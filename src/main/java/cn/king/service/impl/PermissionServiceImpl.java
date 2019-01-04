package cn.king.service.impl;

import cn.king.dao.PermissionMapper;
import cn.king.pojo.Permission;
import cn.king.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Title:
 * @CreateTime: 2018/12/31 15:04
 * @Author: king
 * @Description:
 */
@Service
public class PermissionServiceImpl implements PermissionService {

    @Autowired
    private PermissionMapper permissionMapper;

    /**
     * @param: []
     * @return: java.util.List<cn.king.pojo.Permission>
     * @auther: king
     * @date: 2018/12/31 15:10
     * @description: 获取所有的权限信息
     */
    @Override
    public List<Permission> selectAllPermissions() {
        return permissionMapper.selectAllPermissions();
    }


}
