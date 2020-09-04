package com.ruoyi.wechat.mapper;

import java.util.List;

import com.ruoyi.common.annotation.DataSource;
import com.ruoyi.common.enums.DataSourceType;
import com.ruoyi.wechat.domain.MResource;
import org.apache.ibatis.annotations.Param;

/**
 * 微信资源Mapper接口
 * 
 * @author ruoyi
 * @date 2020-08-24
 */
@DataSource(value = DataSourceType.WECHAT)
public interface MResourceMapper 
{
    /**
     * 查询微信资源
     * 
     * @param id 微信资源ID
     * @return 微信资源
     */
    public MResource selectMResourceById(Long id);

    /**
     * 查询微信资源列表
     * 
     * @param mResource 微信资源
     * @return 微信资源集合
     */
    public List<MResource> selectMResourceList(MResource mResource);

    /**
     * 新增微信资源
     * 
     * @param mResource 微信资源
     * @return 结果
     */
    public int insertMResource(MResource mResource);

    /**
     * 修改微信资源
     * 
     * @param mResource 微信资源
     * @return 结果
     */
    public int updateMResource(MResource mResource);

    /**
     * 删除微信资源
     * 
     * @param id 微信资源ID
     * @return 结果
     */
    public int deleteMResourceById(Long id);

    /**
     * 批量删除微信资源
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteMResourceByIds(String[] ids);

    /**
     * 根据承保商Id 查询对应资源
     * @param underwriteId
     * @return
     */
    List<Long> selectMResourceByUnderwriteId(@Param("underwriteId") String underwriteId);

    /**
     * 根据code 查询相关资源
     * @param code
     * @return
     */
    List<MResource> selectByCode(String code);
}
