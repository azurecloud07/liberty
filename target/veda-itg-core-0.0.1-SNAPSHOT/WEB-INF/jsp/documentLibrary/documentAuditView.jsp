<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<spring:message code="kycSubject.counterPartyTypeView.label" var="counterPartyTypeViewLabel" />
<spring:message code="close.label" var="closeLabel" />
<spring:message code="documentLibrary.documentName.label" var="documentNameLabel" />
<spring:message code="documentLibrary.documentCode.label" var="documentCodeLabel" />
<spring:message code="documentLibrary.isPassportView.label" var="isPassportViewLabel" />
<spring:message code="createdBy.label" var="createdByLabel" />
<spring:message code="createdDate.label" var="createdDateLabel" />
<spring:message code="modifiedBy.label" var="modifiedByLabel" />
<spring:message code="modifiedDate.label" var="modifiedDateLabel" />

<spring:message code="app.kycMasterMenuName" var="kycMasterMenuName" />
<spring:message code="app.documentIsPassport" var="documentIsPassport" />

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar search-page-bar">
			<ul class="page-breadcrumb pull-right">
				<li><i class="fa fa-home"></i> <!-- <a href="#"> --> Home <!-- </a> --> <i class="fa fa-angle-right"></i></li>
				<li><!-- <a href="#"> -->${kycMasterMenuName}<!-- </a> --> <i class="fa fa-angle-right"></i></li>
                <li>Document Library<i class="fa fa-angle-right"></i></li>
				<li>Audit View</li>
			</ul>
			<!-- <h4>&nbsp;Document Library</h4> -->
			<span class="header-scope">&nbsp;Document Library</span>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="portlet-body form">
					<div class="pull-right">
						<button type="button" class="btn-remark btn-link" data-toggle="modal" data-target="#remarkHistoryModalId" onclick="_paq.push(['trackEvent', 'DocumentLibrary', 'ViewRemarks','Viewing remark on audit view document']);" >View Remarks</button>
						<button type="button" id="closeBtn" class="btn-itg btn btn-sm grey-gallery">
							<img src="/digiKYC/assets/global/img/clear.png" /> ${closeLabel}
						</button>
					</div>
					<div class="clearfix margin-bottom-5"></div>
				</div>
			</div>
		</div>

		<form:form action="#" method="POST" id="frm" role="form" class="horizontal-form uk-form bt-flabels js-flabels"
		 modelAttribute="documentLibraryBO">
		 
			<div id="rootwizard" class="row">
				<div class="col-md-12">
					<div class="portlet-body">					
						<div class="form-group" style="margin-left: -1px;">
							
							<div class="row">
								<div class="col-md-2 bold h5">${counterPartyTypeViewLabel}</div>
								<div class="col-md-3 h5">
									<c:if test="${documentLibraryBO != null}">
										<c:forEach items="${documentLibraryBO.typeOfCounterpartyName}" var="typeOfCounterpartyName" varStatus="loop">
										    ${typeOfCounterpartyName}
										   <c:if test="${!loop.last}">,</c:if>
										</c:forEach>
									</c:if>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-2 bold h5">${documentNameLabel}</div>
								<div class="col-md-3 h5">
									<c:if test="${documentLibraryBO != null && documentLibraryBO.documentName != null}">
										<span>${documentLibraryBO.documentName}</span>
									</c:if>
								</div>
								<div class="col-md-2 bold h5">${documentCodeLabel}</div>
								<div class="col-md-3 h5">
									<c:if test="${documentLibraryBO != null && documentLibraryBO.documentCode != null}">
										<span>${documentLibraryBO.documentCode}</span>
									</c:if>
								</div>
							</div>
							
							<c:if test="${documentIsPassport == 'true'}">
								<div class="row">
									<div class="col-md-2 bold h5">${isPassportViewLabel}</div>
									<div class="col-md-3 h5">
										<c:if test="${documentLibraryBO != null && documentLibraryBO.isPassport != null}">
											<span>${documentLibraryBO.isPassport}</span>
										</c:if>
									</div>
								</div>
							</c:if>
							<div class="row">
								<div class="col-md-2 bold h5">${createdByLabel}</div>
								<div class="col-md-3 h5">
									<c:if test="${documentLibraryBO != null && documentLibraryBO.createdBy != null}">
										<span>${documentLibraryBO.createdBy}</span>
									</c:if>
								</div>
								<div class="col-md-2 bold h5">${createdDateLabel}</div>
								<div class="col-md-3 h5">
									<c:if test="${documentLibraryBO != null && documentLibraryBO.createdDate != null}">
										<fmt:formatDate pattern="dd-MMM-yyyy" value="${documentLibraryBO.createdDate}" />
									</c:if>
								</div>
							</div>
							<div class="row">
								<div class="col-md-2 bold h5">${modifiedByLabel}</div>
								<div class="col-md-3 h5">
									<c:if test="${documentLibraryBO != null && documentLibraryBO.modifiedBy != null}">
										<span>${documentLibraryBO.modifiedBy}</span>
									</c:if>
								</div>
								<div class="col-md-2 bold h5">${modifiedDateLabel}</div>
								<div class="col-md-3 h5">
									<c:if test="${documentLibraryBO != null && documentLibraryBO.modifiedDate != null}">
										<fmt:formatDate pattern="dd-MMM-yyyy" value="${documentLibraryBO.modifiedDate}" />
									</c:if>
								</div>
							</div>
						</div>
						<div class="clearfix margin-bottom-10"></div>					
					</div>
				</div>
			</div>
			<div class="clearfix margin-bottom-5"></div>
			<textarea id="documentViewJson" style="display: none;">${documentViewData}</textarea>
			<div class="row">
				<div class="col-md-12">
					<div id='jqxWidget'>
						<div id="documentJqxgrid"></div>
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
		</form:form>
		<div class="clearfix margin-bottom-10"></div>
			<div class="clearfix margin-bottom-10"></div>
			<div class="clearfix margin-bottom-10"></div>
	</div>
</div>

<script>

	$(document).ready(function() {
		
		jQuery("#master").addClass("active");
		jQuery("#subject").remove("active");
		jQuery("#dashboard").remove("active");
		
		var data = $("#documentViewJson").val();
		console.log("data : " + JSON.stringify(data));
		// prepare the data
		var source = {
			datatype : "json",
			localdata : data,
			datafields : [ 
			               {name : 'description',type : 'String'},
			               {name : 'dataType',type : 'string'},
			               {name : 'dataLength',type : 'string'},
			               {name : 'isMandatory',type : 'string'}
			             ],
		};
		var dataAdapter = new $.jqx.dataAdapter(source);

		// Create jqxGrid
		$("#documentJqxgrid").jqxGrid({
			autoheight: true,
            //width: 650,
			source : dataAdapter,
			columnsresize : true,
			theme: 'ITGtheme',
			enabletooltips: true,
	        columnsresize: true,
	        columnsreorder: true,
	        rowsheight: 50,
			columns : [
						{ text: 'Description', datafield: 'description', filtertype: 'input', width: '25%', align: 'center'},
						{ text: 'Data Type', datafield: 'dataType', filtertype: 'input', width: '25%', align: 'center'},
						{ text: 'Data Length', datafield: 'dataLength', filtertype: 'input', width: '25%', align: 'center'},
						{ text: 'Is Mandatory', datafield: 'isMandatory', filtertype: 'input', width: '25%', align: 'center'}
					  ]
		});
		
	});

	$('#closeBtn').click(function() {
		_paq.push(['trackEvent', 'DocumentLibrary', 'Close','Closing document audit view']);
		console.log("close button clicked");
		window.close();
	});	
</script>


