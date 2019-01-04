package cn.king.interceptor;

import cn.king.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @Title:
 * @CreateTime: 2018/12/31 14:11
 * @Author: king
 * @Description: 登录拦截器
 */
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object handler) throws Exception {
        //判断当前用户是否登录
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");
        //如果没登录
        if (loginUser == null) {
            //跳转到登录页面
            String path = session.getServletContext().getContextPath();
            response.sendRedirect(path+"/login");
            return false;
        }
        //如果登录
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response,
                           Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response,
                                Object handler, Exception ex) throws Exception {

    }
}
