package com.ruoyi.wechat.service;

import java.util.List;
import com.ruoyi.wechat.domain.MLoginRestrictList;

/**
 * 登录限制Service接口
 * 
 * @author ruoyi
 * @date 2020-09-01
 */
public interface IMLoginRestrictListService 
{
    /**
     * 查询登录限制
     * 
     * @param acskey 登录限制ID
     * @return 登录限制
     */
    public MLoginRestrictList selectMLoginRestrictListById(Long acskey);

    /**
     * 查询登录限制列表
     * 
     * @param mLoginRestrictList 登录限制
     * @return 登录限制集合
     */
    public List<MLoginRestrictList> selectMLoginRestrictListList(MLoginRestrictList mLoginRestrictList);

    /**
     * 新增登录限制
     * 
     * @param mLoginRestrictList 登录限制
     * @return 结果
     */
    public int insertMLoginRestrictList(MLoginRestrictList mLoginRestrictList);

    /**
     * 修改登录限制
     * 
     * @param mLoginRestrictList 登录限制
     * @return 结果
     */
    public int updateMLoginRestrictList(MLoginRestrictList mLoginRestrictList);

    /**
     * 批量删除登录限制
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteMLoginRestrictListByIds(String ids);

    /**
     * 删除登录限制信息
     * 
     * @param acskey 登录限制ID
     * @return 结果
     */
    public int deleteMLoginRestrictListById(Long acskey);
}
