<%@ page contentType="text/html;charset=UTF-8" %>
<html>

<head>
    <title>课堂管理</title>
    <%@ include file="cite/style.jsp" %>
</head>

<body class="layui-layout-body">
<!--body区-->
<div class="layui-layout layui-layout-admin">

    <!-- 头部区域 -->
    <div class="layui-header">
        <%@ include file="cite/head.jsp" %>
    </div>
    <!-- 头部区域结束 -->

    <!-- 左侧导航区域 -->
    <%@ include file="cite/menu.jsp" %>
    <!-- 左侧导航区域结束 -->

    <!-- 内容主体区域 -->
    <div class="layui-body">
        <!-- 内容主体区域 -->
            <iframe src="${pageContext.request.contextPath}/#" width="100%" height="100%"
            style="border: 1px solid black"></iframe>
        <%--<!--主体内容区域结束-->--%>
    </div>
    <!-- 内容主体区域结束 -->

    <!-- 底部固定区域 -->
    <div class="layui-footer">
        <%@ include file="cite/footer.jsp" %>
    </div>
    <!-- 底部固定区域结束 -->

</div>
<!--body区结束-->
</body>

<%--引入layUI基础模块--%>
<script>
    layui.use(['element'], function () {
        var element = layui.element;
    });
</script>


</html>
