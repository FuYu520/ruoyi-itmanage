package com.ruoyi.wechat.vo;

import com.ruoyi.wechat.domain.MRoleResource;

import java.io.Serializable;
import java.util.List;

/**
 * @Author YuFu
 * @Description
 * @Date 2020/8/25 13:31
 **/
public class MRoleResourceVo extends MRoleResource {

    private static final long serialVersionUID = 1L;

    /**
     * 资源id
     */
    private List<Long> resourceIds;

    /**
     * 1 启用 2 禁用
     */
    private Integer status;


    public MRoleResourceVo() {
    }

    public List<Long> getResourceIds() {
        return resourceIds;
    }

    public void setResourceIds(List<Long> resourceIds) {
        this.resourceIds = resourceIds;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
