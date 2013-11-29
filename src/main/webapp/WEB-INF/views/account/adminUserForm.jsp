<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>用户管理</title>
</head>

<body>
	<div class="row-fluid sortable ui-sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title="">
						<h2><i class="icon-edit"></i> Form Elements</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<form class="form-horizontal" action="${ctx}/admin/user/create" method="post">
							<fieldset>
							  
							  <div class="control-group">
								<label class="control-label" for="username">用户名</label>
								<div class="controls">
								  <input class="input-xlarge" id="username"  name="username" type="text" >
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label" for="realname">真实姓名</label>
								<div class="controls">
								  <input class="input-xlarge " id="realname" name="realname" type="text" value=''>
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label" for="password">密码</label>
								<div class="controls">
								  <input class="input-xlarge" id="password" name="plainPassword" type="password" value=''>
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label" for="checkpassword">密码确认</label>
								<div class="controls">
								  <input class="input-xlarge"  id="checkpassword" type="password" >
								</div>
							  </div>
							   <div class="control-group">
								<label class="control-label" >角色</label>
								<div class="controls">
								  <input class="input-xlarge uneditable-input" id="roleids" name="roleids" style="display:none;"></input>
								  <span class="input-xlarge uneditable-input" id="rolenames"></span>
								   <a class="btn btn-success" data-toggle="modal" data-target="#roleModal">
						                                        <i class="icon-zoom-in icon-white"></i>  
						                                       选择                                            
						                                </a>
								</div>
							  </div>
							  <div class="control-group">
							  <label class="control-label" for="date01">失效日期</label>
							  <div class="controls">
								<input type="text" class="input-xlarge datepicker" id="date01" >
							  </div>
							  </div>
							  <div class="control-group" for="mobilephone">
								<label class="control-label">手机</label>
								<div class="controls">
								  <input class="input-xlarge" id="mobilephone" name="mobilephone" type="text" >
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label" for="telephone">电话号码</label>
								<div class="controls">
								  <input class="input-xlarge" id="telephone" name="telephone" type="text" >
								</div>
							  </div>
							  <div class="form-actions">
								<button type="submit" class="btn btn-primary">Save changes</button>
								<button class="btn">Cancel</button>
							  </div>
							</fieldset>
						  </form>
					
					</div>
				</div><!--/span-->
			
			</div>
			
					<div class="modal fade" id="roleModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" id="myModalLabel">角色选择</h4>
		      </div>
		      <div class="modal-body">
		        		<div class="control-group">
		        	<label class="control-label">角色</label>
		        	<c:forEach var="role" items="${rolesSel}" varStatus="status">
		        		<c:if test="${status.first}||${status.index%4==0}">
		        			<div class="controls">
		        		</c:if>
		        		<label class="checkbox inline">
						<input type="checkbox" id="inlineCheckbox1" value="${role.id}" data="${role.name}">${role.name}
					  	</label>
		        		<c:if test="${status.end}||${status.count%4==0}">
		        			</div>
		        		</c:if>
		    		 </c:forEach>
				  </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" id="saveRolebtn">Save changes</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>	        
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
		<script type="text/javascript">
			function doBodyInit(){
				$('#saveRolebtn').click(function(){
					var rolelist='';
					var roleIds='';
					$('#roleModal input:checked').each(function(index){
						if(index==0){
							rolelist=$(this).attr('data');
							roleIds =$(this).val();
						}else{
							rolelist = rolelist+','+$(this).attr('data');
							roleIds = roleIds+','+$(this).val();
						}
					})
					$('#rolenames').text(rolelist);
					$('#roleids').val(roleIds);
					$('#roleModal').modal('hide');	
				})				
			}
		</script>
</body>
</html>
