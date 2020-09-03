package com.ruoyi.wechat.domain;

import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 承保商配置对象 m_mobile_project_wx
 * 
 * @author FuYu
 * @date 2020-09-02
 */
public class MMobileProjectWx extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long acskey;

    /** 承包商id */
    @Excel(name = "承包商id")
    private String underwriterId;

    /** 承包商名称 */
    @Excel(name = "承包商名称")
    private String underwriterName;

    /** 子承保商id */
    @Excel(name = "子承保商id")
    private String subunderwriterId;

    /** 子承保商名称 */
    @Excel(name = "子承保商名称")
    private String subuwName;

    /** 特殊分类id */
    @Excel(name = "特殊分类id")
    private String categoryId;

    /** 特殊分类名称 */
    @Excel(name = "特殊分类名称")
    private String categoryName;

    /** 客户 */
    @Excel(name = "客户")
    private String clientId;

    /** 客户id */
    @Excel(name = "客户id")
    private String clientName;

    /** 中文首页标题 */
    @Excel(name = "中文首页标题")
    private String chomepagetitle;

    /** 英文首页标题 */
    @Excel(name = "英文首页标题")
    private String ehomepagetitle;

    /** 中文介绍 */
    @Excel(name = "中文介绍")
    private String cintroduction;

    /** 英文介绍 */
    @Excel(name = "英文介绍")
    private String eintroduction;

    /** 中文地址 */
    @Excel(name = "中文地址")
    private String caddress;

    /** 英文地址 */
    @Excel(name = "英文地址")
    private String eaddress;

    /** 邮箱 */
    @Excel(name = "邮箱")
    private String email;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    /** 创建时间 */
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date adddate;

    /** 修改时间 */
    @Excel(name = "修改时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date updatedate;

    /** null */
    @Excel(name = "null")
    private String AAE011;

    /** null */
    @Excel(name = "null")
    private String AAE017;

    /** null */
    @Excel(name = "null", width = 30, dateFormat = "yyyy-MM-dd")
    private Date AAE036;

    /** null */
    @Excel(name = "null")
    private String AAE012;

    /** null */
    @Excel(name = "null")
    private String AAE018;

    /** null */
    @Excel(name = "null", width = 30, dateFormat = "yyyy-MM-dd")
    private Date AAE037;

    public void setAcskey(Long acskey)
    {
        this.acskey = acskey;
    }

    public Long getAcskey()
    {
        return acskey;
    }
    public void setUnderwriterId(String underwriterId)
    {
        this.underwriterId = underwriterId;
    }

    public String getUnderwriterId()
    {
        return underwriterId;
    }
    public void setUnderwriterName(String underwriterName)
    {
        this.underwriterName = underwriterName;
    }

    public String getUnderwriterName()
    {
        return underwriterName;
    }
    public void setSubunderwriterId(String Subunderwriterid)
    {
        this.subunderwriterId = Subunderwriterid;
    }

    public String getSubunderwriterId()
    {
        return subunderwriterId;
    }
    public void setSubuwName(String subuwName)
    {
        this.subuwName = subuwName;
    }

    public String getSubuwName()
    {
        return subuwName;
    }
    public void setCategoryId(String CategoryID)
    {
        this.categoryId = CategoryID;
    }

    public String getCategoryId()
    {
        return categoryId;
    }
    public void setCategoryName(String categoryName) 
    {
        this.categoryName = categoryName;
    }

    public String getCategoryName() 
    {
        return categoryName;
    }
    public void setClientId(String clientId)
    {
        this.clientId = clientId;
    }

    public String getClientId()
    {
        return clientId;
    }

    public void setClientName(String clientName)
    {
        this.clientName = clientName;
    }

    public String getClientName()
    {
        return clientName;
    }
    public void setChomepagetitle(String chomepagetitle) 
    {
        this.chomepagetitle = chomepagetitle;
    }

    public String getChomepagetitle() 
    {
        return chomepagetitle;
    }
    public void setEhomepagetitle(String ehomepagetitle) 
    {
        this.ehomepagetitle = ehomepagetitle;
    }

    public String getEhomepagetitle() 
    {
        return ehomepagetitle;
    }
    public void setCintroduction(String cintroduction) 
    {
        this.cintroduction = cintroduction;
    }

    public String getCintroduction() 
    {
        return cintroduction;
    }
    public void setEintroduction(String eintroduction) 
    {
        this.eintroduction = eintroduction;
    }

    public String getEintroduction() 
    {
        return eintroduction;
    }
    public void setCaddress(String caddress) 
    {
        this.caddress = caddress;
    }

    public String getCaddress() 
    {
        return caddress;
    }
    public void setEaddress(String eaddress) 
    {
        this.eaddress = eaddress;
    }

    public String getEaddress() 
    {
        return eaddress;
    }
    public void setEmail(String email) 
    {
        this.email = email;
    }

    public String getEmail() 
    {
        return email;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setAdddate(Date adddate) 
    {
        this.adddate = adddate;
    }

    public Date getAdddate() 
    {
        return adddate;
    }
    public void setUpdatedate(Date updatedate) 
    {
        this.updatedate = updatedate;
    }

    public Date getUpdatedate() 
    {
        return updatedate;
    }
    public void setAAE011(String AAE011) 
    {
        this.AAE011 = AAE011;
    }

    public String getAAE011() 
    {
        return AAE011;
    }
    public void setAAE017(String AAE017) 
    {
        this.AAE017 = AAE017;
    }

    public String getAAE017() 
    {
        return AAE017;
    }
    public void setAAE036(Date AAE036) 
    {
        this.AAE036 = AAE036;
    }

    public Date getAAE036() 
    {
        return AAE036;
    }
    public void setAAE012(String AAE012) 
    {
        this.AAE012 = AAE012;
    }

    public String getAAE012() 
    {
        return AAE012;
    }
    public void setAAE018(String AAE018) 
    {
        this.AAE018 = AAE018;
    }

    public String getAAE018() 
    {
        return AAE018;
    }
    public void setAAE037(Date AAE037) 
    {
        this.AAE037 = AAE037;
    }

    public Date getAAE037() 
    {
        return AAE037;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("ACSKEY", getAcskey())
            .append("underwriterid", getUnderwriterId())
            .append("underwritername", getUnderwriterName())
            .append("Subunderwriterid", getSubunderwriterId())
            .append("subuwname", getSubuwName())
            .append("CategoryID", getCategoryId())
            .append("categoryName", getCategoryName())
            .append("client", getClientId())
            .append("clientname", getClientName())
            .append("chomepagetitle", getChomepagetitle())
            .append("ehomepagetitle", getEhomepagetitle())
            .append("cintroduction", getCintroduction())
            .append("eintroduction", getEintroduction())
            .append("caddress", getCaddress())
            .append("eaddress", getEaddress())
            .append("email", getEmail())
            .append("status", getStatus())
            .append("adddate", getAdddate())
            .append("updatedate", getUpdatedate())
            .append("AAE011", getAAE011())
            .append("AAE017", getAAE017())
            .append("AAE036", getAAE036())
            .append("AAE012", getAAE012())
            .append("AAE018", getAAE018())
            .append("AAE037", getAAE037())
            .toString();
    }
}
