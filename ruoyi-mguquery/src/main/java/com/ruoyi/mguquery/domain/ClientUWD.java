package com.ruoyi.mguquery.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @Author YuFu
 * @Description
 * @Date 2020/8/25 14:46
 **/
public class ClientUWD extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 客户ID
     */
    private String clientId;

    /**
     * 客户简称
     */
    private String cShortName;

    /**
     * 客户中文
     */
    private String cChineseName;

    /**
     * 客户英文
     */
    private String cEnglishName;

    /**
     * 业务类型
     */
    private String businessType;

    /**
     * 承保商ID
     */
    private String underwriterId;

    /**
     * 承保商名称
     */
    private String underwriterName;

    /**
     * 子承保商ID
     */
    private String subuwNo;

    /**
     * 子承保商名称
     */
    private String subuwName;

    /**
     * 特殊分类ID
     */
    private String categoryID;

    /**
     * 特殊分类名称
     */
    private String categoryName;

    public ClientUWD() {
    }

    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    public String getcShortName() {
        return cShortName;
    }

    public void setcShortName(String cShortName) {
        this.cShortName = cShortName;
    }

    public String getcChineseName() {
        return cChineseName;
    }

    public void setcChineseName(String cChineseName) {
        this.cChineseName = cChineseName;
    }

    public String getcEnglishName() {
        return cEnglishName;
    }

    public void setcEnglishName(String cEnglishName) {
        this.cEnglishName = cEnglishName;
    }

    public String getBusinessType() {
        return businessType;
    }

    public void setBusinessType(String businessType) {
        this.businessType = businessType;
    }

    public String getUnderwriterId() {
        return underwriterId;
    }

    public void setUnderwriterId(String underwriterId) {
        this.underwriterId = underwriterId;
    }

    public String getUnderwriterName() {
        return underwriterName;
    }

    public void setUnderwriterName(String underwriterName) {
        this.underwriterName = underwriterName;
    }

    public String getSubuwNo() {
        return subuwNo;
    }

    public void setSubuwNo(String subuwNo) {
        this.subuwNo = subuwNo;
    }

    public String getSubuwName() {
        return subuwName;
    }

    public void setSubuwName(String subuwName) {
        this.subuwName = subuwName;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("clientId", getClientId())
                .append("cShortName", getcShortName())
                .append("cChineseName", getcChineseName())
                .append("cEnglishName", getcEnglishName())
                .append("businessType", getBusinessType())
                .append("underwriterId", getUnderwriterId())
                .append("underwriterName", getUnderwriterName())
                .append("subuwNo", getSubuwNo())
                .append("subuwName", getSubuwName())
                .append("categoryID", getCategoryID())
                .append("categoryName", getCategoryName())
                .toString();
    }
}
