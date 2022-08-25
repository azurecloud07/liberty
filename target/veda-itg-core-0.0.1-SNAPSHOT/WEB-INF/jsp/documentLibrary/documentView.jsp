<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<spring:message code="kycSubject.counterPartyTypeView.label" var="counterPartyTypeViewLabel" />
<spring:message code="documentLibrary.documentName.label" var="documentNameLabel" />
<spring:message code="documentLibrary.documentCode.label" var="documentCodeLabel" />
<spring:message code="documentLibrary.isPassportView.label" var="isPassportViewLabel" />
<spring:message code="close.label" var="closeLabel" />
<spring:message code="cancel.label" var="cancelLabel" />
<spring:message code="createdBy.label" var="createdByLabel" />
<spring:message code="createdDate.label" var="createdDateLabel" />
<spring:message code="modifiedBy.label" var="modifiedByLabel" />
<spring:message code="modifiedDate.label" var="modifiedDateLabel" />

<spring:message code="app.kycMasterMenuName" var="kycMasterMenuName" />
<spring:message code="app.documentIsPassport" var="documentIsPassport" />

<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar search-page-bar">
			<c:choose>
				<c:when test="${nextStates != null && nextStates.length() > 0}">
             		<ul class="page-breadcrumb pull-right">
						<li><a class="cancel redirect-dashboard"><i class="fa fa-home"></i> Home <i class="fa fa-angle-right"></i></a></li>
            			<li> ${kycMasterMenuName} <i class="fa fa-angle-right"></i></li>
            			<li><a class="cancel redirect-kyc/document/search"> Document Library <i class="fa fa-angle-right"></i></a></li>
						<li>View</li>
					</ul>	
             	</c:when>
             	<c:otherwise>
             		<ul class="page-breadcrumb pull-right">
						<li><i class="fa fa-home"></i> Home  <i class="fa fa-angle-right"></i></li>
						<li> ${kycMasterMenuName} <i class="fa fa-angle-right"></i></li>
			            <li>Document Library<i class="fa fa-angle-right"></i></li>
						<li>View</li>
					</ul>
            	</c:otherwise>
            </c:choose>
			<span class="header-scope">&nbsp;Document Library</span>
		</div>

		<form action="#" method="POST" id="frm" role="form" class="horizontal-form uk-form bt-flabels js-flabels" data-parsley-validate="true" data-parsley-errors-messages-disabled="true">
		
		<textarea id="workflowId" style="display:none;"></textarea>
		<textarea id="stateId" style="display:none;"></textarea>
		<textarea id="masterId" style="display:none;"> ${masterId} </textarea>
		
			<div class="row">
				<div class="col-md-12">
					<div class="portlet-body form">
						<div class="pull-right">
						<button type="button" class="btn-remark btn-link" data-toggle="modal" data-target="#remarkHistoryModalId" onclick="_paq.push(['trackEvent', 'DocumentLibrary', 'ViewRemarks','Viewing remark on view document']);" >View Remarks</button>
							<c:choose>
			                    <c:when test="${nextStates != null && nextStates.length() > 0}">
			                    	<c:forEach begin="0" end="${nextStates.length() -1}" var="index">
			                    		<button type="button" class="btn-itg btn btn-sm grey-gallery" data-toggle="modal" data-target="#remarkModalId" onclick="setUpdateWorkflowDetails('${workflowId}', '${nextStates.get(index).getString('State')}');">
				                            	${nextStates.get(index).getString('iconImage')} ${nextStates.get(index).getString('Label')}
				                        </button>
			                    	</c:forEach>
		                    		<button type="button" id="cancelBtn" class="btn-itg btn btn-sm grey-gallery"><img src="/digiKYC/assets/global/img/clear.png" /> ${cancelLabel} </button>
			                    </c:when>
			                    <c:otherwise>
			                    	<button type="button" id="closeButton" class="btn-itg btn btn-sm grey-gallery"><img src="/digiKYC/assets/global/img/clear.png" /> ${closeLabel} </button>
		                    	</c:otherwise>
		                    </c:choose>
						</div>
						<div class="clearfix margin-bottom-5"></div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12">
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
			</div>
			<div id="rootwizard" class="row">
				<div class="col-md-12">
					<div class="col-md-2 bold h5">${documentNameLabel}</div>
					<div class="col-md-3 h5">
						<c:if test="${documentName != null}">
							${documentName} 
						</c:if>
					</div>
					<div class="col-md-2 bold h5">${documentCodeLabel}</div>
					<div class="col-md-3 h5">
						<c:if test="${documentLibraryBO != null && documentLibraryBO.documentCode != null}">
							<span>${documentLibraryBO.documentCode}</span>
						</c:if>
					</div>
				</div>
			</div>
			
			<c:if test="${documentIsPassport == 'true'}">
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-2 bold h5">${isPassportViewLabel}</div>
						<div class="col-md-3 h5">
							<c:if test="${documentLibraryBO != null && documentLibraryBO.isPassport != null}">
								<span>${documentLibraryBO.isPassport}</span>
							</c:if>
						</div>
					</div>
				</div>
			</c:if>
			
			<div class="row">
				<div class="col-md-12">
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
			</div>
			<div class="row">
				<div class="col-md-12">
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
			<textarea id="documentViewJson" style="display: none;">${documentViewData}</textarea>
			<div class="row">
				<div class="col-md-12">
					<div id='jqxWidget'>
						<div id="documentJqxgrid"></div>
					</div>
				</div>
			</div>
			<div id="remarkModalId" class="modal fade modal-xl" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
				<div class="modal-dialog modal-md">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Remark</h4>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<div class="bt-flabels__wrapper">
											<label class="parsley_hide">Remark</label>
											<textarea name="remark" id="remarkContent" rows="15" style="height: 140px;" data-parsley-required="true" placeholder="Remark"></textarea>
											<span class="bt-flabels__error-desc">Required</span>
										</div>
									</div>
								</div>												
						   </div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn-modal-cls btn btn-sm grey-gallery" onclick="updateWorkflow('${contextPath}')">
								<img src="/digiKYC/assets/global/img/submit.png" /> Submit
							</button>
							<button type="button" class="btn-modal-cls btn btn-sm default" data-dismiss="modal">
	                            <img src="/digiKYC/assets/global/img/clear.png" /> Close
	                        </button>
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
		</form>
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
	        columnsreorder: true,
	        rowsheight: 50,
			columns : [
						{ text: 'Description', datafield: 'description', filtertype: 'input', width: '25%', align: 'center'},
						{ text: 'Data Type', datafield: 'dataType', filtertype: 'input', width: '25%', align: 'center'},
						{ text: 'Data Length', datafield: 'dataLength', filtertype: 'input', width: '25%', align: 'center'},
						{ text: 'Is Mandatory', datafield: 'isMandatory', filtertype: 'input', width: '25%', align: 'center'}
					  ]
		});
		
		
		/* if($("#remarkHistoryViewJson").length != 0 && $("#remarkHistoryViewJson").val() != null && $("#remarkHistoryViewJson").val() != ""){
			var remarkHistorydata = $("#remarkHistoryViewJson").val();
			console.log("remarkHistorydata : " + JSON.stringify(remarkHistorydata));
			// prepare the remarkHistorydata
			var remarkHistorySource = {
				datatype : "json",
				localdata : remarkHistorydata,
				datafields : [ 
				               {name : 'remark',type : 'string'},
				               {name : 'createdDate',type : 'date'},
				               {name : 'createdBy',type : 'string'} 
				             ],
			};
			var remarkDataAdapter = new $.jqx.dataAdapter(remarkHistorySource);

			// Create jqxGrid
			$("#remarkHistoryJqxgrid").jqxGrid({
				autoheight: true,
		        width: 100,            
				source : remarkDataAdapter,
				columnsresize : true,
				theme: 'ITGtheme',
		        columnsreorder: true,
				columns : [
							{ text: 'Remark', 		datafield: 'remark', 		filtertype: 'input', width: '50%', align: 'center'},
							{ text: 'Remark Date', 	datafield: 'createdDate', 	filtertype: 'input', width: '25%', align: 'center'},
							{ text: 'Remark By', 	datafield: 'createdBy', 	filtertype: 'input', width: '25%', align: 'center'}
						  ]
			});			
		} */

		
	});

	$('#closeButton').click(function() {
		_paq.push(['trackEvent', 'DocumentLibrary', 'Close','Closing document view']);
	    console.log("Closing current window...");
	    window.close();
	});
	
	$('#cancelBtn').click(function() {
		_paq.push(['trackEvent', 'DocumentLibrary', 'Cancel','Cancel from approve']);
		location.href = "${contextPath}/dashboard";
	});

	
</script>