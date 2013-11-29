<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
				<a class="btn btn-info" data-toggle="modal" data-target="#roleEdit">
					<i class="icon-edit icon-white"></i>  
						新增                                            
					</a>
             </div>
             </div>
             
             <div class="box-content" style="padding: 10px">
                 <table class="table table-striped table-bordered bootstrap-datatable usertable">
                   <thead>
                       <tr>
                           <th>角色名</th>
                           <th>创建时间</th>
                           <th>创建人</th>
                           <th>功能</th>
                       </tr>
                   </thead>   
               </table>            
             </div>
         </div><!--/span-->
           </div><!--/row-->
           
     <div class="modal fade" id="roleEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" id="myModalLabel">新增角色</h4>
		      </div>
		        <form action="${ctx}/admin/role/create" method="post" class="form-horizontal">
		      <div class="modal-body">
		        	<div class="control-group">
					<label class="control-label">角色名</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="name" name="name" type="text" >
					</div>		</div>
					
		      </div>
	  <div class="modal-footer">
		 	 <button  id="createBtn" type="submit" class="btn btn-primary">保存</button>
        	<button  type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
      </form>
     </div>
     </div>
     </div>
   
     
     <div class="modal fade" id="roleUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" id="myModalLabel">编辑角色</h4>
		      </div>
		        <form action="${ctx}/admin/role/update" method="post" class="form-horizontal">
		      <div class="modal-body">
		        	<div class="control-group">
					<label class="control-label">角色名</label>
								<div class="controls">
								  <input class="input-xlarge focused" name="id" style="display:none" >
								  <input class="input-xlarge focused" name="name" type="text" >
					</div>		</div>
					
		      </div>
	  <div class="modal-footer">
		 	 <button  id="createBtn" type="submit" class="btn btn-primary">保存</button>
        	<button  type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
      </form>
     </div>
     </div>
     </div>
     
     
 <div class="modal fade" id="deleteModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">提示</h4>
      </div>
      <div class="modal-body">
        <p>是否确定删除信息！</p>
      </div>
      <div class="modal-footer">
        <a class="btn commit">提交</a>
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

     <script type="text/javascript">
     	function doBodyInit(){
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
     								return '<a class=\"btn btn-info\" onclick=\"updateRole('+obj.id+')\">'+
     										'<i class="icon-edit icon-white"></i>'+  
     											'编辑'+                                            
     										'</a>'+
     										'<a class=\"btn btn-danger\" onclick=\"deleteRole('+obj.id+')\">'+
     										'<i class=\"icon-trash icon-white\"></i>'+ 
     											'删除'+
     										'</a>'+
     										'<a class=\"btn btn-warning\" href=\"${ctx}/admin/role/permission/'+obj.id+'\">'+
     										'<i class=\"icon-trash icon-white\"></i>'+ 
     											'功能权限'+
     										'</a>'+
     										'<a class=\"btn btn-success\" href=\"${ctx}/admin/role/modulePermission/'+obj.id+'\">'+
     										'<i class=\"icon-zoom-in icon-white\"></i>'+  
     											'模块权限'+                                            
     										'</a>';
     							} ,"sWidth":'40%'}
     						],
     			"sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span12'i><'span12 center'p>>",
     			"sPaginationType": "bootstrap",
     			"oLanguage": {
     			"sLengthMenu": "_MENU_ records per page"
     			}
     		}
     		);
     	}
     	
 		function updateRole(id){
 			$('#roleUpdate input[name="id"]').val(id);
 			$('#roleUpdate').modal('show');
 		}
 		
 		function deleteRole(id){
			$("#deleteModal a.commit").attr("href","${ctx}/admin/role/delete/"+id);
			$("#deleteModal").modal('show');
 		}
     </script>
</body>

</html>
