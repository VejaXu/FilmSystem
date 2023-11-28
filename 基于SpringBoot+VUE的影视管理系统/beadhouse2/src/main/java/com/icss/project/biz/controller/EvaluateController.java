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
import com.icss.project.biz.domain.Evaluate;
import com.icss.project.biz.service.IEvaluateService;
import com.icss.framework.web.controller.BaseController;
import com.icss.framework.web.domain.AjaxResult;
import com.icss.common.utils.poi.ExcelUtil;
import com.icss.framework.web.page.TableDataInfo;

/**
 * 评价管理Controller
 *
 * @author toto1693447968574
 * @date 2023-08-31
 */
@RestController
@RequestMapping("/biz/evaluate")
public class EvaluateController extends BaseController
{
    @Autowired
    private IEvaluateService evaluateService;

    /**
     * 查询评价管理列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Evaluate evaluate)
    {
        startPage();
        List<Evaluate> list = evaluateService.selectEvaluateList(evaluate);

        return getDataTable(list);
    }

    /**
     * 导出评价管理列表
     */
    //@Log(title = "评价管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Evaluate evaluate)
    {
        List<Evaluate> list = evaluateService.selectEvaluateList(evaluate);
        ExcelUtil<Evaluate> util = new ExcelUtil<Evaluate>(Evaluate.class);
        return util.exportExcel(list, "评价管理数据");
    }

    /**
     * 获取评价管理详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(evaluateService.selectEvaluateById(id));
    }

    /**
     * 新增评价管理
     */
    //@Log(title = "评价管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Evaluate evaluate)
    {
        evaluate.setField1(getUserId().toString());
        evaluate.setName(getUsername());
        return toAjax(evaluateService.insertEvaluate(evaluate));
    }

    /**
     * 修改评价管理
     */
    //@Log(title = "评价管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Evaluate evaluate)
    {
        return toAjax(evaluateService.updateEvaluate(evaluate));
    }

    /**
     * 删除评价管理
     */
    ////@Log(title = "评价管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(evaluateService.deleteEvaluateByIds(ids));
    }
}
