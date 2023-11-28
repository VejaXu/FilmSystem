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
import com.icss.project.biz.domain.Collect;
import com.icss.project.biz.service.ICollectService;
import com.icss.framework.web.controller.BaseController;
import com.icss.framework.web.domain.AjaxResult;
import com.icss.common.utils.poi.ExcelUtil;
import com.icss.framework.web.page.TableDataInfo;

/**
 * 收藏Controller
 *
 * @author toto1693639673962
 * @date 2023-09-02
 */
@RestController
@RequestMapping("/biz/collect")
public class CollectController extends BaseController
{
    @Autowired
    private ICollectService collectService;

    /**
     * 查询收藏列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Collect collect)
    {
        startPage();
        List<Collect> list = collectService.selectCollectList(collect);
        return getDataTable(list);
    }

    /**
     * 导出收藏列表
     */
    //@Log(title = "收藏", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Collect collect)
    {
        List<Collect> list = collectService.selectCollectList(collect);
        ExcelUtil<Collect> util = new ExcelUtil<Collect>(Collect.class);
        return util.exportExcel(list, "收藏数据");
    }

    /**
     * 获取收藏详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        Collect collect = collectService.selectCollectById(id);
        return AjaxResult.success(collect);
    }

    /**
     * 新增收藏
     */
    //@Log(title = "收藏", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Collect collect)
    {
        List<Collect> collects=collectService.selectCollectList(collect);
        if (collects.size()==0){
            collect.setNum(getUserId());
            collectService.insertCollect(collect);
            return AjaxResult.success("收藏成功");
        }
        return AjaxResult.success("已收藏");
    }

    /**
     * 修改收藏
     */
    //@Log(title = "收藏", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Collect collect)
    {
        return toAjax(collectService.updateCollect(collect));
    }

    /**
     * 删除收藏
     */
    ////@Log(title = "收藏", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(collectService.deleteCollectByIds(ids));
    }
}
