package cn.king.dao;

import cn.king.pojo.Department;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Title:
 * @CreateTime: 2018/12/28 9:56
 * @Author: king
 * @Description:
 */
public interface DeptMapper {
    //部门分页
    List<Department> selectDeptByPaging(@Param("department") Department department,
                                        @Param("page") Integer page,
                                        @Param("limit") Integer limit);

    //获取部门总数
    Integer selectDeptCountByCondition(@Param("department") Department department);

    //添加部门
    Integer addDept(Department department);

    //批量删除部门
    Integer delDeptByIds(@Param("ids") String[] ids);

    //根据id修改部门
    Integer editDeptById(@Param("department") Department department);

    //查询所有的部门信息
    List<Department> selectAllDept();
}
