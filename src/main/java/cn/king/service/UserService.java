package cn.king.service;

import cn.king.pojo.Permission;
import cn.king.pojo.User;

import java.util.List;

/**
 * @Title:
 * @CreateTime: 2018/12/28 20:18
 * @Author: king
 * @Description:
 */
public interface UserService {

    User selectUserByLogin(User user);

    List<Permission> selectPermissionByUserId(Integer id);
}
