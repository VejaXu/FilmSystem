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
import com.icss.project.biz.domain.History;
import com.icss.project.biz.service.IHistoryService;
import com.icss.framework.web.controller.BaseController;
import com.icss.framework.web.domain.AjaxResult;
import com.icss.common.utils.poi.ExcelUtil;
import com.icss.framework.web.page.TableDataInfo;

/**
 * 观看历史Controller
 *
 * @author toto1693653136271
 * @date 2023-09-02
 */
@RestController
@RequestMapping("/biz/history")
public class HistoryController extends BaseController
{
    @Autowired
    private IHistoryService historyService;

    /**
     * 查询观看历史列表
     */
    @GetMapping("/list")
    public TableDataInfo list(History history)
    {
        startPage();
        List<History> list = historyService.selectHistoryList(history);
        return getDataTable(list);
    }

    /**
     * 导出观看历史列表
     */
    //@Log(title = "观看历史", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(History history)
    {
        List<History> list = historyService.selectHistoryList(history);
        ExcelUtil<History> util = new ExcelUtil<History>(History.class);
        return util.exportExcel(list, "观看历史数据");
    }

    /**
     * 获取观看历史详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(historyService.selectHistoryById(id));
    }

    /**
     * 新增观看历史
     */
    //@Log(title = "观看历史", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody History history)
    {
        return toAjax(historyService.insertHistory(history));
    }

    /**
     * 修改观看历史
     */
    //@Log(title = "观看历史", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody History history)
    {
        return toAjax(historyService.updateHistory(history));
    }

    /**
     * 删除观看历史
     */
    ////@Log(title = "观看历史", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(historyService.deleteHistoryByIds(ids));
    }
}
