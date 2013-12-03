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
								  <input class="input-xlarge" id="realname" name="realname" type="text" value=''>
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label" for="password">密码</label>
								<div class="controls">
								  <input class="input-xlarge" id="plainPassword" name="plainPassword" type="password" value=''>
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label" for="checkpassword">密码确认</label>
								<div class="controls">
								  <input class="input-xlarge"  id="checkpassword" name="checkpassword" type="password" >
								</div>
							  </div>
							   <div class="control-group">
								<label class="control-label" >角色</label>
								<div class="controls">
								  <input class="input-xlarge uneditable-input" id="roleids" name="roleids" style="display:none;"></input>
								  <input class="input-xlarge uneditable-input" id="rolename" name="rolename" disabled="disabled"></input>
								   <a class="btn btn-success" id="roleSelect">
                                        <i class="icon-zoom-in icon-white"></i>  
                                       选择                                            
                                </a>
								</div>
							  </div>
							  <div class="control-group">
							  <label class="control-label" for="department">部门</label>
							  <div class="controls">
								<input type="text" class="input-xlarge" id="department" name="department" >
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
								<a class="btn" onclick="history.back()">Cancel</a>
							  </div>
							</fieldset>
						  </form>
					
					</div>
				</div><!--/span-->
			
			</div>
			
		<div id="roleModal" title="角色选择">
		      <div class="modal-body">
		        		<div class="control-group">
		        	<label class="control-label">角色</label>
		        	<c:forEach var="role" items="${rolesSel}" varStatus="status">
		        		<c:if test="${status.first||status.index%4==0}">
		        			<div class="controls">
		        		</c:if>
		        		<label class="checkbox inline">
						<input type="checkbox" id="inlineCheckbox1" value="${role.id}" data="${role.name}">${role.name}
					  	</label>
		        		<c:if test="${status.end||status.count%4==0}">
		        			</div>
		        		</c:if>
		    		 </c:forEach>
				  </div>
		</div><!-- /.modal -->
		
		<script type="text/javascript">
			function doBodyInit(){
				$("#roleModal").dialog({
					  autoOpen: false,
	 				  height: 250,
	 			      width: 450,
	 			      modal: true,
	 			      buttons:{
	 			    	  "提交":function(){
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
	 						$('#rolename').val(rolelist);
	 						$('#roleids').val(roleIds);
	 						$('#roleModal').dialog('close');	
	 					},
	 			    	  "关闭":function(){
	 			    		  $(this).dialog("close");
	 			    	  }
	 			      }
	 			});
				
				$('#roleSelect').click(function(){
					$('#roleModal').dialog('open');
				});
				
				$('form').validate({
					rules:{
						username:{
							required: true,
							remote:{
								type:"POST",
								url:'${ctx}/admin/user/checkUsername'
							}
						},
						plainPassword:{
							required: true,
						    minlength: 5
						},
						checkpassword:{
							required: true,
						    minlength: 5,
						    equalTo: "#plainPassword"
						}
					}
				});
			};
			
		</script>
</body>
</html>
