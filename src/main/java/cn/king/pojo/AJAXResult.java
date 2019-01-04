package cn.king.pojo;

/**
 * @Title:
 * @CreateTime: 2018/12/28 10:27
 * @Author: king
 * @Description: Ajax响应
 */
public class AJAXResult {
    //响应成功还是失败
    private boolean success;
    //返回给前台的数据
    private Object data;

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
