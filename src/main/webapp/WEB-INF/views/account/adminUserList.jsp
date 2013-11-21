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
                 <h2><i class="icon-user"></i> 用户信息</h2>
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
               </table>            
             </div>
         </div><!--/span-->
     
     </div><!--/row-->
</body>

<script type="text/javascript">
$(document).ready(function() {
	$('.datatable').dataTable( {
	"bProcessing": true,
	"bServerSide": true,
	"sPaginationType": "full_numbers",

	"sAjaxSource": "${ctx}/",
	"sServerMethod":"POST",
	} );
	} );
</script>
</html>
