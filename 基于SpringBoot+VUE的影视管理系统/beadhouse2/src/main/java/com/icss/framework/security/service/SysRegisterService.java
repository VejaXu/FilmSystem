package com.icss.framework.security.service;

import com.icss.common.utils.StringUtils;
import com.icss.project.system.domain.SysUserRole;
import com.icss.project.system.mapper.SysUserRoleMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.icss.common.constant.Constants;
import com.icss.common.constant.UserConstants;
import com.icss.common.exception.user.CaptchaException;
import com.icss.common.exception.user.CaptchaExpireException;
import com.icss.common.utils.MessageUtils;
import com.icss.common.utils.SecurityUtils;
import com.icss.framework.manager.AsyncManager;
import com.icss.framework.manager.factory.AsyncFactory;
import com.icss.framework.redis.RedisCache;
import com.icss.framework.security.RegisterBody;
import com.icss.project.system.domain.SysUser;
import com.icss.project.system.service.ISysConfigService;
import com.icss.project.system.service.ISysUserService;

import java.util.ArrayList;
import java.util.List;

/**
 * 注册校验方法
 *
 * @author system
 */
@Component
public class SysRegisterService
{
    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private SysUserRoleMapper userRoleMapper;

    @Autowired
    private RedisCache redisCache;

    /**
     * 注册
     */
    public String register(RegisterBody registerBody)
    {
        String msg = "", username = registerBody.getUsername(), password = registerBody.getPassword();

        boolean captchaOnOff = configService.selectCaptchaOnOff();
        // 验证码开关
        if (captchaOnOff)
        {
            validateCaptcha(username, registerBody.getCode(), registerBody.getUuid());
        }

        if (StringUtils.isEmpty(username))
        {
            msg = "用户名不能为空";
        }
        else if (StringUtils.isEmpty(password))
        {
            msg = "用户密码不能为空";
        }
        else if (username.length() < UserConstants.USERNAME_MIN_LENGTH
                || username.length() > UserConstants.USERNAME_MAX_LENGTH)
        {
            msg = "账户长度必须在2到20个字符之间";
        }
        else if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
                || password.length() > UserConstants.PASSWORD_MAX_LENGTH)
        {
            msg = "密码长度必须在5到20个字符之间";
        }
        else if (UserConstants.NOT_UNIQUE.equals(userService.checkUserNameUnique(username)))
        {
            msg = "保存用户'" + username + "'失败，注册账号已存在";
        }
        else
        {
            SysUser sysUser = new SysUser();
            sysUser.setNickName(username);
            BeanUtils.copyProperties(registerBody,sysUser);
            sysUser.setUserName(username);
            sysUser.setPassword(SecurityUtils.encryptPassword(registerBody.getPassword()));
            boolean regFlag = userService.registerUser(sysUser);
            if (!regFlag)
            {
                msg = "注册失败,请联系系统管理人员";
            }
            else
            {
                Long roleIds[]=new Long[]{3L};
                if (StringUtils.isNotNull(roleIds))
                {
                    // 新增用户与角色管理
                    List<SysUserRole> list = new ArrayList<SysUserRole>();
                    for (Long roleId : roleIds)
                    {
                        SysUserRole ur = new SysUserRole();
                        ur.setUserId(sysUser.getUserId());
                        ur.setRoleId(roleId);
                        list.add(ur);
                    }
                    if (list.size() > 0)
                    {
                        userRoleMapper.batchUserRole(list);
                    }
                }

                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.REGISTER,
                        MessageUtils.message("user.register.success")));
            }
        }
        return msg;
    }

    /**
     * 校验验证码
     *
     * @param username 用户名
     * @param code 验证码
     * @param uuid 唯一标识
     * @return 结果
     */
    public void validateCaptcha(String username, String code, String uuid)
    {
        String verifyKey = Constants.CAPTCHA_CODE_KEY + uuid;
        String captcha = redisCache.getCacheObject(verifyKey);
        redisCache.deleteObject(verifyKey);
        if (captcha == null)
        {
            throw new CaptchaExpireException();
        }
        if (!code.equalsIgnoreCase(captcha))
        {
            throw new CaptchaException();
        }
    }
}
