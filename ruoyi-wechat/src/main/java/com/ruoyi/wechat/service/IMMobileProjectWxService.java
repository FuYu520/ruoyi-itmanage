package com.ruoyi.wechat.service;

import java.util.List;
import com.ruoyi.wechat.domain.MMobileProjectWx;

/**
 * 承保商配置Service接口
 * 
 * @author FuYu
 * @date 2020-09-02
 */
public interface IMMobileProjectWxService 
{
    /**
     * 查询承保商配置
     * 
     * @param ACSKEY 承保商配置ID
     * @return 承保商配置
     */
    public MMobileProjectWx selectMMobileProjectWxById(Long ACSKEY);

    /**
     * 查询承保商配置列表
     * 
     * @param mMobileProjectWx 承保商配置
     * @return 承保商配置集合
     */
    public List<MMobileProjectWx> selectMMobileProjectWxList(MMobileProjectWx mMobileProjectWx);

    /**
     * 新增承保商配置
     * 
     * @param mMobileProjectWx 承保商配置
     * @return 结果
     */
    public int insertMMobileProjectWx(MMobileProjectWx mMobileProjectWx);

    /**
     * 修改承保商配置
     * 
     * @param mMobileProjectWx 承保商配置
     * @return 结果
     */
    public int updateMMobileProjectWx(MMobileProjectWx mMobileProjectWx);

    /**
     * 批量删除承保商配置
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteMMobileProjectWxByIds(String ids);

    /**
     * 删除承保商配置信息
     * 
     * @param ACSKEY 承保商配置ID
     * @return 结果
     */
    public int deleteMMobileProjectWxById(Long ACSKEY);
}
