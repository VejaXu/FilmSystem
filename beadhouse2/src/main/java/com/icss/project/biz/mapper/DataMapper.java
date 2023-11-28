package com.icss.project.biz.mapper;

import java.util.List;
import java.util.Map;

/**
 * 用户信息Mapper接口
 *
 * @author server
 */
public interface DataMapper
{

    public List<Map<String,Object>> ssql(String sql);

    public int isql(String sql);

    public int usql(String sql);

    public int dsql(String sql);
}
