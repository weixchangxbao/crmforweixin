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
							<li id="image-1" class="thumbnail">
								<img class="grayscale moduleimg" src="${ctx}/static/img/gallery/thumbs/1.jpg" alt="Sample Image 1">
								<input type="checkbox">模块一 
							</li>
														<li id="image-2" class="thumbnail">
								<img class="grayscale moduleimg" src="${ctx}/static/img/gallery/thumbs/2.jpg" alt="Sample Image 2">
								<input type="checkbox" style="margin: 0 auto">
							</li>
														<li id="image-3" class="thumbnail">
								<img class="grayscale moduleimg" src="${ctx}/static/img/gallery/thumbs/3.jpg" alt="Sample Image 3">
								<input type="checkbox" style="margin: 0 auto">
							</li>
						</ul>
					</div>
					<p class="center">
							<button class="btn btn-primary "><i class="icon-arrow-left icon-white"></i> 左移</button>
							<button class="btn btn-primary "><i class="icon-arrow-right icon-white"></i> 右移</button>
							<button class="btn btn-primary "> 保存设置</button>
					</p>
					<table class="table table-bordered table-striped table-condensed">
							  <thead>
								  <tr>
									  <th>模块名称</th>
									  <th>图片</th>
									  <th>动作</th>                                          
								  </tr>
							  </thead>   
							  <tbody>
								<tr>
									<td>Muhammad Usman</td>
									<td class="center">2012/01/01</td>
									<td class="center">
										<button class="btn btn-primary "><i class="icon-arrow-up icon-white"></i></button>
										<button class="btn btn-primary "><i class="icon-arrow-down icon-white"></i></button>
									</td>                                       
								</tr>
								<tr>
									<td>White Horse</td>
									<td class="center">2012/02/01</td>
									<td class="center">
										<button class="btn btn-primary "><i class="icon-arrow-up icon-white"></i></button>
										<button class="btn btn-primary "><i class="icon-arrow-down icon-white"></i></button>
									</td>                                       
								</tr>
								<tr>
									<td>Sheikh Heera</td>
									<td class="center">2012/02/01</td>
									<td class="center">
										<button class="btn btn-primary "><i class="icon-arrow-up icon-white"></i></button>
										<button class="btn btn-primary "><i class="icon-arrow-down icon-white"></i></button>
									</td>                                        
								</tr>
								<tr>
									<td>Saruar</td>
									<td class="center">2012/03/01</td>
									<td class="center">
										<button class="btn btn-primary "><i class="icon-arrow-up icon-white"></i></button>
										<button class="btn btn-primary "><i class="icon-arrow-down icon-white"></i></button>
									</td>                                       
								</tr>                          
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
			}
		</script>      
</body>
</html>
