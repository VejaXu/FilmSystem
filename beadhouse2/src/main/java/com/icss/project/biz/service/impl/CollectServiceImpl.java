package com.icss.project.biz.service.impl;

import java.util.List;
import com.icss.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.icss.project.biz.mapper.CollectMapper;
import com.icss.project.biz.domain.Collect;
import com.icss.project.biz.service.ICollectService;

/**
 * 收藏Service业务层处理
 *
 * @author toto1693639673962
 * @date 2023-09-02
 */
@Service
public class CollectServiceImpl implements ICollectService
{
    @Autowired
    private CollectMapper collectMapper;

    /**
     * 查询收藏
     *
     * @param id 收藏主键
     * @return 收藏
     */
    @Override
    public Collect selectCollectById(Long id)
    {
        return collectMapper.selectCollectById(id);
    }

    /**
     * 查询收藏列表
     *
     * @param collect 收藏
     * @return 收藏
     */
    @Override
    public List<Collect> selectCollectList(Collect collect)
    {
        return collectMapper.selectCollectList(collect);
    }

    /**
     * 新增收藏
     *
     * @param collect 收藏
     * @return 结果
     */
    @Override
    public int insertCollect(Collect collect)
    {
        collect.setCreateTime(DateUtils.getNowDate());
        return collectMapper.insertCollect(collect);
    }

    /**
     * 修改收藏
     *
     * @param collect 收藏
     * @return 结果
     */
    @Override
    public int updateCollect(Collect collect)
    {
        collect.setUpdateTime(DateUtils.getNowDate());
        return collectMapper.updateCollect(collect);
    }

    /**
     * 批量删除收藏
     *
     * @param ids 需要删除的收藏主键
     * @return 结果
     */
    @Override
    public int deleteCollectByIds(Long[] ids)
    {
        return collectMapper.deleteCollectByIds(ids);
    }

    /**
     * 删除收藏信息
     *
     * @param id 收藏主键
     * @return 结果
     */
    @Override
    public int deleteCollectById(Long id)
    {
        return collectMapper.deleteCollectById(id);
    }
}
