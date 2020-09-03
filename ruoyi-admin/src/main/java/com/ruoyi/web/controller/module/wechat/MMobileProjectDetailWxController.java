package com.ruoyi.wechat.controller;

import java.util.List;

import com.ruoyi.wechat.domain.MMobileProjectWx;
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
import com.ruoyi.wechat.domain.MMobileProjectDetailWx;
import com.ruoyi.wechat.service.IMMobileProjectDetailWxService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 客服热线配置Controller
 * 
 * @author FuYu
 * @date 2020-09-02
 */
@Controller
@RequestMapping("/wechat/mobile/detail")
public class MMobileProjectDetailWxController extends BaseController
{
    private String prefix = "wechat/mobile/detail";

    @Autowired
    private IMMobileProjectDetailWxService mMobileProjectDetailWxService;

    @RequiresPermissions("wechat:mobile:detail:view")
    @GetMapping("/{projectId}")
    public String wx(@PathVariable("projectId") Long projectId, ModelMap mmap)
    {
        mmap.put("projectId", projectId);
        return prefix + "/detail";
    }

    /**
     * 查询客服热线配置列表
     */
    @RequiresPermissions("wechat:mobile:detail:list")
    @PostMapping("/list/{projectId}")
    @ResponseBody
    public TableDataInfo list(@PathVariable("projectId") Long projectId)
    {
        startPage();
        MMobileProjectDetailWx mMobileProjectDetailWx = new MMobileProjectDetailWx();
        mMobileProjectDetailWx.setProjectid(projectId);
        List<MMobileProjectDetailWx> list = mMobileProjectDetailWxService.selectMMobileProjectDetailWxList(mMobileProjectDetailWx);
        return getDataTable(list);
    }

    /**
     * 导出客服热线配置列表
     */
    @RequiresPermissions("wechat:mobile:detail:export")
    @Log(title = "客服热线配置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MMobileProjectDetailWx mMobileProjectDetailWx)
    {
        List<MMobileProjectDetailWx> list = mMobileProjectDetailWxService.selectMMobileProjectDetailWxList(mMobileProjectDetailWx);
        ExcelUtil<MMobileProjectDetailWx> util = new ExcelUtil<MMobileProjectDetailWx>(MMobileProjectDetailWx.class);
        return util.exportExcel(list, "wx");
    }

    /**
     * 新增客服热线配置
     */
    @GetMapping("/add/{projectId}")
    public String add(@PathVariable("projectId") Long projectId, ModelMap mmap)
    {
        mmap.put("projectId", projectId);
        return prefix + "/add";
    }

    /**
     * 新增保存客服热线配置
     */
    @RequiresPermissions("wechat:mobile:detail:add")
    @Log(title = "客服热线配置", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MMobileProjectDetailWx mMobileProjectDetailWx)
    {
        return toAjax(mMobileProjectDetailWxService.insertMMobileProjectDetailWx(mMobileProjectDetailWx));
    }

    /**
     * 修改客服热线配置
     */
    @GetMapping("/edit/{acskey}")
    public String edit(@PathVariable("acskey") Long acskey, ModelMap mmap)
    {
        MMobileProjectDetailWx mMobileProjectDetailWx = mMobileProjectDetailWxService.selectMMobileProjectDetailWxById(acskey);
        mmap.put("mMobileProjectDetailWx", mMobileProjectDetailWx);
        return prefix + "/edit";
    }

    /**
     * 修改保存客服热线配置
     */
    @RequiresPermissions("wechat:mobile:detail:edit")
    @Log(title = "客服热线配置", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MMobileProjectDetailWx mMobileProjectDetailWx)
    {
        return toAjax(mMobileProjectDetailWxService.updateMMobileProjectDetailWx(mMobileProjectDetailWx));
    }

    /**
     * 删除客服热线配置
     */
    @RequiresPermissions("wechat:mobile:detail:remove")
    @Log(title = "客服热线配置", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mMobileProjectDetailWxService.deleteMMobileProjectDetailWxByIds(ids));
    }
}
