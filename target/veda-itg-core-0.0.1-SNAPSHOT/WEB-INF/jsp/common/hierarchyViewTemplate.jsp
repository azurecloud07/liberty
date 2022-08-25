<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
<meta charset="utf-8"/>
<title><tiles:insertAttribute name="title" ignore="true"></tiles:insertAttribute></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport"/>
<meta content="" name="description"/>
<meta content="" name="author"/>
<jsp:include page="commonCSS.jsp" />

</head>
<body class="page-sidebar-remove page-sidebar-closed">
	<div id="container">
		<div class="clearfix"> </div>
		<!-- BEGIN CONTAINER -->
		<div class="page-container"> 
			<tiles:insertAttribute name="body"></tiles:insertAttribute>
		  </div>   
		<!-- END CONTAINER --> 
	</div>
	<jsp:include page="commonJS.jsp" />
</body>
</html>