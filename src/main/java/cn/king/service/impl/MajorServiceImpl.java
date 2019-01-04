package cn.king.service.impl;

import cn.king.dao.MajorMapper;
import cn.king.pojo.Major;
import cn.king.service.MajorService;
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
public class MajorServiceImpl implements MajorService {

    @Autowired
    private MajorMapper majorMapper;
    /**
     * @param: [major, page, limit]
     * @return: java.util.List<cn.king.pojo.Major>
     * @auther: king
     * @date: 2019/1/2 15:06
     * @description: 专业分页
     */
    @Override
    public List<Major> selectMajorByPaging(Major major, Integer page, Integer limit) {
        return majorMapper.selectMajorByPaging(major, page, limit);
    }

    /**
     * @param: [major]
     * @return: java.lang.Integer
     * @auther: king
     * @date: 2019/1/2 15:06
     * @description: 根据条件查询专业数量
     */
    @Override
    public Integer selectMajorCountByCondition(Major major) {
        if (major != null) {
            return majorMapper.selectMajorCountByCondition(major);
        }
        return null;
    }

    /**
     * @param: [major]
     * @return: java.lang.Integer
     * @auther: king
     * @date: 2019/1/3 18:34
     * @description: 添加一个专业
     */
    @Override
    public Integer addMajor(Major major) {
        if (major != null) {
            Integer i  =  majorMapper.addMajor(major);
            if (i == 1) {
                return i;
            }
            return null;
        }
        return null;
    }


}
