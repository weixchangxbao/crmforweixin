<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>Android版本管理</title>
</head>

<body>
	<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-edit"></i> Android版本管理</h2>
					</div>
					<div class="box-content">
						<form  action="${ctx}/admin/version/createAndroidVersion" method="post" enctype="multipart/form-data" class="form-horizontal">
							<fieldset>
							  <div class="control-group">
								<label class="control-label" for="focusedInput">软件名称</label>
								<div class="controls">
								  <input class="input-xlarge focused" name="name"  type="text">
								</div>
							  </div>
							   <div class="control-group">
								<label class="control-label" for="focusedInput">软件版本</label>
								<div class="controls">
								  <input class="input-xlarge focused" name="version"  type="text" >
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label" for="textarea2">描述</label>
							  <div class="controls">
								<textarea class="form-control" rows="3" name="description"></textarea>
							  </div>
							  </div>
							 <div class="control-group">
							  <label class="control-label" for="fileInput">上传</label>
							  <div class="controls">
								<input class="input-file uniform_on" id="fileInput" name="app" type="file">
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
			
		<script type="text/javascript">
			function doBodyInit(){
				$('form').validate({
					rules:{
						name:"required",
						version:{
							required:true
						}
					}
				})
			}
		</script>      
</body>
</html>
