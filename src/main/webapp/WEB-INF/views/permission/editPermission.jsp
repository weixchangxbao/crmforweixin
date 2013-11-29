<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>权限管理</title>
</head>

<body>

<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-edit"></i> 权限管理</h2>
					</div>
					<div class="box-content">
						<form class="form-horizontal" action="${ctx}/admin/role/updatePermission" method="post">
						  <fieldset>
						  <input name="roleId" value="${role.id}" style="display:none">
						  <c:forEach items="${permissionTree}" var="permap">
						  	<legend>${permap.key}</legend>
						  	<c:forEach items="${permap.value}" var="submap">
						  		<div class="control-group"> 
                              	<label class="control-label">${submap.key}</label>
                               	 <div class="controls">
						  			<c:forEach items="${submap.value}" var="permission">
						  				<label class="checkbox inline">
                                  			<input type="checkbox" id="inlineCheckbox1" value="${permission.id}" isChecked="${permission.chosed}"> 
                               					  ${permission.name}
                               		  </label>
						  			</c:forEach>
 						  			</div>
 						  		</div> 
						  	</c:forEach>
						  </c:forEach>
						  <input id="chosedPermission" name="chosedPermission" style="display:none">
							<div class="form-actions">
							  <button type="submit" class="btn btn-primary">Save changes</button>
							  <button type="reset" class="btn">Cancel</button>
							</div>
						  </fieldset>
						</form>   

					</div>
				</div><!--/span-->

			</div><!--/row-->
    	<script type="text/javascript">
			function doBodyInit(){
				
				$('input:checkbox').each(function(){
					var ids = $('#chosedPermission').val();
					if($(this).attr('isChecked')=='true'){
						$(this).attr('checked',true);
						if(ids){
							ids = ids + ',' + $(this).val();
						}else{
							ids = $(this).val();
						}			
						$('#chosedPermission').val(ids);
					}
				});
	
				$('input:checkbox').click(function(){
					var ids = $('#chosedPermission').val();
					if(ids){
						ids = ids + ',' + $(this).val();
					}else{
						ids = $(this).val();
					}
					$('#chosedPermission').val(ids);
				});
			}    	
    	</script>
	</body>
</html>
