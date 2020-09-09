package com.ruoyi.mguquery.service;

import com.ruoyi.mguquery.domain.ClientUWD;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author YuFu
 * @Description
 * @Date 2020/8/25 14:44
 **/
public interface ClientUwService {

    /**
     * 根据客户id list 获取信息
     * @param clientIds
     * @return
     */
    HashMap<String, String> getClientMap(List<String> clientIds);

    /**
     * 根据承保商id list 获取信息
     * @param uwIds
     * @return
     */
    HashMap<String, String> getUnderwriterMap(List<String> uwIds);

    /**
     * 根据承保商名称模糊查询对应view 数据
     * @param underwriterName
     * @return
     */
    List<String> findUnderwriterIdsByUnderwriterNameLike(String underwriterName);

    /**
     * 根据客户简称模糊查询对应的view数据
     * @param cShortName
     * @return
     */
    List<String> findClientIdsByClientNameLike(String cShortName);

    /**
     * 获取视图承保商基本信息列表
     * @param
     * @return
     */
    List<ClientUWD> getViewLiUnderWriterInfos(ClientUWD clientUWD);

    /**
     * 获取视图子承保商信息列表
     * @param underWriterIds
     * @param SubUWName
     * @return
     */
    List<ClientUWD> getViewLiSubUWInfos(String underWriterIds, String SubUWName);

    /**
     * 获取视图客户基本信息列表
     * @return
     */
    List<ClientUWD> getViewLiClientBaseInfos(ClientUWD clientUWD);

}
