<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<link href="${ctx}/static/jquery-mobile/jquery.mobile-1.3.2.min.css" type="text/css" rel="stylesheet"/>
	<link href="${ctx}/static/jquery-plugs/idangerous.swiper.css" type="text/css" rel="stylesheet"/>
	<link href="${ctx}/static/styles/default.css" type="text/css" rel="stylesheet"/>
	<link href="${ctx}/static/styles/navbar.css" type="text/css" rel="stylesheet"/>
	<style type="text/css">
		
		.line1{
			top:445px;
			position:absolute;
			width:100%;
			z-index: 1000;
			height: 4px;
		}
		.line2{
			top:570px;
			position:absolute;
			width:100%;
			z-index: 1000;
			height: 4px;
		}
		.line3{
			top:310px;
			left:133px;
			position:absolute;
			width:4px;
			z-index: 1000;
			height: 400px;
		}
		.line4{
			top:310px;
			left:258px;
			position:absolute;
			width:4px;
			z-index: 1000;
			height: 400px;
		}
		.custom-content{
			padding:10px;
			background: #e0e0e0;
		}
		.custom-content .ui-btn{
			padding:0px!important;
			margin:0px!important;
			box-shadow: none!important; 
			-moz-box-shadow: none!important;
			-moz-border-radius:none!important;
			border-radius:none!important;
			border:none!important;
			background: #e0e0e0!important;
		}
		.custom-content .ui-btn .ui-btn-inner{
			border:none!important;
		}
		.custom-content .ui-grid-c .ui-btn{
			margin:-7px!important;
			margin-left:-10px!important;
		}
		img.radius{
			-moz-border-radius:10px;
			border-radius:10px;
			box-shadow:2px 2px 1px #aaa; 
			margin-bottom:5px;
		}
		div.ui-grid-b img{
			-moz-border-radius:10px;
			border-radius:10px;
			box-shadow:2px 2px 1px #aaa;
		}
		.title{
			text-align:center;
			font-size: 14px;
		}
		.pagination {
		  position:absolute;
		  left: 0;
		  text-align: center;
		  width: 100%;
		  z-index: 20;
		  bottom: 10px;
		}
		.swiper-pagination-switch {
		  display: inline-block;
		  width: 5px;
		  height: 5px;
		  border-radius: 5px;
		  background: #aaa;
		  box-shadow: 0px 1px 2px #555 inset;
		  opacity: 0.8;
		  margin: 0 3px;
		  cursor: pointer;
		}
		.swiper-active-switch {
		  background: red;
		}
	</style>
</head>
<body>
<!-- 	<img class="line1" alt="" src="../static/images/app/line-h.png">
	<img class="line2" alt="" src="../static/images/app/line-h.png">
	<img class="line3" alt="" src="../static/images/app/line-v.png">
	<img class="line4" alt="" src="../static/images/app/line-v.png"> -->
	<div data-role="page">
		<div data-role="header" data-position="fixed">
			<img class="logo" src="../static/images/app/logo.png"/>
			<div class="header-bg">大银电商</div>
			<div  style="position:absolute;right: 20px;top:2px;">
				<a href="#" data-role="button" data-iconpos="notext" data-iconshadow="false" data-icon="refresh"></a>
			</div>
		</div>
		
		<div data-role="content" class="custom-content">
			<div class="ui-grid-c">
			<c:forEach items="${tops}" var="module" varStatus="status">
			<c:choose>
				<c:when test="${status.count==1}">
					<div class="ui-block-a">
				</c:when>
				<c:when test="${status.count==2}">
					<div class="ui-block-b">
				</c:when>
				<c:when test="${status.count==3}">
					<div class="ui-block-c">
				</c:when>
				<c:when test="${status.count==4}">
					<div class="ui-block-d">
				</c:when>
			</c:choose>
					<a data-role="button" data-mini="true" href="${module.url}" rel="external">
						<img class="radius" src="${ctx}/upload/${module.picture}" style="width:100%;">
					</a>
				</div>
			</c:forEach>
			</div>	
			<div class="swiper-container" style="height:170px;">
				<div class="swiper-wrapper">
				<c:forEach items="${pictures}" var="module">
					<div class="swiper-slide">
						<a href="${module.url }">
						<img src="${ctx}/upload/${module.picture}" width="100%"/>	
						</a>
					</div>
				</c:forEach>
				</div>
				<div class="pagination"></div>
			</div>
			<div class="ui-grid-b">
				<c:forEach items="${buttoms}" var="module" varStatus="status">
				<c:choose>
				<c:when test="${status.count%3==1}">
				<div class="ui-block-a">
				</c:when>
				<c:when test="${status.count%3==2}">
				<div class="ui-block-b">
				</c:when>
				<c:when test="${status.count%3==0}">
				<div class="ui-block-c">
				</c:when>
				</c:choose>
				<a data-role="button" href="${module.url}" rel="external">
						<img src="${ctx}/upload/${module.picture}" style="width:100%">
						<div class="title">${module.name}</div>
					</a>
				</div>
				</c:forEach>
			</div>		
		</div>
		
		<div data-role="footer" data-position="fixed" class="nav-custom">
			<div data-role="navbar" data-iconpos="left">
			    <ul>
			        <li><a data-role="button" data-icon="myhome"  data-theme="navbar"  href="index.html" rel="external">
			        	<span style="color:#eaeaea;font-size: 15px;">首页</span>
			        </a></li>
			        <li><a data-role="button" data-icon="mymore"  data-theme="navbar"  href="msb.html" rel="external">
			        	<span style="color:#eaeaea;font-size: 15px">更多</span>
			        </a></li>
			    </ul>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="../static/lazyload.js"></script>
	<script type="text/javascript">
		function loadComplete(){
			var mySwiper = new Swiper('.swiper-container',{
			    pagination: '.pagination',
			    loop:true,
			    grabCursor: true,
			    paginationClickable: true
			});
		}
		function loadscript(){
			LazyLoad.js([
			'../static/jquery/jquery-1.9.1.min.js',
			'../static/jquery-mobile/jquery.mobile-1.3.2.min .js',  
			'../static/jquery-plugs/idangerous.swiper-2.3.min.js'
			],loadComplete);
		}
        setTimeout(loadscript,2);
	</script>
</body>
</html>
