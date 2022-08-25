<%@page import="com.viteos.itg.constant.ITGConstant"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<spring:message code="save.label" var="saveLabel" />
<spring:message code="cancel.label" var="cancelLabel" />
<spring:message code="kycTemplate.templateName.label" var="templateNameLabel" />
<spring:message code="kycTemplate.typeOfCounterParty.label" var="typeOfCounterPartyLabel" />
<spring:message code="kycTemplate.investorSubType.label" var="investorSubTypeLabel" />
<spring:message code="kycTemplate.countryOfResidence.label" var="countryOfResidenceLabel" />
<spring:message code="kycTemplate.riskCategory.label" var="riskCategoryLabel" />
<spring:message code="kycTemplate.proofMapping.label" var="proofMappingLabel" />
<spring:message code="kycTemplate.exemptCategory.label" var="exemptCatLabel" />

<spring:message code="app.isRelationList" var="isRelationList" />
<spring:message code="app.isExemptCategory" var="exemptCategory" />

<!--Flags for drop down menu -->
<spring:message code="app.isSubTypeOfCounterparty" var="isSubTypeOfCounterparty" />

<spring:message code="app.kycMasterMenuName" var="kycMasterMenuName" />

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="counterPartyName" value="<%= ITGConstant.COUNTER_PARTY_NAME%>" />
<c:set var="jurisdictionName" value="<%= ITGConstant.JURISDICTION_NAME%>" />
<c:set var="riskCategoryName" value="<%= ITGConstant.RISK_CATEGORY_NAME%>" />
<c:set var="counterPartyShortCode" value="<%= ITGConstant.COUNTER_PARTY_SHORT_CODE%>" />
<c:set var="jurisdictionShortCode" value="<%= ITGConstant.JURISDICTION_SHORT_CODE%>" />
<c:set var="riskCategoryShortCode" value="<%= ITGConstant.RISK_CATEGORY_SHORT_CODE%>" />
<c:set var="maxLength255" value="<%= ITGConstant.MAX_LENGTH_255%>" />

