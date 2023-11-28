package com.icss.project.biz.service;

import java.util.List;
import com.icss.project.biz.domain.Evaluate;

/**
 * 评价管理Service接口
 *
 * @author toto1693447968574
 * @date 2023-08-31
 */
public interface IEvaluateService
{
    /**
     * 查询评价管理
     *
     * @param id 评价管理主键
     * @return 评价管理
     */
    public Evaluate selectEvaluateById(Long id);

    /**
     * 查询评价管理列表
     *
     * @param evaluate 评价管理
     * @return 评价管理集合
     */
    public List<Evaluate> selectEvaluateList(Evaluate evaluate);

    /**
     * 新增评价管理
     *
     * @param evaluate 评价管理
     * @return 结果
     */
    public int insertEvaluate(Evaluate evaluate);

    /**
     * 修改评价管理
     *
     * @param evaluate 评价管理
     * @return 结果
     */
    public int updateEvaluate(Evaluate evaluate);

    /**
     * 批量删除评价管理
     *
     * @param ids 需要删除的评价管理主键集合
     * @return 结果
     */
    public int deleteEvaluateByIds(Long[] ids);

    /**
     * 删除评价管理信息
     *
     * @param id 评价管理主键
     * @return 结果
     */
    public int deleteEvaluateById(Long id);
}
