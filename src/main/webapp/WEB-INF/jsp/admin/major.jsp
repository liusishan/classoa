<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>专业管理</title>
    <%@ include file="../cite/style.jsp" %>
</head>
<body class="layui-layout-body">

<!--表单区域 ※ 根据layui要求此处最好放在body标签旁-->
<div id="form01" class="layui-row" style="display: none">
    <div class="layui-col-md11" id="form001">
        <form class="layui-form" id="form0001" lay-filter="dept_form">

            <div class="layui-form-item">
                <!--表单不顶边-->
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">专业名称</label>
                <div class="layui-input-block">
                    <!--lay-verify="required" : 必须填写此项-->
                    <input type="text" name="majorName" id="majorName" placeholder="请输入专业名称"
                           autocomplete="off" class="layui-input" lay-verify="required">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">所属部门</label>
                <div class="layui-input-block">
                    <select name="departmentName" lay-verify="required" id="dept">
                        <option value=""></option>
                    </select>
                </div>
            </div>

            <!--文本域-->
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">备注</label>
                <div class="layui-input-block">
                    <textarea name="remark" id="remark" placeholder="请输入备注信息" class="layui-textarea"></textarea>
                </div>
            </div>

        </form>
    </div>
</div>
<!--表单结束-->

<%--搜索表单--%>
<div id="form02" class="layui-row" style="display: none">
    <div class="layui-col-md11" id="form002">
        <form class="layui-form" id="form0002" lay-filter="form_example">

            <div class="layui-form-item">
                <!--表单不顶边-->
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">部门名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="deptName" id="deptName" placeholder="请输入部门名称关键字"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">部门负责人</label>
                <div class="layui-input-inline">
                    <input type="text" name="deptAdmin" id="deptAdmin" placeholder="请输入部门负责人关键字"
                           autocomplete="off" class="layui-input">
                </div>
            </div>

        </form>
    </div>
</div>


<!--body区-->
<div class="layui-layout layui-layout-admin">
    <!-- 内容主体区域 -->
    <!--数据表格-->
    <table id="table_major" lay-filter='table01'></table>
    <!--表格头部工具栏-->
    <script type="text/html" id="toolbar_major">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn layui-btn-sm layui-btn-warm" lay-event="add">添加</button>
            <button class="layui-btn layui-btn layui-btn-sm layui-btn-danger" lay-event="del">删除选中</button>
            <button class="layui-btn layui-btn layui-btn-sm layui-btn-normal" lay-event="search">条件查询</button>
        </div>
    </script>
    <!--表格行内操作按钮-->
    <script type="text/html" id="bar01">
        <a class="layui-btn layui-btn-xs layui-btn-radius layui-bg-blue" lay-event="detail">查看</a>
        <a class="layui-btn layui-btn-xs layui-btn-radius layui-bg-green" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-xs layui-btn-radius layui-bg-red" lay-event="del">删除</a>
    </script>
    <!-- 内容主体区域结束 -->
</div>
<!--body区结束-->
</body>

<%--引入lay ui 模块--%>
<script>
    layui.use(['element', 'form', 'layer', 'table', 'util', 'upload'], function () {
        //引入弹框功能
        var layer = layui.layer;
        //引入表单样式模块
        var form = layui.form;
        //引入数据表格模块
        var table = layui.table;
        //引入右下方小工具
        var util = layui.util;
        //引入文件上传模块
        var upload = layui.upload;

        //一个数据表格的实例
        table.render({
            elem: '#table_major'//指定原始表格元素选择器
            , height: 650//容器高度
            , title: '部门数据表'
            , url: '${pageContext.request.contextPath}/majorPaging' //数据接口
            , page: true //开启分页
            , toolbar: '#toolbar_major'//开启表格头部工具栏区域
            , totalRow: false //开启合计行区域
            , skin: 'line' //行边框风格
            , even: true //开启隔行背景
            , unresize: true//列宽可拖拽
            , limits: [5, 10, 15, 20, 25, 30, 35, 40, 50, 60, 70, 80, 90, 100]//每页条数的选择项
            , limit: 15//每页显示的条数
            , cols: [[//表头
                {type: 'checkbox'}
                , {field: 'id', title: '专业编号', sort: true}//sort开启排序
                , {field: 'majorName', title: '专业名称'}
                , {field: 'departmentName', title: '专业所属院系'}
                , {fixed: '', title: '操作', toolbar: '#bar01', width: 200}
            ]]
        });

        //表格头部按钮单击的事件监听
        table.on('toolbar(table01)', function (obj) {
            switch (obj.event) {
                case 'add':
                    //添加专业
                    addMajor();
                    break;
                case 'del':
                    //删除专业

                    break;
                case 'search':
                    //条件查询

                    break;
            }
            ;
        });

        // 表格每行按钮的事件监听
        var deptData = "";
        table.on('tool(table01)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            deptData = obj.data; //获得当前行的数据

            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象

            if (layEvent === 'detail') { //查看
                //查看详细信息
                detailMajor();
            } else if (layEvent === 'del') { //删除
                //删除一个部门
                delMajor(obj);
            } else if (layEvent === 'edit') { //编辑
                //编辑一个部门
                editMajor();
            }
        });


        //添加专业
        function addMajor() {
            //取消只读
            $("#majorName").prop('disabled', "").val("");
            $("#dept").prop('disabled', "").val("");
            $("#remark").prop('disabled', "").val("");
            //回显部门列表
            $.ajax({
                type: 'POST',
                url: '${pageContext.request.contextPath}/selectAllDept',
                success: function (result) {
                    var d = result.data;
                    for (var i = 0; i < d.length; i++) {
                        $("#dept").append("<option value=\"" + d[i].id + "\">" + d[i].departmentName + "</option>");
                    }
                    //更新渲染
                    form.render();
                }
            });
            //弹窗
            layer.open({
                type: 1,//弹出内容类型
                title: "添加部门",//标题
                btn: ['添加', '重置', '取消'],
                area: ['65%', '80%'], //大小
                skin: ['layui-layer-lan'],//皮肤
                anim: 5,//动画类型
                maxmin: true,
                shade: [0.6, '#000'],//遮罩
                //根据layui要求,此处能传纯字符串或DOM对象
                content: $("#form01"),
                moveOut: true,//是否允许拖动到窗口外
                //点击按钮1
                yes: function () {
                    var loadingIndex = null;
                    //获取参数
                    var jsonData = {
                        "majorName": $("#majorName").val(),
                        "departmentName": $("#dept").val(),
                        "remark": $("#remark").val()
                    };
                    console.log(jsonData);//======================================================================================
                    //添加专业
                    $.ajax({
                        type: "POST",
                        url: '${pageContext.request.contextPath}/addMajor',
                        data: jsonData,
                        beforeSend: function () {
                            //显示正在处理中的动画
                            loadingIndex = layer.load(2, {
                                shade: [0.1, '#fff']
                            });

                        },
                        //得到响应数据后的回调
                        success: function (result) {
                            //关闭正在处理中的动画
                            layer.close(loadingIndex);
                            if (result.success) {
                                //数据表格重载
                                table.reload('table_dept', {
                                    url: '${pageContext.request.contextPath}/majorPaging'
                                    , where: {
                                        //设定异步数据接口的额外参数
                                    }
                                });

                                layer.msg('添加成功', {
                                    //提示图标
                                    icon: 1
                                    //动画
                                    , anim: 5
                                    //关闭时间
                                    , time: 1000
                                    //提示框消失后的回调
                                    , end: function () {
                                    }
                                });
                                //添加失败
                            } else {
                                layer.msg('添加失败', {
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
            });

        }


    });
</script>

</html>
