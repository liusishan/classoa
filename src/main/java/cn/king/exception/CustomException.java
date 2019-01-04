package cn.king.exception;

/**
 * @Title:
 * @CreateTime: 2018/12/28 10:03
 * @Author: king
 * @Description: 自定义异常类
 */
public class CustomException extends Exception {
    //保存异常信息
    private String message;

    public CustomException(String message) {
        super(message);
        this.message = message;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
