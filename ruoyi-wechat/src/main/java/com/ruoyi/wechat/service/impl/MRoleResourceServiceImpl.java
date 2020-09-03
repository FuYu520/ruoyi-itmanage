package com.ruoyi.wechat.service.impl;

import java.util.*;
import java.util.stream.Collectors;

import com.ruoyi.common.exception.BusinessException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.wechat.domain.MRoleResource;
import com.ruoyi.mguquery.service.ClientUwService;
import com.ruoyi.wechat.service.IMRoleResourceService;
import com.ruoyi.wechat.vo.MRoleResourceVo;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.wechat.mapper.MRoleResourceMapper;
import com.ruoyi.common.core.text.Convert;

/**
 * 模块白名单Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-08-24
 */
@Service
public class MRoleResourceServiceImpl implements IMRoleResourceService
{
    @Autowired
    private MRoleResourceMapper mRoleResourceMapper;
    @Autowired
    private ClientUwService clientUwService;


    /**
     * 查询模块白名单
     * 
     * @param id 模块白名单ID
     * @return 模块白名单
     */
    @Override
    public MRoleResource selectMRoleResourceById(Long id)
    {
        MRoleResource mRoleResource = mRoleResourceMapper.selectMRoleResourceById(id);
        if (mRoleResource != null) {
            return getRoleResource(mRoleResource);
        }
        return mRoleResource;
    }

    /**
     * 查询模块白名单列表
     * 
     * @param mRoleResource 模块白名单
     * @return 模块白名单
     */
    @Override
    public List<MRoleResource> selectMRoleResourceList(MRoleResource mRoleResource)
    {
        List<String> underwriterIds = null;
        //承保商名称
        if (StringUtils.isNotEmpty(mRoleResource.getUnderwriteName())) {
            underwriterIds = clientUwService.findUnderwriterIdsByUnderwriterNameLike("%" + mRoleResource.getUnderwriteName() + "%");
            if (CollectionUtils.isNotEmpty(underwriterIds)) {
                Set<String> underwriterIdSets = new HashSet<>(underwriterIds);
                underwriterIds = new ArrayList<>(underwriterIdSets);
            } else {
                //返回空对象
                return new ArrayList<>();
            }
        }
        List<String> clientIds = null;
        //公司名称
        if (StringUtils.isNotEmpty(mRoleResource.getClientName())) {
            clientIds = clientUwService.findClientIdsByClientNameLike("%" + mRoleResource.getClientName() + "%");
            if (CollectionUtils.isNotEmpty(clientIds)) {
                Set<String> clientIdSets = new HashSet<>(clientIds);
                clientIds = new ArrayList<>(clientIdSets);
            } else {
                //返回空对象
                return new ArrayList<>();
            }
        }

        List<MRoleResource> roleResourceList = mRoleResourceMapper.selectMRoleResourceList(mRoleResource, underwriterIds, clientIds);
        if (CollectionUtils.isNotEmpty(roleResourceList)) {
            return getRoleResourceList(roleResourceList);
        }
        return roleResourceList;
    }

    /**
     * 获取返回值 list
     *
     * @param roleResourceList
     * @return
     */
    private List<MRoleResource> getRoleResourceList(List<MRoleResource> roleResourceList) {
        List<String> clientIds = roleResourceList.stream().map(roleResource -> roleResource.getClientId()).collect(Collectors.toList());
        HashMap<String, String> clientMap = clientUwService.getClientMap(clientIds);
        List<String> uwIds = roleResourceList.stream().map(roleResource -> roleResource.getUnderwriteId()).collect(Collectors.toList());
        HashMap<String, String> underwriterMap = clientUwService.getUnderwriterMap(uwIds);
        //循环赋值
        for (MRoleResource roleResource : roleResourceList) {
            //设置承保商名称
            roleResource.setUnderwriteName(underwriterMap.get(roleResource.getUnderwriteId() + ""));
            //设置客户名称
            roleResource.setClientName(clientMap.get(roleResource.getClientId() + ""));
        }
        return roleResourceList;
    }

    /**
     * 获取返回值
     *
     * @param roleResource
     * @return
     */
    private MRoleResource getRoleResource(MRoleResource roleResource) {
        HashMap<String, String> clientMap = clientUwService.getClientMap(Arrays.asList(roleResource.getClientId()));
        HashMap<String, String> underwriterMap = clientUwService.getUnderwriterMap(Arrays.asList(roleResource.getUnderwriteId()));
        //设置承保商名称
        roleResource.setUnderwriteName(underwriterMap.get(roleResource.getUnderwriteId() + ""));
        //设置客户名称
        roleResource.setClientName(clientMap.get(roleResource.getClientId() + ""));
        return roleResource;
    }

    /**
     * 新增模块白名单
     * 
     * @param mRoleResource 模块白名单
     * @return 结果
     */
    @Override
    public int insertMRoleResource(MRoleResource mRoleResource)
    {
        mRoleResource.setCreateTime(DateUtils.getNowDate());
        return mRoleResourceMapper.insertMRoleResource(mRoleResource);
    }

    /**
     * 批量新增模块白名单
     *
     * @param mRoleResourceVo 模块白名单Vo
     * @return 结果
     */
    @Override
    public int batchAddMRoleResource(MRoleResourceVo mRoleResourceVo) {
        List<Long> newResourceIdList = mRoleResourceVo.getResourceIds();
        //查出以原有的承保商id配置的资源id 集合
        List<Long> oldResourceIdList = mRoleResourceMapper.selectResourceIdsByUnderwriterIdAndClientId(mRoleResourceVo.getUnderwriteId(), mRoleResourceVo.getClientId());
        //去除存在的
        newResourceIdList.removeAll(oldResourceIdList);
        MRoleResource mRoleResource = null;
        //批量新增新资源数据
        for (int i = 0; i < newResourceIdList.size(); i++) {
            mRoleResource = new MRoleResource();
            mRoleResource.setClientId(mRoleResourceVo.getClientId());
            mRoleResource.setUserType(mRoleResourceVo.getUserType());
            mRoleResource.setStatus(mRoleResourceVo.getStatus());
            mRoleResource.setUnderwriteId(mRoleResourceVo.getUnderwriteId());
            mRoleResource.setCreateTime(new Date());
            mRoleResource.setResourceId(mRoleResourceVo.getResourceIds().get(i));
            mRoleResourceMapper.insertMRoleResource(mRoleResource);
        }
        return newResourceIdList.size() > 0 ? newResourceIdList.size() : 1;
    }

    /**
     * 修改模块白名单
     * 
     * @param mRoleResource 模块白名单
     * @return 结果
     */
    @Override
    public int updateMRoleResource(MRoleResource mRoleResource)
    {
        //先查询选中的资源是否已经存在
        List<MRoleResource> mRoleResourceList = mRoleResourceMapper.selectByUnderwriterIdAndClientId(mRoleResource.getUnderwriteId(), mRoleResource.getClientId());
        mRoleResourceList.forEach(roleResource -> {
            if (roleResource.getResourceId() == mRoleResource.getResourceId() && roleResource.getId() != mRoleResource.getId()) {
                throw new BusinessException("存在已有的资源权限");
            }
        });
        return mRoleResourceMapper.updateMRoleResource(mRoleResource);
    }

    /**
     * 删除模块白名单对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteMRoleResourceByIds(String ids)
    {
        return mRoleResourceMapper.deleteMRoleResourceByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除模块白名单信息
     * 
     * @param id 模块白名单ID
     * @return 结果
     */
    @Override
    public int deleteMRoleResourceById(Long id)
    {
        return mRoleResourceMapper.deleteMRoleResourceById(id);
    }
}
