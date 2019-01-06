<%@ page contentType="text/html;charset=UTF-8" %>
<html>

<head>
    <title>课堂管理</title>
    <%@ include file="../cite/style.jsp" %>
</head>

<body class="layui-layout-body">

<%--隐藏表单, 放到最外边--%>
<div id="form03" class="layui-row" style="display: none">
    <div class="layui-col-md11" id="form003">
        <form class="layui-form" id="form0003" lay-filter="form_example">

            <div class="layui-form-item">
                <!--表单不顶边-->
            </div>

            <!--文字输入框-->
            <div class="layui-form-item">
                <label class="layui-form-label">标题</label>
                <div class="layui-input-block">
                    <!--lay-verify="required" : 必须填写此项-->
                    <input type="text" name="username" required lay-verify="required" placeholder="请输入作业标题"
                           autocomplete="off" class="layui-input">
                </div>
            </div>

            <!--文本域-->
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">描述/要求</label>
                <div class="layui-input-block">
                    <textarea name="desc" placeholder="请输入对作业的详细描述和要求" class="layui-textarea"></textarea>
                </div>
            </div>

            <!--点击按钮上传-->
            <div class="layui-form-item">
                <label class="layui-form-label">附件</label>
                <div class="layui-input-inline"> <!-- 注意：这一层元素并不是必须的 -->
                    <button type="button" class="layui-btn layui-btn-normal layui-btn-sm" id="upload1"><i
                            class="layui-icon"></i>点击上传文件
                    </button>
                </div>
                <div class="layui-form-mid layui-word-aux" style="margin-left: -70px">附件不得大于5MB</div>
            </div>

            <!--单选按钮-->
            <div class="layui-form-item">
                <label class="layui-form-label">作业类型</label>
                <div class="layui-input-block">
                    <input type="radio" name="type" value="1" title="个人任务" checked>
                    <input type="radio" name="type" value="2" title="小组任务">
                    <input type="radio" name="type" value="3" title="投标任务">
                </div>
            </div>

            <!--文字输入框-->
            <div class="layui-form-item">
                <label class="layui-form-label">积分</label>
                <div class="layui-input-inline">
                    <!--lay-verify="required" : 必须填写此项-->
                    <input type="text" name="username" required lay-verify="required"
                           placeholder="完成本次作业可获得的积分"
                           autocomplete="off" class="layui-input">
                </div>
            </div>

            <!--日期选择-->
            <!--传到后台格式默认xxxx-xx-xx-->
            <div class="layui-form-item">
                <label class="layui-form-label">截至时间</label>
                <div class="layui-inline">
                    <input type="text" class="layui-input" id="data02" placeholder="0000-00-00" name="date">
                </div>
            </div>

        </form>
    </div>
</div>

