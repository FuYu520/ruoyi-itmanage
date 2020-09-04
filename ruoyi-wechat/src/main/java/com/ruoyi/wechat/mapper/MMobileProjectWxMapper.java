package com.ruoyi.wechat.mapper;

import java.util.List;

import com.ruoyi.common.annotation.DataSource;
import com.ruoyi.common.enums.DataSourceType;
import com.ruoyi.wechat.domain.MMobileProjectWx;

/**
 * 承保商配置Mapper接口
 * 
 * @author FuYu
 * @date 2020-09-02
 */
@DataSource(value = DataSourceType.WECHAT)
public interface MMobileProjectWxMapper 
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
     * 删除承保商配置
     * 
     * @param ACSKEY 承保商配置ID
     * @return 结果
     */
    public int deleteMMobileProjectWxById(Long ACSKEY);

    /**
     * 批量删除承保商配置
     * 
     * @param ACSKEYs 需要删除的数据ID
     * @return 结果
     */
    public int deleteMMobileProjectWxByIds(String[] ACSKEYs);
}
