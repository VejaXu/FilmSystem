package com.icss.project.biz.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.icss.framework.aspectj.lang.annotation.Excel;
import com.icss.framework.web.domain.BaseEntity;

/**
 * 评价管理对象 evaluate
 *
 * @author toto1693447968574
 * @date 2023-08-31
 */
public class Evaluate extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    @Excel(name = "ID")
    private Long id;

    /** 电影名称 */
    @Excel(name = "电影名称")
    private String title;

    /** 评价用户 */
    @Excel(name = "评价用户")
    private String name;

    /** 内容 */
    @Excel(name = "内容")
    private String address;

    /** 电影ID */
    private Long num;

    /** 状态 */
    private String status;

    /** 时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date date1;

    /** 评价分数 */
    @Excel(name = "评价分数")
    private String field1;

    /** 字段2 */
    private String field2;

    /** 字段3 */
    private String field3;

    /** 字段4 */
    private String field4;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getTitle()
    {
        return title;
    }
    public void setName(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }
    public void setAddress(String address)
    {
        this.address = address;
    }

    public String getAddress()
    {
        return address;
    }
    public void setNum(Long num)
    {
        this.num = num;
    }

    public Long getNum()
    {
        return num;
    }
    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getStatus()
    {
        return status;
    }
    public void setDate1(Date date1)
    {
        this.date1 = date1;
    }

    public Date getDate1()
    {
        return date1;
    }
    public void setField1(String field1)
    {
        this.field1 = field1;
    }

    public String getField1()
    {
        return field1;
    }
    public void setField2(String field2)
    {
        this.field2 = field2;
    }

    public String getField2()
    {
        return field2;
    }
    public void setField3(String field3)
    {
        this.field3 = field3;
    }

    public String getField3()
    {
        return field3;
    }
    public void setField4(String field4)
    {
        this.field4 = field4;
    }

    public String getField4()
    {
        return field4;
    }
    public void setDelFlag(String delFlag)
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag()
    {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("title", getTitle())
            .append("name", getName())
            .append("address", getAddress())
            .append("num", getNum())
            .append("status", getStatus())
            .append("date1", getDate1())
            .append("field1", getField1())
            .append("field2", getField2())
            .append("field3", getField3())
            .append("field4", getField4())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
