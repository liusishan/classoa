<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>部门管理</title>
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
                <label class="layui-form-label">部门名称</label>
                <div class="layui-input-block">
                    <!--lay-verify="required" : 必须填写此项-->
                    <input type="text" name="deptName" id="departmentName" placeholder="请输入部门名称"
                           autocomplete="off" class="layui-input" lay-verify="required">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">部门负责人</label>
                <div class="layui-input-block">
                    <!--lay-verify="required" : 必须填写此项-->
                    <input type="text" name="deptAdmin" id="departmentAdmin" placeholder="请输入部门负责人姓名"
                           autocomplete="off" class="layui-input" lay-verify="required">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">联系方式</label>
                <div class="layui-input-block">
                    <!--lay-verify="required" : 必须填写此项-->
                    <input type="text" name="telephone" id="telephone" lay-verify="required phone"
                           placeholder="请输入部门负责人手机号"
                           autocomplete="off" class="layui-input">
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
    <!--数据表格-->
    <table id="table_dept" lay-filter='table01'></table>
    <!--表格头部工具栏-->
    <script type="text/html" id="toolbar_dept">
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
            elem: '#table_dept'//指定原始表格元素选择器
            , height: 650//容器高度
            , title: '部门数据表'
            , url: '${pageContext.request.contextPath}/deptPaging' //数据接口
            , page: true //开启分页
            , toolbar: '#toolbar_dept'//开启表格头部工具栏区域
            , totalRow: false //开启合计行区域
            , skin: 'line' //行边框风格
            , even: true //开启隔行背景
            , unresize: true//列宽可拖拽
            , limits: [10, 15, 20, 25, 30, 35, 40, 50, 60, 70, 80, 90, 100]//每页条数的选择项
            , limit: 15//每页显示的条数
            , cols: [[//表头
                {type: 'checkbox'}
                , {field: 'id', title: '部门编号', sort: true}//sort开启排序
                , {field: 'departmentName', title: '部门名称'}
                , {field: 'departmentAdmin', title: '部门负责人'}
                , {field: 'telephone', title: '部门负责人电话'}
                , {fixed: '', title: '操作', toolbar: '#bar01', width: 180}
            ]]
        });

        //表格头部按钮单击的事件监听
        table.on('toolbar(table01)', function (obj) {
            switch (obj.event) {
                case 'add':
                    //添加部门
                    addDept();
                    break;
                case 'del':
                    //删除选中
                    deleteSelDept();
                    break;
                case 'search':
                    //条件查询
                    conditionSearch();
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
                detailDept();
            } else if (layEvent === 'del') { //删除
                //删除一个部门
                delDept(obj);
            } else if (layEvent === 'edit') { //编辑
                //编辑一个部门
                editDept();
            }
        });

        //条件查询
        function conditionSearch() {
            //弹窗
            layer.open({
                type: 1,//弹出内容类型
                title: "条件查询",//标题
                btn: ['搜索', '重置', '取消'],
                area: ['350px', '220px'], //大小
                skin: ['layui-layer-lan'],//皮肤
                anim: 5,//动画类型
                maxmin: true,
                shade: [0.6, '#000'],//遮罩
                //根据layui要求,此处能传纯字符串或DOM对象
                // content: $("#form01").html(),
                content: $("#form02"),
                moveOut: true,//是否允许拖动到窗口外
                //点击按钮1
                yes: function () {
                    //条件查询
                    //数据表格重载
                    table.reload('table_dept', {
                        url: '${pageContext.request.contextPath}/deptPaging'
                        , where: {//设定异步数据接口的额外参数
                            "departmentName": $("#deptName").val(),
                            "departmentAdmin": $("#deptAdmin").val()
                        }
                        //,height: 300
                    });
                    //关闭条件查询弹窗
                    layer.closeAll();
                },
                //点击按钮2
                btn2: function () {
                    //重置表单
                    document.getElementById("form0002").reset();
                    //点击按钮后是否关闭该弹窗
                    return false;
                },
                //点击按钮3
                btn3: function () {
                    //关闭条件查询弹窗
                    layer.closeAll();
                }
            });
        }

        //添加部门
        function addDept() {
            //不只读
            $("#departmentName").prop('disabled', "").val("");
            $("#departmentAdmin").prop('disabled', "").val("");
            $("#telephone").prop('disabled', "").val("");
            $("#remark").prop('disabled', "").val("");
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
                    var jsonData = {
                        "departmentName": $("#departmentName").val(),
                        "departmentAdmin": $("#departmentAdmin").val(),
                        "telephone": $("#telephone").val(),
                        "remark": $("#remark").val()
                    };
                    //添加部门
                    $.ajax({
                        type: 'POST',
                        url: '${pageContext.request.contextPath}/addDept',
                        data: jsonData,
                        //发送数据之前要执行的逻辑
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
                            //添加成功
                            if (result.success) {
                                //数据表格重载
                                table.reload('table_dept', {
                                    url: '${pageContext.request.contextPath}/deptPaging'
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

                    //重置表单
                    document.getElementById("form0001").reset();
                    //关闭条件查询弹窗
                    layer.closeAll();
                },
                //点击按钮2
                btn2: function () {
                    //重置表单
                    document.getElementById("form0001").reset();
                    //点击按钮后是否关闭该弹窗
                    return false;
                },
                //点击按钮3
                btn3: function () {
                    //关闭条件查询弹窗
                    layer.closeAll();
                }
            });
        }

        //删除选中
        function deleteSelDept() {
            //获取选中的数据
            var checkData = table.checkStatus('table_dept').data;
            //获取选中的个数
            var i = checkData.length;
            if (i == 0) {
                layer.msg('未选择任何数据', {
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
            } else {
                layer.confirm('确认删除吗', function (index) {
                    //获取选中的数据的id
                    var ids = "";
                    var checkData = table.checkStatus('table_dept').data;
                    for (var i in checkData) {
                        for (var v in checkData[i]) {
                            if (v == "id") {
                                ids += checkData[i][v];
                                ids += ",";
                            }
                        }
                    }
                    ids = ids.substr(0, ids.length - 1);

                    var loadingIndex2 = null;
                    $.ajax({
                        type: 'POST',
                        url: '${pageContext.request.contextPath}/delDepts',
                        data: {"ids": ids},
                        //发送数据之前要执行的逻辑
                        beforeSend: function () {
                            //显示正在处理中的动画
                            loadingIndex2 = layer.load(2, {
                                shade: [0.1, '#fff']
                            });
                        },
                        //得到响应数据后的回调
                        success: function (result) {
                            //关闭正在处理中的动画
                            layer.close(loadingIndex2);
                            if (result.success) {
                                layer.msg('删除成功', {
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
                                //数据表格重载
                                table.reload('table_dept', {
                                    url: '${pageContext.request.contextPath}/deptPaging'
                                    , where: {} //设定异步数据接口的额外参数
                                });
                            } else {
                                layer.msg('删除失败', {
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
                    //关闭当前窗口
                    layer.close(index);
                });
            }
        }

        //查看详细信息
        function detailDept() {
            //回显
            form.val("dept_form", {
                "deptName": deptData.departmentName
                , "deptAdmin": deptData.departmentAdmin
                , "telephone": deptData.telephone
                , "remark": deptData.remark
            });
            //只读
            $("#departmentName").prop('disabled', true);
            $("#departmentAdmin").prop('disabled', true);
            $("#telephone").prop('disabled', true);
            $("#remark").prop('disabled', true);
            //弹窗
            layer.open({
                type: 1,//弹出内容类型
                title: "部门详情",//标题
                btn: ['关闭'],
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
                    //关闭弹窗
                    layer.closeAll();
                }
            });
        }

        //删除一个部门
        function delDept(obj) {
            layer.confirm('确定要删除吗', function (index) {
                var loadingIndex3 = null;
                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/delDepts',
                    data: {"ids": deptData.id},
                    //发送数据之前要执行的逻辑
                    beforeSend: function () {
                        //显示正在处理中的动画
                        loadingIndex3 = layer.load(2, {
                            shade: [0.1, '#fff']
                        });
                    },
                    //得到响应数据后的回调
                    success: function (result) {
                        //关闭正在处理中的动画
                        layer.close(loadingIndex3);
                        if (result.success) {
                            layer.msg('删除成功', {
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
                            //数据表格重载
                            table.reload('table_dept', {
                                url: '${pageContext.request.contextPath}/deptPaging'
                                , where: {} //设定异步数据接口的额外参数
                            });
                            obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                        } else {
                            layer.msg('删除失败', {
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
                layer.close(index);
                // console.log(index); // 查看当前数据的索引
                //向服务端发送删除指令
            });
        }

        //编辑一个部门
        function editDept() {
            //回显
            form.val("dept_form", {
                "deptName": deptData.departmentName
                , "deptAdmin": deptData.departmentAdmin
                , "telephone": deptData.telephone
                , "remark": deptData.remark
            });
            //不只读
            $("#departmentName").prop('disabled', "");
            $("#departmentAdmin").prop('disabled', "");
            $("#telephone").prop('disabled', "");
            $("#remark").prop('disabled', "");
            //弹窗
            layer.open({
                type: 1,//弹出内容类型
                title: "修改部门信息",//标题
                btn: ['修改', "取消"],
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
                    var loadingIndex4 = null;
                    $.ajax({
                        type: 'POST',
                        url: '${pageContext.request.contextPath}/editDept',
                        data: {
                            "id": deptData.id,
                            "departmentName": $("#departmentName").val(),
                            "departmentAdmin": $("#departmentAdmin").val(),
                            "telephone": $("#telephone").val(),
                            "remark": $("#remark").val()
                        },
                        //发送数据之前要执行的逻辑
                        beforeSend: function () {
                            //显示正在处理中的动画
                            loadingIndex4 = layer.load(2, {
                                shade: [0.1, '#fff']
                            });
                        },
                        //得到响应数据后的回调
                        success: function (result) {
                            //关闭正在处理中的动画
                            layer.close(loadingIndex4);
                            if (result.success) {
                                //数据表格重载
                                table.reload('table_dept', {
                                    url: '${pageContext.request.contextPath}/deptPaging'
                                    , where: {
                                        //设定异步数据接口的额外参数
                                    }
                                });
                                layer.msg('修改成功', {
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
                            } else {
                                layer.msg('修改失败', {
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
                    //关闭弹窗
                    layer.closeAll();
                },
                btn1: function () {
                    //关闭弹窗
                    layer.closeAll();
                }
            });
        }
    });
</script>

</html>
