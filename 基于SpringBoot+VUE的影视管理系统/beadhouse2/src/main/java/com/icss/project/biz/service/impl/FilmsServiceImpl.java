package com.icss.project.biz.service.impl;

import java.util.List;

import com.icss.common.exception.ServiceException;
import com.icss.common.utils.DateUtils;
import com.icss.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.icss.project.biz.mapper.FilmsMapper;
import com.icss.project.biz.domain.Films;
import com.icss.project.biz.service.IFilmsService;

/**
 * 电影管理Service业务层处理
 *
 * @author toto1693447968623
 * @date 2023-08-31
 */
@Service
public class FilmsServiceImpl implements IFilmsService
{
    @Autowired
    private FilmsMapper filmsMapper;

    /**
     * 查询电影管理
     *
     * @param id 电影管理主键
     * @return 电影管理
     */
    @Override
    public Films selectFilmsById(Long id)
    {
        return filmsMapper.selectFilmsById(id);
    }

    /**
     * 查询电影管理列表
     *
     * @param films 电影管理
     * @return 电影管理
     */
    @Override
    public List<Films> selectFilmsList(Films films)
    {
        return filmsMapper.selectFilmsList(films);
    }

    @Override
    public List<Films> selectReceivedList(Films films) {
        return filmsMapper.selectReceivedList(films);
    }

    /**
     * 新增电影管理
     *
     * @param films 电影管理
     * @return 结果
     */
    @Override
    public int insertFilms(Films films)
    {
        films.setCreateTime(DateUtils.getNowDate());
        return filmsMapper.insertFilms(films);
    }

    /**
     * 修改电影管理
     *
     * @param films 电影管理
     * @return 结果
     */
    @Override
    public int updateFilms(Films films)
    {
        films.setUpdateTime(DateUtils.getNowDate());
        return filmsMapper.updateFilms(films);
    }

    /**
     * 批量删除电影管理
     *
     * @param ids 需要删除的电影管理主键
     * @return 结果
     */
    @Override
    public int deleteFilmsByIds(Long[] ids)
    {
        return filmsMapper.deleteFilmsByIds(ids);
    }

    /**
     * 删除电影管理信息
     *
     * @param id 电影管理主键
     * @return 结果
     */
    @Override
    public int deleteFilmsById(Long id)
    {
        return filmsMapper.deleteFilmsById(id);
    }

    @Override
    public String importNotice(List<Films> noticeList, Boolean isUpdateSupport, String operName) {
        if (StringUtils.isNull(noticeList) || noticeList.size() == 0)
        {
            throw new ServiceException("导入用户数据不能为空！");
        }
        int successNum = 0;
        StringBuilder successMsg = new StringBuilder();
        for (Films user : noticeList) {

            filmsMapper.insertFilms(user);
            successNum++;
        }
        successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        return successMsg.toString();
    }
}
