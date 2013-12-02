<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
 	<title>UI Starter</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/jq-mobi/css/af.ui.css"  />
	<link rel="stylesheet" type="text/css" href="${ctx}/static/styles/default-index.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/static/jq-mobi-plugs/touchTouch.css"/>
	<script type="text/javascript" src="${ctx}/static/jq-mobi/appframework.min.js"></script>
	<script type="text/javascript" src="${ctx}/static/jq-mobi/appframework.ui.min.js"></script>
	<script type="text/javascript" src="${ctx}/static/jq-mobi-plugs/touchTouch.js"></script>
    <script type="text/javascript">
	    var webRoot = "./";
	    $.ui.autoLaunch = true; //By default, it is set to true and you're app will run right away.  We set it to false to show a splashscreen
	    /* This function runs when the body is loaded.*/
	    var init = function () {
	            window.setTimeout(function () {
	                $.ui.launch();
	            }, 10);//We wait 1.5 seconds to call $.ui.launch after DOMContentLoaded fires
	        };
	    document.addEventListener("DOMContentLoaded", init, false);
	    $.ui.ready(function () {
        	$.ui.removeFooterMenu();
        	$('#thumbs a').touchTouch();
	    });
	    /* This code is used for Intel native apps */
	    var onDeviceReady = function () {
	    	intel.xdk.device.hideSplashScreen();
	    };
	    document.addEventListener("intel.xdk.device.ready", onDeviceReady, false);
    </script>
</head>
<body>
    <div id="afui"> <!-- this is the main container div.  This way, you can have only part of your app use UI -->
        <div id="header">
        	<img class="logo" src="${ctx}/static/images/app/logo.png"/>
        </div>
        <div id="content">
            <div title='大银电商' id="main" class="panel">
            	<div class="top">
            		<c:forEach items="${tops}" var="module" varStatus="status">
            			<a href="${module.url}" data-ignore="true">
				    	<img class="btn" src="${ctx}/upload/${module.picture}"/>
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
					<div class="pagination"></div>
				</div>
				<div class="bottom">
					<c:forEach items="${buttoms}" var="module" varStatus="status">
					<c:choose>
						
						<c:when test="${status.last}">
							<div class="last">
							    <a href="${module.url }" data-ignore="true">
							    	<img class="btn" src="${ctx}/upload/${module.picture}"/>
							    	<h1>${module.name }</h1>
							    </a>
							</div>
						</c:when>
						<c:when test="${status.count-1 != status.end}">
							<c:if test="${status.count%3==1}">
								<div>
							</c:if>
								<a href="${module.url}" data-ignore="true">
						    		<img class="btn" src="${ctx}/upload/${module.picture}"/>
						    		<h1>${module.name }</h1>
						    	</a>
							<c:if test="${status.count%3==0}">
								</div>
							</c:if>
						</c:when>
					</c:choose>
					</c:forEach>
				</div>
            </div>
        </div>
    </div>
</body>
</html>
