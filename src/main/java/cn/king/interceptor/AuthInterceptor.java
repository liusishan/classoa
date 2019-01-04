package cn.king.interceptor;

import cn.king.pojo.Permission;
import cn.king.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @Title:
 * @CreateTime: 2018/12/31 14:58
 * @Author: king
 * @Description: 权限拦截器
 */
public class AuthInterceptor implements HandlerInterceptor {

    @Autowired
    private PermissionService permissionService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object handler) throws Exception {
        //获取用户当前请求地址, 以便验证用户是否具有访问权限
        // -- 当前用户当前请求的地址
        String uri = request.getRequestURI();
        // -- 当前项目名
        String path = request.getSession().getServletContext().getContextPath();

        //判断当前路径是否需要进行权限验证, 公共路径不需要权限即可访问        

        // ‐‐ 获取所有需要验证权限信息的路径集合
        List<Permission> permissions = this.permissionService.selectAllPermissions();

        //将所有的权限信息放到map集合, set是不可重复的map
        Set<String> uriSet = new HashSet<>();
        for (Permission permission : permissions) {
            if (permission.getUrl() != null && !"".equals(permission.getUrl())) {
                uriSet.add(path + permission.getUrl());
            }
        }

        //如果所有需要授权才能访问的路径中包含了用户当前请求的路径, 说明当前的请求需要进行权限验证
        if (uriSet.contains(uri)) {
            //权限验证
            //判断当前用户是否有访问该url的权限
            //取出当前用户所有的权限
            Set<String> authUriSet =
                    (Set<String>) request.getSession().getAttribute("AuthUriSet");

            //如果当前用户的所有许可中, 包含当前访问的地址
            if (authUriSet.contains(uri)) {
                //放行
                return true;
                //如果当前用户的所有许可中, 不包含当前访问的地址
            } else {
                //重定向到错误页面
                request.getSession().setAttribute("message", "无权访问!");
                response.sendRedirect(path + "/error");
                //不放行
                return false;
            }
            //不包含, 说明这个地址不需要授权就能访问
        } else {
            return true;
        }

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
