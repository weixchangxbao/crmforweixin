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
                  <div class="box-icon">
                  <a class="btn btn-info" href="${ctx}/admin/user/add">
					<i class="icon-edit icon-white"></i>  
						位置编辑                                           
					</a>
				<a class="btn btn-info" href="${ctx}/admin/module/funcform">
					<i class="icon-edit icon-white"></i>  
						新增                                            
					</a>
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
     			"sAjaxSource": "${ctx}/admin/module/listFuncModule",
     			"sServerMethod":"POST",
     			"aoColumns": [
     							{"sName":"name","mData": "name","sWidth":"10%" },
     							{"sName":"type","mData": "type","sClass":"center" },
     							{"sName":"orderIndex","mData": "orderIndex" ,"sClass":"center"},
     							{"sName":"picture","mData": function(obj){
     								return '<img src=\"${ctx}/upload/'+obj.picture+'\">';
     							}},
     							//{"sName":"picture","mData": "picture","sClass":"center" },
     							{"sName":"url","mData": "url","sClass":"center" },
     							{"mData" : function(obj,type,val){
     								return '<a class=\"btn btn-success\" href=\"${ctx}/admin/user/view/'+obj.id+'\">'+
     										'<i class=\"icon-zoom-in icon-white\"></i>'+  
     											'View'+                                            
     										'</a>'+
     										'<a class=\"btn btn-info\" href=\"${ctx}/admin/user/edit/'+obj.id+'\">'+
     										'<i class="icon-edit icon-white"></i>'+  
     											'Edit'+                                            
     										'</a>'+
     										'<a class=\"btn btn-danger delete\" onclick=\"doDelete('+obj.id+')\">'+
     										'<i class=\"icon-trash icon-white\"></i>'+ 
     											'Delete'+
     										'</a>';
     							},"sWidth":"30%" }
     						],
     			"sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span12'i><'span12 center'p>>",
     			"sPaginationType": "bootstrap",
     			"oLanguage": {
     			"sLengthMenu": "_MENU_ records per page"
     			}
     		}
     		);
     	}
     	

 		function doDelete(id){ 
 			$("#deleteModal a.commit").attr("href","${ctx}/admin/user/delete/"+id);
 			$("#deleteModal").modal('show');
 		}
     </script>
</body>

</html>
