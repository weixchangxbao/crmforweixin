<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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
                  <div class="box-icon">
                  <shiro:hasPermission name="user:create">
				<a class="btn btn-info" href="${ctx}/admin/user/add">
					<i class="icon-edit icon-white"></i>  
						新增                                            
					</a>
					</shiro:hasPermission>
             </div>
             </div>
             <div class="box-content">
                 <table class="table table-striped table-bordered bootstrap-datatable usertable">
                   <thead>
                       <tr>
                           <th>用户名</th>
                           <th>角色</th>
                           <th>部门</th>
                           <th>创建时间</th>
                           <th>功能</th>
                       </tr>
                   </thead>   
               </table>            
             </div>
         </div><!--/span-->
     
     </div><!--/row-->
      
     <div  id="deleteModal" title="提示">
      <div class="modal-body">
      <input name="id" style="display:none">
        <p>是否确定删除信息！</p>
      </div>
</div><!-- /.modal -->
     <script type="text/javascript">
     	function doBodyInit(){
     		$('.usertable').dataTable( {
     			"bProcessing": true,
     			"bServerSide": true,
     			"sAjaxSource": "${ctx}/admin/user",
     			"sServerMethod":"POST",
     			"aoColumns": [
     							{"sName":"username","mData": "username","sWidth":"10%" },
     							{"sName":"rolename","mData": "rolename","sClass":"center" },
     							{"sName":"department","mData": "department" ,"sClass":"center"},
     							{"sName":"createTime","mData": "createTime","sClass":"center" },
     							{"mData" : function(obj,type,val){
     								var str= "";
     								if(obj.id != 1){
     									str = '<a class=\"btn btn-success\" href=\"${ctx}/admin/user/view/'+obj.id+'\">'+
     										'<i class=\"icon-zoom-in icon-white\"></i>'+  
     											'View'+                                            
     										'</a>'+
     										<shiro:hasPermission name="user:update">
     										'<a class=\"btn btn-info\" href=\"${ctx}/admin/user/edit/'+obj.id+'\">'+
     										'<i class="icon-edit icon-white"></i>'+  
     											'Edit'+                                            
     										'</a>'+
     										</shiro:hasPermission>
     										<shiro:hasPermission name="user:delete">
     										'<a class=\"btn btn-danger delete\" onclick=\"doDelete('+obj.id+')\">'+
     										'<i class=\"icon-trash icon-white\"></i>'+ 
     											'Delete'+
     										'</a>'+
     										</shiro:hasPermission>
     										'';
     								}else{
     									str= '<a class=\"btn btn-success\" href=\"${ctx}/admin/user/view/'+obj.id+'\">'+
 										'<i class=\"icon-zoom-in icon-white\"></i>'+  
											'View'+                                            
										'</a>';
     								}
     								return str;
     							},"sWidth":"30%" }
     						],
     			"sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span12'i><'span12 center'p>>",
     			"sPaginationType": "bootstrap",
     			"oLanguage": {
     			"sLengthMenu": "_MENU_ records per page"
     			}
     		}
     		);
     		
     		$("#deleteModal").dialog({
     			  autoOpen:false,
 				  height: 200,
 			      width: 350,
 			      modal: true,
 			      buttons:{
 			    	  "提交":function(){
 			    		 location.href="${ctx}/admin/user/delete/"+$('#deleteModal input[name="id"]').val();
 			    	  },
 			    	  "关闭":function(){
 			    		  $(this).dialog("close");
 			    	  }
 			      }
 			});
     	}
     	

 		function doDelete(id){ 
 			$('#deleteModal input[name="id"]').val(id);
 			$('#deleteModal').dialog('open');
 		}
     </script>
</body>

</html>
