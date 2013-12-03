<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>角色管理</title>
</head>

<body>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	
      <div class="row-fluid sortable">        
         <div class="box span12">
             <div class="box-header well" data-original-title>
                 <h2><i class="icon-user"></i> 角色信息</h2>
                 <div class="box-icon">
                <shiro:hasPermission name="role:create"> 
				<a class="btn btn-info" id="addbtn">
					<i class="icon-edit icon-white"></i>  
						新增                                            
					</a>
					</shiro:hasPermission>
             </div>
             </div>
             
             <div class="box-content" style="padding: 10px">
                 <table class="table table-striped table-bordered bootstrap-datatable usertable">
                   <thead>
                       <tr>
                           <th>角色名</th>
                           <th>创建人</th>
                           <th>创建时间</th>
                           <th>功能</th>
                       </tr>
                   </thead>   
               </table>            
             </div>
         </div><!--/span-->
           </div><!--/row-->
           
     <div id="roleEdit" title="新增角色">
		      <div class="modal-body">
		      <form action="${ctx}/admin/role/create" method="post" class="form-horizontal">
		        	<div class="control-group">
					<label class="control-label">角色名</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="name" name="name" type="text" >
					</div>		
				</div>	
		      </form>
     </div>
     </div>
   
     
     <div id="roleUpdate">
		    <div class="modal-content">
		        <form action="${ctx}/admin/role/update" method="post" class="form-horizontal">
		      <div class="modal-body">
		        	<div class="control-group">
					<label class="control-label">角色名</label>
								<div class="controls">
								  <input class="input-xlarge focused" name="id" style="display:none" >
								  <input class="input-xlarge focused" name="name" type="text" >
					</div>		</div>
					
		      </div>
      </form>
     </div>
     </div>
     
     
 <div id="deleteModal">
      <div class="modal-body">
        <input name="id" style="display:none">
        <p>是否确定删除信息！</p>
      </div>
</div><!-- /.modal -->

     <script type="text/javascript">
     	function doBodyInit(){
     		
     		$('#roleEdit form').validate({
     			rules:{
     				name:{
     					required:true,
     					remote:{
     						type:"POST",
     						url:'${ctx}/admin/role/checkName'
     					}
     				}
     			}
     		});
     		
     		$('#roleUpdate form').validate({
     			rules:{
     				name:{
     					required:true,
     					remote:{
     						type:"POST",
     						url:'${ctx}/admin/role/checkName',
     						data:{
     							id:function(){return $('#roleUpdate input[name="id"]').val()},
     							name:function(){return $('#roleUpdate input[name="name"]').val()},
     						}
     					}
     				}
     			}
     		});
     		
     		$('.usertable').dataTable( {
     			"bProcessing": true,
     			"bServerSide": true,
     			"sAjaxSource": "${ctx}/admin/role",
     			"sServerMethod":"POST",
     			"aoColumns": [
     							{"sName":"name","mData": "name" },
     							{"sName":"createBy","mData": "createBy","sClass":"center" },
     							{"sName":"createTime","mData": "createTime" ,"sClass":"center"},
     							{"mData" : function(obj,type,val){
     								return  ''+
     										<shiro:hasPermission name="role:update">
     										'<a class=\"btn btn-info\" refId=\"'+obj.id+'\" val=\"'+obj.name+'\" onclick=\"updateRole('+obj.id+')\">'+
     										'<i class="icon-edit icon-white"></i>'+  
     											'编辑'+                                            
     										'</a>'+
     										</shiro:hasPermission>
     										<shiro:hasPermission name="role:delete">
     										'<a class=\"btn btn-danger\" onclick=\"deleteRole('+obj.id+')\">'+
     										'<i class=\"icon-trash icon-white\"></i>'+ 
     											'删除'+
     										'</a>'+
     										</shiro:hasPermission>
     										<shiro:hasPermission name="permission:edit">
     										'<a class=\"btn btn-warning\" href=\"${ctx}/admin/role/permission/'+obj.id+'\">'+
     										'<i class=\"icon-trash icon-white\"></i>'+ 
     											'功能权限'+
     										'</a>'+
     										</shiro:hasPermission>
     										<shiro:hasPermission name="modulePermission:edit">
     										'<a class=\"btn btn-success\" href=\"${ctx}/admin/role/modulePermission/'+obj.id+'\">'+
     										'<i class=\"icon-zoom-in icon-white\"></i>'+  
     											'模块权限'+                                            
     										'</a>'+
     										</shiro:hasPermission>
     										'';
     							} ,"sWidth":'40%'}
     						],
     			"sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span12'i><'span12 center'p>>",
     			"sPaginationType": "bootstrap",
     			"oLanguage": {
     			"sLengthMenu": "_MENU_ records per page"
     			}
     		}
     		);
     		
     		
     		$('#deleteModal').dialog({
     			autoOpen: false,
				 height: 250,
			      width: 450,
			      modal: true,
			      buttons:{
			    	  "提交":function(){
			    		window.location.href="${ctx}/admin/role/delete/"+$('#deleteModal input[name="id"]').val();
			      },
			    	"关闭":function(){
			    		$(this).dialog("close");
			    	}  
			      }
			});
     		
     		$('#roleEdit').dialog({
     			autoOpen: false,
				 height: 200,
			      width: 600,
			      modal: true,
			      buttons:{
			    	  "保存":function(){
			    	  $('#roleEdit form').submit();
			      },
			    	"关闭":function(){
			    		$(this).dialog("close");
			    	}  
			      }
			});
     		
     		$('#roleUpdate').dialog({
     			autoOpen: false,
 				height: 200,
			      width: 600,
			      modal: true,
			      buttons:{
			    	  "保存":function(){
			    	  $('#roleUpdate form').submit();
			      },
			    	"关闭":function(){
			    		$(this).dialog("close");
			    	}  
			      }
			});
     		
     		$('#addbtn').click(function(){
     			$('#roleEdit').dialog('open');
     		});
     		
     	}
     	
 		function updateRole(id){
 			$('#roleUpdate input[name="id"]').val(id);
 			$('#roleUpdate input[name="name"]').val($('a[refId="'+id+'"]').attr('val'));
 			$('#roleUpdate').dialog('open');
 		}
 		
 		function deleteRole(id){
 			$('#deleteModal input[name="id"]').val(id);
 			$('#deleteModal').dialog('open');
 		}
     </script>
</body>

</html>
