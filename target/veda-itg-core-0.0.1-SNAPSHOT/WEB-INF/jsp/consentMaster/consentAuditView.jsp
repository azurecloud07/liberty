<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<spring:message code="close.label" var="closeLabel" />
<spring:message code="consentMaster.consentDetails.label" var="consentDetailsLabel" />
<spring:message code="consentMaster.consentName.label" var="consentNameLabel" />
<spring:message code="consentMaster.consentCode.label" var="consentCodeLabel" />
<spring:message code="consentMaster.consentType.label" var="consentTypeLabel" />
<spring:message code="consentMaster.typeOfCounterParty.label" var="typeOfCounterPartyLabel" />
<spring:message code="consentMaster.isMandatory.label" var="isMandatoryLabel" />
<spring:message code="consentMaster.effectiveDate.label" var="effectiveDateLabel" />
<spring:message code="consentMaster.effectiveEndDate.label" var="effectiveEndDateLabel" />
<spring:message code="consentMaster.consentDescription.label" var="consentDescriptionLabel" />
<spring:message code="createdBy.label" var="createdByLabel" />
<spring:message code="createdDate.label" var="createdDateLabel" />
<spring:message code="modifiedBy.label" var="modifiedByLabel" />
<spring:message code="modifiedDate.label" var="modifiedDateLabel" />

