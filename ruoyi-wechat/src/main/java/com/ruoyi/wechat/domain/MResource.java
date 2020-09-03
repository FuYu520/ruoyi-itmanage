package com.ruoyi.wechat.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 微信资源对象 m_resource
 *
 * @author ruoyi
 * @date 2020-08-24
 */
public class MResource extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * $column.columnComment
     */
    private Long id;

    /**
     * 父级
     */
    @Excel(name = "父级")
    private Long pid;

    /**
     * 资源名称
     */
    @Excel(name = "资源名称")
    private String name;

    /**
     * 资源编码
     */
    @Excel(name = "资源编码")
    private String code;

    /**
     * 1 启用 2 禁用
     */
    @Excel(name = "1 启用 2 禁用")
    private Integer status;

    /**
     * 中文提示话术
     */
    @Excel(name = "中文提示话术")
    private String zhMsg;

    /**
     * 英文提示话术
     */
    @Excel(name = "英文提示话术")
    private String enMsg;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public Long getPid() {
        return pid;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getStatus() {
        return status;
    }

    public void setZhMsg(String zhMsg) {
        this.zhMsg = zhMsg;
    }

    public String getZhMsg() {
        return zhMsg;
    }

    public void setEnMsg(String enMsg) {
        this.enMsg = enMsg;
    }

    public String getEnMsg() {
        return enMsg;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("pid", getPid())
                .append("name", getName())
                .append("code", getCode())
                .append("status", getStatus())
                .append("zhMsg", getZhMsg())
                .append("enMsg", getEnMsg())
                .append("remark", getRemark())
                .append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}
