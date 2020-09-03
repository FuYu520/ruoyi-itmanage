package com.ruoyi.wechat.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 模块白名单对象 m_role_resource
 *
 * @author ruoyi
 * @date 2020-08-24
 */
public class MRoleResource extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * $column.columnComment
     */
    private Long id;

    /**
     * 用户类型 mgu(01) or tpa(02)
     */
    @Excel(name = "用户类型 mgu(01) or tpa(02)  ")
    private String userType;

    /**
     * 资源id
     */
    @Excel(name = "资源id")
    private Long resourceId;

    /**
     * 资源名称
     */
    private String resourceName;

    /**
     * 状态 1 启用 2 禁用
     */
    @Excel(name = "1 启用 2 禁用")
    private Integer status;

    /**
     * 承保商id
     */
    @Excel(name = "承保商id")
    private String underwriteId;

    /**
     * 承保商名称
     */
    private String underwriteName;

    /**
     * 公司ID
     */
    @Excel(name = "客户ID")
    private String clientId;

    /**
     * 客户名称
     */
    private String clientName;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getUserType() {
        return userType;
    }

    public void setResourceId(Long resourceId) {
        this.resourceId = resourceId;
    }

    public Long getResourceId() {
        return resourceId;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getStatus() {
        return status;
    }

    public void setUnderwriteId(String underwriteId) {
        this.underwriteId = underwriteId;
    }

    public String getUnderwriteId() {
        return underwriteId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    public String getClientId() {
        return clientId;
    }

    public String getResourceName() {
        return resourceName;
    }

    public void setResourceName(String resourceName) {
        this.resourceName = resourceName;
    }

    public String getUnderwriteName() {
        return underwriteName;
    }

    public void setUnderwriteName(String underwriteName) {
        this.underwriteName = underwriteName;
    }

    public String getClientName() {
        return clientName;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("userType", getUserType())
                .append("resourceId", getResourceId())
                .append("status", getStatus())
                .append("underwriteId", getUnderwriteId())
                .append("createTime", getCreateTime())
                .append("clientId", getClientId())
                .append("clientName", getClientName())
                .append("underwriteName", getUnderwriteName())
                .append("resourceName", getUnderwriteName())
                .toString();
    }
}
