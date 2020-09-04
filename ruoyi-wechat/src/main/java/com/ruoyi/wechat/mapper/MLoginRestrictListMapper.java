package com.ruoyi.wechat.mapper;

import java.util.List;

import com.ruoyi.common.annotation.DataSource;
import com.ruoyi.common.enums.DataSourceType;
import com.ruoyi.wechat.domain.MLoginRestrictList;
import org.apache.ibatis.annotations.Param;

/**
 * 登录限制Mapper接口
 *
 * @author ruoyi
 * @date 2020-09-01
 */
@DataSource(value = DataSourceType.WECHAT)
public interface MLoginRestrictListMapper
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
     * 删除登录限制
     *
     * @param acskey 登录限制ID
     * @return 结果
     */
    public int deleteMLoginRestrictListById(Long acskey);

    /**
     * 批量删除登录限制
     *
     * @param acskeys 需要删除的数据ID
     * @return 结果
     */
    public int deleteMLoginRestrictListByIds(String[] acskeys);

    /**
     * 根据客户id 承保商id 业务类型查询
     * @param clientId
     * @param uwId
     * @param bussType
     * @return
     */
    List<MLoginRestrictList> selectByClientIdAndUwIdAndBussType(@Param("clientId") String clientId, @Param("uwId") String uwId, @Param("bussType") String bussType);

}
