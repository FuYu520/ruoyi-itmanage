package com.ruoyi.wechat.service.impl;

import java.util.*;
import java.util.stream.Collectors;

import com.ruoyi.common.exception.BusinessException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.mguquery.service.ClientUwService;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.wechat.mapper.MLoginRestrictListMapper;
import com.ruoyi.wechat.domain.MLoginRestrictList;
import com.ruoyi.wechat.service.IMLoginRestrictListService;
import com.ruoyi.common.core.text.Convert;

/**
 * 登录限制Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-09-01
 */
@Service
public class MLoginRestrictListServiceImpl implements IMLoginRestrictListService 
{
    @Autowired
    private MLoginRestrictListMapper mLoginRestrictListMapper;
    @Autowired
    private ClientUwService clientUwService;

    /**
     * 查询登录限制
     * 
     * @param acskey 登录限制ID
     * @return 登录限制
     */
    @Override
    public MLoginRestrictList selectMLoginRestrictListById(Long acskey)
    {
        MLoginRestrictList loginRestrictList = mLoginRestrictListMapper.selectMLoginRestrictListById(acskey);
        if (loginRestrictList != null) {
            List<MLoginRestrictList> mLoginRestrictLists = new ArrayList<>();
            mLoginRestrictLists.add(loginRestrictList);
            return setUnderwriterName(mLoginRestrictLists).get(0);
        }
        return loginRestrictList;
    }

    /**
     * 查询登录限制列表
     * 
     * @param mLoginRestrictList 登录限制
     * @return 登录限制
     */
    @Override
    public List<MLoginRestrictList> selectMLoginRestrictListList(MLoginRestrictList mLoginRestrictList)
    {
        List<String> underwriterIds = null;
        //承保商名称不为空
        if (StringUtils.isNotEmpty(mLoginRestrictList.getUnderwriterName())) {
            //查询underwriterId 集合
            List<String> uwIds = clientUwService.findUnderwriterIdsByUnderwriterNameLike("%" + mLoginRestrictList.getUnderwriterName() + "%");
            if (CollectionUtils.isNotEmpty(uwIds)) {
                Set<String> underwriterIdSets = new HashSet<>(uwIds);
                underwriterIds = new ArrayList<>(underwriterIdSets);
                mLoginRestrictList.setUnderwriterIds(underwriterIds);
            } else {
                //返回空对象
                return new ArrayList<>();
            }
        }
        List<MLoginRestrictList> loginRestrictLists = mLoginRestrictListMapper.selectMLoginRestrictListList(mLoginRestrictList);
        //设置返回值承保商名称
        return setUnderwriterName(loginRestrictLists);
    }

    /**
     * 设置返回值承保商名称
     * @param loginRestrictLists
     */
    private List<MLoginRestrictList> setUnderwriterName(List<MLoginRestrictList> loginRestrictLists) {
        //查询集合不为空
        if (CollectionUtils.isNotEmpty(loginRestrictLists)) {
            List<String> clientIds = loginRestrictLists.stream().map(restrict -> restrict.getUwId()).collect(Collectors.toList());
            HashMap<String, String> underwriterMap = clientUwService.getUnderwriterMap(clientIds);
            //循环赋值
            for (MLoginRestrictList loginRestrictList : loginRestrictLists) {
                //设置承保商名称
                loginRestrictList.setUnderwriterName(underwriterMap.get(loginRestrictList.getUwId() + ""));
            }
        }
        return loginRestrictLists;
    }

    /**
     * 新增登录限制
     * 
     * @param mLoginRestrictList 登录限制
     * @return 结果
     */
    @Override
    public int insertMLoginRestrictList(MLoginRestrictList mLoginRestrictList)
    {
        checkIsExist(mLoginRestrictList);
        return mLoginRestrictListMapper.insertMLoginRestrictList(mLoginRestrictList);
    }

    /**
     * 检查是否重复
     * @param mLoginRestrictList
     * @throws BusinessException
     */
    private void checkIsExist(MLoginRestrictList mLoginRestrictList) {
        //查询 clientId  uwId   bussType 是否存在数据
        List<MLoginRestrictList> loginRestrictLists = mLoginRestrictListMapper.selectByClientIdAndUwIdAndBussType(mLoginRestrictList.getClientId(), mLoginRestrictList.getUwId(), mLoginRestrictList.getBussType());
        if (CollectionUtils.isNotEmpty(loginRestrictLists) && !loginRestrictLists.get(0).getAcskey().equals(mLoginRestrictList.getAcskey())) {
            for (MLoginRestrictList loginRestrictList : loginRestrictLists) {
                if (!loginRestrictList.getAcskey().equals(mLoginRestrictList.getAcskey())) {
                    throw new BusinessException("客户,承保商,业务类型组合存在相同数据不能重复添加");
                }
            }
        }
    }

    /**
     * 修改登录限制
     * 
     * @param mLoginRestrictList 登录限制
     * @return 结果
     */
    @Override
    public int updateMLoginRestrictList(MLoginRestrictList mLoginRestrictList)
    {
        checkIsExist(mLoginRestrictList);
        return mLoginRestrictListMapper.updateMLoginRestrictList(mLoginRestrictList);
    }

    /**
     * 删除登录限制对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteMLoginRestrictListByIds(String ids)
    {
        return mLoginRestrictListMapper.deleteMLoginRestrictListByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除登录限制信息
     * 
     * @param acskey 登录限制ID
     * @return 结果
     */
    @Override
    public int deleteMLoginRestrictListById(Long acskey)
    {
        return mLoginRestrictListMapper.deleteMLoginRestrictListById(acskey);
    }
}
