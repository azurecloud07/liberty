<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
	String instanceName = "";
	if(session.getAttribute("instanceName") != null) {
		instanceName = (String)session.getAttribute("instanceName");
	}
%>
										
<div class="page-footer navbar-fixed-bottom">
	<div class="page-footer-inner pull-left col-md-2 col-sm-6"> <spring:eval expression="@environment.getProperty('application.version')" /></div>
	<c:choose>
		<c:when test="${instanceName == 'VEDA' }">
			<div class="page-footer-inner pull-right  col-md-2 col-xs-6 text-right" style="margin-top:-5px;"> 
				<span class="hidden-xs">Powered by</span> 
				<img src="${contextPath}/assets/admin/layout/img/logo-footer.png" alt="Intertrust" style="max-width: 90px;" />
			</div>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
	<div class="scroll-to-top" style="display: none;"> <i class="icon-arrow-up"></i> </div>
</div>
<!-- END FOOTER --> 
<div id="activity_pane"></div>