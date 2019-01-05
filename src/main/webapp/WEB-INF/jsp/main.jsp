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
            <h1 style="text-align: center; padding: 20%;">这是主页</h1>
            <!--主体内容区域结束-->
        </div>
        <!-- 内容主体区域结束 -->

        <!-- 底部固定区域 -->
        <div class="layui-footer">
            © 666 - 底部固定区域
        </div>
        <!-- 底部固定区域结束 -->

    </div>
    <!--body区结束-->
</body>

<script>
    var element;
    layui.use(['element'], function () {
        element = layui.element;
    });
</script>

</html>
