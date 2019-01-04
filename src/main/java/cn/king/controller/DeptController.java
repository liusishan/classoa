package cn.king.controller;

import cn.king.pojo.AJAXResult;
import cn.king.pojo.Department;
import cn.king.service.DeptService;
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
public class DeptController {

    @Autowired
    private DeptService deptService;

    /**
     * @param: []
     * @return: java.lang.Object
     * @auther: king
     * @date: 2019/1/3 18:43
     * @description: 查询所有部门
     */
    @ResponseBody
    @RequestMapping("/selectAllDept")
    public Object selectAllDept() {
        AJAXResult ajaxResult = new AJAXResult();
        List<Department> departments = deptService.selectAllDept();
        if (departments != null) {
            ajaxResult.setSuccess(true);
            ajaxResult.setData(departments);
        } else {
            ajaxResult.setSuccess(false);
        }
        return ajaxResult;
    }

    /**
     * @param: []
     * @return: java.lang.Object
     * @auther: king
     * @date: 2019/1/1 20:35
     * @description: 修改部门
     */
    @ResponseBody
    @RequestMapping("/editDept")
    public Object editDept(Department department) {
        AJAXResult ajaxResult = new AJAXResult();
        Integer i = deptService.editDeptById(department);
        if (i != null && i > 0) {
            ajaxResult.setSuccess(true);
            ajaxResult.setData(i);
        } else {
            ajaxResult.setSuccess(false);
        }
        return ajaxResult;
    }

    /**
     * @param: []
     * @return: java.lang.Object
     * @auther: king
     * @date: 2019/1/1 18:14
     * @description: 按照id批量删除部门
     */
    @ResponseBody
    @RequestMapping("/delDepts")
    public Object delDept(String[] ids) {
        AJAXResult ajaxResult = new AJAXResult();
        Integer i = deptService.delDeptByIds(ids);
        if (i != null && i > 0) {
            ajaxResult.setData(i);
            ajaxResult.setSuccess(true);
        } else {
            ajaxResult.setSuccess(false);
        }
        return ajaxResult;
    }

    /**
     * @param: []
     * @return: java.lang.Object
     * @auther: king
     * @date: 2019/1/1 14:46
     * @description: 添加部门
     */
    @ResponseBody
    @RequestMapping("/addDept")
    public Object addDept(Department department) {
        AJAXResult ajaxResult = new AJAXResult();
        Integer i = deptService.addDept(department);
        if (i == null) {
            ajaxResult.setSuccess(false);
        } else {
            ajaxResult.setData(i);
            ajaxResult.setSuccess(true);
        }
        return ajaxResult;
    }

    /**
     * @param: [department, page, limit]
     * @return: java.lang.Object
     * @auther: king
     * @date: 2018/12/31 19:17
     * @description: 部门分页
     */
    @ResponseBody
    @RequestMapping("/deptPaging")
    public Object deptPaging(Department department,
                             @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                             @RequestParam(value = "limit", required = false, defaultValue = "10") Integer limit) {
        List<Department> departments = deptService.selectDeptByPaging(department, page, limit);
        Integer deptCount = deptService.selectDeptCountByCondition(department);
        Map<String, Object> pageData = new HashMap<>();
        pageData.put("code", 0);
        pageData.put("msg", "");
        pageData.put("count", deptCount);
        pageData.put("data", departments);
        return pageData;
    }

    /**
     * @param: []
     * @return: java.lang.String
     * @auther: king
     * @date: 2019/1/1 14:45
     * @description: 跳转到部门列表
     */
    @RequestMapping("/dept")
    public String dept() {
        return "admin/dept";
    }


}
