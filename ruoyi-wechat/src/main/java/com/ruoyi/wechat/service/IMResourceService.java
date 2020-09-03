package com.ruoyi.wechat.service;

import java.util.List;

import com.ruoyi.common.core.domain.Ztree;
import com.ruoyi.wechat.domain.MResource;
import com.ruoyi.wechat.vo.MRoleResourceVo;

/**
 * 微信资源Service接口
 * 
 * @author ruoyi
 * @date 2020-08-24
 */
public interface IMResourceService 
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
     * 批量删除微信资源
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteMResourceByIds(String ids);

    /**
     * 删除微信资源信息
     * 
     * @param id 微信资源ID
     * @return 结果
     */
    public int deleteMResourceById(Long id);

    /**
     * 加载所有微信资源菜单列表树
     */
    List<Ztree> resourceTreeData(Long[] underwriteId);
}
