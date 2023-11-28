package com.icss.project.biz.service.impl;

import java.util.List;

import com.icss.common.exception.ServiceException;
import com.icss.common.utils.DateUtils;
import com.icss.common.utils.StringUtils;
import com.icss.project.system.service.ISysConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.icss.project.biz.mapper.NoticeMapper;
import com.icss.project.biz.domain.Notice;
import com.icss.project.biz.service.INoticeService;

/**
 * 公告管理Service业务层处理
 *
 * @author toto1693447968710
 * @date 2023-08-31
 */
@Service
public class NoticeServiceImpl implements INoticeService
{
    @Autowired
    private NoticeMapper noticeMapper;
    @Autowired
    private ISysConfigService configService;

    /**
     * 查询公告管理
     *
     * @param id 公告管理主键
     * @return 公告管理
     */
    @Override
    public Notice selectNoticeById(Long id)
    {
        return noticeMapper.selectNoticeById(id);
    }

    /**
     * 查询公告管理列表
     *
     * @param notice 公告管理
     * @return 公告管理
     */
    @Override
    public List<Notice> selectNoticeList(Notice notice)
    {
        return noticeMapper.selectNoticeList(notice);
    }

    /**
     * 新增公告管理
     *
     * @param notice 公告管理
     * @return 结果
     */
    @Override
    public int insertNotice(Notice notice)
    {
        notice.setCreateTime(DateUtils.getNowDate());
        return noticeMapper.insertNotice(notice);
    }

    /**
     * 修改公告管理
     *
     * @param notice 公告管理
     * @return 结果
     */
    @Override
    public int updateNotice(Notice notice)
    {
        notice.setUpdateTime(DateUtils.getNowDate());
        return noticeMapper.updateNotice(notice);
    }

    /**
     * 批量删除公告管理
     *
     * @param ids 需要删除的公告管理主键
     * @return 结果
     */
    @Override
    public int deleteNoticeByIds(Long[] ids)
    {
        return noticeMapper.deleteNoticeByIds(ids);
    }

    /**
     * 删除公告管理信息
     *
     * @param id 公告管理主键
     * @return 结果
     */
    @Override
    public int deleteNoticeById(Long id)
    {
        return noticeMapper.deleteNoticeById(id);
    }

    @Override
    public String importNotice(List<Notice> noticeList, Boolean isUpdateSupport, String operName) {
        if (StringUtils.isNull(noticeList) || noticeList.size() == 0)
        {
            throw new ServiceException("导入用户数据不能为空！");
        }
        int successNum = 0;
        StringBuilder successMsg = new StringBuilder();
        for (Notice user : noticeList) {

            noticeMapper.insertNotice(user);
            successNum++;
        }
        successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        return successMsg.toString();
    }
}
