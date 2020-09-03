package com.ruoyi.web.controller.module.wechat;

import java.util.List;

import com.ruoyi.common.core.domain.Ztree;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.wechat.domain.MResource;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.wechat.service.IMResourceService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 微信资源Controller
 * 
 * @author ruoyi
 * @date 2020-08-24
 */
@Controller
@RequestMapping("/wechat/resource")
public class MResourceController extends BaseController
{
    private String prefix = "/wechat/resource";

    @Autowired
    private IMResourceService mResourceService;

    @RequiresPermissions("wechat:resource:view")
    @GetMapping()
    public String resource()
    {
        return prefix + "/resource";
    }

    /**
     * 查询微信资源列表
     */
    @RequiresPermissions("wechat:resource:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MResource mResource)
    {
        startPage();
        List<MResource> list = mResourceService.selectMResourceList(mResource);
        return getDataTable(list);
    }

    /**
     * 导出微信资源列表
     */
    @RequiresPermissions("wechat:resource:export")
    @Log(title = "微信资源", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MResource mResource)
    {
        List<MResource> list = mResourceService.selectMResourceList(mResource);
        ExcelUtil<MResource> util = new ExcelUtil<MResource>(MResource.class);
        return util.exportExcel(list, "resource");
    }

    /**
     * 新增微信资源
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存微信资源
     */
    @RequiresPermissions("wechat:resource:add")
    @Log(title = "微信资源", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MResource mResource)
    {
        return toAjax(mResourceService.insertMResource(mResource));
    }

    /**
     * 修改微信资源
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        MResource mResource = mResourceService.selectMResourceById(id);
        mmap.put("mResource", mResource);
        return prefix + "/edit";
    }

    /**
     * 修改保存微信资源
     */
    @RequiresPermissions("wechat:resource:edit")
    @Log(title = "微信资源", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MResource mResource)
    {
        return toAjax(mResourceService.updateMResource(mResource));
    }

    /**
     * 删除微信资源
     */
    @RequiresPermissions("wechat:resource:remove")
    @Log(title = "微信资源", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mResourceService.deleteMResourceByIds(ids));
    }


    /**
     * 加载所有微信资源菜单列表树
     */
    @GetMapping("/resourceTreeData")
    @ResponseBody
    public List<Ztree> resourceTreeData(@RequestParam(value = "resourceIds", required = false) Long[] resourceIds)
    {
        List<Ztree> ztrees = mResourceService.resourceTreeData(resourceIds);
        return ztrees;
    }
}
