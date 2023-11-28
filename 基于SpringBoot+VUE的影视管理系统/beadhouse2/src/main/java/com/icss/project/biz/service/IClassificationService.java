package com.icss.project.biz.service;

import java.util.List;
import com.icss.project.biz.domain.Classification;

/**
 * 分类管理Service接口
 *
 * @author toto1693447968475
 * @date 2023-08-31
 */
public interface IClassificationService
{
    /**
     * 查询分类管理
     *
     * @param id 分类管理主键
     * @return 分类管理
     */
    public Classification selectClassificationById(Long id);

    /**
     * 查询分类管理列表
     *
     * @param classification 分类管理
     * @return 分类管理集合
     */
    public List<Classification> selectClassificationList(Classification classification);

    /**
     * 新增分类管理
     *
     * @param classification 分类管理
     * @return 结果
     */
    public int insertClassification(Classification classification);

    /**
     * 修改分类管理
     *
     * @param classification 分类管理
     * @return 结果
     */
    public int updateClassification(Classification classification);

    /**
     * 批量删除分类管理
     *
     * @param ids 需要删除的分类管理主键集合
     * @return 结果
     */
    public int deleteClassificationByIds(Long[] ids);

    /**
     * 删除分类管理信息
     *
     * @param id 分类管理主键
     * @return 结果
     */
    public int deleteClassificationById(Long id);

    public String importNotice(List<Classification> noticeList, Boolean isUpdateSupport, String operName);
}
