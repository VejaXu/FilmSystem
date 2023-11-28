package com.icss.project.biz.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.icss.framework.aspectj.lang.annotation.Excel;
import com.icss.framework.web.domain.BaseEntity;

/**
 * 电影评分对象 biz_movie_rating
 *
 * @author toto1695798531089
 * @date 2023-09-27
 */
public class BizMovieRating extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 电影评分 */
    private Long movieRatingId;

    /** 分数 */
    @Excel(name = "分数")
    private Long movieRatingSource;

    /** 电影id */
    @Excel(name = "电影id")
    private Long filmsId;

    /** 用户Id */
    @Excel(name = "用户Id")
    private Long userId;

    /** 备注 */
    @Excel(name = "备注")
    private String remarks;

    public void setMovieRatingId(Long movieRatingId)
    {
        this.movieRatingId = movieRatingId;
    }

    public Long getMovieRatingId()
    {
        return movieRatingId;
    }
    public void setMovieRatingSource(Long movieRatingSource)
    {
        this.movieRatingSource = movieRatingSource;
    }

    public Long getMovieRatingSource()
    {
        return movieRatingSource;
    }
    public void setFilmsId(Long filmsId)
    {
        this.filmsId = filmsId;
    }

    public Long getFilmsId()
    {
        return filmsId;
    }
    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }
    public void setRemarks(String remarks)
    {
        this.remarks = remarks;
    }

    public String getRemarks()
    {
        return remarks;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("movieRatingId", getMovieRatingId())
            .append("movieRatingSource", getMovieRatingSource())
            .append("filmsId", getFilmsId())
            .append("userId", getUserId())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .append("remarks", getRemarks())
            .toString();
    }
}
