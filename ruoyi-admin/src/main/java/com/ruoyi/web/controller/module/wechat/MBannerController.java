package com.ruoyi.web.controller.module.wechat;

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
import com.ruoyi.wechat.domain.MBanner;
import com.ruoyi.wechat.service.IMBannerService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 首页banner图Controller
 * 
 * @author FuYu
 * @date 2020-09-08
 */
@Controller
@RequestMapping("/system/banner")
public class MBannerController extends BaseController
{
    private String prefix = "system/banner";

    @Autowired
    private IMBannerService mBannerService;

    @RequiresPermissions("system:banner:view")
    @GetMapping()
    public String banner()
    {
        return prefix + "/banner";
    }

    /**
     * 查询首页banner图列表
     */
    @RequiresPermissions("system:banner:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MBanner mBanner)
    {
        startPage();
        List<MBanner> list = mBannerService.selectMBannerList(mBanner);
        return getDataTable(list);
    }

    /**
     * 导出首页banner图列表
     */
    @RequiresPermissions("system:banner:export")
    @Log(title = "首页banner图", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MBanner mBanner)
    {
        List<MBanner> list = mBannerService.selectMBannerList(mBanner);
        ExcelUtil<MBanner> util = new ExcelUtil<MBanner>(MBanner.class);
        return util.exportExcel(list, "banner");
    }

    /**
     * 新增首页banner图
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存首页banner图
     */
    @RequiresPermissions("system:banner:add")
    @Log(title = "首页banner图", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MBanner mBanner)
    {
        return toAjax(mBannerService.insertMBanner(mBanner));
    }

    /**
     * 修改首页banner图
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        MBanner mBanner = mBannerService.selectMBannerById(id);
        mmap.put("mBanner", mBanner);
        return prefix + "/edit";
    }

    /**
     * 修改保存首页banner图
     */
    @RequiresPermissions("system:banner:edit")
    @Log(title = "首页banner图", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MBanner mBanner)
    {
        return toAjax(mBannerService.updateMBanner(mBanner));
    }

    /**
     * 删除首页banner图
     */
    @RequiresPermissions("system:banner:remove")
    @Log(title = "首页banner图", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mBannerService.deleteMBannerByIds(ids));
    }
}
