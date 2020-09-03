package com.ruoyi.mguquery.service.impl;

import com.ruoyi.common.annotation.DataSource;
import com.ruoyi.common.enums.DataSourceType;
import com.ruoyi.mguquery.domain.ClientUWD;
import com.ruoyi.mguquery.mapper.ClientUWDMapper;
import com.ruoyi.mguquery.service.ClientUwService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

/**
 * @Author YuFu
 * @Description
 * @Date 2020/8/25 14:45
 **/
@Service
public class ClientUwServiceImpl implements ClientUwService {

    @Resource
    private ClientUWDMapper clientUWDMapper;

    /**
     * 根据客户id list 获取信息
     * @param clientIds
     * @return
     */
    @Override
    public HashMap<String, String> getClientMap(List<String> clientIds) {
        Set<String> clientSetIds = new HashSet<>(clientIds);
        List<ClientUWD> clientUWDS = clientUWDMapper.findByClientIdIn(new ArrayList<>(clientSetIds));
        HashMap<String, String> viewMap = new HashMap();
        clientUWDS.forEach(clientUWD -> {
            viewMap.put(clientUWD.getClientId(), clientUWD.getcShortName());
        });
        return viewMap;
    }

    /**
     * 根据承保商id list 获取信息
     * @param uwIds
     * @return
     */
    @Override
    public HashMap<String, String> getUnderwriterMap(List<String> uwIds) {
        Set<String> uwSetIds = new HashSet<>(uwIds);
        //资源id集合
        List<ClientUWD> clientUWDS = clientUWDMapper.findByUnderwriterIdIn(new ArrayList<>(uwSetIds));
        HashMap<String, String> viewMap = new HashMap();
        clientUWDS.forEach(clientUWD -> {
            viewMap.put(clientUWD.getUnderwriterId(), clientUWD.getUnderwriterName());
        });
        return viewMap;
    }

    /**
     * 根据承保商名称模糊查询对应view 数据
     * @param underwriterName
     * @return
     */
    @Override
    public List<String> findUnderwriterIdsByUnderwriterNameLike(String underwriterName) {
        return clientUWDMapper.findUnderwriterIdsByUnderwriterNameLike(underwriterName);
    }

    /**
     * 根据客户简称模糊查询对应的view数据
     * @param cShortName
     * @return
     */
    @Override
    public List<String> findClientIdsByClientNameLike(String cShortName) {
        return clientUWDMapper.findClientIdsByClientNameLike(cShortName);
    }

    /**
     * 获取视图承保商基本信息列表
     * @param
     * @return
     */
    @Override
    public List<ClientUWD> getViewLiUnderWriterInfos() {
        return clientUWDMapper.getViewLiUnderWriterInfos();
    }

    /**
     * 获取视图子承保商信息列表
     * @param underWriterIds
     * @return
     */
    @Override
    public List<ClientUWD> getViewLiSubUWInfos(String underWriterIds) {
        if (StringUtils.isNotEmpty(underWriterIds)) {
            String[] underWriterIdArr = underWriterIds.split(",");
            return clientUWDMapper.getViewLiSubUWInfosByUnderWriterIds(Arrays.asList(underWriterIdArr));
        } else {
            return new ArrayList<>();
        }
    }

    /**
     * 获取视图客户基本信息列表
     * @return
     */
    @Override
    public List<ClientUWD> getViewLiClientBaseInfos() {
        return clientUWDMapper.getViewLiClientBaseInfos();
    }
}
