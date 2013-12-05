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
							<fieldset>
							<c:if test="${module != null }">
								<div class="hiddenArea">
								<input name="id" value="${module.id}" style="display:none">
								</div>
							</c:if>
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
							  <c:if test="${module==null }">
							  <div class="control-group">
								<label class="control-label" for="fileInput">模块位置</label>
							  <div class="controls">
								<input class="input-xlarge focuse" name="orderIndex" type="text" value="${module.orderIndex}">
								<span>（请填入数字，从1开始）</span>
							  </div>
							  </div>	
							  </c:if>
							  <c:if test="${module!=null }">
								<input class="input-xlarge focuse" name="orderIndex" type="text" value="${module.orderIndex}" style="display:none">
							  </c:if>
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
							  	<c:if test="${module!=null}">
							  	${ctx}/upload/${module.picture}
							  	</c:if>">
							  </div>
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
						url:"required",
						type:"required",
						orderIndex:{
							required:true,
							digits:true,
							remote:{
								type:"POST",
								url:"${ctx}/admin/module/checkFunLocation",
								data:{
									type:2,
									orderIndex:function(){return $('form input[name="orderIndex"]').val()},
								}
							}
						}
						
					}
				})
				
				//config picture upload
				$('#file_upload').uploadify({
					'fileSizeLimit' : '300KB',
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
