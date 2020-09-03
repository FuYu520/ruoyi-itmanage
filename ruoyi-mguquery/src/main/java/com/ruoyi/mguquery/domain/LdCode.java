package com.ruoyi.mguquery.domain;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * @Author YuFu
 * @Description
 * @Date 2020/9/2 15:11
 **/
public class LdCode extends BaseEntity {
    /**
     * 编码类型
     */
    private String codeType;
    /**
     * 编码
     */
    private String code;
    /**
     * 编码名称
     */
    private String codeName;

    /**
     * 编码别名
     */
    private String codeAlias;

    /**
     * 机构代码
     */
    private String comCode;

    /**
     * 其它标志
     */
    private String otherSign;

    /**
     * eCodeName
     */
    private String eCodeName;

    public LdCode() {
    }

    public String getCodeType() {
        return codeType;
    }

    public void setCodeType(String codeType) {
        this.codeType = codeType;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCodeName() {
        return codeName;
    }

    public void setCodeName(String codeName) {
        this.codeName = codeName;
    }

    public String getCodeAlias() {
        return codeAlias;
    }

    public void setCodeAlias(String codeAlias) {
        this.codeAlias = codeAlias;
    }

    public String getComCode() {
        return comCode;
    }

    public void setComCode(String comCode) {
        this.comCode = comCode;
    }

    public String getOtherSign() {
        return otherSign;
    }

    public void setOtherSign(String otherSign) {
        this.otherSign = otherSign;
    }

    public String geteCodeName() {
        return eCodeName;
    }

    public void seteCodeName(String eCodeName) {
        this.eCodeName = eCodeName;
    }
}
