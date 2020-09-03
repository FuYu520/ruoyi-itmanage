package com.ruoyi.mguquery.mapper;


import com.ruoyi.common.annotation.DataSource;
import com.ruoyi.common.enums.DataSourceType;
import com.ruoyi.mguquery.domain.ClientUWD;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 视图 Mapper接口
 * 
 * @author ruoyi
 * @date 2020-08-24
 */
@DataSource(value = DataSourceType.MGUQUERY)
public interface ClientUWDMapper
{


    /**
     * 根据客户ids查询对应得view数据
     * @param clientIds
     * @return
     */
    List<ClientUWD> findByClientIdIn(List<String> clientIds);

    /**
     * 根据承保商ids 查询对应的view数据
     * @param underwriterIds
     * @return
     */
    List<ClientUWD> findByUnderwriterIdIn(List<String> underwriterIds);

    /**
     * 根据承保商名称模糊查询对应view 数据
     * @param underwriterName
     * @return
     */
    List<String> findUnderwriterIdsByUnderwriterNameLike(@Param("underwriterName") String underwriterName);

    /**
     * 根据客户简称模糊查询对应的view数据
     * @param cShortName
     * @return
     */
    List<String> findClientIdsByClientNameLike(@Param("cShortName") String cShortName);

    /**
     * 获取承保商信息列表
     * @return
     */
    List getViewLiUnderWriterInfos();

    /**
     * 获取客户信息列表
     * @return
     */
    List<ClientUWD> getViewLiClientBaseInfos();

    /**
     * 根据承保商id集合查询对应得子承保商信息
     * @param underWriterIds
     * @return
     */
    List<ClientUWD> getViewLiSubUWInfosByUnderWriterIds(@Param("underWriterIds") List<String> underWriterIds);

}
