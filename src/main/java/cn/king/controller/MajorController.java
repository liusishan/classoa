package cn.king.controller;

import cn.king.pojo.AJAXResult;
import cn.king.pojo.Department;
import cn.king.pojo.Major;
import cn.king.service.MajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Title:
 * @CreateTime: 2018/12/28 10:00
 * @Author: king
 * @Description:
 */
@Controller
public class MajorController {

    @Autowired
    private MajorService majorService;

    /**
     * @param: []
     * @return: java.lang.Object
     * @auther: king
     * @date: 2019/1/3 18:29
     * @description: 添加专业
     */
    @ResponseBody
    @RequestMapping("/addMajor")
    public Object addMajor(Major major) {
        AJAXResult ajaxResult = new AJAXResult();
        Integer i = majorService.addMajor(major);
        if (i == 1) {
            ajaxResult.setSuccess(true);
            ajaxResult.setData(i);
        } else {
            ajaxResult.setSuccess(false);
        }
        return ajaxResult;
    }

    /**
     * @param: [major, page, limit]
     * @return: java.lang.Object
     * @auther: king
     * @date: 2019/1/2 8:20
     * @description: 专业的分页
     */
    @ResponseBody
    @RequestMapping("/majorPaging")
    public Object deptPaging(Major major,
                             @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                             @RequestParam(value = "limit", required = false, defaultValue = "10") Integer limit) {
        List<Major> majors = majorService.selectMajorByPaging(major, page, limit);
        Integer majorCount = majorService.selectMajorCountByCondition(major);
        Map<String, Object> pageData = new HashMap<>();
        pageData.put("code", 0);
        pageData.put("msg", "");
        pageData.put("count", majorCount);
        pageData.put("data", majors);
        return pageData;
    }

    /**
     * @param: []
     * @return: java.lang.String
     * @auther: king
     * @date: 2019/1/2 8:17
     * @description: 跳转到专业管理页面
     */
    @RequestMapping("/major")
    public String major() {
        return "admin/major";
    }
}
