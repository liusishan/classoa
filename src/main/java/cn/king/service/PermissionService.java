package cn.king.service;

import cn.king.pojo.Permission;

import java.util.List;

/**
 * @Title:
 * @CreateTime: 2018/12/31 15:04
 * @Author: king
 * @Description:
 */
public interface PermissionService {

    //获取所有的权限信息
    List<Permission> selectAllPermissions();



}
