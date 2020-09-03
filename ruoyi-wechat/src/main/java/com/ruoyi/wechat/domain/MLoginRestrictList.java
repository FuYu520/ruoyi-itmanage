package com.ruoyi.wechat.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.List;

/**
 * 登录限制对象 m_login_restrict_list
 * 
 * @author ruoyi
 * @date 2020-09-01
 */
public class MLoginRestrictList extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long acskey;

    /** 限制类型：1黑名单，2白名单 */
    @Excel(name = "限制类型：1黑名单，2白名单")
    private String reversalFlag;

    /** 业务类型：01MGU，02TPA */
    @Excel(name = "业务类型：01MGU，02TPA")
    private String bussType;

    /** 承包商id */
    @Excel(name = "承包商id")
    private String uwId;

    /**
     * 承保商id集合
     */
    private List<String> underwriterIds;

    /**
     * 承保商名称
     */
    private String underwriterName;

    /** 子承包商id */
    @Excel(name = "子承包商id")
    private String subUwId;

    /** 特殊分类 */
    @Excel(name = "特殊分类")
    private String spCate;

    /** 公司ID */
    @Excel(name = "公司ID")
    private String clientId;

    /** 公司简称 */
    @Excel(name = "公司简称")
    private String clientShortName;

    /** 会员ID */
    @Excel(name = "会员ID")
    private String empId;

    /** 是否有效：0可用，1禁用 */
    @Excel(name = "是否有效：0可用，1禁用")
    private String isValid;

    public void setAcskey(Long acskey) 
    {
        this.acskey = acskey;
    }

    public Long getAcskey() 
    {
        return acskey;
    }
    public void setReversalFlag(String reversalFlag) 
    {
        this.reversalFlag = reversalFlag;
    }

    public String getReversalFlag() 
    {
        return reversalFlag;
    }
    public void setBussType(String bussType) 
    {
        this.bussType = bussType;
    }

    public String getBussType() 
    {
        return bussType;
    }
    public void setUwId(String uwId) 
    {
        this.uwId = uwId;
    }

    public String getUwId() 
    {
        return uwId;
    }
    public void setSubUwId(String subUwId) 
    {
        this.subUwId = subUwId;
    }

    public List<String> getUnderwriterIds() {
        return underwriterIds;
    }

    public void setUnderwriterIds(List<String> underwriterIds) {
        this.underwriterIds = underwriterIds;
    }

    public String getUnderwriterName() {
        return underwriterName;
    }

    public void setUnderwriterName(String underwriterName) {
        this.underwriterName = underwriterName;
    }

    public String getSubUwId()
    {
        return subUwId;
    }
    public void setSpCate(String spCate) 
    {
        this.spCate = spCate;
    }

    public String getSpCate() 
    {
        return spCate;
    }
    public void setClientId(String clientId) 
    {
        this.clientId = clientId;
    }

    public String getClientId() 
    {
        return clientId;
    }
    public void setClientShortName(String clientShortName) 
    {
        this.clientShortName = clientShortName;
    }

    public String getClientShortName() 
    {
        return clientShortName;
    }
    public void setEmpId(String empId) 
    {
        this.empId = empId;
    }

    public String getEmpId() 
    {
        return empId;
    }
    public void setIsValid(String isValid) 
    {
        this.isValid = isValid;
    }

    public String getIsValid() 
    {
        return isValid;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("acskey", getAcskey())
            .append("reversalFlag", getReversalFlag())
            .append("bussType", getBussType())
            .append("uwId", getUwId())
            .append("underwriterIds", getUnderwriterIds())
            .append("underwriterName", getUnderwriterName())
            .append("subUwId", getSubUwId())
            .append("spCate", getSpCate())
            .append("clientId", getClientId())
            .append("clientShortName", getClientShortName())
            .append("empId", getEmpId())
            .append("isValid", getIsValid())
            .toString();
    }
}
