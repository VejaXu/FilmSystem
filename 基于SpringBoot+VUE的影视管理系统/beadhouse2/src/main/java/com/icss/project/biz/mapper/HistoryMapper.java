package com.icss.project.biz.mapper;

import java.util.List;
import com.icss.project.biz.domain.History;

/**
 * 观看历史Mapper接口
 *
 * @author toto1693653136271
 * @date 2023-09-02
 */
public interface HistoryMapper
{
    /**
     * 查询观看历史
     *
     * @param id 观看历史主键
     * @return 观看历史
     */
    public History selectHistoryById(Long id);

    /**
     * 查询观看历史列表
     *
     * @param history 观看历史
     * @return 观看历史集合
     */
    public List<History> selectHistoryList(History history);

    /**
     * 新增观看历史
     *
     * @param history 观看历史
     * @return 结果
     */
    public int insertHistory(History history);

    History selectHistoryName(String title);

    /**
     * 修改观看历史
     *
     * @param history 观看历史
     * @return 结果
     */
    public int updateHistory(History history);

    /**
     * 删除观看历史
     *
     * @param id 观看历史主键
     * @return 结果
     */
    public int deleteHistoryById(Long id);

    /**
     * 批量删除观看历史
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteHistoryByIds(Long[] ids);
}
