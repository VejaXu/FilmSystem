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
import com.icss.project.biz.domain.Notice;
import com.icss.project.biz.service.INoticeService;
import com.icss.framework.web.controller.BaseController;
import com.icss.framework.web.domain.AjaxResult;
import com.icss.common.utils.poi.ExcelUtil;
import com.icss.framework.web.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 公告管理Controller
 *
 * @author toto1693447968710
 * @date 2023-08-31
 */
@RestController
@RequestMapping("/biz/notice")
public class NoticeController extends BaseController
{
    @Autowired
    private INoticeService noticeService;

    /**
     * 查询公告管理列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Notice notice)
    {
        startPage();
        List<Notice> list = noticeService.selectNoticeList(notice);
        return getDataTable(list);
    }

    /**
     * 导出公告管理列表
     */
    //@Log(title = "公告管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Notice notice)
    {
        List<Notice> list = noticeService.selectNoticeList(notice);
        ExcelUtil<Notice> util = new ExcelUtil<Notice>(Notice.class);
        return util.exportExcel(list, "公告管理数据");
    }

    /**
     * 获取公告管理详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(noticeService.selectNoticeById(id));
    }

    /**
     * 新增公告管理
     */
    //@Log(title = "公告管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Notice notice)
    {
        notice.setName(getUsername());
        return toAjax(noticeService.insertNotice(notice));
    }

    /**
     * 修改公告管理
     */
    //@Log(title = "公告管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Notice notice)
    {
        return toAjax(noticeService.updateNotice(notice));
    }

    /**
     * 删除公告管理
     */
    ////@Log(title = "公告管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(noticeService.deleteNoticeByIds(ids));
    }

    @Log(title = "公告管理", businessType = BusinessType.IMPORT)
    @PreAuthorize("@ss.hasPermi('biz:notice:import')")
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception
    {
        ExcelUtil<Notice> util = new ExcelUtil<Notice>(Notice.class);
        List<Notice> noticeList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        noticeList.stream().forEach(System.out::println);
        String message = noticeService.importNotice(noticeList, updateSupport, operName);
        return AjaxResult.success(message);
    }

    @GetMapping("/importTemplate")
    public AjaxResult importTemplate()
    {
        ExcelUtil<Notice> util = new ExcelUtil<Notice>(Notice.class);
        return util.importTemplateExcel("公告数据");
    }
}
