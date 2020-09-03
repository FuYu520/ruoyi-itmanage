package com.ruoyi.wechat.service;

import java.util.List;

import com.ruoyi.wechat.domain.MRoleResource;
import com.ruoyi.wechat.vo.MRoleResourceVo;

/**
 * 模块白名单Service接口
 * 
 * @author ruoyi
 * @date 2020-08-24
 */
public interface IMRoleResourceService 
{
    /**
     * 查询模块白名单
     * 
     * @param id 模块白名单ID
     * @return 模块白名单
     */
    public MRoleResource selectMRoleResourceById(Long id);

    /**
     * 查询模块白名单列表
     * 
     * @param mRoleResource 模块白名单
     * @return 模块白名单集合
     */
    public List<MRoleResource> selectMRoleResourceList(MRoleResource mRoleResource);

    /**
     * 新增模块白名单
     * 
     * @param mRoleResource 模块白名单
     * @return 结果
     */
    public int insertMRoleResource(MRoleResource mRoleResource);

    /**
     * 批量新增微信资源
     *
     * @param mRoleResourceVo
     * @return
     */
    public int batchAddMRoleResource(MRoleResourceVo mRoleResourceVo);

    /**
     * 修改模块白名单
     * 
     * @param mRoleResource 模块白名单
     * @return 结果
     */
    public int updateMRoleResource(MRoleResource mRoleResource);

    /**
     * 批量删除模块白名单
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteMRoleResourceByIds(String ids);

    /**
     * 删除模块白名单信息
     * 
     * @param id 模块白名单ID
     * @return 结果
     */
    public int deleteMRoleResourceById(Long id);
}
