package com.ruoyi.web.controller.module.mguQuery;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.PageDomain;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.page.TableSupport;
import com.ruoyi.mguquery.domain.ClientUWD;
import com.ruoyi.mguquery.domain.LdCode;
import com.ruoyi.mguquery.service.ClientUwService;
import com.ruoyi.mguquery.service.LdCodeService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Author YuFu
 * @Description
 * @Date 2020/8/27 9:48
 **/
@Controller
@RequestMapping("/clientuw/core")
public class ClientUwController extends BaseController {

    @Autowired
    private ClientUwService clientUwService;
    @Autowired
    private LdCodeService ldCodeService;

    /**
     * 查询承保商列表
     */
    @PostMapping("/list/uw")
    @ResponseBody
    public TableDataInfo listUW(ClientUWD clientUWD) {
        startPage();
        List<ClientUWD> resultList = clientUwService.getViewLiUnderWriterInfos(clientUWD);
        return getDataTable(resultList);
    }

    /**
     * 查询子承保商列表
     */
    @PostMapping("/list/subuw")
    @ResponseBody
    public TableDataInfo listSubUW(@RequestParam("underWriterIds") String underWriterIds, @RequestParam(value = "searchValue", required = false) String searchValue) {
        startPage();
        List<ClientUWD> resultList = clientUwService.getViewLiSubUWInfos(underWriterIds, searchValue);
        return getDataTable(resultList);
    }

    /**
     * 查询客户列表
     */
    @PostMapping("/list/client")
    @ResponseBody
    public TableDataInfo listClient(ClientUWD clientUWD) {
        startPage();
        List<ClientUWD> resultList = clientUwService.getViewLiClientBaseInfos(clientUWD);
        return getDataTable(resultList);
    }

    /**
     * 查询特殊分类
     */
    @PostMapping("/list/category")
    @ResponseBody
    public TableDataInfo listCategory(LdCode ldCode) {
        startPage();
        ldCode.setCodeType("specialsort");
        List<LdCode> resultList = ldCodeService.selectLdCodeList(ldCode);
        return getDataTable(resultList);
    }
}
