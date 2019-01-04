package cn.king.controller;

import cn.king.pojo.Permission;
import cn.king.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @Title:
 * @CreateTime: 2018/12/31 15:02
 * @Author: king
 * @Description:
 */
@Controller
public class PermissionController {
    @Autowired
    private PermissionService permissionService;


}