<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar search-page-bar">
			<ul class="page-breadcrumb pull-right">
				<li><a class="cancel redirect-dashboard"><i class="fa fa-home"></i> Home <i class="fa fa-angle-right"></i></a></li>
				<li> ${kycMasterMenuName} <i class="fa fa-angle-right"></i></li>
				<li><a class="cancel redirect-kyc/template/search"> KYC Documents Template <i class="fa fa-angle-right"></i></a></li>
				<li>Add</li>
			</ul>
			<span class="header-scope">&nbsp;KYC Documents Template</span>
		</div>

		<div class="row">
			<div class="col-md-6">
				<div id="divCheckKYCTemplate"></div>
			</div>
			<div class="col-md-6">
				<div class="portlet-body form">
					<div class="pull-right">

						<button type="button" id="saveButton" disabled="disabled" class="btn-itg btn btn-sm grey-gallery"><img src="/digiKYC/assets/global/img/save.png" />&nbsp;${saveLabel} </button>

						<button type="button" id="cancelButton" class="btn-itg btn btn-sm grey-gallery"><img src="/digiKYC/assets/global/img/clear.png" />&nbsp;${cancelLabel} </button>
					</div>
					<div class="clearfix margin-bottom-5"></div>
				</div>
			</div>
		</div>
		<hr>
		<form:form action="${contextPath}/kyc/template/add" method="POST" id="frm" role="form"
			class="horizontal-form uk-form bt-flabels js-flabels"
			data-parsley-validate="true" modelAttribute="kycTemplateBO"
			data-parsley-errors-messages-disabled="true">
			<input type="hidden" id="instanceName" value="${instance}" />
			<textarea id="investorSubTypeData" style="display:none;">${investorSubTypeData}</textarea>
			
			<input type="hidden" id="isRelationList" value="${isRelationList}" />
            <input type="hidden" id="exemptCategory" value="${exemptCategory}" />
            <input type="hidden" id="isSubTypeOfCounterparty" value="${isSubTypeOfCounterparty}" />
			
			<div class="row">
				<div class="col-md-3">
					<div class="bt-form__wrapper">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">${templateNameLabel}</label>
								<form:input path="templateName" type="text" id="templateName" class="form-control field-background" placeholder="${templateNameLabel}" data-parsley-required="true" maxlength="${maxLength255}" data-parsley-id="4" />
								<span class="bt-flabels__error-desc">Required</span>
							</div>
							<form:errors path="templateName" cssClass="help-block error" />
						</div>
					</div>
				</div>
				
				<div class="col-md-3">
					<div class="bt-form__wrapper">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">${typeOfCounterPartyLabel}</label>
								<div class="field-background">
									<form:select id="typeOfCounterParty" path="typeOfCounterPartyCode" class="form-control select2me" data-parsley-required="true" placeholder="${typeOfCounterPartyLabel}">
										<option value=""></option>
										<c:if test="${counterPartyData != null && counterPartyData.length() > 0}">
											<c:forEach begin="0" end="${counterPartyData.length() -1}" var="index">
												<form:option value="${counterPartyData.get(index).get(counterPartyShortCode)}">${counterPartyData.get(index).get(counterPartyName)}</form:option>
											</c:forEach>
										</c:if>
									</form:select>
								</div>
								<span class="bt-flabels__error-desc_select">Required</span>
							</div>
							<form:errors path="typeOfCounterPartyCode" cssClass="help-block error" />
						</div>
					</div>
				</div>
				<c:if test="${isSubTypeOfCounterparty == 'true'}">
					<div class="col-md-3">
						<div class="bt-form__wrapper">
							<div class="form-group uk-width-1-1">
								<div class="bt-flabels__wrapper">
									<label class="parsley_hide">${investorSubTypeLabel}</label>
									<div class="field-background">
										<form:select id="subTypeOfCounterpartyCode" path="subTypeOfCounterpartyCode" multiple="multiple" class="form-control select2me" data-parsley-required="true" placeholder="${investorSubTypeLabel}">
											<option value=""></option>
											<%-- <c:if test="${investorSubTypeData != null && investorSubTypeData.length() > 0}">
												<c:forEach begin="0" end="${investorSubTypeData.length() -1}" var="index">
													<form:option value="${investorSubTypeData.get(index).get(CounterPartySubType_shortcode)}">${investorSubTypeData.get(index).get(CounterPartySubtype_Name)}</form:option>
												</c:forEach>
											</c:if> --%>
										</form:select>
									</div>
									<span class="bt-flabels__error-desc_select">Required</span>
								</div>
								<form:errors path="subTypeOfCounterpartyCode" cssClass="help-block error" />
							</div>
						</div>
					</div>
				</c:if>
				
				<div class="col-md-3">
					<div class="bt-form__wrapper">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">${countryOfResidenceLabel}
									</label>
								<div class="field-background">
									<form:select id="countryOfResidence" path="countryOfResidenceCode" class="form-control select2me" data-parsley-required="false" placeholder="${countryOfResidenceLabel}">
									<option value=""></option>
										<c:if test="${jurisdictionData != null && jurisdictionData.length() > 0}">
											<c:forEach begin="0" end="${jurisdictionData.length() -1}" var="index">
												<form:option value="${jurisdictionData.get(index).get(jurisdictionShortCode)}">${jurisdictionData.get(index).get(jurisdictionName)}</form:option>
											</c:forEach>
										</c:if>
									</form:select>
								</div>								
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-md-3">
					<div class="bt-form__wrapper">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">${riskCategoryLabel}</label>
								<div class="field-background">
									<form:select id="riskCategory" path="riskCategoryCode"
										class="form-control select2me" data-parsley-required="false"
										placeholder="${riskCategoryLabel}">
										<option value=""></option>
										<c:if test="${riskCategoryData != null && riskCategoryData.length() > 0}">
											<c:forEach begin="0" end="${riskCategoryData.length() -1}" var="index">
												<form:option value="${riskCategoryData.get(index).get(riskCategoryShortCode)}">${riskCategoryData.get(index).get(riskCategoryName)}</form:option>
											</c:forEach>
										</c:if>
									</form:select>
								</div>								
							</div>
						</div>
					</div>
				</div>
				
			</div>
			<!-- End Row -->
			<c:if test="${isRelationList == 'true'}">
				<div class="row">
					<div id='content'>
				        <div class="col-lg-3 col-md-3 col-sm-3">
			            	<div id='jqxWidget1'>
			            		<label>Available Roles</label>
								<div style="" id="listBoxA"></div>
							</div>	
						</div>
						<div style="margin-left:30px;" class="col-lg-1 col-md-1 col-sm-1">
							<input type='button' class="btnListBox" style="display:none;margin-top:150px;" id='btnRight' value ='  >  '/><br><br>
							<input type='button'class="btnListBox" style="display:none;" id='btnLeft' value ='  <  '/>
						</div>
				        <div class="col-lg-3 col-md-3 col-sm-3">
							<div id='jqxWidget2'>
								<label style="">Selected Roles</label>
								<form:hidden path="roleCode" />
								<form:hidden path="roleName" />
								<div style="" id="listBoxB"></div>
							</div>
				        </div>
				        <c:if test="${exemptCategory == 'true'}">
				        	<div class="col-lg-2 col-md-2 col-sm-2" style="margin-left: 65px; margin-top: 30px;">
	                        <form:checkbox path="isExemptCategory" />
	                        <label class="control-label">${exemptCatLabel}</label>
	                    </div>
				        </c:if>
				    </div>
				</div>
			</c:if>
			
			<!-- End Row -->

			<input type="hidden" id="legalEntityIdList" name="legalEntityIdList" />
			<input type="hidden" id="proofIdList" name="proofIdList" />
			<c:choose>
            <c:when test="${not empty(kycTemplateBO.kycTemplateDetailBO)}">
			<c:if test="${kycTemplateBO.kycTemplateDetailBO != null && kycTemplateBO.kycTemplateDetailBO.size() > 0}">
				<div class="row">
					<div class="col-md-12">
						<div class="portlet-body">
							<div class="page-bar">
								<ul class="page-breadcrumb">
									<li><em><strong>${proofMappingLabel}</strong></em></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="kycProofList" style="" id="proofList">
							<div class="table-scrollable" style="!important;">
								<table class="table table-bordered table-hover" id="kycProofTable">
									<!-- <thead class="portlet box">
										<tr>
											<th width="20%">Proof Name</th>
											<th>Document Name</th>
										</tr>
									</thead> -->
									<tbody id="tbody">
										<c:forEach items="${kycTemplateBO.kycTemplateDetailBO}" var="kycTemplateDetail" varStatus="proofStatus">
											<tr>
												<td width="20%">
													<c:choose>
														<c:when test="${kycTemplateDetail.isProofSelected}">
															<form:hidden path="kycTemplateDetailBO[${proofStatus.index}].isProofSelected" />
															<input type="checkbox" checked id="${kycTemplateDetail.proofId}" name="kycTemplateDetailBO[${proofStatus.index}].proofId" value="${kycTemplateDetail.proofId}" onclick="javascript:isChecked(this.id,this.value,'${proofStatus.index}');" />
															${kycTemplateDetail.proofName}
															
															</td>
															<td>
																<div id="kycDoc_${kycTemplateDetail.proofId}" >
														</c:when>
														<c:otherwise>
															<form:hidden path="kycTemplateDetailBO[${proofStatus.index}].isProofSelected" />
															<input type="checkbox" id="${kycTemplateDetail.proofId}" name="kycTemplateDetailBO[${proofStatus.index}].proofId" value="${kycTemplateDetail.proofId}" onclick="javascript:isChecked(this.id,this.value,'${proofStatus.index}');" />
															${kycTemplateDetail.proofName}
															</td>
															<td>
																<div id="kycDoc_${kycTemplateDetail.proofId}" style="display: none;">
														</c:otherwise>
													</c:choose>
												
														<table class="table table-bordered table-hover">
															<thead class="portlet box">
																<tr>
																	<th width="40%">Document Name</th>
																	<th width="30%" style="text-align: center;">Photocopy</th>
																	<th width="30%" style="text-align: center;">CTC</th>
																	<!-- <th width="20%" style="text-align: center;">Original</th> -->
																</tr>
															</thead>
															<tbody>
																<c:if test="${kycTemplateDetail.kycTemplateDocumentDetailBO != null && kycTemplateDetail.kycTemplateDocumentDetailBO.size() > 0}">
																	<c:forEach items="${kycTemplateDetail.kycTemplateDocumentDetailBO}" var="kycTemplateDocumentDetail" varStatus="docStatus">
																		<tr>
																			<td width="40%">
																				<form:hidden path="kycTemplateDetailBO[${proofStatus.index}].kycTemplateDocumentDetailBO[${docStatus.index}].documentId" value="${kycTemplateDocumentDetail.documentId}" />
																				<form:hidden path="kycTemplateDetailBO[${proofStatus.index}].kycTemplateDocumentDetailBO[${docStatus.index}].isPassport" value="${kycTemplateDocumentDetail.isPassport}" />
																				${kycTemplateDocumentDetail.documentName}
																			</td>
																			<td width="30%" align="center">
																				<c:choose>
																					<c:when test="${kycTemplateDocumentDetail.isPhotocopy}">
																						<form:checkbox checked="checked" path="kycTemplateDetailBO[${proofStatus.index}].kycTemplateDocumentDetailBO[${docStatus.index}].isPhotocopy" />
																					</c:when>
																					<c:otherwise>
																						<form:checkbox path="kycTemplateDetailBO[${proofStatus.index}].kycTemplateDocumentDetailBO[${docStatus.index}].isPhotocopy" />
																					</c:otherwise>
																				</c:choose>
																				<%-- <input type="checkbox" id="${proofMasterList.getJSONObject(index).getString('proofId')}_photocopy"/> --%>
																			</td>
																			<td width="30%" align="center">
																				<c:choose>
																					<c:when test="${kycTemplateDocumentDetail.isCTC}">
																						<form:checkbox checked="checked" path="kycTemplateDetailBO[${proofStatus.index}].kycTemplateDocumentDetailBO[${docStatus.index}].isCTC" />
																					</c:when>
																					<c:otherwise>
																						<form:checkbox path="kycTemplateDetailBO[${proofStatus.index}].kycTemplateDocumentDetailBO[${docStatus.index}].isCTC" />
																					</c:otherwise>
																				</c:choose>
																				<%-- <input type="checkbox" checked id="${proofMasterList.getJSONObject(index).getString('proofId')}_ctc" /> --%>
																			</td>
																			<%-- <td width="20%" align="center">
																				<c:choose>
																					<c:when test="${kycTemplateDocumentDetail.isOriginal}">
																						<form:checkbox checked="checked" path="kycTemplateDetailBO[${proofStatus.index}].kycTemplateDocumentDetailBO[${docStatus.index}].isOriginal" />
																					</c:when>
																					<c:otherwise>
																						<form:checkbox path="kycTemplateDetailBO[${proofStatus.index}].kycTemplateDocumentDetailBO[${docStatus.index}].isOriginal" />
																					</c:otherwise>
																				</c:choose> --%>
																				<%-- <input type="checkbox" checked id="${proofMasterList.getJSONObject(index).getString('proofId')}_original" /> --%>
																			<!-- </td> -->
																		</tr>														
																	</c:forEach>
																</c:if>
															</tbody>
														</table>
													</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</c:if>
 		</c:when>
		<c:otherwise>
			<div class="row">
				<div class="col-md-12">
					<div style="padding: 9px;"><font color="red"><i class="fa fa-warning"></i>&nbsp; No proof is setup !</font> <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
					</div>								
				</div>
			</div>
		</c:otherwise>  
	</c:choose> 
		</form:form>

		<div class="clearfix margin-bottom-10"></div>
		<div class="clearfix margin-bottom-10"></div>
		<div class="clearfix margin-bottom-10"></div>
	</div>
