package com.ruoyi.wechat.mapper;

import java.util.List;

import com.ruoyi.wechat.domain.MRoleResource;
import com.ruoyi.wechat.vo.MRoleResourceVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * 模块白名单Mapper接口
 * 
 * @author ruoyi
 * @date 2020-08-24
 */
@Repository
public interface MRoleResourceMapper 
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
     *  group by only_full_group_by 修改数据库配置
     * @param mRoleResource 模块白名单
     * @param underwriterIds
     * @param clientIds
     * @return 模块白名单集合
     */
    public List<MRoleResource> selectMRoleResourceList(@Param("mRoleResource")MRoleResource mRoleResource,@Param("underwriterIds")List<String> underwriterIds, @Param("clientIds")List<String> clientIds);

    /**
     * 新增模块白名单
     * 
     * @param mRoleResource 模块白名单
     * @return 结果
     */
    public int insertMRoleResource(MRoleResource mRoleResource);

    /**
     * 修改模块白名单
     * 
     * @param mRoleResource 模块白名单
     * @return 结果
     */
    public int updateMRoleResource(MRoleResource mRoleResource);

    /**
     * 删除模块白名单
     * 
     * @param id 模块白名单ID
     * @return 结果
     */
    public int deleteMRoleResourceById(Long id);

    /**
     * 批量删除模块白名单
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteMRoleResourceByIds(String[] ids);


    /**
     * 根据 UnderwriteId 和clientId查询 资源id集合
     * @param underwriterId
     * @param clientId
     * @return
     */
    List<Long> selectResourceIdsByUnderwriterIdAndClientId(@Param("underwriterId") String underwriterId, @Param("clientId") String clientId);


    /**
     * 根据 UnderwriteId 和clientId查询
     * @param underwriterId
     * @param clientId
     * @return
     */
    List<MRoleResource> selectByUnderwriterIdAndClientId(@Param("underwriterId") String underwriterId, @Param("clientId") String clientId);


}
