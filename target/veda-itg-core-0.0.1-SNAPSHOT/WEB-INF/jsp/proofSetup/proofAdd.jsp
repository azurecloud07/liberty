<%@page import="com.viteos.itg.constant.ITGConstant"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<spring:message code="save.label" var="saveLabel" />
<spring:message code="cancel.label" var="cancelLabel" />
<spring:message code="proofSetup.proofName.label" var="proofNameLabel" />
<spring:message code="proofSetup.select.label" var="selectLabel" />
<spring:message code="proofSetup.documentName.label" var="documentNameLabel" />

<spring:message code="kycSubject.counterPartyType.label" var="counterPartyTypeLabel" />

<spring:message code="app.kycMasterMenuName" var="kycMasterMenuName" />

<c:set var="counterPartyName" value="<%= ITGConstant.COUNTER_PARTY_NAME%>" />
<c:set var="counterPartyShortCode" value="<%= ITGConstant.COUNTER_PARTY_SHORT_CODE%>" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="maxLength255" value="<%= ITGConstant.MAX_LENGTH_255%>" />

<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar search-page-bar">
			<ul class="page-breadcrumb pull-right">
				<li><a class="cancel redirect-dashboard"><i class="fa fa-home"></i> Home <i class="fa fa-angle-right"></i></a></li>
				<li> ${kycMasterMenuName} <i class="fa fa-angle-right"></i></li>
				<li><a class="cancel redirect-kyc/proof/search"> Proof Setup <i class="fa fa-angle-right"></i></a></li>
				<li>Add</li>
			</ul>
			<!-- <h4>&nbsp;Proof Setup</h4> -->
			<span class="header-scope">&nbsp;Proof Setup</span>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="portlet-body form">
					<div class="pull-right">

						<button type="button" id="saveButton" class="btn-itg btn btn-sm grey-gallery"><img src="/digiKYC/assets/global/img/save.png" /> ${saveLabel} </button>

						<button type="button" id="cancelButton" class="btn-itg btn btn-sm grey-gallery"><img src="/digiKYC/assets/global/img/clear.png" /> ${cancelLabel} </button>
					</div>
					<div class="clearfix margin-bottom-5"></div>
				</div>
			</div>
		</div>

		<form:form action="${contextPath}/kyc/proof/add" method="POST"
			id="frm" role="form"
			class="horizontal-form uk-form bt-flabels js-flabels"
			data-parsley-validate="true" modelAttribute="proofMasterBO"
			data-parsley-errors-messages-disabled="true">
			<div class="row">
				<div class="col-md-3">
					<div class="bt-form__wrapper">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">${proofNameLabel}</label>
								<form:input type="text" maxlength="${maxLength255}" path="proofName" id="proofNameId"
									class="form-control field-background textRequired"
									data-parsley-required="true" placeholder="${proofNameLabel}" />
								<span class="bt-flabels__error-desc">Required</span>
							</div>
							<form:errors path="proofName" cssClass="help-block error" />
						</div>
					</div>
				</div>
				<div class="col-md-3">
                   <div class="bt-form__wrapper">
                      <div class="form-group uk-width-1-1">
                         <div class="bt-flabels__wrapper">
                            <label class="parsley_hide">${counterPartyTypeLabel}</label>
                            <div class="field-background">
                               <form:select path="typeOfCounterpartyCode" class="form-control select2me select" multiple="multiple" placeholder="${counterPartyTypeLabel}" data-parsley-required="true">
                                  <c:if test="${counterPartyData != null && counterPartyData.length() > 0}">
                                     <c:forEach begin="0" end="${counterPartyData.length() -1}" var="index">
                                        <form:option  value="${counterPartyData.get(index).get(counterPartyShortCode)}">${counterPartyData.get(index).get(counterPartyName)}</form:option>
                                     </c:forEach>
                                  </c:if>
                               </form:select>
                            </div>
                            <span class="bt-flabels__error-desc_select">Required</span>
                         </div>
                         <form:errors path="typeOfCounterpartyCode" cssClass="help-block error" />
                      </div>
                   </div>
                </div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div id="divCheckProofName"></div>
				</div>
			</div>
			<%-- <form:input type="hidden" path="proofId" value="${proofId}" /> --%>
			<c:choose>
            <c:when test="${not empty(proofMasterBO.documentList)}"> 
			
			<div class="row">
				<div class="col-md-6 kyc-scroll-row" id="tableContainer">
					<table class="table table-bordered table-striped table-condensed"
						id="documentTable">
						<thead>
							<tr>
								<th width="10%">${selectLabel}</th>
								<th width="60%">${documentNameLabel}</th>
								<th width="30%">${counterPartyTypeLabel}</th>
							</tr>
						</thead>
						<tbody id="tbody">
							<c:if
								test="${proofMasterBO.documentList != null && proofMasterBO.documentList.size() > 0}">
								<c:forEach var="documentObject" varStatus="status"
									items="${proofMasterBO.documentList}">
									<tr>
										<td>
											<c:choose>
												<c:when
													test="${documentObject.isDocumentSelected}">
													<form:checkbox path="documentList[${status.index}].isDocumentSelected" checked="checked" value="true" />
												</c:when>
												<c:otherwise>
													<form:checkbox path="documentList[${status.index}].isDocumentSelected" value="false" />
												</c:otherwise>
											</c:choose>
											<form:hidden path="documentList[${status.index}].documentId" class="selectCheckBox" value="${documentObject.documentId}" />
											<form:hidden path="documentList[${status.index}].isPassport" value="${documentObject.isPassport}" />
										</td>
										<td><input type="hidden"
											id="document_name_${documentObject.documentId}"
											value="${documentObject.documentName}" />${documentObject.documentName}</td>
										<td>
											<c:forEach items="${documentObject.typeOfCounterpartyName}" var="typeOfCounterpartyName" varStatus="loop">
											    ${typeOfCounterpartyName}
											   <c:if test="${!loop.last}">,</c:if>
											</c:forEach>
										</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
			</c:when>
			<c:otherwise>
				<div class="row">
					<div class="col-md-12">
						<div  style="padding: 9px;"><font color="red"><i class="fa fa-warning"></i>&nbsp; No document is setup !</font> <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
						</div>								
					</div>
				</div>
			</c:otherwise>  
		</c:choose> 
		</form:form>
		<div class="clearfix margin-bottom-20"></div>
		<div class="clearfix margin-bottom-20"></div>
	</div>
