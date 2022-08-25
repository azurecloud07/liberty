<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<spring:message code="app.isintegrated" var="isIntegratedModule" />
<%
	String userName = "";
	if(session.getAttribute("userName") != null){
		userName = (String)session.getAttribute("userName");
	}
%>
<div class="page-sidebar-wrapper">
	<div class="page-sidebar navbar-collapse collapse">
		<ul class="page-sidebar-menu page-sidebar-menu-closed" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
		<c:choose>
			<c:when test="${leftMenu != ''}">
				${leftMenu}
			</c:when>
			<c:otherwise>
			<c:if test="${isIntegratedModule == 'true'}">
			<li id="dashboardActivate">
				<a href="<spring:message code="sourceAppURL"></spring:message><spring:message code="sourceAppContextPath"></spring:message>/dashboard">
					<i class="icon-home"></i> <span class="title">Dashboard</span> <span class="selected"></span>
				</a>
			</li>
			<%-- <li id="investorInquiryActivate">
				<a href="<spring:message code="sourceAppURL"></spring:message><spring:message code="sourceAppContextPath"></spring:message>/dashboard/investorInquiry">
					<i class="icon-user"></i> <span class="title">Investor Inquiry</span>
				</a>
			</li>
			<li id="cadActivate">
				<a href="<spring:message code="sourceAppURL"></spring:message><spring:message code="sourceAppContextPath"></spring:message>/dashboard/cad">
					<i class="icon-wallet"></i> <span class="title">Capital Activity Dashboard</span>
				</a>
			</li> --%>
			<li id="fundHierarchyTreeView">
				<a href="<spring:message code="sourceAppURL"></spring:message><spring:message code="sourceAppContextPath"></spring:message>/hierarchicallayout/loadGrid">
					<i class="fa fa-bars"></i> <span class="title">Fund Hierarchy</span>
				</a>
			</li>
			<%-- <li id="holdingSummary">
				<a href="<spring:message code="sourceAppURL"></spring:message><spring:message code="sourceAppContextPath"></spring:message>/holdingSummary/summary">
					<i class="fa fa-group"></i> <span class="title">Holding Summary</span>
				</a>
			</li> --%>
			</c:if>
			<li id="kycExpiry">
				<a href="${contextPath}/dashboard/kycDashboard">
					<i class="fa fa-warning"></i> <span class="title">KYC Expiry</span>
				</a>
			</li>
			<li id="kycDocumentStatus">
				<a href="${contextPath}/dashboard/kycDocumentStatus">
					<i class="fa fa-file-pdf-o"></i> <span class="title">KYC Document Status</span>
				</a>
			</li>
			<li id="kycPeriodicScreening">
				<a href="${contextPath}/dashboard/kycPeriodicScreening">
					<i class="fa fa-calendar"></i> <span class="title">Periodic Screening</span>
				</a>
			</li>
			</c:otherwise>
		</c:choose>
		</ul>
		<!-- END SIDEBAR MENU -->
	</div>
</div>