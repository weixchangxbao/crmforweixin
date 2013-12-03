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
						<form class="form-horizontal" action="${ctx}/admin/user/update" method="post">
							<fieldset>
							  <input class="input-xlarge"   name="id" type="text" value="${user.id}" style="display:none">
							  <div class="control-group">
								<label class="control-label" for="username">用户名</label>
								<div class="controls">
								  <input class="input-xlarge" id="username"  name="username" type="text" value="${user.username}">
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label" for="realname">真实姓名</label>
								<div class="controls">
								  <input class="input-xlarge " id="realname" name="realname" type="text" value='${user.realname}'>
								</div>
							  </div>
							   <div class="control-group">
								<label class="control-label" >角色</label>
								<div class="controls">
								  <input class="input-xlarge uneditable-input" id="roleids" name="roleids" style="display:none;" value="unchange"></input>
								  <input class="input-xlarge uneditable-input" id="rolename" name="rolename" value="${user.rolename}" disabled="disabled">
								  <c:if test="${model==null}">
								   <a class="btn btn-success" id="roleSelect">
						                 <i class="icon-zoom-in icon-white"></i>  
						                   选择                                            
						                 </a>
						           </c:if>
								</div>
							  </div>
							  <div class="control-group">
							  <label class="control-label" for="date01">部门</label>
							  <div class="controls">
								<input type="text" class="input-xlarge" id="department" name="department" value="${user.department }">
							  </div>
							  </div>
							  <div class="control-group" for="mobilephone">
								<label class="control-label">手机</label>
								<div class="controls">
								  <input class="input-xlarge" id="mobilephone" name="mobilephone" type="text" value="${user.mobilephone}">
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label" for="telephone">电话号码</label>
								<div class="controls">
								  <input class="input-xlarge" id="telephone" name="telephone" type="text" value="${user.telephone}">
								</div>
							  </div>
							  <div class="form-actions">
							  <c:if test="${model==null}">
							  	<button type="submit" class="btn btn-primary">Save changes</button>
							  </c:if>
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
				<c:if test="${model!=null}">
					$('input').each(function(){
						$(this).attr('disabled','disabled' );
					})
				</c:if>
				
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
						var names = $('#rolename').val().split(',');
						for (var i in names){
							$('input[data="'+names[i]+'"]').attr('checked',true);
						}
						$('#roleModal').dialog('open');
					});
					
					$('form').validate({
						rules:{
							username:{
								required: true,
								remote:{
									type:"POST",
									url:'${ctx}/admin/user/checkUsername',
									data:{
										id:${user.id},
										username:function(){
											return $('#username').val();	
										}
									}
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
