<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>日志管理</title>
</head>

<body>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	
      <div class="row-fluid sortable">        
         <div class="box span12">
             <div class="box-header well" data-original-title>
                 <h2><i class="icon-user"></i> 日志管理</h2>
             </div>
             <div class="box-content">
                 <table class="table table-striped table-bordered bootstrap-datatable usertable">
                   <thead>
                       <tr>
                           <th>行为</th>
                           <th>操作人</th>
                           <th>IP</th>
                           <th>操作时间</th>
                           <th>明细</th>
                       </tr>
                   </thead>   
               </table>            
             </div>
         </div><!--/span-->
     
     </div><!--/row-->
      
   
     <script type="text/javascript">
     	function doBodyInit(){
     		
     		$('.usertable').dataTable( {
     			"bProcessing": true,
     			"bServerSide": true,
     			"sAjaxSource": "${ctx}/admin/logs",
     			"sServerMethod":"POST",
     			"aoColumns": [
     							{"sName":"actionName","mData": "actionName","sWidth":"10%" },
     							{"sName":"username","mData": "username","sClass":"center" },
     							{"sName":"ip","mData": "ip" ,"sClass":"center"},
     							{"sName":"actionTime","mData": "actionTime"}, 
     							{"mData":"detail"}
     						],
     			"sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span12'i><'span12 center'p>>",
     			"sPaginationType": "bootstrap",
     			"oLanguage": {
     			"sLengthMenu": "_MENU_ records per page"
     			}
     		}
     		);
     	}

     </script>
</body>

</html>
