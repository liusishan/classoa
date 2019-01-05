package cn.king.service.impl;

import cn.king.dao.UserMapper;
import cn.king.pojo.Permission;
import cn.king.pojo.Role;
import cn.king.pojo.User;
import cn.king.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Title:
 * @CreateTime: 2018/12/28 20:18
 * @Author: king
 * @Description:
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    /**
     * @param: [user]
     * @return: cn.king.pojo.User
     * @auther: king
     * @date: 2018/12/28 20:20
     * @description: 根据用户名和密码查询数据库, 返回用户信息
     */
    @Override
    public User selectUserByLogin(User user) {
        User dbUser1 = userMapper.selectUserByLogin(user);
        //登录失败
        if (!dbUser1.getPassword().equals(user.getPassword())) {
            return null;
        }
        //登录成功
        //获取角色信息
        Role role = userMapper.selectRoleById(dbUser1.getId());
        if (role.getRoleName().equals("教师")) {
            dbUser1 = userMapper.selectTeacherById(dbUser1.getId());
        } else if (role.getRoleName().equals("管理员")) {
            dbUser1 = userMapper.selectAdminById(dbUser1.getId());
            //学生
        } else if (role.getRoleName().equals("普通学生")){
            dbUser1 = userMapper.selectStudentById(dbUser1.getId());
        }
        return dbUser1;
    }

    /**
     * @param: [id]
     * @return: cn.king.pojo.Permission
     * @auther: king
     * @date: 2018/12/29 17:01
     * @description: 根据用户id查询权限信息
     */
    @Override
    public List<Permission> selectPermissionByUserId(Integer id) {
        return userMapper.selectPermissionByUserId(id);
    }
}
