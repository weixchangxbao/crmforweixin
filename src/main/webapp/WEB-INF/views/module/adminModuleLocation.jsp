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
						<h2><i class="icon-picture"></i> 位置设置</h2>
					</div>
					<div class="box-content">
						<ul class="thumbnails gallery">
							<c:forEach var="topmodule" items="${top}">
								<li  class="thumbnail">
									<img class="grayscale moduleimg" src="${ctx}/upload/${topmodule.picture}">
									<input type="checkbox">${topmodule.name} 
								</li>
							</c:forEach>
						</ul>
					</div>
					<p class="center">
							<button class="btn btn-primary left"><i class="icon-arrow-left icon-white"></i> 左移</button>
							<button class="btn btn-primary right"><i class="icon-arrow-right icon-white"></i> 右移</button>
							<button class="btn btn-primary "> 保存设置</button>
					</p>
					<table class="table table-bordered table-striped table-condensed">
							  <thead>
								  <tr>
									  <th>模块名称</th>
									  <th style="width:200px">图片</th>
									  <th>动作</th>                                          
								  </tr>
							  </thead>   
							  <tbody>
							  	<c:forEach items="${buttom}" var="buttomModule">
							  		<tr>
									<td>${buttomModule.name}</td>
									<td class="center"><span><img src="${ctx}/upload/${buttomModule.picture}" style="width:100px;height:50px"></span></td>
									<td class="center">
										<button class="btn btn-primary up"><i class="icon-arrow-up icon-white"></i></button>
										<button class="btn btn-primary down"><i class="icon-arrow-down icon-white"></i></button>
									</td>                                       
								</tr>
							  	</c:forEach>
							  </tbody>
						 </table>
				</div><!--/span-->
			</div><!--/row-->
    
					<!-- content ends -->
			</div><!--/#content.span10-->
				</div><!--/fluid-row-->
			
		<script type="text/javascript">
			function doBodyInit(){
				//config picture upload
				$('ul.thumbnails :checkbox').click(function(){
					$(':checkbox').each(function(){
						if($(this).attr('checked')){
							$(this).prev().addClass('grayscale');
							$(this).attr('checked',false);
						}
						
					})
					$(this).prev().removeClass('grayscale');
					$(this).attr('checked',true);
				})
				
				$('.up').click(function(){
					var tr = $(this).parents('tr');
					if(tr.prev()){
						tr.prev().before(tr);
					}
				})
				
				$('.down').click(function(){
					var tr = $(this).parents('tr');
					if(tr.next()){
						tr.next().after(tr);
					}
				})
				
				$('.left').click(function(){
					var li = $('input:checked').parents('li');
					if(li.prev()){
						li.prev().before(li);
					}
				})
				
				
				
				$('.right').click(function(){
					var li = $('input:checked').parents('li');
					if(li.next()){
						li.next().after(li);
					}
				})
				
			}
		</script>      
</body>
</html>
