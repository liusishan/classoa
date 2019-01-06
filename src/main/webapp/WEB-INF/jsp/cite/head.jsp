<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="layui-logo">课堂管理</div>

<ul class="layui-nav layui-layout-left">
    <c:forEach items="#" var="head">

    </c:forEach>
    <li class="layui-nav-item"><a href="javascript:void(0);">测试1</a></li>
    <li class="layui-nav-item"><a href="javascript:void(0);">测试2</a></li>
    <li class="layui-nav-item"><a href="javascript:void(0);">测试3</a></li>
    <li class="layui-nav-item"><a href="javascript:void(0);">测试4</a></li>
    <li class="layui-nav-item"><a href="javascript:void(0);">测试5</a></li>
    <li class="layui-nav-item"><a href="javascript:void(0);">测试6</a></li>
    <li class="layui-nav-item"><a href="javascript:void(0);">测试7</a></li>
    <li class="layui-nav-item"><a href="javascript:void(0);">测试8</a></li>

    <li class="layui-nav-item">
        <a href="javascript:void(0);">测试A</a>
        <dl class="layui-nav-child">
            <dd><a href="javascript:void(0);">测试A1</a></dd>
            <dd><a href="javascript:void(0);">测试A2</a></dd>
            <dd><a href="javascript:void(0);">测试A3</a></dd>
        </dl>
    </li>
</ul>

<ul class="layui-nav layui-layout-right">
    <li class="layui-nav-item">
        <%--<img src="#" class="layui-nav-img">--%>
        <a href="javascript:void(0);"><span>你好,${sessionScope.loginUser.name}</span></a>
        <dl class="layui-nav-child">
            <dd><a href="javascript:void(0);">个人信息</a></dd>
            <dd><a href="javascript:void(0);">修改密码</a></dd>
        </dl>
    </li>
    <li class="layui-nav-item">
        <a href="${pageContext.request.contextPath}/logout">
            退出
        </a>
    </li>
</ul>