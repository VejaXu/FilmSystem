package com.icss.project.biz.controller;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.icss.framework.aspectj.lang.annotation.Log;
import com.icss.framework.aspectj.lang.enums.BusinessType;
import com.icss.project.biz.domain.Classification;
import com.icss.project.biz.service.IClassificationService;
import com.icss.framework.web.controller.BaseController;
import com.icss.framework.web.domain.AjaxResult;
import com.icss.common.utils.poi.ExcelUtil;
import com.icss.framework.web.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 分类管理Controller
 *
 * @author toto1693447968475
 * @date 2023-08-31
 */
@RestController
@RequestMapping("/biz/classification")
public class ClassificationController extends BaseController
{
    @Autowired
    private IClassificationService classificationService;

    /**
     * 查询分类管理列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Classification classification)
    {
        startPage();
        List<Classification> list = classificationService.selectClassificationList(classification);
        return getDataTable(list);
    }

    /**
     * 导出分类管理列表
     */
    //@Log(title = "分类管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Classification classification)
    {
        List<Classification> list = classificationService.selectClassificationList(classification);
        ExcelUtil<Classification> util = new ExcelUtil<Classification>(Classification.class);
        return util.exportExcel(list, "分类管理数据");
    }

    /**
     * 获取分类管理详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(classificationService.selectClassificationById(id));
    }

    /**
     * 新增分类管理
     */
    //@Log(title = "分类管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Classification classification)
    {
        return toAjax(classificationService.insertClassification(classification));
    }

    /**
     * 修改分类管理
     */
    //@Log(title = "分类管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Classification classification)
    {
        return toAjax(classificationService.updateClassification(classification));
    }

    /**
     * 删除分类管理
     */
    ////@Log(title = "分类管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(classificationService.deleteClassificationByIds(ids));
    }

    @Log(title = "公告管理", businessType = BusinessType.IMPORT)
    @PreAuthorize("@ss.hasPermi('biz:classification:import')")
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception
    {
        ExcelUtil<Classification> util = new ExcelUtil<Classification>(Classification.class);
        List<Classification> noticeList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        noticeList.stream().forEach(System.out::println);
        String message = classificationService.importNotice(noticeList, updateSupport, operName);
        return AjaxResult.success(message);
    }

    @GetMapping("/importTemplate")
    public AjaxResult importTemplate()
    {
        ExcelUtil<Classification> util = new ExcelUtil<Classification>(Classification.class);
        return util.importTemplateExcel("分类数据");
    }
}
