<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<title>大银后台管理:<sitemesh:title/></title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />

    <!-- The styles -->
    <link id="bs-css" href="${ctx}/static/css/bootstrap-cerulean.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }
    </style>
    <link href="${ctx}/static/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="${ctx}/static/css/charisma-app.css" rel="stylesheet">
    <link href="${ctx}/static/css/jquery-ui-1.8.21.custom.css" rel="stylesheet">
    <link href='${ctx}/static/css/chosen.css' rel='stylesheet'>
    <link href='${ctx}/static/css/uniform.default.css' rel='stylesheet'>
    <link href='${ctx}/static/css/jquery.noty.css' rel='stylesheet'>
    <link href='${ctx}/static/css/noty_theme_default.css' rel='stylesheet'>
    <link href='${ctx}/static/css/opa-icons.css' rel='stylesheet'>
    <link href='${ctx}/static/css/uploadify.css' rel='stylesheet'>
    <link href='${ctx}/static/jquery-validation/1.11.1/validate.css' rel='stylesheet'>
    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- The fav icon -->
    <link rel="shortcut icon" href="${ctx}/static/img/favicon.ico">
        
<sitemesh:head/>        
</head>

<body>
	<div class="navbar">
        <!-- topbar starts -->
    	<%@ include file="/WEB-INF/layouts/navbar.jsp"%>
        <!-- topbar ends -->
    </div>
        <div class="container-fluid">
        <div class="row-fluid">
                
            <!-- left menu starts -->
          	<%@ include file="/WEB-INF/layouts/menu.jsp"%>
            <!-- left menu ends -->
            
            <noscript>
                <div class="alert alert-block span10">
                    <h4 class="alert-heading">Warning!</h4>
                    <p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
                </div>
            </noscript>
            
            <div id="content" class="span10">
            <!-- content starts -->
            
			<!-- view starts -->
			<sitemesh:body/>
			<!-- view end -->
            <!-- content end -->
            </div>
           </div><!--/fluid-row-->
                
      <!-- footer start-->
		<%@ include file="/WEB-INF/layouts/footer.jsp"%>
      <!-- footer end-->
        
    </div><!--/.fluid-container-->

    <!-- external javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->

    <!-- jQuery -->
    <script src="${ctx}/static/js/jquery-1.7.2.min.js"></script>
    <!-- jQuery UI -->
    <script src="${ctx}/static/js/jquery-ui-1.8.21.custom.min.js"></script>
    <!-- transition / effect library -->
    <script src="${ctx}/static/js/bootstrap-transition.js"></script>
    <!-- alert enhancer library -->
    <script src="${ctx}/static/js/bootstrap-alert.js"></script>
    <!-- custom dropdown library -->
    <script src="${ctx}/static/js/bootstrap-dropdown.js"></script>
    <!-- scrolspy library -->
    <script src="${ctx}/static/js/bootstrap-scrollspy.js"></script>
    <!-- library for advanced tooltip -->
    <script src="${ctx}/static/js/bootstrap-tooltip.js"></script>
    <!-- popover effect library -->
    <script src="${ctx}/static/js/bootstrap-popover.js"></script>
    <!-- button enhancer library -->
    <script src="${ctx}/static/js/bootstrap-button.js"></script>
    <!-- accordion library (optional, not used in demo) -->
    <script src="${ctx}/static/js/bootstrap-collapse.js"></script>
    <!-- carousel slideshow library (optional, not used in demo) -->
    <script src="${ctx}/static/js/bootstrap-carousel.js"></script>
    <!-- autocomplete library -->
    <script src="${ctx}/static/js/bootstrap-typeahead.js"></script>
    <!-- tour library -->
    <script src="${ctx}/static/js/bootstrap-tour.js"></script>
    <!-- library for cookie management -->
    <script src="${ctx}/static/js/jquery.cookie.js"></script>
    
    <!-- data table plugin -->
    <script src='${ctx}/static/js/jquery.dataTables.min.js'></script>

    <!-- select or dropdown enhancer -->
    <script src="${ctx}/static/js/jquery.chosen.min.js"></script>
    <!-- checkbox, radio, and file input styler -->
    <script src="${ctx}/static/js/jquery.uniform.min.js"></script>
    <!-- notification plugin -->
    <script src="${ctx}/static/js/jquery.noty.js"></script>
    <!-- star rating plugin -->
    <script src="${ctx}/static/js/jquery.raty.min.js"></script>
    <!-- multiple file upload plugin -->
    <script src="${ctx}/static/js/jquery.uploadify-3.1.min.js"></script>
    <!-- history.js for cross-browser state change on ajax -->
    <script src="${ctx}/static/js/jquery.history.js"></script>
    <!-- application script for Charisma demo -->
    <script src="${ctx}/static/js/charisma.js" type="text/javascript"></script>
    <script src="${ctx}/static/jquery-validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/jquery-validation/1.11.1/messages_bs_zh.js" type="text/javascript"></script>
    <script type="text/javascript">
    	function swiththems(){
    		//default theme(CSS) is cerulean, change it if needed
    		var current_theme = $.cookie('current_theme')==null ? 'cerulean' :$.cookie('current_theme');
    		switch_theme(current_theme);
    		
    		$('#themes a[data-value="'+current_theme+'"]').find('i').addClass('icon-ok');
    					 
    		$('#themes a').click(function(e){
    			e.preventDefault();
    			current_theme=$(this).attr('data-value');
    			$.cookie('current_theme',current_theme,{expires:365});
    			switch_theme(current_theme);
    			$('#themes i').removeClass('icon-ok');
    			$(this).find('i').addClass('icon-ok');
    		});
    		
    		
    		function switch_theme(theme_name)
    		{
    			$('#bs-css').attr('href','/basic/static/css/bootstrap-'+theme_name+'.css');
    		}
    	}
    </script>
    
</body>
</html>
