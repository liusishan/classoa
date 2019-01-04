package cn.king.dao;

import cn.king.pojo.Major;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Title:
 * @CreateTime: 2018/12/28 9:56
 * @Author: king
 * @Description:
 */
public interface MajorMapper {
    //专业的分页
    List<Major> selectMajorByPaging(@Param("major") Major major,
                                    @Param("page") Integer page,
                                    @Param("limit") Integer limit);

    //根据条件查询专业总数
    Integer selectMajorCountByCondition(@Param("major") Major major);

    //添加专业
    Integer addMajor(Major major);
}
