<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>用户管理</title>
</head>

<body>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	
      <div class="row-fluid sortable">        
         <div class="box span12">
             <div class="box-header well" data-original-title>
                 <h2><i class="icon-user"></i> Members</h2>
                 <div class="box-icon">
                     <a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
                     <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                     <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
                 </div>
             </div>
             <div class="box-content">
                 <table class="table table-striped table-bordered bootstrap-datatable datatable">
                   <thead>
                       <tr>
                           <th>用户名</th>
                           <th>角色</th>
                           <th>创建时间</th>
                           <th>状态</th>
                           <th>功能</th>
                       </tr>
                   </thead>   
                   <tbody>
                     <tr>
                         <td>David R</td>
                         <td class="center">2012/01/01</td>
                         <td class="center">Member</td>
                         <td class="center">
                             <span class="label label-success">Active</span>
                         </td>
                         <td class="center">
                             <a class="btn btn-success" href="#">
                                 <i class="icon-zoom-in icon-white"></i>  
                                 View                                            
                             </a>
                             <a class="btn btn-info" href="#">
                                 <i class="icon-edit icon-white"></i>  
                                 Edit                                            
                             </a>
                             <a class="btn btn-danger" href="#">
                                 <i class="icon-trash icon-white"></i> 
                                 Delete
                             </a>
                         </td>
                     </tr>
                   </tbody>
               </table>            
             </div>
         </div><!--/span-->
     
     </div><!--/row-->
</body>

<script type="text/javascript">
$(document).ready(function() {
	$('#example').dataTable( {
	"bProcessing": true,
	"bServerSide": true,
	"sPaginationType": "full_numbers",

	"sAjaxSource": "./server_processing.php",
	"sServerMethod":"POST",
	"aoColumns": [
	{ "sName": "platform" },
	{ "sName": "version" },
	{ "sName": "engine" },
	{ "sName": "browser" },
	{ "sName": "grade" }
	]
	} );
	} );
</script>
</html>
