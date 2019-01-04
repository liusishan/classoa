package cn.king.dao;

import cn.king.pojo.Permission;

import java.util.List;

/**
 * @Title:
 * @CreateTime: 2018/12/31 15:40
 * @Author: king
 * @Description:
 */
public interface PermissionMapper {

    //获取所有的权限信息
    List<Permission> selectAllPermissions();


}
