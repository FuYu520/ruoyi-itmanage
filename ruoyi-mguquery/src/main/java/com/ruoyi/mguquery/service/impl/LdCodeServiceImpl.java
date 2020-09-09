package com.ruoyi.mguquery.service.impl;

import com.ruoyi.mguquery.domain.ClientUWD;
import com.ruoyi.mguquery.domain.LdCode;
import com.ruoyi.mguquery.mapper.ClientUWDMapper;
import com.ruoyi.mguquery.mapper.LdCodeMapper;
import com.ruoyi.mguquery.service.ClientUwService;
import com.ruoyi.mguquery.service.LdCodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

/**
 * @Author YuFu
 * @Description
 * @Date 2020/8/25 14:45
 **/
@Service
public class LdCodeServiceImpl implements LdCodeService {

    @Autowired
    private LdCodeMapper ldCodeMapper;

    @Override
    public List<LdCode> selectLdCodeList(LdCode ldCode) {
        ldCode.setCodeName("%" + ldCode.getSearchValue() + "%");
        return ldCodeMapper.selectLdCodeList(ldCode);
    }
}
