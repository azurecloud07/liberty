<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<spring:message code="sourceAppContextPath" var="sourceAppContextPath" />

<%
	String userName = "";
	String isInvestor = "";
	if(session.getAttribute("userName") != null) {
		userName = (String)session.getAttribute("userName");
	}
	
	String instanceName = "";
	if(session.getAttribute("instanceName") != null) {
		instanceName = (String)session.getAttribute("instanceName");
	}
%>

<div class="page-header navbar navbar-fixed-top">
   <div class="page-header-inner">
      <div class="page-logo header-logo-allign">
         <%-- <img src="${contextPath}/assets/admin/layout/img/logo.jpg" alt="Veda Logo" /></a>
         <div class="menu-toggler sidebar-toggler hide">
            
         </div> --%>
      </div>
      <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse"></a>
      <div class="page-header-menu"> 
	       	<div class="hor-menu hidden-sm hidden-xs">
	      		<div class="page-header navbar navbar-fixed-top">
					<div class="page-header-inner">
						<!-- BEGIN LOGO -->
						<c:choose>
							<c:when test="${instanceName == 'VEDA' }">
								<div class="page-logo header-logo-allign" style="padding-top: 5px !important;padding-left: 10px !important; width:auto !important">
									<a href="${sourceAppContextPath}/dashboard" class="loading-buffer"><img src="${contextPath}/assets/admin/layout/img/logo.svg" alt="Intertrust Logo" style="max-width: 110px;"> </a>
									<div class="menu-toggler sidebar-toggler hide"></div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="page-logo" style="padding-top: 5px !important; padding-left: 5px !important; padding-right: 5px !important;">
									<a href="${contextPath}/dashboard" class="loading-buffer"><img src="${contextPath}/assets/admin/layout/img/logo.svg" alt="Intertrust Logo"/> </a>
									<div class="menu-toggler sidebar-toggler hide"></div>
								</div>
							</c:otherwise>
						</c:choose>

						<a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse"> </a>
						<div class="page-header-menu">
							<div class="hor-menu ">
								<ul class="nav navbar-nav">
									<c:choose>
									<c:when test="${authorizedMenu != ''}">
										${authorizedMenu}
									</c:when>
									<c:otherwise>
										<li class="menu-dropdown classic-menu-dropdown" id="dashboard">
											<a href="${contextPath}/dashboard" class="loading-buffer" onclick="_paq.push(['trackEvent', 'Dashboard', 'My Task(s)']);">
											  My Task(s)..
											</a>
										</li>
										<li class="menu-dropdown classic-menu-dropdown" id="master">
											<a data-hover="megamenu-dropdown" data-close-others="true" data-toggle="dropdown" href="javascript:;">
											  MASTER<i class="fa fa-angle-down"></i>
											</a>
											<ul class="dropdown-menu">
												<li class="loading-buffer">
													<a href="${contextPath}/kyc/document/search" onclick="_paq.push(['trackEvent', 'DocumentLibrary', 'Search']);">Document Library</a>
												</li>
												<li class="loading-buffer">
													<a href="${contextPath}/kyc/proof/search" onclick="_paq.push(['trackEvent', 'Proof', 'Search']);">Proof Setup</a>
												</li>
												<li class="loading-buffer">
		    									   <a href="${contextPath}/kyc/defaultDocument/search" onclick="_paq.push(['trackEvent', 'DefaultDocument', 'Search']);">Default Document</a>
												</li>
												<li class="loading-buffer">
		    									   <a href="${contextPath}/kyc/template/search" onclick="_paq.push(['trackEvent', 'KYCTemplate', 'Search']);">KYC Template</a>
												</li>
												<li class="loading-buffer">
		    									   <a href="${contextPath}/kyc/consent/search" onclick="_paq.push(['trackEvent', 'ConsentMaster', 'Search']);">Consent Master</a>
												</li>
												<li class="loading-buffer">
		    									   <a href="${contextPath}/nec/template/search">NEC Template</a>
												</li>
											</ul>
										</li>
										<!-- #EndLibraryItem -->
										
										<!-- Menu 03 --->
										<li class=" menu-dropdown classic-menu-dropdown" id="necRequest">
											<a href="${contextPath}/nec/request/search" class="loading-buffer">
											  NEC Request
											</a>
										</li>
										
										<!-- Menu 04 --->
										<li class=" menu-dropdown classic-menu-dropdown" id="subject">
											<a href="${contextPath}/kyc/subject/search" class="loading-buffer" onclick="_paq.push(['trackEvent', 'KYCSubject', 'Search');">
											  KYC Subject
											</a>
										</li>
										
										<!-- Menu 05 --->
										<li class=" menu-dropdown classic-menu-dropdown" id="operationalDocument">
											<a href="${contextPath}/operationalDocument/add" class="loading-buffer">
											  Operational Documents
											</a>
										</li>
									</c:otherwise>
									</c:choose>
								</ul>
							</div>
							<!-- END MEGA MENU -->
						</div>
						<!-- END HEADER MENU -->
						<!-- BEGIN TOP NAVIGATION MENU -->
						<div class="top-menu">
							<ul class="nav navbar-nav pull-right">
								<!-- BEGIN USER LOGIN DROPDOWN -->
								<c:choose>
									<c:when test="${instanceName == 'VEDA' }">
										<li class="dropdown dropdown-extended dropdown-notification" id="header_notification_bar">
									        <a href="<spring:message code="sourceAppURL"></spring:message><spring:message code="sourceAppContextPath"></spring:message>/pendingRequest/show" class="dropdown-toggle" data-hover="dropdown" data-close-others="true">
									            <i class="icon-bell"></i>
									            <span class="badge badge-default"></span>
									        </a>
									        <ul></ul>
									    </li>
									    <li>
									        <a href="javascript:void(0);" class="dropdown-toggle" id="menuItemsViewID"> <i class="fa fa-th" style="color: #999; !important"></i>&nbsp; </a>
									    </li>
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>
								
								<li class="dropdown dropdown-user">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"> <img alt="" class="img-circle hide1" src="${contextPath}/assets/admin/layout/img/avatar_small.svg" /> <span class="username username-hide-on-mobile"> ${userName} </span> <i class="fa fa-angle-down"></i> </a>
									<ul class="dropdown-menu">
										<c:choose>
											<c:when test="${instanceName == 'VEDA' }">
												<li> <a href="<spring:message code="sourceAppURL"></spring:message><spring:message code="sourceAppContextPath"></spring:message>/logout"> <i class="icon-key"></i> Log Out</a> </li>
											</c:when>
											<c:otherwise>
												<li> <a href="${contextPath}/logout" onclick="_paq.push(['trackEvent', 'Dashboard', 'LogOut', 'Logging out.']);"> <i class="icon-key"></i> Log Out</a> </li>
											</c:otherwise>
										</c:choose>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
	   </div>
	</div>
</div>