<!--body区-->
<div class="layui-layout layui-layout-admin">

    <!-- 头部区域 -->
    <div class="layui-header">
        <%@ include file="../cite/head.jsp" %>
    </div>
    <!-- 头部区域结束 -->

    <!-- 左侧导航区域 -->
    <%@ include file="../cite/menu.jsp" %>
    <!-- 左侧导航区域结束 -->

    <!-- 内容主体区域 -->
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">

            <button id="btn1" >测试表单</button>

            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                <legend>作业历史记录</legend>
            </fieldset>
            <ul class="layui-timeline">
                <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis"></i>
                    <div class="layui-timeline-content layui-text">
                        <h3 class="layui-timeline-title">2019-01-12</h3>
                        <div>
                            <span>最晚提交时间:</span>
                            <span class="layui-badge layui-bg-orange">2019-01-20</span>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <span>提交通过人数:</span>
                            <span class="layui-badge layui-bg-black">49/50</span>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                        <!--个人作业-->
                        <div>
                            <table class="layui-table" lay-size="sm" style="width: 70%">
                                <colgroup>
                                    <col width="150">
                                    <col width="200">
                                    <col>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th style="width: 50%">个人作业</th>
                                    <th style="width: 27%">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        汉语拼音抄100遍
                                    </td>
                                    <td>
                                        <button class="layui-btn layui-bg-blue  layui-btn-xs layui-btn-radius">下载附件</button>
                                        <button class="layui-btn layui-bg-cyan  layui-btn-xs layui-btn-radius">查看详情</button>
                                        <button class="layui-btn layui-bg-red  layui-btn-xs layui-btn-radius">修改作业</button>
                                        <button class="layui-btn layui-bg-green  layui-btn-xs layui-btn-radius ">
                                            审批作业</button>
                                        <span class="layui-badge-dot layui-bg-orange"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>汉语拼音抄100遍</td>
                                    <td>
                                        <button class="layui-btn layui-bg-blue  layui-btn-xs layui-btn-radius">下载附件</button>
                                        <button class="layui-btn layui-bg-cyan  layui-btn-xs layui-btn-radius">查看详情</button>
                                        <button class="layui-btn layui-bg-red  layui-btn-xs layui-btn-radius">修改作业</button>
                                        <button class="layui-btn layui-bg-green  layui-btn-xs layui-btn-radius ">审批作业</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>汉语拼音抄100遍</td>
                                    <td>
                                        <button class="layui-btn layui-bg-blue  layui-btn-xs layui-btn-radius">下载附件</button>
                                        <button class="layui-btn layui-bg-cyan  layui-btn-xs layui-btn-radius">查看详情</button>
                                        <button class="layui-btn layui-bg-red  layui-btn-xs layui-btn-radius">修改作业</button>
                                        <button class="layui-btn layui-bg-green  layui-btn-xs layui-btn-radius ">审批作业</button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <!--小组作业-->
                        <div>
                            <table class="layui-table" lay-size="sm" style="width: 70%">
                                <colgroup>
                                    <col width="150">
                                    <col width="200">
                                    <col>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th style="width: 50%">小组作业</th>
                                    <th style="width: 27%">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        汉语拼音抄100遍
                                    </td>
                                    <td>
                                        <button class="layui-btn layui-bg-blue  layui-btn-xs layui-btn-radius">下载附件</button>
                                        <button class="layui-btn layui-bg-cyan  layui-btn-xs layui-btn-radius">查看详情</button>
                                        <button class="layui-btn layui-bg-red  layui-btn-xs layui-btn-radius">修改作业</button>
                                        <button class="layui-btn layui-bg-green  layui-btn-xs layui-btn-radius ">审批作业</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>汉语拼音抄100遍</td>
                                    <td>
                                        <button class="layui-btn layui-bg-blue  layui-btn-xs layui-btn-radius">下载附件</button>
                                        <button class="layui-btn layui-bg-cyan  layui-btn-xs layui-btn-radius">查看详情</button>
                                        <button class="layui-btn layui-bg-red  layui-btn-xs layui-btn-radius">修改作业</button>
                                        <button class="layui-btn layui-bg-green  layui-btn-xs layui-btn-radius ">审批作业</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>汉语拼音抄100遍</td>
                                    <td>
                                        <button class="layui-btn layui-bg-blue  layui-btn-xs layui-btn-radius">下载附件</button>
                                        <button class="layui-btn layui-bg-cyan  layui-btn-xs layui-btn-radius">查看详情</button>
                                        <button class="layui-btn layui-bg-red  layui-btn-xs layui-btn-radius">修改作业</button>
                                        <button class="layui-btn layui-bg-green  layui-btn-xs layui-btn-radius ">审批作业</button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </li>
                <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis"></i>
                    <div class="layui-timeline-content layui-text">
                        <h3 class="layui-timeline-title">2019-01-01</h3>
                        <div>
                            <span>最晚提交时间:</span>
                            <span class="layui-badge layui-bg-orange">2019-01-10</span>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <span>提交通过人数:</span>
                            <span class="layui-badge layui-bg-black">49/50</span>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                        <!--个人作业-->
                        <div>
                            <table class="layui-table" lay-size="sm" style="width: 70%">
                                <colgroup>
                                    <col width="150">
                                    <col width="200">
                                    <col>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th style="width: 50%">个人作业</th>
                                    <th style="width: 27%">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        汉语拼音抄100遍
                                    </td>
                                    <td>
                                        <button class="layui-btn layui-bg-blue  layui-btn-xs layui-btn-radius">下载附件</button>
                                        <button class="layui-btn layui-bg-cyan  layui-btn-xs layui-btn-radius">查看详情</button>
                                        <button class="layui-btn layui-bg-red  layui-btn-xs layui-btn-radius">修改作业</button>
                                        <button class="layui-btn layui-bg-green  layui-btn-xs layui-btn-radius ">审批作业</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>汉语拼音抄100遍</td>
                                    <td>
                                        <button class="layui-btn layui-bg-blue  layui-btn-xs layui-btn-radius">下载附件</button>
                                        <button class="layui-btn layui-bg-cyan  layui-btn-xs layui-btn-radius">查看详情</button>
                                        <button class="layui-btn layui-bg-red  layui-btn-xs layui-btn-radius">修改作业</button>
                                        <button class="layui-btn layui-bg-green  layui-btn-xs layui-btn-radius ">审批作业</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>汉语拼音抄100遍</td>
                                    <td>
                                        <button class="layui-btn layui-bg-blue  layui-btn-xs layui-btn-radius">下载附件</button>
                                        <button class="layui-btn layui-bg-cyan  layui-btn-xs layui-btn-radius">查看详情</button>
                                        <button class="layui-btn layui-bg-red  layui-btn-xs layui-btn-radius">修改作业</button>
                                        <button class="layui-btn layui-bg-green  layui-btn-xs layui-btn-radius ">审批作业</button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <!--小组作业-->
                        <div>
                            <table class="layui-table" lay-size="sm" style="width: 70%">
                                <colgroup>
                                    <col width="150">
                                    <col width="200">
                                    <col>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th style="width: 50%">小组作业</th>
                                    <th style="width: 27%">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        汉语拼音抄100遍
                                    </td>
                                    <td>
                                        <button class="layui-btn layui-bg-blue  layui-btn-xs layui-btn-radius">下载附件</button>
                                        <button class="layui-btn layui-bg-cyan  layui-btn-xs layui-btn-radius">查看详情</button>
                                        <button class="layui-btn layui-bg-red  layui-btn-xs layui-btn-radius">修改作业</button>
                                        <button class="layui-btn layui-bg-green  layui-btn-xs layui-btn-radius ">审批作业</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>汉语拼音抄100遍</td>
                                    <td>
                                        <button class="layui-btn layui-bg-blue  layui-btn-xs layui-btn-radius">下载附件</button>
                                        <button class="layui-btn layui-bg-cyan  layui-btn-xs layui-btn-radius">查看详情</button>
                                        <button class="layui-btn layui-bg-red  layui-btn-xs layui-btn-radius">修改作业</button>
                                        <button class="layui-btn layui-bg-green  layui-btn-xs layui-btn-radius ">审批作业</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>汉语拼音抄100遍</td>
                                    <td>
                                        <button class="layui-btn layui-bg-blue  layui-btn-xs layui-btn-radius">下载附件</button>
                                        <button class="layui-btn layui-bg-cyan  layui-btn-xs layui-btn-radius">查看详情</button>
                                        <button class="layui-btn layui-bg-red  layui-btn-xs layui-btn-radius">修改作业</button>
                                        <button class="layui-btn layui-bg-green  layui-btn-xs layui-btn-radius ">审批作业</button>

                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </li>
                <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis"></i>
                    <div class="layui-timeline-content layui-text">
                        <span class="layui-badge-dot"></span>
                        <span class="layui-badge-dot layui-bg-orange"></span>
                        <span class="layui-badge-dot layui-bg-green"></span>
                        <span class="layui-badge layui-bg-cyan">点击查看更多作业历史</span>
                        <span class="layui-badge-dot layui-bg-cyan"></span>
                        <span class="layui-badge-dot layui-bg-blue"></span>
                        <span class="layui-badge-dot layui-bg-black"></span>
                    </div>
                </li>
            </ul>

        </div>
        <!-- 内容主体区域结束 -->
    </div>
    <!-- 内容主体区域结束 -->

    <!-- 底部固定区域 -->
    <div class="layui-footer">
        <%@ include file="../cite/footer.jsp" %>
    </div>
    <!-- 底部固定区域结束 -->

