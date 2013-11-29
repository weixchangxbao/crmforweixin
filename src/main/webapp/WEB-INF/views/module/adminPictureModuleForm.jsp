<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>图片模块</title>
</head>

<body>
	<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-edit"></i> 图片模块信息</h2>
					</div>
					<div class="box-content">
						<form  action="${ctx}/admin/module/create" method="post" class="form-horizontal">
						<div class="hiddenArea">
							<input name="id" value="${module.id}" style="display:none">
							<input name="createBy" value="${module.createBy}" style="display:none">
							<input name="createTime" value="${module.createTime}" style="display:none">
						</div>
							<fieldset>
							  <div class="control-group">
								<label class="control-label" for="focusedInput">模块名称</label>
								<div class="controls">
								  <input class="input-xlarge focused" name="name"  type="text" value="${module.name}">
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label" for="focusedInput">链接地址</label>
								<div class="controls">
								  <input class="input-xlarge focused" name="url" type="text" value="${module.url}">
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label" for="fileInput">模块位置</label>
							  <div class="controls">
								<input class="input-xlarge focuse" name="orderIndex" type="text" value="${module.orderIndex}">
								<span>（请填入数字，从1开始）</span>
							  </div>
							  </div>	
							  <div class="control-group">
								<label class="control-label" for="fileInput">模块图片</label>
							  <div class="controls">
							    <input name="picture" id="picture" type="text" style="display:none" value="${module.picture}">
								<input data-no-uniform="true" disabled="disabled" type="file" name="file_upload" id="file_upload" />
							  </div>
							  </div>	
							  <div class="control-group">
								<label class="control-label" for="fileInput">图片预览</label>
							  <div class="controls">
							  <div>
							  	<img id="picPreview" src="
							  	<c:if test="${module}!=null">
							  	${ctx}/upload/${module.picture}
							  	</c:if>">
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
