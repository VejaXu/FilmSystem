package com.icss.project.biz.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.icss.framework.aspectj.lang.annotation.Excel;
import com.icss.framework.web.domain.BaseEntity;

/**
 * 轮播图对象 carousel
 *
 * @author toto1693993298300
 * @date 2023-09-06
 */
public class Carousel extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    @Excel(name = "ID")
    private Long id;

    /** 轮播图 */
    @Excel(name = "轮播图")
    private String img;

    /** 图片名 */
    @Excel(name = "图片名")
    private String name;

    /** 备注 */
    @Excel(name = "备注")
    private String rl;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setImg(String img)
    {
        this.img = img;
    }

    public String getImg()
    {
        return img;
    }
    public void setName(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }
    public void setRl(String rl)
    {
        this.rl = rl;
    }

    public String getRl()
    {
        return rl;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("img", getImg())
            .append("name", getName())
            .append("rl", getRl())
            .toString();
    }
}
