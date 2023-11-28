package com.icss.project.biz.controller;

import java.util.List;

import com.icss.project.biz.domain.History;
import com.icss.project.biz.service.ICollectService;
import com.icss.project.biz.service.IHistoryService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.icss.project.biz.domain.Films;
import com.icss.project.biz.service.IFilmsService;
import com.icss.framework.web.controller.BaseController;
import com.icss.framework.web.domain.AjaxResult;
import com.icss.common.utils.poi.ExcelUtil;
import com.icss.framework.web.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 电影管理Controller
 *
 * @author toto1693447968623
 * @date 2023-08-31
 */
@RestController
@RequestMapping("/biz/films")
public class FilmsController extends BaseController {
    @Autowired
    private IFilmsService filmsService;

    @Autowired
    private ICollectService collectService;

    @Autowired
    private IHistoryService historyService;

    /**
     * 查询电影管理列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Films films) {
        startPage();
        List<Films> list = filmsService.selectFilmsList(films);
        return getDataTable(list);
    }


    @GetMapping("/receivedList")
    public AjaxResult getReceivedList(Films films) {
        return AjaxResult.success(filmsService.selectReceivedList(films));
    }

    /**
     * 导出电影管理列表
     */
    //@Log(title = "电影管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Films films) {
        List<Films> list = filmsService.selectFilmsList(films);
        ExcelUtil<Films> util = new ExcelUtil<Films>(Films.class);
        return util.exportExcel(list, "电影管理数据");
    }

    /**
     * 获取电影管理详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        History history = new History();
        Films films = filmsService.selectFilmsById(id);
        History historyTitle = historyService.selectHistoryName(films.getTitle());
        if (historyTitle == null) {
            //将films对象内相同字段值赋值给history，其中new String[]内的是忽略赋值的字段
            BeanUtils.copyProperties(films, history, new String[]{"id"});
            history.setNum(films.getId());
            history.setUserId(getUserId());
            System.out.println(history);
            //存储观看历史的视频
            historyService.insertHistory(history);
        }
        return AjaxResult.success(films);
    }

    /**
     * 新增电影管理
     */
    //@Log(title = "电影管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Films films) {

        return toAjax(filmsService.insertFilms(films));
    }

    /**
     * 修改电影管理
     */
    //@Log(title = "电影管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Films films) {
        return toAjax(filmsService.updateFilms(films));
    }

    /**
     * 删除电影管理
     */
    ////@Log(title = "电影管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(filmsService.deleteFilmsByIds(ids));
    }


    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception {
        ExcelUtil<Films> util = new ExcelUtil<Films>(Films.class);
        List<Films> noticeList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        noticeList.stream().forEach(System.out::println);
        String message = filmsService.importNotice(noticeList, updateSupport, operName);
        return AjaxResult.success(message);
    }

    @GetMapping("/importTemplate")
    public AjaxResult importTemplate() {
        ExcelUtil<Films> util = new ExcelUtil<Films>(Films.class);
        return util.importTemplateExcel("电影数据");
    }
}
