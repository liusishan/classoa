<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>错误提示页面</title>
</head>
<body>
出错了, 错误提示:
<c:if test="${not empty requestScope.message}">
    <span style="color: red">${requestScope.message}</span>
</c:if>
<%--没有权限访问专用--%>
<c:if test="${not empty sessionScope.message}">
    <span style="color: red">${sessionScope.message}</span>
</c:if>
</body>
</html>