</div>

<script>
	var isSubTypeOfCounterparty;
	var isRelationList;
	var exemptCategory;
	jQuery(document).ready(function() {
		jQuery("#master").addClass("active");
		jQuery("#subject").remove("active");
		jQuery("#dashboard").remove("active");
		
		var instanceName = $("#instanceName").val();
		isSubTypeOfCounterparty = $("#isSubTypeOfCounterparty").val();
		isRelationList = $("#isRelationList").val();
		exemptCategory = $("#exemptCategory").val();
		
		if(isRelationList == 'true'){
        	var data1 = [];
    		var responseObject= ${roleMasterData};
    		for(var i=0;i<responseObject.length;i++){
    			data1.push({"code":responseObject[i].LegalEntityRoleType_shortcode,"name":responseObject[i].Legal_Entity_Type_Name});
    		}
           	var data2 = [];
            // Create a jqxListBox
            $("#listBoxA").jqxListBox({ allowDrop: true, allowDrag: true, source: data1,width:300, height: 300, 
                filterable: true, selectedIndex: 0,displayMember: "name", 
                valueMember: "code",
            });
            
            $("#listBoxB").jqxListBox({ allowDrop: true, allowDrag: true, source: data2,width:300, height: 300, 
                filterable: true, selectedIndex: 0
            });
            $("#listBoxA, #listBoxB").on('dragStart', function (event) {});
            $("#listBoxA, #listBoxB").on('dragEnd', function (event) {
                if (event.args.label) {
                    var ev = event.args.originalEvent;
                    var x = ev.pageX;
                    var y = ev.pageY;
                    if (event.args.originalEvent && event.args.originalEvent.originalEvent && event.args.originalEvent.originalEvent.touches) {
                        var touch = event.args.originalEvent.originalEvent.changedTouches[0];
                        x = touch.pageX;
                        y = touch.pageY;
                    }
                }
            });
            $(".btnListBox").show();
        }
	});

	$("#btnRight").click(function(){
		var item = $('#listBoxA').jqxListBox('getSelectedItem');
		if (item != null) {
        	$("#listBoxB").jqxListBox("addItem", item);
        	var items = $("#listBoxB").jqxListBox('getItems');
        	$("#listBoxB").jqxListBox('selectIndex', items.length-1);
        	$("#listBoxA").jqxListBox('removeItem', item);
        	$("#listBoxA").jqxListBox('selectIndex', item.index);
        }
        item = $('#listBoxA').jqxListBox('getSelectedItem');
		if(item == undefined || item == "undefined" || item == null){
        	var items = $("#listBoxA").jqxListBox('getItems');
        	$("#listBoxA").jqxListBox('selectIndex', items.length-1);
        }
	});
	
	$("#btnLeft").click(function(){
		var item = $('#listBoxB').jqxListBox('getSelectedItem');
        if (item != null) {
        	$("#listBoxA").jqxListBox("addItem", item);
        	var items = $("#listBoxA").jqxListBox('getItems');
        	$("#listBoxA").jqxListBox('selectIndex', items.length-1);
        	$("#listBoxB").jqxListBox('removeItem', item);
        	$("#listBoxB").jqxListBox('selectIndex', item.index);
        }
        item = $('#listBoxB').jqxListBox('getSelectedItem');
		if(item == undefined || item == "undefined" || item == null){
        	var items = $("#listBoxB").jqxListBox('getItems');
        	$("#listBoxB").jqxListBox('selectIndex', items.length-1);
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
	        		_paq.push(['trackEvent', 'KYCTemplate', 'Cancel', 'Cancel saving template']);
	        		location.href = "${contextPath}/kyc/template/search";
	        		buffer();
	        	}
	        }
		});
	});

	function isChecked(id,value,index) {

		console.log("index :: " + index);
		console.log("id :: " + id);
		var kycId = "kycDoc_" + value;
		console.log("kycId :: " + kycId);
		if ($('#' + id).is(':checked')) {
			$('#' + kycId).show();
			document.getElementById('kycTemplateDetailBO'+index+'.isProofSelected').value = true;
		} else {
			$('#' + kycId).hide();
			document.getElementById('kycTemplateDetailBO'+index+'.isProofSelected').value = false;
		}
	}
	
	$('#saveButton').click( function() {
		console.log("Initiating Parsley Validation.....");
		var instanceName = $("#instanceName").val();
		$('#frm').parsley().validate();
		var response = $('#frm').parsley().isValid();
		console.log("Validation Response : " + response);

		if (response) {
			if(isRelationList == 'true'){
				var items = $("#listBoxB").jqxListBox('getItems');
	    		if(items.length<=0){
	    			bootbox.alert("Please Select Atleast One Role!", function(){});
					return false;
	    		}
			}
			
			var proofCount = 0;
			//console.log("proofCount : " + proofCount);
			$('#kycProofTable').find('input[type="checkbox"]:checked').each( function() {
				var proofId = this.value;
				console.log("proofId : " + proofId);
				if(proofId === "true"){
					//console.log("Inside if");
				} else {
					proofCount++;
				}
			});

			//console.log("proofCount : " + proofCount);
			if(proofCount==0){
				bootbox.alert("Please Select Atleast One Proof!", function(){});
				return false;
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
			        		var roleCode = [];
			        		var roleName = [];
			        		if(isRelationList == 'true'){
			        			var items = $("#listBoxB").jqxListBox('getItems');
				        		for(var i=0;i<items.length;i++){
				        			roleCode.push(items[i].value);
				        			roleName.push(items[i].label);
				        		}
				        		$("#roleCode").val(roleCode);
				        		$("#roleName").val(roleName);
			        		}
			        		_paq.push(['trackEvent', 'KYCTemplate', 'Save', 'Saving template']);
			        		$('#frm').submit();
			    			buffer();
			    			
//--			        		 if(instanceName === "FASTLANE" || instanceName === "FCH"){
//--			        			var roleCode = [];
//--				        		var roleName = [];
//--				        		var items = $("#listBoxB").jqxListBox('getItems');
//--				        		for(var i=0;i<items.length;i++){
//--				        			roleCode.push(items[i].value);
//--				        			roleName.push(items[i].label);
//--				        		}
//--				        		_paq.push(['trackEvent', 'KYCTemplate', 'Save', 'Saving template']);
//--				        		$("#roleCode").val(roleCode);
//--				        		$("#roleName").val(roleName);
//--				        		$('#frm').submit();
//--				    			buffer();
//--			        		}else if(instanceName === "VEDA"){
//--				        		_paq.push(['trackEvent', 'KYCTemplate', 'Save', 'Saving template']);
//--				        		$('#frm').submit();
//--				    			buffer();
//--			        		}
			        	}
			        }
				});
			}
		}
	});
	
	$("#typeOfCounterParty, #countryOfResidence, #riskCategory, #templateName, #isExemptCategory1, #subTypeOfCounterpartyCode").change(function(){
        console.log(this.value);
        if (this.value != "" || $("#templateName").val() != "") {
            checkTemplateExist();
        } 
    });
	
	$('#listBoxB').on('change', function(event) {
		var currentRoles = [];
		var items = $("#listBoxB").jqxListBox('getItems');
		for(var i=0;i<items.length;i++){
			currentRoles.push(items[i].value);
		}
		isEqual = compareArrayString(previousRoles,currentRoles);
		if(!isEqual){
			checkTemplateExist();
		}
	});
	
	var previousRoles = [];
	var checkTemplateExist = function(){
		$('#saveButton').attr("disabled", true);
		var templateName = $("#templateName").val();
		var typeOfCounterPartyCode = $("#typeOfCounterParty").val();
		var countryOfResidenceCode = $("#countryOfResidence").val();
		var riskCategoryCode = $("#riskCategory").val();
		var instanceName = $("#instanceName").val();
		
		var isExemptCategory = "";
		var roleCode = [];
		var roleName = [];
		
		var data1 = [];
		previousRoles = [];
		
		if(isRelationList == 'true'){
			isExemptCategory = $("#isExemptCategory1").prop('checked');
			
			var items = $("#listBoxB").jqxListBox('getItems');
			for(var i=0;i<items.length;i++){
				roleCode.push(items[i].value);
				roleName.push(items[i].label);
				data1.push({"code":items[i].value,"name":items[i].label});
				previousRoles.push(items[i].value);
			}
			
			if(typeOfCounterPartyCode != "" && countryOfResidenceCode != "" && riskCategoryCode != "" && roleCode.length>0){
				var templateObject = {};
				templateObject["templateName"] = templateName;
			    templateObject["typeOfCounterPartyCode"] = typeOfCounterPartyCode;
			    templateObject["countryOfResidenceCode"] = countryOfResidenceCode;
			    templateObject["riskCategoryCode"] = riskCategoryCode;
			    templateObject["isDefaultDocument"] = "false";
			    templateObject["roleCode"] = roleCode;
			    templateObject["isExemptCategory"] = isExemptCategory;

			    ajaxCallBack("POST", $("#commonContextPathId").val() + "/kyc/defaultDocument/search", templateObject,"json", function(response) {
					$("#listBoxB").jqxListBox({ allowDrop: true, allowDrag: true, source: data1, width: 250, height: 300,displayMember: "name", 
			            valueMember: "code",selectedIndex: 0,
	                    renderer: function (index, label, value) {
	                    	var idx = $.inArray(value, response);
	                    	if (idx == -1) {
	                    		return label;
	                    	}else {
	                    		return "<span style='color: red;'>" + label + "</span>";
	                    	}
	                    }
	                });
			        
					$("#divCheckKYCTemplate").html("");
					if(response.length>0){
						var checkDiv = '<div class="alert alert-danger alertHide" style="padding: 9px;"><i class="fa fa-warning"></i>&nbsp;'+
						'KYC Documents Template is already exist with given combinations !<button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button></div>';
						$("#divCheckKYCTemplate").html(checkDiv);
					}else{
						$('#saveButton').attr("disabled", false);
					}
				});
			}
		}else if(isSubTypeOfCounterparty == 'true'){
			
			if(typeOfCounterPartyCode != "" && countryOfResidenceCode != "" && riskCategoryCode != "" && subTypeOfCounterpartyCode != "" && subTypeOfCounterpartyCode != null){
				var templateObject = {};
				var subTypeOfCounterparty = $("#subTypeOfCounterpartyCode").val();
				templateObject["templateName"] = templateName;
			    templateObject["typeOfCounterPartyCode"] = typeOfCounterPartyCode;
			    templateObject["countryOfResidenceCode"] = countryOfResidenceCode;
			    templateObject["riskCategoryCode"] = riskCategoryCode;
			    templateObject["isDefaultDocument"] = "false";
			    templateObject["subTypeOfCounterpartyCode"] = subTypeOfCounterparty;

			    ajaxCallBack("POST", $("#commonContextPathId").val() + "/kyc/defaultDocument/search/forVeda", templateObject,"text", function(response) {
			    	$("#divCheckKYCTemplate").html("");
			    	$('#saveButton').attr("disabled", false);
					if(response != "" && response != null && response == "exist"){
						var checkDiv = '<div class="alert alert-danger alertHide" style="padding: 9px;"><i class="fa fa-warning"></i>&nbsp;'+
							'KYC Documents Template is already exist with given combinations !<button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button></div>';

						$("#divCheckKYCTemplate").html(checkDiv);
						$('#saveButton').attr("disabled", true);
					}else{
						$('#saveButton').attr("disabled", false);
					}
				});
			}
		}
	};
	
	$("#typeOfCounterParty").change(function(){
		var counterPartyType = $(this).val();
		var instanceName = $("#instanceName").val();
		if(isSubTypeOfCounterparty == 'true'){
			setSubTypeOfCounterParty();
		}
		var htmlElement = "";
		
		ajaxCallBack("GET", $("#commonContextPathId").val() + "/kyc/template/proof/filter?counterPartyType="+counterPartyType, "","json", function(response) {
			for(var i=0;i<response.length;i++){
				var kycTemplateDetail = response[i];
				console.log(kycTemplateDetail);
				htmlElement += "<tr><td width='20%'><input id='kycTemplateDetailBO"+i+".isProofSelected' name='kycTemplateDetailBO["+i+"].isProofSelected' type='hidden' value='false'>" +
					"<input type='checkbox' id="+kycTemplateDetail.proofId+" name='kycTemplateDetailBO["+i+"].proofId' value="+kycTemplateDetail.proofId+" onclick='javascript:isChecked(this.id,this.value,"+i+");' />" +
					kycTemplateDetail.proofName+"</td><td><div id='kycDoc_"+kycTemplateDetail.proofId+"' style='display:none'><table class='table table-bordered table-hover'><thead class='portlet box'>"+
					"<tr><th width='40%'>Document Name</th><th width='30%' style='text-align: center;'>Photocopy</th><th width='30%' style='text-align: center;'>CTC</th></tr></thead><tbody>";
					
					var kycTemplateDocumentDetailBO = kycTemplateDetail.kycTemplateDocumentDetailBO;
					for(var j=0;j<kycTemplateDocumentDetailBO.length;j++){
						var kycTemplateDocumentDetail = kycTemplateDocumentDetailBO[j];
						
						htmlElement += "<tr><td width='40%'><input id='kycTemplateDetailBO"+i+".kycTemplateDocumentDetailBO"+j+".documentId' name='kycTemplateDetailBO["+i+"].kycTemplateDocumentDetailBO["+j+"].documentId' value="+kycTemplateDocumentDetail.documentId+" type='hidden' />"+kycTemplateDocumentDetail.documentName+"</td>" +
							"<td width='30%' align='center'><input id='kycTemplateDetailBO"+i+".kycTemplateDocumentDetailBO"+j+".isPhotocopy1' name='kycTemplateDetailBO["+i+"].kycTemplateDocumentDetailBO["+j+"].isPhotocopy' type='checkbox' value='true' />" +
							"<input type='hidden' name='_kycTemplateDetailBO["+i+"].kycTemplateDocumentDetailBO[0].isPhotocopy' value='on'></td>" +
							"<td width='30%' align='center'><input id='kycTemplateDetailBO"+i+".kycTemplateDocumentDetailBO"+j+".isCTC1' name='kycTemplateDetailBO["+i+"].kycTemplateDocumentDetailBO["+j+"].isCTC' type='checkbox' value='true' />" +
							"<input type='hidden' name='_kycTemplateDetailBO["+i+"].kycTemplateDocumentDetailBO["+j+"].isCTC' value='on'></td></tr>";
					}
					htmlElement += "</tbody></table></div></td></tr>";
			}
			$("#tbody").html(htmlElement);
			pcframework.initUniform();
		});
	});
	
	function setSubTypeOfCounterParty(){
		
		$("#subTypeOfCounterpartyCode").select2("val", "");
		$('#subTypeOfCounterpartyCode').find('option').remove().end();
		
		var typeOfCounterpartyCode = $("#typeOfCounterParty").val();
		var investorSubTypeData = JSON.parse($("#investorSubTypeData").val());
		$('#subTypeOfCounterpartyCode').append(new Option("", ""));
		for (var m = 0; m < investorSubTypeData.length; m++) {
			if(typeOfCounterpartyCode === "Individual" && investorSubTypeData[m].IsIndividual == true){
				var optionText = investorSubTypeData[m].CounterPartySubtype_Name; 
			    var optionValue = investorSubTypeData[m].CounterPartySubType_shortcode; 

			    $('#subTypeOfCounterpartyCode').append(new Option(optionText, optionValue)); 
			}else if(typeOfCounterpartyCode === "Entity" && investorSubTypeData[m].IsIndividual == false){
				var optionText = investorSubTypeData[m].CounterPartySubtype_Name; 
			    var optionValue = investorSubTypeData[m].CounterPartySubType_shortcode; 

			    $('#subTypeOfCounterpartyCode').append(new Option(optionText, optionValue));
			}
		}
	}
</script>