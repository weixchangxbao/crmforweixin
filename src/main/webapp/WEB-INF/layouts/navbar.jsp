<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
 <div class="navbar-inner">
     <div class="container-fluid">
         <a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
             <span class="icon-bar"></span>
             <span class="icon-bar"></span>
             <span class="icon-bar"></span>
         </a>
         <a class="brand" href="${ctx}/login/welcome"> <img alt="Charisma Logo" src="${ctx}/static/img/logo20.png" /> <span>大银管理平台</span></a>
         
         <!-- theme selector starts -->
         <div class="btn-group pull-right theme-container" >
             <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                 <i class="icon-tint"></i><span class="hidden-phone"> 修改主题</span>
                 <span class="caret"></span>
             </a>
             <ul class="dropdown-menu" id="themes">
                 <li><a data-value="classic" href="#"><i class="icon-blank"></i> Classic</a></li>
                 <li><a data-value="cerulean" href="#"><i class="icon-blank"></i> Cerulean</a></li>
                 <li><a data-value="simplex" href="#"><i class="icon-blank"></i> Simplex</a></li>
                 <li><a data-value="slate" href="#"><i class="icon-blank"></i> Slate</a></li>
                 <li><a data-value="spacelab" href="#"><i class="icon-blank"></i> Spacelab</a></li>
                 <li><a data-value="united" href="#"><i class="icon-blank"></i> United</a></li>
             </ul>
         </div>
         <!-- theme selector ends -->
         
         <!-- user dropdown starts -->
         <div class="btn-group pull-right" >
             <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                 <i class="icon-user"></i><span class="hidden-phone"> <shiro:principal property="name"/></span>
                 <span class="caret"></span>
             </a>
             <ul class="dropdown-menu">
                 <li><a href="${ctx}/admin/profile">Profile</a></li>
                 <li class="divider"></li>
                 <li><a href="${ctx}/logout">Logout</a></li>
             </ul>
         </div>
         <!-- user dropdown ends -->
         
     </div>
 </div>
    <!-- topbar ends -->