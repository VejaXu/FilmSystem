package com.icss.project.biz.service.impl;

import java.util.List;
import com.icss.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.icss.project.biz.mapper.EvaluateMapper;
import com.icss.project.biz.domain.Evaluate;
import com.icss.project.biz.service.IEvaluateService;

/**
 * 评价管理Service业务层处理
 *
 * @author toto1693447968574
 * @date 2023-08-31
 */
@Service
public class EvaluateServiceImpl implements IEvaluateService
{
    @Autowired
    private EvaluateMapper evaluateMapper;

    /**
     * 查询评价管理
     *
     * @param id 评价管理主键
     * @return 评价管理
     */
    @Override
    public Evaluate selectEvaluateById(Long id)
    {
        return evaluateMapper.selectEvaluateById(id);
    }

    /**
     * 查询评价管理列表
     *
     * @param evaluate 评价管理
     * @return 评价管理
     */
    @Override
    public List<Evaluate> selectEvaluateList(Evaluate evaluate)
    {
        return evaluateMapper.selectEvaluateList(evaluate);
    }

    /**
     * 新增评价管理
     *
     * @param evaluate 评价管理
     * @return 结果
     */
    @Override
    public int insertEvaluate(Evaluate evaluate)
    {
        evaluate.setCreateTime(DateUtils.getNowDate());
        return evaluateMapper.insertEvaluate(evaluate);
    }

    /**
     * 修改评价管理
     *
     * @param evaluate 评价管理
     * @return 结果
     */
    @Override
    public int updateEvaluate(Evaluate evaluate)
    {
        evaluate.setUpdateTime(DateUtils.getNowDate());
        return evaluateMapper.updateEvaluate(evaluate);
    }

    /**
     * 批量删除评价管理
     *
     * @param ids 需要删除的评价管理主键
     * @return 结果
     */
    @Override
    public int deleteEvaluateByIds(Long[] ids)
    {
        return evaluateMapper.deleteEvaluateByIds(ids);
    }

    /**
     * 删除评价管理信息
     *
     * @param id 评价管理主键
     * @return 结果
     */
    @Override
    public int deleteEvaluateById(Long id)
    {
        return evaluateMapper.deleteEvaluateById(id);
    }
}
