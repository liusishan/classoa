package cn.king.dao;

import cn.king.pojo.Permission;
import cn.king.pojo.Role;
import cn.king.pojo.User;

import java.util.List;

/**
 * @Title:
 * @CreateTime: 2018/12/28 20:20
 * @Author: king
 * @Description:
 */
public interface UserMapper {

    //根据登录信息查询数据库判断用户名密码是否正确
    User selectUserByLogin(User user);

    //根据id查询角色信息
    Role selectRoleById(Integer id);

    //根据用户id查询教师信息
    User selectTeacherById(Integer id);

    //根据用户id查询管理员信息
    User selectAdminById(Integer id);

    //根据用户id查询学生信息
    User selectStudentById(Integer id);

    //根据用户id查询用户权限信息
    List<Permission> selectPermissionByUserId(Integer id);
}