</div>
<!--body区结束-->
</body>

<script>
    layui.use(['element', 'form','laydate'], function () {
        var element = layui.element;
        //引入表单样式模块
        var form = layui.form;
        //日期组件
        laydate = layui.laydate;

        //执行一个日期实例
        laydate.render({
            elem: '#data02' //指定元素
            , btns: ['clear', 'now']
            , theme: 'grid' //格子主题
            , min: '1970-00-00'
            , max: '2099-06-16'
            , istoday: false
            , istime: true
            //显示阳历节日
            , calendar: true
        });

        $("#btn1").on('click',function () {
            layer.open({
                type: 1,//弹出内容类型
                title: "发布作业 软件技术五班 java高级应用",//标题
                btn: ['发布', '重置', '取消'],
                area: ['65%', '80%'], //大小
                skin: ['layui-layer-lan'],//皮肤
                anim: 5,//动画类型
                maxmin: true,
                shade: [0.6, '#000'],//遮罩
                //根据layui要求,此处能传纯字符串或DOM对象
                // content: $("#form01").html(),
                content: $("#form03"),
                moveOut: true,//是否允许拖动到窗口外
                //点击按钮1
                yes: function () {
                    layer.msg('操作成功', {
                        time: 2000, //2s后自动关闭
                        btn: ['滚', '哦']
                    });
                }, //点击按钮2
                btn2: function () {
                    //关闭
                    //重置表单
                    document.getElementById("form0001").reset();
                    //点击按钮后是否关闭该弹窗
                    return false;
                },
                //点击按钮3
                btn3: function () {
                    //关闭
                    layer.close();
                }
            });
            //渲染表单,否则选择类表单将不能用
            form.render();
        });

    });
</script>

</html>
