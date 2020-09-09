package com.ruoyi.wechat.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 首页banner图对象 m_banner
 * 
 * @author FuYu
 * @date 2020-09-08
 */
public class MBanner extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 承保人 */
    @Excel(name = "承保人")
    private String underwriterId;

    /** 承保商 */
    @Excel(name = "承保商")
    private String subunderwriterId;

    /** 特殊分类 */
    @Excel(name = "特殊分类")
    private String categoryId;

    /** 客户id */
    @Excel(name = "客户id")
    private String clientId;

    /** 图片地址 */
    @Excel(name = "图片地址")
    private String url;

    /** 排序 */
    @Excel(name = "排序")
    private Integer sort;

    /** 分类 */
    @Excel(name = "分类")
    private String type;

    /** 状态 */
    @Excel(name = "状态")
    private Integer status;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUnderwriterId(String underwriterId) 
    {
        this.underwriterId = underwriterId;
    }

    public String getUnderwriterId() 
    {
        return underwriterId;
    }
    public void setSubunderwriterId(String subunderwriterId) 
    {
        this.subunderwriterId = subunderwriterId;
    }

    public String getSubunderwriterId() 
    {
        return subunderwriterId;
    }
    public void setCategoryId(String categoryId) 
    {
        this.categoryId = categoryId;
    }

    public String getCategoryId() 
    {
        return categoryId;
    }
    public void setClientId(String clientId) 
    {
        this.clientId = clientId;
    }

    public String getClientId() 
    {
        return clientId;
    }
    public void setUrl(String url) 
    {
        this.url = url;
    }

    public String getUrl() 
    {
        return url;
    }
    public void setSort(Integer sort) 
    {
        this.sort = sort;
    }

    public Integer getSort() 
    {
        return sort;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }
    public void setStatus(Integer status) 
    {
        this.status = status;
    }

    public Integer getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("underwriterId", getUnderwriterId())
            .append("subunderwriterId", getSubunderwriterId())
            .append("categoryId", getCategoryId())
            .append("clientId", getClientId())
            .append("url", getUrl())
            .append("sort", getSort())
            .append("type", getType())
            .append("status", getStatus())
            .toString();
    }
}
