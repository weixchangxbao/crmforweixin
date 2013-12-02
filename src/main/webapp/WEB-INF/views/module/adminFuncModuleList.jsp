<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>功能模块管理</title>
</head>

<body>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	
      <div class="row-fluid sortable">        
         <div class="box span12">
             <div class="box-header well" data-original-title>
                 <h2><i class="icon-user"></i> 功能模块管理</h2>
                  <div class="box-icon">
                  <shiro:hasPermission name="function:location">
                  <a class="btn btn-info" href="${ctx}/admin/module/location">
					<i class="icon-edit icon-white"></i>  
						位置编辑                                           
					</a>
				  </shiro:hasPermission>
				  <shiro:hasPermission name="function:create">
				<a class="btn btn-info" href="${ctx}/admin/module/funcform">
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
                           <th>模块名称</th>
                           <th>区域</th>
                           <th>位置</th>
                           <th>图片</th>
                           <th>页面地址</th>
                           <th>功能</th>
                       </tr>
                   </thead>   
               </table>            
             </div>
         </div><!--/span-->
     
     </div><!--/row-->
      
 <div id="deleteModal" title="删除提示">
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
     			"sAjaxSource": "${ctx}/admin/module/listFuncModule",
     			"sServerMethod":"POST",
     			"aoColumns": [
     							{"sName":"name","mData": "name","sWidth":"10%" },
     							{"sName":"type","mData": "type","sClass":"center" },
     							{"sName":"orderIndex","mData": "orderIndex" ,"sClass":"center"},
     							{"sName":"picture","mData": function(obj){
     								return '<img src=\"${ctx}/upload/'+obj.picture+'\" style="height:100px">';
     							}},
     							//{"sName":"picture","mData": "picture","sClass":"center" },
     							{"sName":"url","mData": "url","sClass":"center" },
     							{"mData" : function(obj,type,val){
     								return  ''+ 
     										<shiro:hasPermission name="function:update">
     										'<a class=\"btn btn-info\" href=\"${ctx}/admin/module/editFunc/'+obj.id+'\">'+
     										'<i class="icon-edit icon-white"></i>'+  
     											'Edit'+                                            
     										'</a>'+
     										</shiro:hasPermission>
     										<shiro:hasPermission name="function:delete">
     										'<a class=\"btn btn-danger delete\" onclick=\"doDelete('+obj.id+')\">'+
     										'<i class=\"icon-trash icon-white\"></i>'+ 
     											'Delete'+
     										'</a>'+
     										</shiro:hasPermission>
     										'';
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
 				autoOpen: false,
 				height: 200,
 			      width: 350,
 			      modal: true,
 			      buttons:{
 			    	  "提交":function(){
 			    		 location.href="${ctx}/admin/module/deleteFunc/"+$('#deleteModal input[name="id"]').val();
 			    	  },
 			    	  "关闭":function(){
 			    		  $(this).dialog("close");
 			    	  }
 			      }
 			});
     	}
     	

 		function doDelete(id){ 
 			$('#deleteModal input[name="id"]').val(id);
 			$("#deleteModal").dialog('open');
 		}
     </script>
</body>

</html>
