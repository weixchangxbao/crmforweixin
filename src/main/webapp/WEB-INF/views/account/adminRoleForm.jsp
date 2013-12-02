<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>角色管理</title>
</head>

<body>
	<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-edit"></i> 角色管理</h2>
					</div>
					<div class="box-content">
						<form class="form-horizontal">
							<fieldset>
							  <div class="control-group">
								<label class="control-label" for="focusedInput">用户名</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="focusedInput" type="text" value="">
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label" for="focusedInput">真实姓名</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="focusedInput" type="password" value="">
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label" for="focusedInput">密码</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="focusedInput" type="password" value="">
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label" for="focusedInput">密码确认</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="focusedInput" type="password" value="">
								</div>
							  </div>
							   <div class="control-group">
								<label class="control-label" for="focusedInput">角色</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="focusedInput" type="role" value="">
								   <a class="btn btn-success" data-toggle="modal" data-target="#myModal">
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
							  <div class="control-group">
								<label class="control-label" for="focusedInput">手机</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="mobilephone" type="text" value="">
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label" for="focusedInput">电话号码</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="telephone" type="text" value="">
								</div>
							  </div>
						
							  
							  <div class="form-actions">
								<button type="submit" class="btn btn-primary">Save changes</button>
								<button class="btn" onclick="history.back()">Cancel</button>
							  </div>
							</fieldset>
						  </form>
					
					</div>
				</div><!--/span-->
			
			</div><!--/row-->
	
</body>
</html>
