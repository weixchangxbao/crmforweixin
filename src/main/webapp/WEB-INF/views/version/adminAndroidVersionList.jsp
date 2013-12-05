<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>版本管理</title>
</head>

<body>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	
      <div class="row-fluid sortable">        
         <div class="box span12">
             <div class="box-header well" data-original-title>
                 <h2><i class="icon-user"></i> 版本管理</h2>
                  <div class="box-icon">
                  <shiro:hasPermission name="andriod:create">
				<a class="btn btn-info" href="${ctx}/admin/version/androidForm">
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
                           <th>应用名称</th>
                           <th>版本</th>
                           <th>位置</th>
                           <th>描述</th>
                           <th>创建人</th>
                           <th>创建时间</th>
                           <th>功能</th>
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
     			"sAjaxSource": "${ctx}/admin/version",
     			"sServerMethod":"POST",
     			"aoColumns": [
     							{"sName":"name","mData": "name","sWidth":"10%" },
     							{"sName":"version","mData": "version","sClass":"center" },
     							{"sName":"path","mData": "path" ,"sClass":"center"},
     							{"sName":"description","mData": "description"}, 
     							{"mData":"createBy"},
     							{"mData":"createTime"},
     							{"mData":function(obj,type,val){
     								return '<a class=\"btn btn-info\" href=\"${ctx}/admin/version/delete/'+obj.id+'\">'+
											'<i class="icon-edit icon-white"></i>'+  
											'Delete'+                                            
											'</a>';
     							}}
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
