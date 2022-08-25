<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<spring:message code="kycSubject.counterPartyTypeView.label" var="counterPartyTypeViewLabel" />
<spring:message code="close.label" var="closeLabel" />
<spring:message code="cancel.label" var="cancelLabel" />
<spring:message code="proofSetup.proofDetails.label" var="proofDetailsLabel" />
<spring:message code="proofSetup.proofName.label" var="proofNameLabel" />
<spring:message code="proofSetup.proofCode.label" var="proofCodeLabel" />
<spring:message code="proofSetup.documentDetails.label" var="documentDetailsLabel" />
<spring:message code="proofSetup.documentName.label" var="documentNameLabel" />
<spring:message code="createdBy.label" var="createdByLabel" />
<spring:message code="createdDate.label" var="createdDateLabel" />
<spring:message code="modifiedBy.label" var="modifiedByLabel" />
<spring:message code="modifiedDate.label" var="modifiedDateLabel" />

<spring:message code="app.kycMasterMenuName" var="kycMasterMenuName" />

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="page-content-wrapper">
    <div class="page-content">
        <div class="page-bar search-page-bar">
            <c:choose>
				<c:when test="${nextStates != null && nextStates.length() > 0}">
             		<ul class="page-breadcrumb pull-right">
						<li><a class="cancel redirect-dashboard"><i class="fa fa-home"></i> Home <i class="fa fa-angle-right"></i></a></li>
            			<li> ${kycMasterMenuName} <i class="fa fa-angle-right"></i></li>
            			<li><a class="cancel redirect-kyc/proof/search"> Proof Setup <i class="fa fa-angle-right"></i></a></li>
						<li>View</li>
					</ul>	
             	</c:when>
             	<c:otherwise>
             		<ul class="page-breadcrumb pull-right">
						<li><i class="fa fa-home"></i> Home  <i class="fa fa-angle-right"></i></li>
						<li> ${kycMasterMenuName} <i class="fa fa-angle-right"></i></li>
			            <li> Proof Setup <i class="fa fa-angle-right"></i></li>
						<li>View</li>
					</ul>
            	</c:otherwise>
            </c:choose>
			<span class="header-scope">&nbsp;Proof Setup</span>
        </div>
        
		<form:form action="#" method="POST" id="frm" role="form" class="horizontal-form uk-form bt-flabels js-flabels" data-parsley-validate="true"
		modelAttribute="proofMasterBO" data-parsley-errors-messages-disabled="true">
		
		<textarea id="workflowId" style="display:none;"></textarea>
		<textarea id="stateId" style="display:none;"></textarea>
		<textarea id="masterId" style="display:none;"> ${proofMasterBO.id} </textarea>
		
			<div class="row">
	            <div class="col-md-12">
	                <div class="portlet-body form">
	                    <div class="pull-right">
	                    <button type="button" class="btn-remark btn-link" data-toggle="modal" data-target="#remarkHistoryModalId" onclick="_paq.push(['trackEvent', 'Proof', 'ViewRemarks','Viewing remark on view proof']);" >View Remarks</button>
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
					<div class="portlet-body">
						<div class="page-bar">
							<ul class="page-breadcrumb">
								<li><em><strong>${proofDetailsLabel}</strong></em></li>
							</ul>
						</div>
						
						<div class="row">
							<div class="col-md-12">
								<div class="col-md-2 bold h5">${counterPartyTypeViewLabel}</div>
								<div class="col-md-3 h5">
									<c:if test="${proofMasterBO != null}">
										<c:forEach items="${proofMasterBO.typeOfCounterpartyName}" var="typeOfCounterpartyName" varStatus="loop">
										    ${typeOfCounterpartyName}
										   <c:if test="${!loop.last}">,</c:if>
										</c:forEach>
									</c:if>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-12">
								<div class="col-md-2 bold h5">
									${proofNameLabel}
								</div>
								<c:if test="${proofMasterBO != null}"> 
									<div class="col-md-3 h5" id="proofName" style="">${proofMasterBO.proofName}</div>
								</c:if>
								<div class="col-md-2 bold h5">
									${proofCodeLabel}
								</div>
								<c:if test="${proofMasterBO != null}">
									<div class="col-md-3 h5" id="proofCode" style="">${proofMasterBO.proofCode}</div>
								</c:if>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="col-md-2 bold h5">${createdByLabel}</div>
								<div class="col-md-3 h5">
									<c:if test="${proofMasterBO != null && proofMasterBO.createdBy != null}">
										<span>${proofMasterBO.createdBy}</span>
									</c:if>
								</div>
								<div class="col-md-2 bold h5">${createdDateLabel}</div>
								<div class="col-md-3 h5">
									<c:if test="${proofMasterBO != null && proofMasterBO.createdDate != null}">
										<fmt:formatDate pattern="dd-MMM-yyyy" value="${proofMasterBO.createdDate}" />
									</c:if>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="col-md-2 bold h5">${modifiedByLabel}</div>
								<div class="col-md-3 h5">
									<c:if test="${proofMasterBO != null && proofMasterBO.modifiedBy != null}">
										<span>${proofMasterBO.modifiedBy}</span>
									</c:if>
								</div>
								<div class="col-md-2 bold h5">${modifiedDateLabel}</div>
								<div class="col-md-3 h5">
									<c:if test="${proofMasterBO != null && proofMasterBO.modifiedDate != null}">
										<fmt:formatDate pattern="dd-MMM-yyyy" value="${proofMasterBO.modifiedDate}" />
									</c:if>
								</div>
							</div>
						</div>
						<div class="clearfix margin-bottom-10"></div>
						<div class="page-bar">
							<ul class="page-breadcrumb">
								<li><em><strong>${documentDetailsLabel}</strong></em></li>
							</ul>
						</div>
						<textarea id="proofViewJson" style="display: none;">${proofViewData}</textarea>
						<div id="proofDetails"></div>
					</div>
				</div>
			</div>
			<div class="clearfix margin-bottom-10"></div>
			<div class="clearfix margin-bottom-10"></div>
			<div class="clearfix margin-bottom-10"></div>
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
		</form:form>
		
	</div>