<spring:message code="app.kycMasterMenuName" var="kycMasterMenuName" />

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="page-content-wrapper">
    <div class="page-content">
        <div class="page-bar search-page-bar">
            <ul class="page-breadcrumb pull-right">
                <li><i class="fa fa-home"></i> <!-- <a href="#"> --> Home <!-- </a> --> <i class="fa fa-angle-right"></i></li>
				<li><!-- <a href="#"> -->${kycMasterMenuName}<!-- </a> --> <i class="fa fa-angle-right"></i></li>
                <li>Consent Master<i class="fa fa-angle-right"></i></li>
                <li>Audit View</li>
            </ul>
			<!-- <h4>&nbsp;Consent Master</h4> -->
			<span class="header-scope">&nbsp;Consent Master</span>
        </div>
        
         <div class="row">
            <div class="col-md-12">
                <div class="portlet-body form">
                    <div class="pull-right">
                    	<button type="button" class="btn-remark btn-link" data-toggle="modal" data-target="#remarkHistoryModalId" onclick="_paq.push(['trackEvent', 'ConsentMaster', 'ViewRemarks','Viewing remark on auditview consent']);" >View Remarks</button>
                        <button type="button" id="closeButton" class="btn-itg btn btn-sm grey-gallery"><img src="/digiKYC/assets/global/img/clear.png" /> ${closeLabel} </button>
                    </div>
                    <div class="clearfix margin-bottom-5"></div>
                </div>
            </div>
        </div>

		<form:form action="#" method="POST" id="frm" role="form" class="horizontal-form uk-form bt-flabels js-flabels" data-parsley-validate="true" 
		modelAttribute="consentMasterBO" data-parsley-errors-messages-disabled="true"> 
		
			<div class="row">
				<div class="col-md-12">
					<div class="portlet-body">
						<div class="page-bar">
							<ul class="page-breadcrumb">
								<li><em><strong>${consentDetailsLabel}</strong></em></li>
							</ul>
						</div>
						<div class="form-group" style="margin-left: -1px;">
							<div class="col-md-2 bold h5">
								${consentNameLabel}
							</div>
							<c:if test="${consentMasterBO != null}"> 
								<div class="col-md-3 h5">								
									${consentMasterBO.consentName} 								
								</div>
							</c:if>
							<div class="col-md-2 bold h5">
								${consentCodeLabel}
							</div>
							<c:if test="${consentMasterBO != null}"> 
								<div class="col-md-3 h5">								
									${consentMasterBO.consentCode}
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12">
					<div class="portlet-body">
						<div class="form-group" style="margin-left: -1px;">
							<div class="col-md-2 bold h5">
								${consentTypeLabel}
							</div>
							<c:if test="${consentMasterBO != null}">
								<div class="col-md-3 h5">								
									${consentMasterBO.consentTypeName}
								</div>
							</c:if>
							<div class="col-md-2 bold h5">
								${typeOfCounterPartyLabel}
							</div>
							<c:if test="${consentMasterBO != null}">
								<div class="col-md-3 h5">								
									${consentMasterBO.typeOfCounterpartyName}
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<div class="portlet-body">
						<div class="form-group" style="margin-left: -1px;">
							<div class="col-md-2 bold h5">
								${isMandatoryLabel}
							</div>
							<c:choose>
								<c:when test="${consentMasterBO.isMandatory==true}">
									<div class="col-md-3 h5">
										Yes
									</div>
								</c:when>
								<c:when test="${consentMasterBO.isMandatory==false}">
									<div class="col-md-3 h5">
										No
									</div>
								</c:when>
								<c:otherwise>
									-
								</c:otherwise>
							</c:choose>
							<div class="col-md-2 bold h5">
								${effectiveDateLabel}
							</div>
							<c:if test="${consentMasterBO != null}">
								<div class="col-md-3 h5">								
									<fmt:formatDate pattern="dd-MMM-yyyy" value="${consentMasterBO.effectiveDate}" />
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<div class="portlet-body">
						<div class="form-group" style="margin-left: -1px;">
							<div class="col-md-2 bold h5">
								${effectiveEndDateLabel}
							</div>
							<c:if test="${consentMasterBO != null}">
								<div class="col-md-3 h5">
									<fmt:formatDate pattern="dd-MMM-yyyy" value="${consentMasterBO.effectiveEndDate}" />								
								</div>
							</c:if>
							<div class="col-md-2 bold h5">
								${consentDescriptionLabel}
							</div>
							<c:if test="${consentMasterBO != null}">
								<div class="col-md-3 h5">								
									${consentMasterBO.consentDescription}
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
				<div class="row">
				<div class="col-md-12">
					<div class="portlet-body">
						<div class="form-group" style="margin-left: -1px;">
							<div class="col-md-2 bold h5">
								${createdByLabel}
							</div>
							<c:if test="${consentMasterBO != null}">
								<div class="col-md-3 h5">								
									${consentMasterBO.createdBy}
								</div>
							</c:if>
							<div class="col-md-2 bold h5">
									${createdDateLabel}
							</div>
							<c:if test="${consentMasterBO != null}">
								<div class="col-md-3 h5">
									<fmt:formatDate pattern="dd-MMM-yyyy" value="${consentMasterBO.createdDate}" />								
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="portlet-body">
						<div class="form-group" style="margin-left: -1px;">
							<div class="col-md-2 bold h5">
								${modifiedByLabel}
							</div>
							<c:if test="${consentMasterBO != null}">
								<div class="col-md-3 h5">								
									${consentMasterBO.modifiedBy}
								</div>
							</c:if>
							<div class="col-md-2 bold h5">
								${modifiedDateLabel}
							</div>
							<c:if test="${consentMasterBO != null}">
								<div class="col-md-3 h5">
									<fmt:formatDate pattern="dd-MMM-yyyy" value="${consentMasterBO.modifiedDate}" />								
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			
			<div id="remarkHistoryModalId" class="modal fade modal-xl" tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog modal-md">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Remark Details</h4>
						</div>
						<div class="modal-body">
						<textarea id="remarkHistoryViewJson" style="display: none;">${remarkHistoryViewJson}</textarea>
							<div class="row">
								<div class="col-md-12">
									<div id="remarkHistoryJqxgrid"></div>
								</div>												
						   </div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn-modal-cls btn-sm default" data-dismiss="modal"><img src="/digiKYC/assets/global/img/clear.png" /> Close
	                        </button>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix margin-bottom-10"></div>
			<div class="clearfix margin-bottom-10"></div>
			<div class="clearfix margin-bottom-10"></div>
		</form:form>
		
	</div>
</div>

<script>

	jQuery(document).ready(function() {
		jQuery("#master").addClass("active");
		jQuery("#subject").remove("active");
		jQuery("#dashboard").remove("active");
	});
	
	$('#closeButton').click(function() {
		_paq.push(['trackEvent', 'ConsentMaster', 'Close','Closing audit view consent']);
	    console.log("Closing current window...");
	    window.close();
	});
</script>