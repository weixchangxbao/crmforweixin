<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div class="span2 main-menu-span">
    <div class="well nav-collapse sidebar-nav">
        <ul class="nav nav-tabs nav-stacked main-menu">
            <li class="nav-header hidden-tablet">基础管理</li>
            <li><a class="ajax-link" href="index.html"><i class="icon-home"></i><span class="hidden-tablet"> 用户管理</span></a></li>
            <li><a class="ajax-link" href="ui.html"><i class="icon-eye-open"></i><span class="hidden-tablet"> 角色管理</span></a></li>
            <li><a class="ajax-link" href="form.html"><i class="icon-edit"></i><span class="hidden-tablet"> 菜单管理</span></a></li>
            <li class="nav-header hidden-tablet">权限管理</li>
            <li><a class="ajax-link" href="table.html"><i class="icon-align-justify"></i><span class="hidden-tablet"> 角色权限管理</span></a></li>
            <li><a class="ajax-link" href="calendar.html"><i class="icon-calendar"></i><span class="hidden-tablet"> 菜单权限管理</span></a></li>
            <li><a class="ajax-link" href="grid.html"><i class="icon-th"></i><span class="hidden-tablet"> 模块权限管理</span></a></li>
            <li class="nav-header hidden-tablet">模块管理</li>
            <li><a class="ajax-link" href="table.html"><i class="icon-align-justify"></i><span class="hidden-tablet"> 图片模块管理</span></a></li>
            <li><a class="ajax-link" href="calendar.html"><i class="icon-calendar"></i><span class="hidden-tablet"> 功能模块管理</span></a></li>
        </ul>
        <label id="for-is-ajax" class="hidden-tablet" for="is-ajax"><input id="is-ajax" type="checkbox"> Ajax on menu</label>
    </div><!--/.well -->
 </div><!--/span-->