package cn.king.service.impl;

import cn.king.dao.DeptMapper;
import cn.king.pojo.Department;
import cn.king.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Title:
 * @CreateTime: 2018/12/28 9:47
 * @Author: king
 * @Description:
 */
@Service
public class DeptServiceImpl implements DeptService {
    @Autowired
    private DeptMapper deptMapper;

    /**
     * @param: [department, page, limit]
     * @return: java.util.List<cn.king.pojo.Department>
     * @auther: king
     * @date: 2018/12/31 19:18
     * @description: 获取部门分页数据
     */
    @Override
    public List<Department> selectDeptByPaging(Department department,
                                               Integer page, Integer limit) {
        return deptMapper.selectDeptByPaging(department, (page - 1) * limit, limit);
    }

    /**
     * @param: []
     * @return: java.lang.Integer
     * @auther: king
     * @date: 2018/12/31 19:18
     * @description: 获取部门总数
     */
    @Override
    public Integer selectDeptCountByCondition(Department department) {
        return deptMapper.selectDeptCountByCondition(department);
    }

    /**
     * @param: [department]
     * @return: java.lang.Integer
     * @auther: king
     * @date: 2019/1/1 15:08
     * @description: 添加部门信息
     */
    @Override
    public Integer addDept(Department department) {
        if (department != null) {
            if (!"".equals(department.getDepartmentName().trim()) &&
                !"".equals(department.getDepartmentAdmin().trim()) &&
                !"".equals(department.getTelephone().trim())) {
                return deptMapper.addDept(department);
            }
            return null;
        }
        return null;
    }

    /**
     * @param: [ids]
     * @return: java.lang.Integer
     * @auther: king
     * @date: 2019/1/1 18:16
     * @description: 批量删除部门信息
     */
    @Override
    public Integer delDeptByIds(String[] ids) {
        if (ids != null) {
            return deptMapper.delDeptByIds(ids);
        }
        return null;
    }

    /**
     * @param: [department]
     * @return: java.lang.Integer
     * @auther: king
     * @date: 2019/1/1 20:37
     * @description: 根据id修改部门
     */
    @Override
    public Integer editDeptById(Department department) {
        if (department != null) {
            return deptMapper.editDeptById(department);
        }
        return null;
    }

    /**
     * @param: []
     * @return: java.util.List<cn.king.pojo.Department>
     * @auther: king
     * @date: 2019/1/3 18:49
     * @description: 查询所有的部门信息
     */
    @Override
    public List<Department> selectAllDept() {
        List<Department>departments = deptMapper.selectAllDept();
        if (departments != null) {
            return departments;
        }
        return null;
    }
}
