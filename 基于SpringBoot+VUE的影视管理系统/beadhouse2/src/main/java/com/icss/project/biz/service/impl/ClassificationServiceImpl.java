package com.icss.project.biz.service.impl;

import java.util.List;

import com.icss.common.exception.ServiceException;
import com.icss.common.utils.DateUtils;
import com.icss.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.icss.project.biz.mapper.ClassificationMapper;
import com.icss.project.biz.domain.Classification;
import com.icss.project.biz.service.IClassificationService;

/**
 * 分类管理Service业务层处理
 *
 * @author toto1693447968475
 * @date 2023-08-31
 */
@Service
public class ClassificationServiceImpl implements IClassificationService
{
    @Autowired
    private ClassificationMapper classificationMapper;

    /**
     * 查询分类管理
     *
     * @param id 分类管理主键
     * @return 分类管理
     */
    @Override
    public Classification selectClassificationById(Long id)
    {
        return classificationMapper.selectClassificationById(id);
    }

    /**
     * 查询分类管理列表
     *
     * @param classification 分类管理
     * @return 分类管理
     */
    @Override
    public List<Classification> selectClassificationList(Classification classification)
    {
        return classificationMapper.selectClassificationList(classification);
    }

    /**
     * 新增分类管理
     *
     * @param classification 分类管理
     * @return 结果
     */
    @Override
    public int insertClassification(Classification classification)
    {
        classification.setCreateTime(DateUtils.getNowDate());
        return classificationMapper.insertClassification(classification);
    }

    /**
     * 修改分类管理
     *
     * @param classification 分类管理
     * @return 结果
     */
    @Override
    public int updateClassification(Classification classification)
    {
        classification.setUpdateTime(DateUtils.getNowDate());
        return classificationMapper.updateClassification(classification);
    }

    /**
     * 批量删除分类管理
     *
     * @param ids 需要删除的分类管理主键
     * @return 结果
     */
    @Override
    public int deleteClassificationByIds(Long[] ids)
    {
        return classificationMapper.deleteClassificationByIds(ids);
    }

    /**
     * 删除分类管理信息
     *
     * @param id 分类管理主键
     * @return 结果
     */
    @Override
    public int deleteClassificationById(Long id)
    {
        return classificationMapper.deleteClassificationById(id);
    }

    @Override
    public String importNotice(List<Classification> noticeList, Boolean isUpdateSupport, String operName) {
        if (StringUtils.isNull(noticeList) || noticeList.size() == 0)
        {
            throw new ServiceException("导入用户数据不能为空！");
        }
        int successNum = 0;
        StringBuilder successMsg = new StringBuilder();
        for (Classification user : noticeList) {

            classificationMapper.insertClassification(user);
            successNum++;
        }
        successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        return successMsg.toString();
    }

}
