package com.ruoyi.wechat.service;

import java.util.List;
import com.ruoyi.wechat.domain.MBanner;

/**
 * 首页banner图Service接口
 * 
 * @author FuYu
 * @date 2020-09-08
 */
public interface IMBannerService 
{
    /**
     * 查询首页banner图
     * 
     * @param id 首页banner图ID
     * @return 首页banner图
     */
    public MBanner selectMBannerById(Long id);

    /**
     * 查询首页banner图列表
     * 
     * @param mBanner 首页banner图
     * @return 首页banner图集合
     */
    public List<MBanner> selectMBannerList(MBanner mBanner);

    /**
     * 新增首页banner图
     * 
     * @param mBanner 首页banner图
     * @return 结果
     */
    public int insertMBanner(MBanner mBanner);

    /**
     * 修改首页banner图
     * 
     * @param mBanner 首页banner图
     * @return 结果
     */
    public int updateMBanner(MBanner mBanner);

    /**
     * 批量删除首页banner图
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteMBannerByIds(String ids);

    /**
     * 删除首页banner图信息
     * 
     * @param id 首页banner图ID
     * @return 结果
     */
    public int deleteMBannerById(Long id);
}
