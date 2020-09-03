package com.ruoyi.wechat.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.wechat.mapper.MMobileProjectWxMapper;
import com.ruoyi.wechat.domain.MMobileProjectWx;
import com.ruoyi.wechat.service.IMMobileProjectWxService;
import com.ruoyi.common.core.text.Convert;

/**
 * 承保商配置Service业务层处理
 * 
 * @author FuYu
 * @date 2020-09-02
 */
@Service
public class MMobileProjectWxServiceImpl implements IMMobileProjectWxService 
{
    @Autowired
    private MMobileProjectWxMapper mMobileProjectWxMapper;

    /**
     * 查询承保商配置
     * 
     * @param ACSKEY 承保商配置ID
     * @return 承保商配置
     */
    @Override
    public MMobileProjectWx selectMMobileProjectWxById(Long ACSKEY)
    {
        return mMobileProjectWxMapper.selectMMobileProjectWxById(ACSKEY);
    }

    /**
     * 查询承保商配置列表
     * 
     * @param mMobileProjectWx 承保商配置
     * @return 承保商配置
     */
    @Override
    public List<MMobileProjectWx> selectMMobileProjectWxList(MMobileProjectWx mMobileProjectWx)
    {
        return mMobileProjectWxMapper.selectMMobileProjectWxList(mMobileProjectWx);
    }

    /**
     * 新增承保商配置
     * 
     * @param mMobileProjectWx 承保商配置
     * @return 结果
     */
    @Override
    public int insertMMobileProjectWx(MMobileProjectWx mMobileProjectWx)
    {
        return mMobileProjectWxMapper.insertMMobileProjectWx(mMobileProjectWx);
    }

    /**
     * 修改承保商配置
     * 
     * @param mMobileProjectWx 承保商配置
     * @return 结果
     */
    @Override
    public int updateMMobileProjectWx(MMobileProjectWx mMobileProjectWx)
    {
        return mMobileProjectWxMapper.updateMMobileProjectWx(mMobileProjectWx);
    }

    /**
     * 删除承保商配置对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteMMobileProjectWxByIds(String ids)
    {
        return mMobileProjectWxMapper.deleteMMobileProjectWxByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除承保商配置信息
     * 
     * @param ACSKEY 承保商配置ID
     * @return 结果
     */
    @Override
    public int deleteMMobileProjectWxById(Long ACSKEY)
    {
        return mMobileProjectWxMapper.deleteMMobileProjectWxById(ACSKEY);
    }
}
