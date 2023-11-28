package com.icss.project.biz.service.impl;

import java.util.List;
import com.icss.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.icss.project.biz.mapper.HistoryMapper;
import com.icss.project.biz.domain.History;
import com.icss.project.biz.service.IHistoryService;

/**
 * 观看历史Service业务层处理
 *
 * @author toto1693653136271
 * @date 2023-09-02
 */
@Service
public class HistoryServiceImpl implements IHistoryService
{
    @Autowired
    private HistoryMapper historyMapper;

    /**
     * 查询观看历史
     *
     * @param id 观看历史主键
     * @return 观看历史
     */
    @Override
    public History selectHistoryById(Long id)
    {
        return historyMapper.selectHistoryById(id);
    }

    /**
     * 查询观看历史列表
     *
     * @param history 观看历史
     * @return 观看历史
     */
    @Override
    public List<History> selectHistoryList(History history)
    {
        return historyMapper.selectHistoryList(history);
    }

    /**
     * 新增观看历史
     *
     * @param history 观看历史
     * @return 结果
     */
    @Override
    public int insertHistory(History history)
    {
        history.setCreateTime(DateUtils.getNowDate());
        return historyMapper.insertHistory(history);
    }

    @Override
    public History selectHistoryName(String title) {
        return historyMapper.selectHistoryName(title);
    }

    /**
     * 修改观看历史
     *
     * @param history 观看历史
     * @return 结果
     */
    @Override
    public int updateHistory(History history)
    {
        history.setUpdateTime(DateUtils.getNowDate());
        return historyMapper.updateHistory(history);
    }

    /**
     * 批量删除观看历史
     *
     * @param ids 需要删除的观看历史主键
     * @return 结果
     */
    @Override
    public int deleteHistoryByIds(Long[] ids)
    {
        return historyMapper.deleteHistoryByIds(ids);
    }

    /**
     * 删除观看历史信息
     *
     * @param id 观看历史主键
     * @return 结果
     */
    @Override
    public int deleteHistoryById(Long id)
    {
        return historyMapper.deleteHistoryById(id);
    }
}
