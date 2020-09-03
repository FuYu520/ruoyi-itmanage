package com.ruoyi.mguquery.mapper;


import com.ruoyi.common.annotation.DataSource;
import com.ruoyi.common.enums.DataSourceType;
import com.ruoyi.mguquery.domain.ClientUWD;
import com.ruoyi.mguquery.domain.LdCode;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 视图 Mapper接口
 * 
 * @author ruoyi
 * @date 2020-08-24
 */
@DataSource(value = DataSourceType.MYMSH)
public interface LdCodeMapper
{

    /**
     * 根据编码类型 和编码查询集合数据
     * @param codeType
     * @param code
     * @return
     */
    List<LdCode> selectLdCodeList(LdCode ldCode);

}
