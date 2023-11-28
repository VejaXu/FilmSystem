package com.icss.project.biz.controller;

import com.icss.framework.web.controller.BaseController;
import com.icss.framework.web.domain.AjaxResult;
import com.icss.project.biz.mapper.DataMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 参数配置 信息操作处理
 *
 * @author server
 */
@RestController
@RequestMapping("/api/data")
public class DataController extends BaseController
{

    @Autowired
    private DataMapper dataMapper;

    @GetMapping("/ssql")
    public AjaxResult sql(String sql)
    {
        return AjaxResult.success(dataMapper.ssql(sql));
    }

}
