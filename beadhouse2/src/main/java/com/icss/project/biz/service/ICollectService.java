package com.icss.project.biz.service;

import java.util.List;
import com.icss.project.biz.domain.Collect;

/**
 * 收藏Service接口
 *
 * @author toto1693639673962
 * @date 2023-09-02
 */
public interface ICollectService
{
    /**
     * 查询收藏
     *
     * @param id 收藏主键
     * @return 收藏
     */
    public Collect selectCollectById(Long id);

    /**
     * 查询收藏列表
     *
     * @param collect 收藏
     * @return 收藏集合
     */
    public List<Collect> selectCollectList(Collect collect);

    /**
     * 新增收藏
     *
     * @param collect 收藏
     * @return 结果
     */
    public int insertCollect(Collect collect);

    /**
     * 修改收藏
     *
     * @param collect 收藏
     * @return 结果
     */
    public int updateCollect(Collect collect);

    /**
     * 批量删除收藏
     *
     * @param ids 需要删除的收藏主键集合
     * @return 结果
     */
    public int deleteCollectByIds(Long[] ids);

    /**
     * 删除收藏信息
     *
     * @param id 收藏主键
     * @return 结果
     */
    public int deleteCollectById(Long id);
}
