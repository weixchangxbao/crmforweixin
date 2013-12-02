<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
 	<title>UI Starter</title>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/bootstrap/2.1.1/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/static/styles/default-index.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/static/jq-mobi-plugs/touchTouch.css"/>
	<script type="text/javascript" src="${ctx}/static/jquery/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/static/jquery-mobile/jquery.mobile.custom.min.js"></script>
	<script type="text/javascript" src="${ctx}/static/jq-mobi-plugs/touchTouch.js"></script>
    <script type="text/javascript">
    	$(function(){
    		$('#thumbs a').touchTouch();
    	})
    </script>
</head>
<body>
	<div id="header">
		<div class="navbar-static-top">
        	<img class="logo" src="${ctx}/static/images/app/logo.png"/>
        	<h1>大银电商</h1>
        </div>
	</div>
    <div class="container">
		<div class="row-fluid top">
			<c:forEach items="${tops}" var="module" varStatus="status">
            <a  class="span3" href="${module.url}" data-ignore="true">
				    	<img class="btns" src="${ctx}/upload/${module.picture}"/>
				    </a>
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
			<div class="shiftbar"></div>
		</div>
		<div class="bottom">
		<c:forEach items="${buttoms}" var="module" varStatus="status">
							<c:if test="${status.count%3==1}">
								<div class="row-fluid">
							</c:if>
								<a class="span4" href="${module.url}" data-ignore="true">
						    		<img class="btns" border=0 src="${ctx}/upload/${module.picture}"/>
						    		<span>${module.name }</span>
						    	</a>
							<c:if test="${status.count%3==0}">
								</div>
							</c:if>
					</c:forEach>
		</div>
     </div>
</body>
</html>