package com.ruoyi.wechat.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.wechat.domain.MMobileProjectWx;
import com.ruoyi.wechat.service.IMMobileProjectWxService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 承保商配置Controller
 * 
 * @author FuYu
 * @date 2020-09-02
 */
@Controller
@RequestMapping("/wechat/mobile")
public class MMobileProjectWxController extends BaseController {
    private String prefix = "wechat/mobile" ;

    @Autowired
    private IMMobileProjectWxService mMobileProjectWxService;

    @RequiresPermissions("wechat:mobile:view")
    @GetMapping()
    public String wx() {
        return prefix + "/mobile" ;
    }

    /**
     * 查询承保商配置列表
     */
    @RequiresPermissions("wechat:mobile:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MMobileProjectWx mMobileProjectWx) {
        startPage();
        List<MMobileProjectWx> list = mMobileProjectWxService.selectMMobileProjectWxList(mMobileProjectWx);
        return getDataTable(list);
    }

    /**
     * 导出承保商配置列表
     */
    @RequiresPermissions("wechat:mobile:export")
    @Log(title = "承保商配置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MMobileProjectWx mMobileProjectWx) {
        List<MMobileProjectWx> list = mMobileProjectWxService.selectMMobileProjectWxList(mMobileProjectWx);
        ExcelUtil<MMobileProjectWx> util = new ExcelUtil<MMobileProjectWx>(MMobileProjectWx.class);
        return util.exportExcel(list, "wx");
    }

    /**
     * 新增承保商配置
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add" ;
    }

    /**
     * 新增保存承保商配置
     */
    @RequiresPermissions("wechat:mobile:add")
    @Log(title = "承保商配置", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MMobileProjectWx mMobileProjectWx) {
        return toAjax(mMobileProjectWxService.insertMMobileProjectWx(mMobileProjectWx));
    }

    /**
     * 修改承保商配置
     */
    @GetMapping("/edit/{ACSKEY}")
    public String edit(@PathVariable("ACSKEY") Long ACSKEY, ModelMap mmap) {
        MMobileProjectWx mMobileProjectWx = mMobileProjectWxService.selectMMobileProjectWxById(ACSKEY);
        mmap.put("mMobileProjectWx", mMobileProjectWx);
        return prefix + "/edit" ;
    }

    /**
     * 修改保存承保商配置
     */
    @RequiresPermissions("wechat:mobile:edit")
    @Log(title = "承保商配置", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MMobileProjectWx mMobileProjectWx) {
        return toAjax(mMobileProjectWxService.updateMMobileProjectWx(mMobileProjectWx));
    }

    /**
     * 删除承保商配置
     */
    @RequiresPermissions("wechat:mobile:remove")
    @Log(title = "承保商配置", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(mMobileProjectWxService.deleteMMobileProjectWxByIds(ids));
    }
}
