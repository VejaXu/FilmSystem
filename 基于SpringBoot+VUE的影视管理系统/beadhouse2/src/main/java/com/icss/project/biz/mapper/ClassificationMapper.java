package com.icss.project.biz.mapper;

import java.util.List;
import com.icss.project.biz.domain.Classification;

/**
 * 分类管理Mapper接口
 *
 * @author toto1693447968475
 * @date 2023-08-31
 */
public interface ClassificationMapper
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
     * 删除分类管理
     *
     * @param id 分类管理主键
     * @return 结果
     */
    public int deleteClassificationById(Long id);

    /**
     * 批量删除分类管理
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteClassificationByIds(Long[] ids);
}
