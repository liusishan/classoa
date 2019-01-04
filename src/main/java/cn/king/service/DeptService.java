package cn.king.service;

import cn.king.pojo.Department;

import java.util.List;

/**
 * @Title:
 * @CreateTime: 2018/12/28 9:47
 * @Author: king
 * @Description:
 */
public interface DeptService {
    //部门分页
    List<Department> selectDeptByPaging(Department department, Integer page, Integer limit);

    //获取部门总数
    Integer selectDeptCountByCondition(Department department);

    //添加部门信息
    Integer addDept(Department department);

    //批量删除部门信息
    Integer delDeptByIds(String[] ids);

    //根据id修改部门
    Integer editDeptById(Department department);


    //查询所有部门
    List<Department> selectAllDept();
}
