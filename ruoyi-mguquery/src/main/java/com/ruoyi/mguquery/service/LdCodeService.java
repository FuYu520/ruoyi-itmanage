package com.ruoyi.mguquery.service;

import com.ruoyi.mguquery.domain.ClientUWD;
import com.ruoyi.mguquery.domain.LdCode;

import java.util.HashMap;
import java.util.List;

/**
 * @Author YuFu
 * @Description
 * @Date 2020/8/25 14:44
 **/
public interface LdCodeService {

    /**
     * 条件查询
     * @param ldCode
     * @return
     */
    List<LdCode> selectLdCodeList(LdCode ldCode);
}
