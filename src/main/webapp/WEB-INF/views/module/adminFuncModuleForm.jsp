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
								<label class="control-label" for="selectError3">模块位置</label>
								<div class="controls">
								  <select id="type" name="moduleType">
									<option value="0" <c:if test="${module.type=='TOP'}">  selected="selected"</c:if>>Top</option>
									<option value="1" <c:if test="${module.type=='BUTTOM'}">  selected="selected"</c:if>>Buttom</option>
								  </select>
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label" for="focusedInput">链接地址</label>
								<div class="controls">
								  <input class="input-xlarge focused" name="url" type="text" value="${module.url}">
								</div>
							  </div>
							    <c:if test="${module==null}">
							  <div class="control-group">
								<label class="control-label" for="fileInput">模块位置</label>
							  <div class="controls">
								<input class="input-xlarge focuse" name="orderIndex" type="text">
								<span>（请填入数字，从1开始）</span>
							  </div>
							  </div>	
							  </c:if>
							  <c:if test="${module!=null}">
								<input class="input-xlarge focuse" name="orderIndex" type="text" value="${module.orderIndex }" style="display:none">
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
								<button id="submitBtn" class="btn btn-primary">Save changes</button>
								<button class="btn" onclick="history.back()">Cancel</button>
							  </div>
							</fieldset>
						  </form>
					</div>
				</div><!--/span-->
			
			</div><!--/row-->
			
			
			 <div id="addModal" title="新增提示">
		      <div class="modal-body">
		        <p>顶部模块最大为4个，当前值已经满足，无法提交。</p>
		      </div>
		     </div>
		      
		      
		<script type="text/javascript">
			function doBodyInit(){
				
				$('#submitBtn').click(function(check){
					if($('#type').val() == 0){
						check.preventDefault();
						$.ajax({
							url:'${ctx}/admin/module/checkTopNum',
							success:function(data){
								if(data == 'false'){
									$("#addModal").dialog('open');
								}else{
									$('form').submit();
								}
							}
						})
					}
				});
				
				$("#addModal").dialog({
	 				autoOpen: false,
	 				height: 200,
	 			      width: 350,
	 			      modal: true,
	 			      buttons:{
	 			    	  "关闭":function(){
	 			    		  $(this).dialog("close");
	 			    	  }
	 			      }
	 			});
				
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
								url:'${ctx}/admin/module/checkFunLocation',
								data:{
									type:function(){return $('#type option:selected').val()},
									orderIndex:function(){return $('form input[name="orderIndex"]').val()}
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
