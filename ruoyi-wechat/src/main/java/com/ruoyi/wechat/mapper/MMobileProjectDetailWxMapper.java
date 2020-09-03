package com.ruoyi.wechat.mapper;

import java.util.List;
import com.ruoyi.wechat.domain.MMobileProjectDetailWx;

/**
 * 客服热线配置Mapper接口
 * 
 * @author FuYu
 * @date 2020-09-02
 */
public interface MMobileProjectDetailWxMapper 
{
    /**
     * 查询客服热线配置
     * 
     * @param acskey 客服热线配置ID
     * @return 客服热线配置
     */
    public MMobileProjectDetailWx selectMMobileProjectDetailWxById(Long acskey);

    /**
     * 查询客服热线配置列表
     * 
     * @param mMobileProjectDetailWx 客服热线配置
     * @return 客服热线配置集合
     */
    public List<MMobileProjectDetailWx> selectMMobileProjectDetailWxList(MMobileProjectDetailWx mMobileProjectDetailWx);

    /**
     * 新增客服热线配置
     * 
     * @param mMobileProjectDetailWx 客服热线配置
     * @return 结果
     */
    public int insertMMobileProjectDetailWx(MMobileProjectDetailWx mMobileProjectDetailWx);

    /**
     * 修改客服热线配置
     * 
     * @param mMobileProjectDetailWx 客服热线配置
     * @return 结果
     */
    public int updateMMobileProjectDetailWx(MMobileProjectDetailWx mMobileProjectDetailWx);

    /**
     * 删除客服热线配置
     * 
     * @param acskey 客服热线配置ID
     * @return 结果
     */
    public int deleteMMobileProjectDetailWxById(Long acskey);

    /**
     * 批量删除客服热线配置
     * 
     * @param acskeys 需要删除的数据ID
     * @return 结果
     */
    public int deleteMMobileProjectDetailWxByIds(String[] acskeys);
}