</div>

<script>
	$(document).ready(function(){
		
		jQuery("#master").addClass("active");
		jQuery("#subject").remove("active");
		jQuery("#dashboard").remove("active");
		
		var data = $("#proofViewJson").val();
		var proofDetails = JSON.parse(data);
		console.log("proofDetails :: " + JSON.stringify(proofDetails));
		
		var documentDetails = proofDetails.documentList;
		console.log("documentDetails :: " + JSON.stringify(documentDetails));
		console.log("documentDetails.length :: " + documentDetails.length);
	
		// Creating Document/s And table with details
		var html='';
		for(var i = 0; i < documentDetails.length; i++) {
			var count = i + 1;
			var documentJson = documentDetails[i];
			console.log(i + " : documentJson :: " + JSON.stringify(documentJson));
			
			if(i==0){
				html += '<div class="form-group" style="margin-left: -1px;"><div class="col-md-2 bold h5">Document Name</div><div class="col-md-3 h5">'+documentJson.documentName+'</div></div><div class="clearfix margin-bottom-20"></div><div class="row"><div class="col-md-11 col-md-offset-1"><div id="jqxWidget"><div id="proofJqxgrid' + count + '"></div></div></div></div>';
			}else{			
				html += '<hr/><div class="form-group" style="margin-left: -1px;"><div class="col-md-2 bold h5">Document Name</div><div class="col-md-3 h5">'+documentJson.documentName+'</div></div><div class="clearfix margin-bottom-20"></div><div class="row"><div class="col-md-11 col-md-offset-1"><div id="jqxWidget"><div id="proofJqxgrid' + count + '"></div></div></div></div>';
			}
	
			$("#proofDetails").html(html);
		}
	
		for(var i = 0; i < documentDetails.length; i++) {
			var count = i + 1;
			var documentJson = documentDetails[i];
			console.log(i + " : documentJson :: " + JSON.stringify(documentJson));
			
			// prepare the data
			var source = {
				datatype : "json",
				localdata : documentJson.details,
				datafields : [
				               {name : 'description',type : 'String'},
				               {name : 'dataType',type : 'string'},
				               {name : 'dataLength',type : 'string'},
				               {name : 'isMandatory',type : 'string'}
				             ],
			};
			var dataAdapter = new $.jqx.dataAdapter(source);
			
			// Create jqxGrid
			$("#proofJqxgrid"+count).jqxGrid({
				source : dataAdapter,
				autoloadstate : false,
				autosavestate : false,
				theme: 'ITGtheme',
				autoheight: true,
				selectionmode : 'multiplecellsextended',
				columnsResize : true,
				enabletooltips: true,
		        columnsreorder: true,
		        rowsheight: 50,
				columns : [
							{ text: 'Description', datafield: 'description', filtertype: 'input', width: '25%', align: 'center'},
							{ text: 'Data Type', datafield: 'dataType', filtertype: 'input', width: '25%', align: 'center'},
							{ text: 'Data Length', datafield: 'dataLength', filtertype: 'input', width: '25%', align: 'center'},
							{ text: 'Is Mandatory', datafield: 'isMandatory', filtertype: 'input', width: '25%', align: 'center'}
				          ],
			});
		}
	
	});
	
	$('#closeButton').click(function() {
		_paq.push(['trackEvent', 'Proof', 'Close','Closing proof view']);
	    console.log("Closing current window...");
	    window.close();
	});
	
	$('#cancelBtn').click(function() {
		_paq.push(['trackEvent', 'Proof', 'Cancel','Cancel from approve']);
		location.href = "${contextPath}/dashboard";
	});
	/* function updateWorkflow(contextPath, workflowId, state) {
		$('#frm').append('<input type="hidden" name="workflowId" value="' + workflowId + '" />');
		$('#frm').append('<input type="hidden" name="state" value="' + state + '" />');
		$('#frm').prop("action", contextPath + "/dashboard/workflow/update");
		$('#frm').prop("method", "post");
		$('#frm').submit();
		buffer();
	} */
	
</script>