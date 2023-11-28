package com.icss.project.biz.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.icss.framework.aspectj.lang.annotation.Excel;
import com.icss.framework.web.domain.BaseEntity;

/**
 * 观看历史对象 history
 *
 * @author toto1693653136271
 * @date 2023-09-02
 */
public class History extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 电影名称 */
    @Excel(name = "电影名称")
    private String title;

    /** 导演 */
    @Excel(name = "导演")
    private String name;

    /** 片长 */
    @Excel(name = "片长")
    private String mobile;

    /** 分类 */
    @Excel(name = "分类")
    private String address;

    /** 简介 */
    @Excel(name = "简介")
    private String content;

    /** 视频 */
    @Excel(name = "视频")
    private String imgs;

    /** 序号 */
    @Excel(name = "序号")
    private Long num;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    /** 上映时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "上映时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date date1;

    /** 评分 */
    @Excel(name = "评分")
    private String field1;

    /** 国家 */
    @Excel(name = "国家")
    private String field2;

    /** 语言 */
    @Excel(name = "语言")
    private String field3;

    /** 封面图 */
    @Excel(name = "封面图")
    private String field5;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 字段7 */
    @Excel(name = "字段7")
    private String field7;

    /** 字段8 */
    @Excel(name = "字段8")
    private Long field8;

    /** 字段9 */
    @Excel(name = "字段9")
    private Long field9;

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
    public void setMobile(String mobile)
    {
        this.mobile = mobile;
    }

    public String getMobile()
    {
        return mobile;
    }
    public void setAddress(String address)
    {
        this.address = address;
    }

    public String getAddress()
    {
        return address;
    }
    public void setContent(String content)
    {
        this.content = content;
    }

    public String getContent()
    {
        return content;
    }
    public void setImgs(String imgs)
    {
        this.imgs = imgs;
    }

    public String getImgs()
    {
        return imgs;
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
    public void setField5(String field5)
    {
        this.field5 = field5;
    }

    public String getField5()
    {
        return field5;
    }
    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }
    public void setField7(String field7)
    {
        this.field7 = field7;
    }

    public String getField7()
    {
        return field7;
    }
    public void setField8(Long field8)
    {
        this.field8 = field8;
    }

    public Long getField8()
    {
        return field8;
    }
    public void setField9(Long field9)
    {
        this.field9 = field9;
    }

    public Long getField9()
    {
        return field9;
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
            .append("mobile", getMobile())
            .append("address", getAddress())
            .append("content", getContent())
            .append("imgs", getImgs())
            .append("num", getNum())
            .append("status", getStatus())
            .append("date1", getDate1())
            .append("field1", getField1())
            .append("field2", getField2())
            .append("field3", getField3())
            .append("field5", getField5())
            .append("userId", getUserId())
            .append("field7", getField7())
            .append("field8", getField8())
            .append("field9", getField9())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
