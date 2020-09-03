package com.ruoyi.common.enums;

/**
 * 数据源
 * 
 * @author ruoyi
 */
public enum DataSourceType
{
    /**
     * 主库
     */
    MASTER,

    /**
     * 从库
     */
    SLAVE,
    /**
     * ITManage rbac_db库
     */
    MANAGE,
    /**
     * MGU查询库
     */
    MGUQUERY,
    /**
     * 预约库
     */
    APPOINTMENT,
    /**
     * APP/Wechat库
     */
    WECHAT,
    /**
     * IPMI库
     */
    IPMI,
    /**
     * MGU查询库--Web
     */
    MYMSH,
    /**
     * MyMshMGU
     */
    MYMSHMGU
}
