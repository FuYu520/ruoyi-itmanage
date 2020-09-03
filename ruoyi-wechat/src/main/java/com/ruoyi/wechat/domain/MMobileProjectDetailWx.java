package com.ruoyi.wechat.domain;

import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 客服热线配置对象 m_mobile_project_detail_wx
 * 
 * @author FuYu
 * @date 2020-09-02
 */
public class MMobileProjectDetailWx extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long acskey;

    /** 承保商配置表关联主键 */
    @Excel(name = "承保商配置表关联主键")
    private Long projectid;

    /** 号码 */
    @Excel(name = "号码")
    private String number;

    /** 中文说明 */
    @Excel(name = "中文说明")
    private String cdesrc;

    /** 英文说明 */
    @Excel(name = "英文说明")
    private String edesrc;

    /** 类型 */
    @Excel(name = "类型")
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

    /** 优先级 */
    @Excel(name = "优先级")
    private String priority;

    public void setAcskey(Long acskey) 
    {
        this.acskey = acskey;
    }

    public Long getAcskey() 
    {
        return acskey;
    }
    public void setProjectid(Long projectid) 
    {
        this.projectid = projectid;
    }

    public Long getProjectid() 
    {
        return projectid;
    }
    public void setNumber(String number) 
    {
        this.number = number;
    }

    public String getNumber() 
    {
        return number;
    }
    public void setCdesrc(String cdesrc) 
    {
        this.cdesrc = cdesrc;
    }

    public String getCdesrc() 
    {
        return cdesrc;
    }
    public void setEdesrc(String edesrc) 
    {
        this.edesrc = edesrc;
    }

    public String getEdesrc() 
    {
        return edesrc;
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
    public void setPriority(String priority) 
    {
        this.priority = priority;
    }

    public String getPriority() 
    {
        return priority;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("acskey", getAcskey())
            .append("projectid", getProjectid())
            .append("number", getNumber())
            .append("cdesrc", getCdesrc())
            .append("edesrc", getEdesrc())
            .append("status", getStatus())
            .append("adddate", getAdddate())
            .append("updatedate", getUpdatedate())
            .append("AAE011", getAAE011())
            .append("AAE017", getAAE017())
            .append("AAE036", getAAE036())
            .append("AAE012", getAAE012())
            .append("AAE018", getAAE018())
            .append("AAE037", getAAE037())
            .append("priority", getPriority())
            .toString();
    }
}
