package com.icss.project.biz.service;

import java.util.List;
import com.icss.project.biz.domain.Films;

/**
 * 电影管理Service接口
 *
 * @author toto1693447968623
 * @date 2023-08-31
 */
public interface IFilmsService
{
    /**
     * 查询电影管理
     *
     * @param id 电影管理主键
     * @return 电影管理
     */
    public Films selectFilmsById(Long id);

    /**
     * 查询电影管理列表
     *
     * @param films 电影管理
     * @return 电影管理集合
     */
    public List<Films> selectFilmsList(Films films);

    public List<Films> selectReceivedList(Films films);

    /**
     * 新增电影管理
     *
     * @param films 电影管理
     * @return 结果
     */
    public int insertFilms(Films films);

    /**
     * 修改电影管理
     *
     * @param films 电影管理
     * @return 结果
     */
    public int updateFilms(Films films);

    /**
     * 批量删除电影管理
     *
     * @param ids 需要删除的电影管理主键集合
     * @return 结果
     */
    public int deleteFilmsByIds(Long[] ids);

    /**
     * 删除电影管理信息
     *
     * @param id 电影管理主键
     * @return 结果
     */
    public int deleteFilmsById(Long id);

    public String importNotice(List<Films> noticeList, Boolean isUpdateSupport, String operName);
}
