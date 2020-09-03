package com.ruoyi.web.controller.module.wechat;

import java.util.List;

import com.ruoyi.wechat.vo.MRoleResourceVo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.wechat.domain.MRoleResource;
import com.ruoyi.wechat.service.IMRoleResourceService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 模块白名单Controller
 * 
 * @author ruoyi
 * @date 2020-08-24
 */
@Controller
@RequestMapping("/wechat/role/resource")
public class MRoleResourceController extends BaseController
{
    private String prefix = "wechat/role/resource";

    @Autowired
    private IMRoleResourceService mRoleResourceService;

    @RequiresPermissions("wechat:role:resource:view")
    @GetMapping()
    public String resource()
    {
        return prefix + "/resource";
    }

    /**
     * 查询模块白名单列表
     */
    @RequiresPermissions("wechat:role:resource:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MRoleResource mRoleResource)
    {
        startPage();
        List<MRoleResource> list = mRoleResourceService.selectMRoleResourceList(mRoleResource);
        return getDataTable(list);
    }

    /**
     * 导出模块白名单列表
     */
    @RequiresPermissions("wechat:role:resource:export")
    @Log(title = "模块白名单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MRoleResource mRoleResource)
    {
        List<MRoleResource> list = mRoleResourceService.selectMRoleResourceList(mRoleResource);
        ExcelUtil<MRoleResource> util = new ExcelUtil<MRoleResource>(MRoleResource.class);
        return util.exportExcel(list, "resource");
    }

    /**
     * 新增模块白名单
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 批量新增保存模块白名单
     */
    @RequiresPermissions("wechat:role:resource:add")
    @Log(title = "模块白名单", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MRoleResourceVo mRoleResourceVo)
    {
        return toAjax(mRoleResourceService.batchAddMRoleResource(mRoleResourceVo));
    }

    /**
     * 修改模块白名单
     * id 由 underwriteId + clientId 组成
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        MRoleResource mRoleResource = mRoleResourceService.selectMRoleResourceById(id);
        mmap.put("mRoleResource", mRoleResource);
        return prefix + "/edit";
    }

    /**
     * 修改保存模块白名单
     */
    @RequiresPermissions("wechat:role:resource:edit")
    @Log(title = "模块白名单", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MRoleResource mRoleResource)
    {
        return toAjax(mRoleResourceService.updateMRoleResource(mRoleResource));
    }

    /**
     * 删除模块白名单
     */
    @RequiresPermissions("wechat:role:resource:remove")
    @Log(title = "模块白名单", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mRoleResourceService.deleteMRoleResourceByIds(ids));
    }
}
