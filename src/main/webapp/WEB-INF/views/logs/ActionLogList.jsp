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
                 <div class="box-icon">
	                <shiro:hasPermission name="log:delete"> 
					<a class="btn btn-info" id="deleteBtn">
						<i class="icon-edit icon-white"></i>  
							删除                                            
						</a>
					</shiro:hasPermission>
	             </div>
             </div>
             <div class="box-content">
                 <table class="table table-striped table-bordered bootstrap-datatable usertable">
                   <thead>
                       <tr>
                       	   <th><input name="allCheck" type="checkbox"></th>
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
      
   	<div style="display:none">
   		<form action="${ctx}/admin/logs/delete" method="post">
   			<input name="ids" id="ids">
   		</form>
   	</div>
   	
     <script type="text/javascript">
     	function doBodyInit(){
     		
     		$('input[name="allCheck"]').toggle(function(){
     			$(':checkbox').attr('checked',true);
     		},function(){
     			$(':checkbox').attr('checked',false);
     		})
     		
     		$('#deleteBtn').click(function(){
     			var ids;
     			$('input[name="deleteCheck"]:checked').each(function(index){
     				if(index ==0){
     					ids = $(this).attr('val');
     				}else{
						ids = ids + ',' + $(this).attr('val');   					
     				}
     			});
     			$('#ids').val(ids);
     			$('form').submit();
     		});
     		
     		$('.usertable').dataTable( {
     			"bProcessing": true,
     			"bServerSide": true,
     			"sAjaxSource": "${ctx}/admin/logs",
     			"sServerMethod":"POST",
     			"bSort": false ,
     			"aoColumns": [
     			              	{"mData":function(obj){
     			              		return '<input type=\"checkbox\" name=\"deleteCheck\" val=\"'+obj.id+'\">';
     			              	},"sWidth":'5'},
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