</div>

<script>
	
	jQuery(document).ready(function() {
		jQuery("#master").addClass("active");
		jQuery("#subject").remove("active");
		jQuery("#dashboard").remove("active");
	});
	
	$("#typeOfCounterpartyCode").change(function(){
		var counterPartyType = $(this).val();
		ajaxCallBack("GET", $("#commonContextPathId").val() + "/kyc/proof/filter?counterPartyType="+counterPartyType, "","json", function(response) {
			var htmlElement = "";
			for(var i=0;i<response.length;i++){
				var documentObject = response[i];
				var typeOfCounterpartyName = "";
				if(documentObject.typeOfCounterpartyName != 'undefined' && documentObject.typeOfCounterpartyName != undefined)
					typeOfCounterpartyName = documentObject.typeOfCounterpartyName;
				htmlElement += "<tr><td><input type='checkbox' name='documentList["+i+"].isDocumentSelected' id='documentList"+i+".isDocumentSelected' value='true' /><input type='hidden' id='documentList"+i+".documentId' name='documentList["+i+"].documentId' class='selectCheckBox' value="+documentObject.documentId+" /></td>"+
					"<td><input type='hidden' name='_documentList["+i+"].isDocumentSelected' value='on' /><input type='hidden' id='document_name_" + documentObject.documentId +"' value='"+documentObject.documentName+"'/>"+documentObject.documentName+"</td><td>"+typeOfCounterpartyName+"</td></tr>";
			}
			$("#tbody").html(htmlElement);
			pcframework.initUniform();
		});
	});
	
	$('#saveButton').click(function() {
		$('#frm').parsley().validate();
		var response = $('#frm').parsley().isValid();
		if(response){
			var docCount = 0;
			$('#documentTable').find('input[type="checkbox"]:checked').each( function() {
				docCount++;
			});

			if(docCount==0){
				bootbox.alert("Please Select Atleast One Document!", function(){});
				return false;
			}
			
			var proofName = $("#proofNameId").val();
			var templateObject = {};
			templateObject["proofName"] = proofName;
		    ajaxCallBack("POST", $("#commonContextPathId").val() + "/kyc/proof/search", templateObject,"text", function(response) {
		    	$("#divCheckProofName").html("");
				if(response != "" && response != null && response == "exist"){
					var checkDiv = '<div class="alert alert-danger alertHide" style="padding: 9px;"><i class="fa fa-warning"></i>&nbsp;'+
						'Proof name already in use !<button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button></div>';
					$("#divCheckProofName").html(checkDiv);
				} else {
					bootbox.confirm({
				        message: "Are you sure you want to save?",
				        buttons: {
				            confirm: {
				                label: ' Yes',
				                className: 'alert-yes btn btn-sm grey-gallery'
				            },
				            cancel: {
				                label: ' No',
				                className: 'alert-no btn btn-sm btn-default'
				            }
				        },
				        callback: function (result) {
				        	if(result){
				        		_paq.push(['trackEvent', 'Proof', 'Save','Saving proof']);
				        		$('#frm').submit();
				    			buffer();
				        	}
				        }
					});
				}
			});
		}
	});
	
	$('#cancelButton').click(function() {
		bootbox.confirm({
	        message: "Are you sure you want to cancel?",
	        buttons: {
	            confirm: {
	                label: ' Yes',
	                className: 'alert-yes btn btn-sm grey-gallery'
	            },
	            cancel: {
	                label: ' No',
	                className: 'alert-no btn btn-sm btn-default'
	            }
	        },
	        callback: function (result) {
	        	if(result){
	        		_paq.push(['trackEvent', 'Proof', 'Cancel','Cancel saving proof']);
	        		location.href = "${contextPath}/kyc/proof/search";
					buffer();
	        	}
	        }
		});
	});
</script>