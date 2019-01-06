<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 这是左侧导航菜单 , 单独提取出来, 哪个页面用, 就用标签包含进去 -->


<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域 -->
        <ul class="layui-nav layui-nav-tree"> <%--lay-filter="test"--%>

            <%--主页--%>
            <li class="layui-nav-item">
                <a href="${pageContext.request.contextPath}/home">
                    <!--图标-->
                    <i class="layui-icon layui-icon-home"></i>
                    <cite>&nbsp;&nbsp;主页</cite>
                </a>
            </li>

            <!-- 循环根节点下面的子节点, 根节点我们是不显示出来的 -->
            <c:forEach items="${sessionScope.rootPermission.children}" var="permission">
                <!-- 如果当前的结点下"没有"子节点 -->
                <c:if test="${empty permission.children}">
                    <li class="layui-nav-item">
                        <a href="${pageContext.request.contextPath}${permission.url}">
                            <!--图标-->
                            <i class="layui-icon ${permission.icon}"></i>
                            <cite>&nbsp;&nbsp;${permission.permissionName}</cite>
                        </a>
                    </li>
                </c:if>
                <!-- 如果当前的结点下"有"子节点 -->
                <c:if test="${not empty permission.children}">
                    <li class="layui-nav-item">
                        <a href="javascript:void(0);">
                            <!--图标-->
                            <i class="layui-icon layui-icon-component"></i>
                            <cite>&nbsp;&nbsp;${permission.permissionName}</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <c:forEach items="${permission.children}" var="child">
                                <dd>
                                    <a href="${pageContext.request.contextPath}${child.url}">${child.permissionName}</a>
                                </dd>
                            </c:forEach>
                        </dl>
                    </li>
                </c:if>
            </c:forEach>

        </ul>
    </div>
</div>

<script>
    var token = '${sessionScope.loginUser.id}';
    console.log(token);
    if (token != null) {
        $(".layui-nav-item a").on('click', function (e) {
            var href = $(this).attr('href');
            if (href != "javascript:void(0);") {
                $("iframe").attr('src', href);
                return false;
            }
        });
    }
</script>
