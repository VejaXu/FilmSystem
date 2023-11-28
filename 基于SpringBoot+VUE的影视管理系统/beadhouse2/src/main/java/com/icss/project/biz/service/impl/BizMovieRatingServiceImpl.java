package com.icss.project.biz.service.impl;

import java.util.List;
import com.icss.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.icss.project.biz.mapper.BizMovieRatingMapper;
import com.icss.project.biz.domain.BizMovieRating;
import com.icss.project.biz.service.IBizMovieRatingService;

/**
 * 电影评分Service业务层处理
 *
 * @author toto1695798531089
 * @date 2023-09-27
 */
@Service
public class BizMovieRatingServiceImpl implements IBizMovieRatingService
{
    @Autowired
    private BizMovieRatingMapper bizMovieRatingMapper;

    /**
     * 查询电影评分
     *
     * @param movieRatingId 电影评分主键
     * @return 电影评分
     */
    @Override
    public BizMovieRating selectBizMovieRatingByMovieRatingId(Long movieRatingId)
    {
        return bizMovieRatingMapper.selectBizMovieRatingByMovieRatingId(movieRatingId);
    }

    /**
     * 查询电影评分列表
     *
     * @param bizMovieRating 电影评分
     * @return 电影评分
     */
    @Override
    public List<BizMovieRating> selectBizMovieRatingList(BizMovieRating bizMovieRating)
    {
        return bizMovieRatingMapper.selectBizMovieRatingList(bizMovieRating);
    }

    /**
     * 新增电影评分
     *
     * @param bizMovieRating 电影评分
     * @return 结果
     */
    @Override
    public int insertBizMovieRating(BizMovieRating bizMovieRating)
    {
        bizMovieRating.setCreateTime(DateUtils.getNowDate());
        return bizMovieRatingMapper.insertBizMovieRating(bizMovieRating);
    }

    /**
     * 修改电影评分
     *
     * @param bizMovieRating 电影评分
     * @return 结果
     */
    @Override
    public int updateBizMovieRating(BizMovieRating bizMovieRating)
    {
        bizMovieRating.setUpdateTime(DateUtils.getNowDate());
        return bizMovieRatingMapper.updateBizMovieRating(bizMovieRating);
    }

    /**
     * 批量删除电影评分
     *
     * @param movieRatingIds 需要删除的电影评分主键
     * @return 结果
     */
    @Override
    public int deleteBizMovieRatingByMovieRatingIds(Long[] movieRatingIds)
    {
        return bizMovieRatingMapper.deleteBizMovieRatingByMovieRatingIds(movieRatingIds);
    }

    /**
     * 删除电影评分信息
     *
     * @param movieRatingId 电影评分主键
     * @return 结果
     */
    @Override
    public int deleteBizMovieRatingByMovieRatingId(Long movieRatingId)
    {
        return bizMovieRatingMapper.deleteBizMovieRatingByMovieRatingId(movieRatingId);
    }
}
