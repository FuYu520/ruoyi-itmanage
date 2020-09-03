package com.ruoyi.wechat.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import com.ruoyi.common.core.domain.Ztree;
import com.ruoyi.common.exception.BusinessException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.wechat.domain.MResource;
import com.ruoyi.wechat.service.IMResourceService;
import com.ruoyi.wechat.vo.MRoleResourceVo;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.wechat.mapper.MResourceMapper;
import com.ruoyi.common.core.text.Convert;
import org.springframework.web.client.ResourceAccessException;

/**
 * 微信资源Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-08-24
 */
@Service
public class MResourceServiceImpl implements IMResourceService
{
    @Autowired
    private MResourceMapper mResourceMapper;

    /**
     * 查询微信资源
     * 
     * @param id 微信资源ID
     * @return 微信资源
     */
    @Override
    public MResource selectMResourceById(Long id)
    {
        return mResourceMapper.selectMResourceById(id);
    }

    /**
     * 查询微信资源列表
     * 
     * @param mResource 微信资源
     * @return 微信资源
     */
    @Override
    public List<MResource> selectMResourceList(MResource mResource)
    {
        return mResourceMapper.selectMResourceList(mResource);
    }

    /**
     * 新增微信资源
     * 
     * @param mResource 微信资源
     * @return 结果
     */
    @Override
    public int insertMResource(MResource mResource)
    {
        checkIsExist(mResource);
        mResource.setCreateTime(DateUtils.getNowDate());
        return mResourceMapper.insertMResource(mResource);
    }

    /**
     * 修改微信资源
     * 
     * @param mResource 微信资源
     * @return 结果
     */
    @Override
    public int updateMResource(MResource mResource)
    {
        checkIsExist(mResource);
        mResource.setUpdateTime(DateUtils.getNowDate());
        return mResourceMapper.updateMResource(mResource);
    }

    /**
     * 检查资源编码是否存在
     * @param mResource
     */
    public void checkIsExist(MResource mResource) {
        List<MResource> resourceList = mResourceMapper.selectByCode(mResource.getCode());
        //code不为空，并且id和当前不相同
        if (CollectionUtils.isNotEmpty(resourceList) && resourceList.get(0).getId() != mResource.getId()) {
            throw new BusinessException("已存在相同的资源编码，不可再创建");
        }
    }

    /**
     * 删除微信资源对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteMResourceByIds(String ids)
    {
        return mResourceMapper.deleteMResourceByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除微信资源信息
     * 
     * @param id 微信资源ID
     * @return 结果
     */
    @Override
    public int deleteMResourceById(Long id)
    {
        return mResourceMapper.deleteMResourceById(id);
    }

    /**
     * 加载所有微信资源菜单列表树
     */
    @Override
    public List<Ztree> resourceTreeData(Long[] resourceIds) {
        //查询全部资源列表
        List<MResource> allResourceList = mResourceMapper.selectMResourceList(null);
        List<Long> uwResourceList = Arrays.asList(resourceIds);
        List<Ztree> zTrees = initZtree(allResourceList, uwResourceList);
        return zTrees;
    }


    /**
     * 对象转菜单树
     *
     * @param allResourceList 微信资源菜单列表
     * @param uwResourceList 角色已存在资源菜单列表
     * @return 树结构列表
     */
    public List<Ztree> initZtree(List<MResource> allResourceList, List<Long> uwResourceList)
    {
        List<Ztree> ztrees = new ArrayList<Ztree>();
        boolean isCheck = StringUtils.isNotNull(uwResourceList);
        for (MResource mResource : allResourceList)
        {
            Ztree ztree = new Ztree();
            ztree.setId(mResource.getId());
            ztree.setpId(mResource.getPid());
            ztree.setName(mResource.getName());
            ztree.setTitle(mResource.getName());
            if (isCheck)
            {
                ztree.setChecked(uwResourceList.contains(mResource.getId()));
            }
            ztrees.add(ztree);
        }
        return ztrees;
    }
}
