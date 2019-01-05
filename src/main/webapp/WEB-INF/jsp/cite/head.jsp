<%@ page contentType="text/html;charset=UTF-8" %>

<div class="layui-logo">课堂管理</div>
<ul class="layui-nav layui-layout-left">
    <li class="layui-nav-item"><a href="">控制台</a></li>
    <li class="layui-nav-item"><a href="">商品管理</a></li>
    <li class="layui-nav-item"><a href="">用户</a></li>
    <li class="layui-nav-item">
        <a href="javascript:void(0);">其它系统</a>
        <dl class="layui-nav-child">
            <dd><a href="">邮件管理</a></dd>
            <dd><a href="">消息管理</a></dd>
            <dd><a href="">授权管理</a></dd>
        </dl>
    </li>
</ul>
<ul class="layui-nav layui-layout-right">
    <li class="layui-nav-item">
        <a href="javascript:void(0);">
            <img src="#" class="layui-nav-img">
            <span>你好,${sessionScope.loginUser.name}</span>
        </a>
        <dl class="layui-nav-child">
            <dd><a href="">基本资料</a></dd>
            <dd><a href="">安全设置</a></dd>
        </dl>
    </li>
    <li class="layui-nav-item">
        <a href="${pageContext.request.contextPath}/logout">退出</a>
    </li>
</ul>