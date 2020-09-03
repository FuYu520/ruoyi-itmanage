package com.ruoyi.wechat.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.wechat.mapper.MMobileProjectDetailWxMapper;
import com.ruoyi.wechat.domain.MMobileProjectDetailWx;
import com.ruoyi.wechat.service.IMMobileProjectDetailWxService;
import com.ruoyi.common.core.text.Convert;

/**
 * 客服热线配置Service业务层处理
 * 
 * @author FuYu
 * @date 2020-09-02
 */
@Service
public class MMobileProjectDetailWxServiceImpl implements IMMobileProjectDetailWxService 
{
    @Autowired
    private MMobileProjectDetailWxMapper mMobileProjectDetailWxMapper;

    /**
     * 查询客服热线配置
     * 
     * @param acskey 客服热线配置ID
     * @return 客服热线配置
     */
    @Override
    public MMobileProjectDetailWx selectMMobileProjectDetailWxById(Long acskey)
    {
        return mMobileProjectDetailWxMapper.selectMMobileProjectDetailWxById(acskey);
    }

    /**
     * 查询客服热线配置列表
     * 
     * @param mMobileProjectDetailWx 客服热线配置
     * @return 客服热线配置
     */
    @Override
    public List<MMobileProjectDetailWx> selectMMobileProjectDetailWxList(MMobileProjectDetailWx mMobileProjectDetailWx)
    {
        return mMobileProjectDetailWxMapper.selectMMobileProjectDetailWxList(mMobileProjectDetailWx);
    }

    /**
     * 新增客服热线配置
     * 
     * @param mMobileProjectDetailWx 客服热线配置
     * @return 结果
     */
    @Override
    public int insertMMobileProjectDetailWx(MMobileProjectDetailWx mMobileProjectDetailWx)
    {
        return mMobileProjectDetailWxMapper.insertMMobileProjectDetailWx(mMobileProjectDetailWx);
    }

    /**
     * 修改客服热线配置
     * 
     * @param mMobileProjectDetailWx 客服热线配置
     * @return 结果
     */
    @Override
    public int updateMMobileProjectDetailWx(MMobileProjectDetailWx mMobileProjectDetailWx)
    {
        return mMobileProjectDetailWxMapper.updateMMobileProjectDetailWx(mMobileProjectDetailWx);
    }

    /**
     * 删除客服热线配置对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteMMobileProjectDetailWxByIds(String ids)
    {
        return mMobileProjectDetailWxMapper.deleteMMobileProjectDetailWxByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除客服热线配置信息
     * 
     * @param acskey 客服热线配置ID
     * @return 结果
     */
    @Override
    public int deleteMMobileProjectDetailWxById(Long acskey)
    {
        return mMobileProjectDetailWxMapper.deleteMMobileProjectDetailWxById(acskey);
    }
}
