package com.ruoyi.wechat.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.wechat.mapper.MBannerMapper;
import com.ruoyi.wechat.domain.MBanner;
import com.ruoyi.wechat.service.IMBannerService;
import com.ruoyi.common.core.text.Convert;

/**
 * 首页banner图Service业务层处理
 * 
 * @author FuYu
 * @date 2020-09-08
 */
@Service
public class MBannerServiceImpl implements IMBannerService 
{
    @Autowired
    private MBannerMapper mBannerMapper;

    /**
     * 查询首页banner图
     * 
     * @param id 首页banner图ID
     * @return 首页banner图
     */
    @Override
    public MBanner selectMBannerById(Long id)
    {
        return mBannerMapper.selectMBannerById(id);
    }

    /**
     * 查询首页banner图列表
     * 
     * @param mBanner 首页banner图
     * @return 首页banner图
     */
    @Override
    public List<MBanner> selectMBannerList(MBanner mBanner)
    {
        return mBannerMapper.selectMBannerList(mBanner);
    }

    /**
     * 新增首页banner图
     * 
     * @param mBanner 首页banner图
     * @return 结果
     */
    @Override
    public int insertMBanner(MBanner mBanner)
    {
        return mBannerMapper.insertMBanner(mBanner);
    }

    /**
     * 修改首页banner图
     * 
     * @param mBanner 首页banner图
     * @return 结果
     */
    @Override
    public int updateMBanner(MBanner mBanner)
    {
        return mBannerMapper.updateMBanner(mBanner);
    }

    /**
     * 删除首页banner图对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteMBannerByIds(String ids)
    {
        return mBannerMapper.deleteMBannerByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除首页banner图信息
     * 
     * @param id 首页banner图ID
     * @return 结果
     */
    @Override
    public int deleteMBannerById(Long id)
    {
        return mBannerMapper.deleteMBannerById(id);
    }
}
