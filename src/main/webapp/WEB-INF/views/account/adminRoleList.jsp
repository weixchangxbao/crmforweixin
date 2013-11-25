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
     								return '<a class=\"btn btn-success\" href=\"#\">'+
     										'<i class=\"icon-zoom-in icon-white\"></i>'+  
     											'View'+                                            
     										'</a>'+
     										'<a class=\"btn btn-info\" href=\"#\">'+
     										'<i class="icon-edit icon-white"></i>'+  
     											'Edit'+                                            
     										'</a>'+
     										'<a class=\"btn btn-danger\" href=\"#\">'+
     										'<i class=\"icon-trash icon-white\"></i>'+ 
     											'Delete'+
     										'</a>';
     							} ,"sWidth":'30%'}
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
