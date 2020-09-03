package com.ruoyi.web.controller.module.dialog;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @Author YuFu
 * @Description
 * @Date 2020/8/27 13:24
 **/
@Controller
@RequestMapping("/module/dialog/table")
public class DialogController {

    private String prefix = "/wechat/table";


    /**
     * 微信资源树 单选
     */
    @GetMapping("/resourceUpdateTree")
    public String resourceUpdateTree(@RequestParam(value = "resourceId") Long resourceId,
                                     @RequestParam(value = "resourceName") String resourceName,
                                     ModelMap modelMap)
    {
        modelMap.put("resourceId", resourceId);
        modelMap.put("resourceName", resourceName);
        return prefix + "/resourceUpdateTree";
    }

    /**
     * 微信资源树
     */
    @GetMapping("/resourceAddTree")
    public String resourceAddTree(@RequestParam(value = "resourceIds", required = false) Long[] resourceIds,
                                  ModelMap modelMap)
    {
        modelMap.put("resourceIds", resourceIds);
        return prefix + "/resourceAddTree";
    }

    /**
     * 弹出承保商列表 复选
     */
    @GetMapping("/checkUW")
    public String checkUW()
    {
        return prefix + "/checkUW";
    }

    /**
     * 弹出承保商列表  单选
     */
    @GetMapping("/radioUW")
    public String radioUW()
    {
        return prefix + "/radioUW";
    }

    /**
     * 弹出子承保商列表
     */
    @GetMapping("/checkSubUW")
    public String checkSubUW(@Param("underWriterIds") String underWriterIds, ModelMap modelMap)
    {
        modelMap.put("underWriterIds", underWriterIds);
        return prefix + "/checkSubUW";
    }

    /**
     * 弹出客户列表
     */
    @GetMapping("/checkClient")
    public String checkClient()
    {
        return prefix + "/checkClient";
    }

    /**
     * 弹出客户列表  单选
     */
    @GetMapping("/radioClient")
    public String radioClient()
    {
        return prefix + "/radioClient";
    }

    /**
     * 弹出客户列表  单选
     */
    @GetMapping("/checkCategory")
    public String checkCategory()
    {
        return prefix + "/checkCategory";
    }
}
