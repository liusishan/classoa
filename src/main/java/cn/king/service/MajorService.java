package cn.king.service;

import cn.king.pojo.Major;

import java.util.List;

/**
 * @Title:
 * @CreateTime: 2018/12/28 9:47
 * @Author: king
 * @Description:
 */
public interface MajorService {

    //根据条件查询专业信息
    List<Major> selectMajorByPaging(Major major, Integer page, Integer limit);

    //根据条件查询专业总数
    Integer selectMajorCountByCondition(Major major);

    //添加专业
    Integer addMajor(Major major);
}
