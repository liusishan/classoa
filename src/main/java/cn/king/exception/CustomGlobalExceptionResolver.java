package cn.king.exception;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Title:
 * @CreateTime: 2018/12/28 10:06
 * @Author: king
 * @Description: 全局的异常处理器
 */
public class CustomGlobalExceptionResolver implements HandlerExceptionResolver {

    @Override
    public ModelAndView resolveException(HttpServletRequest request,
                                         HttpServletResponse response,
                                         Object handler, Exception e) {
        CustomException customException = null;
        //如果出现的异常是我们自己抛出的异常
        if (e instanceof CustomException) {
            customException = (CustomException) e;
            //如果出现的异常不是我们自己抛出的异常, 说明是运行时异常
        } else {
            customException = new CustomException("未知错误.(一旦出现这个错误, 说明出bug了, 请联系系统管理员!)");
        }
        //取出错误信息
        String message = customException.getMessage();
        //将错误信息再页面展示
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("message", message);
        //跳转到错误提示页面
        modelAndView.setViewName("error");

        return modelAndView;
    }
}
