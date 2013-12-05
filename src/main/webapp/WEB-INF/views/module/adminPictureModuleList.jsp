<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>图片模块管理</title>
</head>

<body>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	
      <div class="row-fluid sortable">        
         <div class="box span12">
             <div class="box-header well" data-original-title>
                 <h2><i class="icon-user"></i> 图片模块管理</h2>
                  <div class="box-icon">
                  <shiro:hasPermission name="picture:create">
				<a class="btn btn-info"  href="${ctx}/admin/module/pictform">
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
      </div>
      
      <div id="updateModal" title="更新提示">
      <div class="modal-body">
      	<form action="${ctx}/admin/module/updatePictureLocation">
      		<input name="original" style="display:none">
      		<input name="changeto" style="display:none">
      	</form>
        <p>是否确定更新位置信息！</p>
      </div>
      </div>
      
     <script type="text/javascript">
     	function doBodyInit(){
     		
     		$('.usertable').dataTable( {
     			"bProcessing": true,
     			"bServerSide": true,
     			"sAjaxSource": "${ctx}/admin/module/listPictureModule",
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
     								return  '<input name=\"id\" value=\"'+obj.id+'\" style=\"display:none\">'+
     										<shiro:hasPermission name="picture:location">
     										'<a class=\"btn btn-primary up\" onclick=\"up('+obj.id+')\"><i class=\"icon-arrow-up icon-white\"></i></a>'+
											'<a class=\"btn btn-primary down\" onclick=\"down('+obj.id+')\"><i class=\"icon-arrow-down icon-white\"></i></a>'+
											</shiro:hasPermission>
											<shiro:hasPermission name="picture:update">
     										'<a class=\"btn btn-info\" href=\"${ctx}/admin/module/editPicture/'+obj.id+'\">'+
     										'<i class="icon-edit icon-white"></i>'+  
     											'Edit'+                                            
     										'</a>'+
     										</shiro:hasPermission>
     										<shiro:hasPermission name="picture:delete">
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
 			    		 location.href="${ctx}/admin/module/delete/"+$('#deleteModal input[name="id"]').val();
 			    	  },
 			    	  "关闭":function(){
 			    		  $(this).dialog("close");
 			    	  }
 			      }
 			});
     		
     		$("#updateModal").dialog({
     			autoOpen: false,
 				height: 200,
 			      width: 350,
 			      modal: true,
 			      buttons:{
 			    	  "提交":function(){ 			    	
 			    		 $('#updateModal form').submit();
 			    	  },
 			    	  "关闭":function(){
 			    		  $(this).dialog("close");
 			    	  }
 			      }
 			});
     		
     	}
     	
     	function down(id){
     		var oindex = -1;
     		var arr = new Array();
     		$('input[name="id"]').each(function(index){
        		arr[index] = $(this).val();
        		if($(this).val() == id.toString()){
        			oindex = index;
        		}
     		});
     		if(arr.length-1 == oindex){
     			return;
     		}else{
     			$('#updateModal input[name="original"]').val(arr[oindex]);
         		$('#updateModal input[name="changeto"]').val(arr[oindex+1]);
     		}
     		$('#updateModal').dialog('open');
     	}
     	
     	function up(id){
     		var oindex = -1;
     		var arr = new Array();
     		$('input[name="id"]').each(function(index){
        		arr[index] = $(this).val();
        		if($(this).val() == id.toString()){
        			oindex = index;
        		}
     		});
     		if(oindex == 0){
     			return;
     		}else{
     			$('#updateModal input[name="original"]').val(arr[oindex]);
         		$('#updateModal input[name="changeto"]').val(arr[oindex-1]);
     		}
     		$('#updateModal').dialog('open');
     	}
     	
     	function doDelete(id){ 
     		$('#deleteModal input[name="id"]').val(id);
     		$("#deleteModal").dialog('open');
 		}

     </script>
</body>

</html>
