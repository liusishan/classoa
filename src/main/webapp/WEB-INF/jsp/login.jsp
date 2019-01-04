<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>用户登录</title>
    <%@ include file="cite/style.jsp" %>
</head>
<body>

<div>
    <form method="post">
        用户名:<input type="text" placeholder="请输入用户名" id="account"><br>
        密码: <input type="password" placeholder="请输入密码" id="password"><br>
        <input type="button" onclick="doLogin()" value="登录">
    </form>
</div>

</body>

<%--引入layUI--%>
<script>
    var element;
    var layer;
    layui.use(['element', 'layer'], function () {
        element = layui.element;
        //引入弹框模块
        layer = layui.layer;
    });
</script>

<%--密码输入框回车事件--%>
<script>
    $("#password").on('keypress', function (event) {
        if (event.keyCode == "13") {
            doLogin();
        }
    });
</script>

<%--异步登录方法--%>
<script>
    function doLogin() {
        //非空校验
        var account = $("#account").val();
        //表单元素的取值不可能为null, 只能判断是否为空字符串
        if (account.trim().length == 0) {

            layer.msg('账号不能为空', {
                //提示图标
                icon: 5
                //动画
                , anim: 6
                //关闭时间
                , time: 1000
                //提示框消失后的回调
                , end: function () {
                }
            });
            //结束方法
            return;
        }

        var password = $("#password").val();
        if (password.trim().length == 0) {

            layer.msg('密码不能为空', {
                //提示图标
                icon: 5
                //动画
                , anim: 6
                //关闭时间
                , time: 1000
                //提示框消失后的回调
                , end: function () {
                }
            });
            //结束方法
            return;
        }

        //提交表单 -- 异步提交, 使用ajax <==> $.ajax(josn对象); <==> $.ajax({键1:值1,键2,值2});
        var loadingIndex = null;
        $.ajax({
            //指定提交方式
            type: "POST",
            //指定请求的URL
            url: "${pageContext.request.contextPath}/doAJAXLogin",
            //指定提交的参数
            data: {"account": account, "password": password},
            //发送数据之前要执行的逻辑
            beforeSend: function () {
                //显示正在处理中的动画
                loadingIndex = layer.load(2, {
                    shade: [0.1, '#fff']
                });
            },
            //接收到服务器的响应之后要执行的逻辑, 参数就是接收到的服务器的Http响应
            success: function (result) {
                //关闭正在处理中的动画
                layer.close(loadingIndex);
                //登录成功
                if (result.success) {
                    window.location.href = "${pageContext.request.contextPath}/main";
                    //登录失败
                } else {

                    layer.msg('账号或密码错误', {
                        //提示图标
                        icon: 5
                        //动画
                        , anim: 6
                        //关闭时间
                        , time: 1000
                        //提示框消失后的回调
                        , end: function () {
                        }
                    });

                }
            }
        });
    }
</script>

</html>
