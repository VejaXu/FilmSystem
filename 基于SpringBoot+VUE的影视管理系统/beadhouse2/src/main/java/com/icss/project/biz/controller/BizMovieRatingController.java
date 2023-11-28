package com.icss.project.biz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.icss.project.biz.domain.BizMovieRating;
import com.icss.project.biz.service.IBizMovieRatingService;
import com.icss.framework.web.controller.BaseController;
import com.icss.framework.web.domain.AjaxResult;
import com.icss.common.utils.poi.ExcelUtil;
import com.icss.framework.web.page.TableDataInfo;

/**
 * 电影评分Controller
 *
 * @author toto1695798531089
 * @date 2023-09-27
 */
@RestController
@RequestMapping("/biz/rating")
public class BizMovieRatingController extends BaseController
{
    @Autowired
    private IBizMovieRatingService bizMovieRatingService;

    /**
     * 查询电影评分列表
     */
    @GetMapping("/list")
    public TableDataInfo list(BizMovieRating bizMovieRating)
    {
        startPage();
        List<BizMovieRating> list = bizMovieRatingService.selectBizMovieRatingList(bizMovieRating);
        return getDataTable(list);
    }

    /**
     * 导出电影评分列表
     */
    //@Log(title = "电影评分", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(BizMovieRating bizMovieRating)
    {
        List<BizMovieRating> list = bizMovieRatingService.selectBizMovieRatingList(bizMovieRating);
        ExcelUtil<BizMovieRating> util = new ExcelUtil<BizMovieRating>(BizMovieRating.class);
        return util.exportExcel(list, "电影评分数据");
    }

    /**
     * 获取电影评分详细信息
     */
    @GetMapping(value = "/{movieRatingId}")
    public AjaxResult getInfo(@PathVariable("movieRatingId") Long movieRatingId)
    {
        return AjaxResult.success(bizMovieRatingService.selectBizMovieRatingByMovieRatingId(movieRatingId));
    }

    /**
     * 新增电影评分
     */
    //@Log(title = "电影评分", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BizMovieRating bizMovieRating)
    {
        return toAjax(bizMovieRatingService.insertBizMovieRating(bizMovieRating));
    }

    /**
     * 评分
     * @param bizMovieRating
     * @return
     */
    @PostMapping("/pingFen")
    public AjaxResult pingFen(@RequestBody BizMovieRating bizMovieRating){
        //1. 查询是否存在
        Long userId = getUserId();
        BizMovieRating query = new BizMovieRating();
        query.setFilmsId(bizMovieRating.getFilmsId());
        query.setUserId(userId);
        bizMovieRating.setUserId(getUserId());
        if(bizMovieRatingService.selectBizMovieRatingList(query).size()<1){
            // 添加
            bizMovieRatingService.insertBizMovieRating(bizMovieRating);
        }else {
            // 修改
            bizMovieRatingService.updateBizMovieRating(bizMovieRating);
        }
        return AjaxResult.success("评分成功");
    }

    /**
     * 获取电影评分
     * @return
     */
    @GetMapping("/{filmsId}/pingFen")
    public AjaxResult getFilmsPingFen(@PathVariable Long filmsId){
        Long userId = getUserId();
        BizMovieRating query = new BizMovieRating();
        query.setFilmsId(filmsId);
        query.setUserId(userId);
        List<BizMovieRating> bizMovieRatings = bizMovieRatingService.selectBizMovieRatingList(query);
        if(bizMovieRatings.size()>0) {
            return AjaxResult.success(bizMovieRatings.get(0).getMovieRatingSource());
        }
        return AjaxResult.success(0);
    }

    /**
     * 修改电影评分
     */
    //@Log(title = "电影评分", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BizMovieRating bizMovieRating)
    {
        return toAjax(bizMovieRatingService.updateBizMovieRating(bizMovieRating));
    }

    /**
     * 删除电影评分
     */
    ////@Log(title = "电影评分", businessType = BusinessType.DELETE)
    @DeleteMapping("/{movieRatingIds}")
    public AjaxResult remove(@PathVariable Long[] movieRatingIds)
    {
        return toAjax(bizMovieRatingService.deleteBizMovieRatingByMovieRatingIds(movieRatingIds));
    }
}
