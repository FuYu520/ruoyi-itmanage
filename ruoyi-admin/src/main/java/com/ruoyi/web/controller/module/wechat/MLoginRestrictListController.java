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
import com.ruoyi.wechat.domain.MLoginRestrictList;
import com.ruoyi.wechat.service.IMLoginRestrictListService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 登录限制Controller
 * 
 * @author ruoyi
 * @date 2020-09-01
 */
@Controller
@RequestMapping("/wechat/restrict")
public class MLoginRestrictListController extends BaseController
{
    private String prefix = "wechat/restrict";

    @Autowired
    private IMLoginRestrictListService mLoginRestrictListService;

    @RequiresPermissions("wechat:restrict:view")
    @GetMapping()
    public String list()
    {
        return prefix + "/list";
    }

    /**
     * 查询登录限制列表
     */
    @RequiresPermissions("wechat:restrict:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MLoginRestrictList mLoginRestrictList)
    {
        startPage();
        List<MLoginRestrictList> list = mLoginRestrictListService.selectMLoginRestrictListList(mLoginRestrictList);
        return getDataTable(list);
    }

    /**
     * 导出登录限制列表
     */
    @RequiresPermissions("wechat:restrict:export")
    @Log(title = "登录限制", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MLoginRestrictList mLoginRestrictList)
    {
        List<MLoginRestrictList> list = mLoginRestrictListService.selectMLoginRestrictListList(mLoginRestrictList);
        ExcelUtil<MLoginRestrictList> util = new ExcelUtil<MLoginRestrictList>(MLoginRestrictList.class);
        return util.exportExcel(list, "list");
    }

    /**
     * 新增登录限制
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存登录限制
     */
    @RequiresPermissions("wechat:restrict:add")
    @Log(title = "登录限制", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MLoginRestrictList mLoginRestrictList)
    {
        return toAjax(mLoginRestrictListService.insertMLoginRestrictList(mLoginRestrictList));
    }

    /**
     * 修改登录限制
     */
    @GetMapping("/edit/{acskey}")
    public String edit(@PathVariable("acskey") Long acskey, ModelMap mmap)
    {
        MLoginRestrictList mLoginRestrictList = mLoginRestrictListService.selectMLoginRestrictListById(acskey);
        mmap.put("mLoginRestrictList", mLoginRestrictList);
        return prefix + "/edit";
    }

    /**
     * 修改保存登录限制
     */
    @RequiresPermissions("wechat:restrict:edit")
    @Log(title = "登录限制", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MLoginRestrictList mLoginRestrictList)
    {
        return toAjax(mLoginRestrictListService.updateMLoginRestrictList(mLoginRestrictList));
    }

    /**
     * 删除登录限制
     */
    @RequiresPermissions("wechat:restrict:remove")
    @Log(title = "登录限制", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mLoginRestrictListService.deleteMLoginRestrictListByIds(ids));
    }
}
