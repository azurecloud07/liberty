<%@page import="java.util.List"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
String userName = "User";

if(session.getAttribute("userName") != null){
	userName = (String)session.getAttribute("userName");
}
%>

<div class="page-header navbar navbar-fixed-top"> 
  <!-- BEGIN HEADER INNER -->
  <div class="page-header-inner"> 
    <!-- BEGIN LOGO -->
    <div class="page-logo header-logo-allign"> <a href="${contextPath}/welcome"> <img src="${contextPath}/assets/admin/layout/img/logo.png" alt="Veda Logo" /> </a>
      <div class="menu-toggler sidebar-toggler hide"> 
        <!-- DOC: Remove the above "hide" to enable the sidebar toggler button on header --> 
      </div>
    </div>
    <!-- END LOGO --> 
    <!-- BEGIN RESPONSIVE MENU TOGGLER --> 
    <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse"> </a> 
    <!-- END RESPONSIVE MENU TOGGLER --> 
    <!-- ADDED by AVRINDER --> 
    <!-- BEGIN HEADER MENU -->
    <div class="page-header-menu"> 
      <!-- BEGIN MEGA MENU --> 
      <!-- DOC: Apply "hor-menu-light" class after the "hor-menu" class below to have a horizontal menu with white background --> 
      <!-- DOC: Remove data-hover="dropdown" and data-close-others="true" attributes below to disable the dropdown opening on mouse hover -->
      <div class="hor-menu hidden-sm hidden-xs">
        <ul class="nav navbar-nav">
        	<!-- BEGIN HEADER -->
			<div class="page-header navbar navbar-fixed-top">
				<!-- BEGIN HEADER INNER -->
				<div class="page-header-inner">
					<!-- BEGIN LOGO -->
					<div class="page-logo">
						<a href="${contextPath}/workFlowDashboard"><img src="${contextPath}/assets/admin/layout/img/logo.png" alt="Veda Logo"/> </a>
						<div class="menu-toggler sidebar-toggler hide">
							<!-- DOC: Remove the above "hide" to enable the sidebar toggler button on header -->
						</div>
					</div>
					<!-- END LOGO -->
					<!-- BEGIN RESPONSIVE MENU TOGGLER -->
					<a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse"> </a>
					<!-- END RESPONSIVE MENU TOGGLER -->
					<!-- ADDED by AVRINDER -->
					<!-- BEGIN HEADER MENU -->
					<div class="page-header-menu">
						<!-- BEGIN MEGA MENU -->
						<!-- DOC: Apply "hor-menu-light" class after the "hor-menu" class below to have a horizontal menu with white background -->
						<!-- DOC: Remove data-hover="dropdown" and data-close-others="true" attributes below to disable the dropdown opening on mouse hover -->
						<div class="hor-menu ">
							<ul class="nav navbar-nav">
								<!-- Menu 01 - Dashboard -->
								<!-- Menu 02 - Fund Setup -->
								<li class="active menu-dropdown classic-menu-dropdown" id="dashboard">
									<a href="${contextPath}/kycDashboard">
									  DASHBOARD
									</a>
								</li>
								<li class="menu-dropdown classic-menu-dropdown" id="master">
									<a data-hover="megamenu-dropdown" data-close-others="true" data-toggle="dropdown" href="javascript:;">
									  MASTER <i class="fa fa-angle-down"></i>
									  </a>
									<!-- #BeginLibraryItem "/Library/TopNav-FundSetup-ddmenu.lbi" -->
									<ul class="dropdown-menu">
										<li class=" ">
											<a href="${contextPath}/fundSetup/client/add">Client / Holding Company</a>
										</li>
										<li class=" ">
											<a href="${contextPath}/fundSetup/legalEntity/search">Legal Entity </a>
										</li>
										<li class=" ">
    									   <a href="${contextPath}/fundSetup/hierarchy/search">Fund Hierarchy</a>
										</li>
										<li class=" ">
    									   <a href="${contextPath}/fundSetup/riskMatrix">Risk Jurisdiction Matrix</a>
										</li>
										<li class=" ">
    									   <a href="${contextPath}/fundSetup/calculateRiskLevel">Risk Rules</a>
										</li>
										<li class=" ">
    									   <a href="${contextPath}/NEC/search">NEC</a>
										</li>
									</ul>
									<!-- #EndLibraryItem -->
								</li>
								<!-- Menu 03 - Master -->
								<li class=" menu-dropdown classic-menu-dropdown" id="kyc">
									<a data-hover="megamenu-dropdown" data-close-others="true" data-toggle="dropdown" href="javascript:;">
									  KYC
									  <i class="fa fa-angle-down"></i>
									  </a>
									<!-- #BeginLibraryItem "/Library/TopNav-FundSetup-ddmenu.lbi" -->
									<ul class="dropdown-menu">
										<li class=" ">
											<a href="${contextPath}/kyc/proofMaster/add">Proof - Document</a>
										</li>
										<li class=" ">
											<a href="${contextPath}/kyc/kycTemplate/add">KYC Template</a>
										</li>
										<li class=" ">
											<a href="${contextPath}/kyc/legalEntityKYC/add">Legal Entity KYC</a>
										</li>
										<li class=" ">
											<a href="${contextPath}/documentWorkflow">Process Workflow</a>
										</li>
									</ul>
									<!-- #EndLibraryItem -->
								</li>
								<!-- Menu 04 - Investor Setup -->
								<!-- Menu 05 - Transaction -->
							</ul>
						</div>
						<!-- END MEGA MENU -->
					</div>
					<!-- END HEADER MENU -->
					<!-- BEGIN TOP NAVIGATION MENU -->
					<div class="top-menu">
						<ul class="nav navbar-nav pull-right">
							<!-- BEGIN USER LOGIN DROPDOWN -->
							<li class="dropdown dropdown-user">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"> <img alt="" class="img-circle hide1" src="${contextPath}/assets/admin/layout/img/avatar_small.png" /> <span class="username username-hide-on-mobile"> <%=userName %> </span> <i class="fa fa-angle-down"></i> </a>
								<ul class="dropdown-menu">
									<!-- <li>
										<a href="extra_profile.html"> <i class="icon-user"></i> My Profile </a>
									</li>
									<li>
										<a href="page_calendar.html"> <i class="icon-calendar"></i> My Calendar </a>
									</li>
									<li class="divider"> </li>
									<li> <a href="javascript:;" id="trigger_fullscreen"><i
										 class="icon-size-fullscreen"></i> Full Screen</a> </li>
									<li>
										<a href="extra_lock.html"> <i class="icon-lock"></i> Lock Screen </a>
									</li> -->
									<li>
										<!-- <a href=""> <i class="icon-key"></i> Log Out </a> -->
										<li> <a href="${contextPath}/logout" onclick="_paq.push(['trackEvent', 'Dashboard', 'LogOut', 'Logging out.']);"> <i class="icon-key"></i> Log Out </a> </li>
									</li>
								</ul>
							</li>
						</ul>
					</div>
					<!-- END TOP NAVIGATION MENU -->
				</div>
				<!-- END HEADER INNER -->
			</div>

        	<!-- End Menus - Dashboard -->
        </ul>
      </div>
      <!-- END MEGA MENU --> 
    </div>
    <!-- END HEADER MENU --> 
    <!-- BEGIN TOP NAVIGATION MENU -->
    <div class="top-menu">
      <div style="display:none;" ><button type="button" id="showtoast"></button><input type="hidden" id="mesg" value="${successMessage}"/><input type="hidden" id="flag" value="${successFlag}"/><input type="hidden" id="mode"/></div>
    </div>
     
  </div>
  <!-- END HEADER INNER --> 
</div>
<!-- END HEADER -->