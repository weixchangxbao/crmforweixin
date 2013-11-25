<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>功能模块</title>
</head>

<body>
	<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-edit"></i> 功能模块信息</h2>
					</div>
					<div class="box-content">
						<form  action="${ctx}/admin/module/createFunc" method="post" class="form-horizontal">
							<fieldset>
							  <div class="control-group">
								<label class="control-label" for="focusedInput">模块名称</label>
								<div class="controls">
								  <input class="input-xlarge focused" name="name"  type="text" >
								</div>
							  </div>
							   <div class="control-group">
								<label class="control-label" for="selectError3">模块位置</label>
								<div class="controls">
								  <select id="type" name="moduleType">
									<option value="1">Top</option>
									<option value="2">Buttom</option>
								  </select>
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label" for="focusedInput">链接地址</label>
								<div class="controls">
								  <input class="input-xlarge focused" name="url" type="text" >
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label" for="fileInput">模块位置</label>
							  <div class="controls">
								<input class="input-xlarge focuse" name="orderIndex" type="text">
								<span>（请填入数字，从1开始）</span>
							  </div>
							  </div>	
							  <div class="control-group">
								<label class="control-label" for="fileInput">模块图片</label>
							  <div class="controls">
							    <input name="picture" id="picture" type="text" style="display:none">
								<input data-no-uniform="true" disabled="disabled" type="file" name="file_upload" id="file_upload" />
							  </div>
							  </div>	
							  <div class="control-group">
								<label class="control-label" for="fileInput">图片预览</label>
							  <div class="controls">
							  <div>
							  	<img id="picPreview" src="">
							  </div>
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
			
			</div><!--/row-->
			
		<script type="text/javascript">
			function doBodyInit(){
				//config picture upload
				$('#file_upload').uploadify({
					'swf'      : '${ctx}/static/misc/uploadify.swf',
					'uploader' : '${ctx}/admin/module/pictupload',
					"fileObjName":"picture",
					"onUploadSuccess":function(file,data,response){
						$('#picPreview').attr("src","${ctx}/upload/"+file.name);
						$('#picture').val(file.name);
					}
				});
			}
		</script>      
</body>
</html>
