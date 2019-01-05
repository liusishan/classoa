package cn.king.common;

import cn.king.pojo.AJAXResult;

/**
 * @Title:
 * @CreateTime: 2019/1/5 16:51
 * @Author: king
 * @Description: 返回结果工具类
 */
public class ResultUtil {

    /**
     * @param: [result]
     * @return: java.lang.Object
     * @auther: king
     * @date: 2019/1/5 16:50
     * @description: 返回方法的抽取
     *
     * 注意:
     * 如果查询总数,总数可能是0, 用此方法将返回null;
     * 增删改影响几条就会返回几;
     */
    public static AJAXResult Result(Object result) {
        AJAXResult ajaxResult = new AJAXResult();
        if (result instanceof Long) {
            if ((Long) result > 0) {
                ajaxResult.setData(result);
                ajaxResult.setSuccess(true);
            } else {
                ajaxResult.setSuccess(false);
            }
            return ajaxResult;
        }
        if (result != null) {
            ajaxResult.setData(result);
            ajaxResult.setSuccess(true);
        } else {
            ajaxResult.setSuccess(false);
        }
        return ajaxResult;
    }


}
