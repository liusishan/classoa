package cn.king.controller;

import cn.king.pojo.AJAXResult;
import cn.king.pojo.Permission;
import cn.king.pojo.User;
import cn.king.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * @Title:
 * @CreateTime: 2018/12/28 10:12
 * @Author: king
 * @Description:
 */
@Controller
public class DispatchController {

    @Autowired
    private UserService userService;

    /**
     * @param: [session]
     * @return: java.lang.String
     * @auther: king
     * @date: 2018/12/31 14:29
     * @description: 退出功能
     */
    @ResponseBody
    @RequestMapping("/logout")
    public void logout(HttpSession session) {
        //按照session名清空指定session        
        //session.removeAttribute("loginUser");        
        //让所有session失效‐‐ 清空所有session数据        
        session.invalidate();
    }


    /**
     * @param: []
     * @return: java.lang.String
     * @auther: king
     * @date: 2018/12/29 18:05
     * @description: 登录成功后跳转到主页
     */
    @RequestMapping("/main")
    public String main() {
        return "main";
    }

    /**
     * @param: [user, session]
     * @return: java.lang.Object
     * @auther: king
     * @date: 2018/12/29 16:48
     * @description: 异步登录
     */
    @ResponseBody
    @RequestMapping("/doAJAXLogin")
    public Object doAjax(User user, HttpSession session) {
        AJAXResult ajaxResult = new AJAXResult();
        User dbUser = userService.selectUserByLogin(user);
        //登录成功
        if (dbUser != null) {
            //将用户信息放到session
            session.setAttribute("loginUser", dbUser);

            //获取当前用户所有的权限信息
            List<Permission> permissions =
                    userService.selectPermissionByUserId(dbUser.getId());

            //将权限信息放入Map, 键是id
            Map<Integer, Permission> permissionMap = new HashMap<>();
            for (Permission permission : permissions) {
                permissionMap.put(permission.getId(), permission);
            }

            //将权限信息做成树
            Permission root = null;
            for (Permission permission : permissions) {
                Permission child = null;
                //如果这个链接是导航栏结点
                if (permission.getPid() != -1) {
                    child = permission;
                    //如果这个结点是根结点
                    if (child.getPid() == 0) {
                        root = permission;
                        //如果这个结点不是根结点
                    } else {
                        //获取这个结点的父结点
                        Permission parent = permissionMap.get(child.getPid());
                        //将这个结点添加到他的父结点下
                        parent.getChildren().add(child);
                    }
                }
            }
            session.setAttribute("rootPermission", root);

            //当前用户所有的权限拦截 -- set是元素不可重复的list
            String path = session.getServletContext().getContextPath();
            Set<String> uriSet = new HashSet<>();
            //获取所有的权限信息保存到session
            for (Permission permission : permissions) {
                if (permission.getUrl() != null && !"".equals(permission.getUrl())) {
                    uriSet.add(path + permission.getUrl());
                }
            }

            System.out.println("※※※※※※※※※当前用户的权限是※※※※※※※※※※※※※※※※※※");
            for (String s : uriSet){
                System.out.println(s);
            }
            System.out.println("※※※※※※※※※※※※※※※※※※※※※※※※※※※");


            session.setAttribute("AuthUriSet", uriSet);

            ajaxResult.setSuccess(true);
            //登录失败
        } else {
            ajaxResult.setSuccess(false);
        }
        return ajaxResult;
    }

    /**
     * @param: []
     * @return: java.lang.String
     * @auther: king
     * @date: 2018/12/29 18:11
     * @description: 跳转到登录界面
     */
    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    /**
     * @param: []
     * @return: java.lang.String
     * @auther: king
     * @date: 2018/12/31 15:22
     * @description: 跳转到错误提示页面
     */
    @RequestMapping("/error")
    public String goErrorPage() {
        return "error";
    }

}
