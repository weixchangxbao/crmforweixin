<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<link href="${ctx }/static/jquery-mobile/jquery.mobile-1.3.2.min.css" type="text/css" rel="stylesheet"/>
	<link href="${ctx }/static/styles/default.css" type="text/css" rel="stylesheet"/>
	<link href="${ctx }/static/styles/navbar.css" type="text/css" rel="stylesheet"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/static/jq-mobi-plugs/touchTouch.css"/>
	<style type="text/css">
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
	</style>
	<script type="text/javascript" src="${ctx }/static/lazyload.js"></script>
	<script type="text/javascript">
		function loadComplete(){
			$('#thumbs a').touchTouch();
		}
		function loadscript(){
			LazyLoad.js([
			'${ctx }/static/jquery/jquery-1.9.1.min.js',
			'${ctx }/static/jquery-mobile/jquery.mobile-1.3.2.min .js',
			'${ctx }/static/jq-mobi-plugs/touchTouch.js'
			],loadComplete);
		}
        setTimeout(loadscript,2);
	</script>
</head>
<body>
	<div data-role="page">
		<div data-role="header" data-position="fixed">
			<img class="logo" src="${ctx }/static/images/app/logo.png"/>
			<div class="header-bg">大银电商</div>
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
			<div id="thumbs">
				<c:forEach items="${pictures}" var="module">
					<a href="${module.url}" data-ignore="true">
						<div>
							<img src="${ctx}/upload/${module.picture}" style="width:100%;height:170px;" />	
						</div>
					</a>
				</c:forEach>
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
</body>
</html>
