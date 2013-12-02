<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div class="span2 main-menu-span">
    <div class="well nav-collapse sidebar-nav">
        <ul class="nav nav-tabs nav-stacked main-menu">
            <li class="nav-header hidden-tablet">基础管理</li>
            <shiro:hasPermission name="user:view">
            <li><a class="ajax-link" href="${ctx}/admin/user"><i class="icon-home"></i><span class="hidden-tablet"> 用户管理</span></a></li>
            </shiro:hasPermission>
            <shiro:hasPermission name="role:view">
            <li><a class="ajax-link" href="${ctx}/admin/role"><i class="icon-eye-open"></i><span class="hidden-tablet"> 角色管理</span></a></li>
            </shiro:hasPermission>
            <shiro:hasPermission name="android:view">
            <li><a class="ajax-link" href="${ctx}/admin/version"><i class="icon-edit"></i><span class="hidden-tablet"> 版本管理</span></a></li>
            </shiro:hasPermission>
            <shiro:hasPermission name="log:view">
            <li><a class="ajax-link" href="${ctx}/admin/logs"><i class="icon-edit"></i><span class="hidden-tablet"> 日志管理</span></a></li>
            </shiro:hasPermission>
            <li class="nav-header hidden-tablet">模块管理</li>
            <shiro:hasPermission name="picture:view">
            <li><a class="ajax-link" href="${ctx}/admin/module/picture"><i class="icon-align-justify"></i><span class="hidden-tablet"> 图片模块管理</span></a></li>
            </shiro:hasPermission>
            <shiro:hasPermission name="function:view">
            <li><a class="ajax-link" href="${ctx}/admin/module/func"><i class="icon-calendar"></i><span class="hidden-tablet"> 功能模块管理</span></a></li>
            </shiro:hasPermission>
        </ul>
    </div><!--/.well -->
 </div><!--/span-->