<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>错误提示页面</title>
</head>
<body>

<c:if test="${not empty requestScope.message}">
    出错了, 错误提示:
    <span style="color: red">${requestScope.message}</span>
</c:if>

<%--没有权限访问专用--%>
<c:if test="${not empty sessionScope.message}">
    出错了, 错误提示:
    <span style="color: red">${sessionScope.message}</span>
</c:if>

<c:if test="${not empty sessionScope.doLogin}">
    <a href="${pageContext.request.contextPath}/login">请登录</a>
</c:if>
</body>

</html>
