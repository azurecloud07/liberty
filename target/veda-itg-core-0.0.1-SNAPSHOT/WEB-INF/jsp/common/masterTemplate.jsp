<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->
<head>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<meta charset="utf-8"/>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link rel="shortcut icon" href="${contextPath}/favicon.ico" />
<title>KYC</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport"/>
<meta content="" name="description"/>
<meta content="" name="author"/>
<jsp:include page="commonCSS.jsp" />
</head>
<body class="page-header-fixed page-quick-sidebar-over-content page-sidebar-closed">
	<div id="container">
		<div id="headerDiv">
			<tiles:insertAttribute name="header"></tiles:insertAttribute>
		</div>
		<div class="clearfix"> </div>
		<!-- BEGIN CONTAINER -->
		<div class="page-container"> 
			<tiles:insertAttribute name="leftsidebar"></tiles:insertAttribute>
			<tiles:insertAttribute name="body"></tiles:insertAttribute>
		  </div>   
		<!-- END CONTAINER --> 
		<div id="footerDiv">
			<tiles:insertAttribute name="footer"></tiles:insertAttribute>
		</div>
	</div>
	<jsp:include page="commonJS.jsp" />
</body>
</html>