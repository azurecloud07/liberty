<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="page-content-wrapper">
    <div class="page-content">
        <div class="page-bar search-page-bar">
            <ul class="page-breadcrumb pull-right">
                <li><i class="fa fa-home"></i> <a href="#"> Home </a> <i class="fa fa-angle-right"></i></li>
                <li>KYC Subject<i class="fa fa-angle-right"></i></li>
                <li>Add</li>
            </ul>
            <h4>&nbsp;KYC Subject</h4>
        </div>
        
        <div class="row">
            <div class="col-md-12">
                <div class="portlet-body form">
                    <div class="pull-right">
                    	
                        <button type="button" id="saveButton" class="btn btn-sm grey-gallery">
                            <em class="fa fa-check-circle"></em> Save
                        </button>
                        
                        <button type="button" id="cancelButton" class="btn btn-sm grey-gallery">
                            <em class="fa fa-times-circle"></em> Cancel
                        </button>
                    </div>
                    <div class="clearfix margin-bottom-5"></div>
                </div>
            </div>
        </div>
        
		<form action="#" method="POST" id="frm" role="form" class="horizontal-form uk-form bt-flabels js-flabels" data-parsley-validate="true" data-parsley-errors-messages-disabled="true">
			<div class="row">
				<div class="col-md-3">
                    <div class="bt-form__wrapper">
                        <div class="form-group uk-width-1-1">
                            <div class="bt-flabels__wrapper">
                                <label class="parsley_hide">Counterparty(CP) Type</label>
								<div class="field-background">
									<select id="counterparty" name="counterparty" placeholder="Type of Counterparty" class="form-control select2me" data-parsley-required="true">
										<option value=""></option>
										<!-- <option value="Individual">Individual</option>
										<option value="Entity">Entity</option> -->
										<c:forEach begin="0" end="${dropdownData.getJSONArray('counterparty').length() -1}" var="index">
											<option value="${dropdownData.getJSONArray('counterparty').get(index)}">${dropdownData.getJSONArray('counterparty').get(index)}</option>
										</c:forEach>
									</select>
								</div>
								<span class="bt-flabels__error-desc_select">Required</span>
                            </div>
                        </div>
                    </div>
                </div>
				<div class="col-md-3">
                    <div class="bt-form__wrapper">
                        <div class="form-group uk-width-1-1">
                            <div class="bt-flabels__wrapper">
                                <label class="parsley_hide">First Name</label>
                                <input type="text" name="firstName" class="form-control field-background" placeholder="First Name" data-parsley-required="true" maxlength="255" />
                                <span class="bt-flabels__error-desc">Required</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3">
                    <div class="bt-form__wrapper">
                        <div class="form-group uk-width-1-1">
                            <div class="bt-flabels__wrapper">
                                <label class="parsley_hide">Middle Name</label>
                                <input type="text" name="middleName" class="form-control" placeholder="Middle Name" data-parsley-required="false" maxlength="255" />
                                <span class="bt-flabels__error-desc">Required</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3">
                    <div class="bt-form__wrapper">
                        <div class="form-group uk-width-1-1">
                            <div class="bt-flabels__wrapper">
                                <label class="parsley_hide">Last Name</label>
                                <input type="text" name="lastName" class="form-control field-background" placeholder="Last Name" data-parsley-required="true" maxlength="255" />
                                <span class="bt-flabels__error-desc">Required</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
            	<div class="col-md-3">
                    <div class="bt-form__wrapper">
                        <div class="form-group uk-width-1-1">
                            <div class="bt-flabels__wrapper">
                                <label class="parsley_hide">Date of Birth</label>
								<div class="input-group date date-picker">
									<input type="text" name="dateOfBirth" id="dateOfBirth" placeholder="Date of Birth" data-parsley-required="true" class="form-control form-control-inline date-picker field-background" />
									<span class="input-group-btn btn default"> <i class="fa fa-calendar"></i></span>
								</div>
                                <span class="bt-flabels__error-desc">Required</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3">
                    <div class="bt-form__wrapper">
                        <div class="form-group uk-width-1-1">
                            <div class="bt-flabels__wrapper">
                                <label class="parsley_hide">Occupation</label>
                                <input type="text" name="occupation" class="form-control field-background" placeholder="Occupation" maxlength="255" data-parsley-required="true" />
                                <span class="bt-flabels__error-desc">Required</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <hr />
            
			<div class="row">
				<div class="col-md-6">
                    <div class="">
                        <div class="form-group uk-width-1-1">
                            <div class="bt-flabels__wrapper">
                                <label class="parsley_hide">Residential Address</label>
                                <input type="text" name="residentialAddress" class="form-control field-background" placeholder="Residential Address" data-parsley-required="true" />
                                <span class="bt-flabels__error-desc">Required</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3">
                    <div class="bt-form__wrapper">
                        <div class="form-group uk-width-1-1">
                            <div class="bt-flabels__wrapper">
                                <label class="parsley_hide">State/City</label>
                                <input type="text" name="stateCity" class="form-control field-background" placeholder="State/City" data-parsley-required="true" maxlength="255" />
                                <span class="bt-flabels__error-desc">Required</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3">
                    <div class="bt-form__wrapper">
                        <div class="form-group uk-width-1-1">
                            <div class="bt-flabels__wrapper">
                                <label class="parsley_hide">Zip Code</label>
                                <input type="text" name="zipCode" class="form-control field-background" placeholder="Zip Code" data-parsley-required="true" maxlength="255" />
                                <span class="bt-flabels__error-desc">Required</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
			<div class="row">
				<div class="col-md-3">
                    <div class="bt-form__wrapper">
                        <div class="form-group uk-width-1-1">
                            <div class="bt-flabels__wrapper">
                                <label class="parsley_hide">Country of Residency</label>
								<div class="field-background">
									<select id="countryOfResidency" name="countryOfResidency" placeholder="Country of Residency" class="form-control select2me" data-parsley-required="true">
										<option value=""></option>
										<c:forEach begin="0" end="${dropdownData.getJSONArray('jurisdiction').length() -1}" var="index">
											<option value="${dropdownData.getJSONArray('jurisdiction').get(index)}">${dropdownData.getJSONArray('jurisdiction').get(index)}</option>
										</c:forEach>
									</select>
								</div>
								<span class="bt-flabels__error-desc_select">Required</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3">
                    <div class="bt-form__wrapper">
                        <div class="form-group uk-width-1-1">
                            <div class="bt-flabels__wrapper">
                                <label class="parsley_hide">Country of Birth</label>
								<div class="field-background">
									<select id="countryOfBirth" name="countryOfBirth" placeholder="Country of Birth" class="form-control select2me" data-parsley-required="true">
										<option value=""></option>
										<c:forEach begin="0" end="${dropdownData.getJSONArray('jurisdiction').length() -1}" var="index">
											<option value="${dropdownData.getJSONArray('jurisdiction').get(index)}">${dropdownData.getJSONArray('jurisdiction').get(index)}</option>
										</c:forEach>
									</select>
								</div>
								<span class="bt-flabels__error-desc_select">Required</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3">
                    <div class="bt-form__wrapper">
                        <div class="form-group uk-width-1-1">
                            <div class="bt-flabels__wrapper">
                                <label class="parsley_hide">Country of Nationality</label>
								<div class="field-background">
									<select id="countryOfNationality" name="countryOfNationality" placeholder="Country of Nationality" class="form-control select2me" data-parsley-required="true">
										<option value=""></option>
										<c:forEach begin="0" end="${dropdownData.getJSONArray('jurisdiction').length() -1}" var="index">
											<option value="${dropdownData.getJSONArray('jurisdiction').get(index)}">${dropdownData.getJSONArray('jurisdiction').get(index)}</option>
										</c:forEach>
									</select>
								</div>
								<span class="bt-flabels__error-desc_select">Required</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <hr />
            
			<div class="row">
                <div class="col-md-3">
                    <div class="bt-form__wrapper">
                        <div class="form-group uk-width-1-1">
                            <div class="bt-flabels__wrapper">
                                <label class="parsley_hide">Any Other Former First Name</label>
                                <input type="text" name="otherFirstName" class="form-control" placeholder="Any Other Former First Name" maxlength="255" />
                                <span class="bt-flabels__error-desc">Required</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3">
                    <div class="bt-form__wrapper">
                        <div class="form-group uk-width-1-1">
                            <div class="bt-flabels__wrapper">
                                <label class="parsley_hide">Any Other Former Middle Name</label>
                                <input name="otherMiddleName" class="form-control" placeholder="Any Other Former Middle Name" maxlength="255" />
                                <span class="bt-flabels__error-desc">Required</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3">
                    <div class="bt-form__wrapper">
                        <div class="form-group uk-width-1-1">
                            <div class="bt-flabels__wrapper">
                                <label class="parsley_hide">Any Other Former Last Name</label>
                                <input name="otherLastName" class="form-control" placeholder="Any Other Former Last Name" maxlength="255" />
                                <span class="bt-flabels__error-desc">Required</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3">
                    <div class="bt-form__wrapper">
                        <div class="form-group uk-width-1-1">
                            <div class="bt-flabels__wrapper">
                                <label class="parsley_hide">Other Nationality</label>
								<div class="">
									<select id="otherNationality" name="otherNationality" placeholder="Other Nationality" class="form-control select2me">
										<option value=""></option>
										<c:forEach begin="0" end="${dropdownData.getJSONArray('jurisdiction').length() -1}" var="index">
											<option value="${dropdownData.getJSONArray('jurisdiction').get(index)}">${dropdownData.getJSONArray('jurisdiction').get(index)}</option>
										</c:forEach>
									</select>
								</div>
								<span class="bt-flabels__error-desc_select">Required</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <hr />
            
            <div class="row form">
				<div class="col-md-12">
            		<h3 class="form-section">Document Required</h3>
            		<div class="row">
						<div class="col-md-3 col-sm-3 col-xs-3">
							<ul class="nav nav-tabs tabs-left">
			            	<c:forEach begin="0" end="${proofData.length() -1}" var="proofIndex">
			            		<c:choose>
				            		<c:when test="${proofIndex == 0}">
			            				<li>
			            			</c:when>
			            			<c:otherwise>
			            				<li>
			            			</c:otherwise>
		            			</c:choose>
									<a href="#tab_${proofIndex}" data-toggle="tab">
									${proofData.get(proofIndex).getString('proofName')} </a>
								</li>
							</c:forEach>
							</ul>
						</div>
						
						<div class="col-md-9 col-sm-9 col-xs-9">
							<div class="tab-content">
								<c:forEach begin="0" end="${proofData.length() -1}" var="proofIndex">
									<c:choose>
					            		<c:when test="${proofIndex == 0}">
				            				<div class="tab-pane" id="tab_${proofIndex}">
				            			</c:when>
				            			<c:otherwise>
				            				<div class="tab-pane" id="tab_${proofIndex}">
				            			</c:otherwise>
			            			</c:choose>
									<c:forEach begin="0" end="${proofData.get(proofIndex).getJSONArray('documents').length() -1}" var="documentIndex">
										<div class="row">
											<div class="col-md-4">
												<div class="form-group">
													<%-- <input id="proof_${proofIndex}_document_${documentIndex}" name="userConsent_0" type="checkbox" value="true" onclick="javascript:showHideDiv(this, '0');" autocomplete="off"> --%>
													<input type="checkbox" id="isDocSelected${proofIndex}_${documentIndex}" onclick="javascript:displaydocs(this,'${proofIndex}','${documentIndex}');">
											    	<label class="control-label">${proofData.get(proofIndex).getJSONArray('documents').get(documentIndex).getString('documentName')}</label>
											    </div>
											</div>
										
											<div class="col-md-8 document${proofIndex}_${documentIndex}" style="display:none">
												<div class="radio-list">
													<label class="radio-inline"><b>Document Received&nbsp;:&nbsp;</b></label>
													<label class="radio-inline"><input type="radio" name="isDocumentReceived${proofIndex}_${documentIndex}" id="isDocumentReceivedYes${proofIndex}_${documentIndex}" value="1" onclick="showdocFields(this.value,'${proofIndex}','${documentIndex}')">&nbsp;Yes&nbsp;&nbsp;</label>&nbsp;
													<label class="radio-inline"><input type="radio" name="isDocumentReceived${proofIndex}_${documentIndex}" id="isDocumentReceivedNo${proofIndex}_${documentIndex}" value="0" onclick="showdocFields(this.value,'${proofIndex}','${documentIndex}')">&nbsp;No&nbsp;&nbsp;</label>&nbsp;
													<label class="radio-inline"><input type="radio" name="isDocumentReceived${proofIndex}_${documentIndex}" id="isDocumentReceivedWaiver${proofIndex}_${documentIndex}" value="2" onclick="showdocFields(this.value,'${proofIndex}','${documentIndex}')" >&nbsp;Waiver&nbsp;&nbsp;</label>&nbsp;
												</div>
											</div>
										</div>
										
										<div class="row docFieldDetailsNo${proofIndex}_${documentIndex}" style="display:none">
							                <div class="col-md-4">
						                        <div class="form-group uk-width-1-1">
						                            <div class="bt-flabels__wrapper">
						                                <label class="parsley_hide">Due Date</label>
														<div class="input-group date date-picker" data-date-format="mm/dd/yyyy">
															<input type="text" name="docDueDate${proofIndex}_${documentIndex}" id="docDueDate${proofIndex}_${documentIndex}" placeholder="Due Date" class="form-control form-control-inline date-picker" />
															<span class="input-group-btn btn default"> <i class="fa fa-calendar"></i></span>
															<span class="bt-flabels__error-desc">Required</span>
														</div>
						                            </div>
						                            <form:errors path="effectiveDate" cssClass="help-block error" />
						                        </div>
							                </div>
							            </div>
							            
							            <div class="row docFieldDetailsWaiver${proofIndex}_${documentIndex}" style="display:none">
							                <div class="col-md-6">
						                        <div class="form-group uk-width-1-1">
						                            <div class="bt-flabels__wrapper">
						                                <label class="parsley_hide">Waiver Reason</label>
						                                <textarea name="waiverReason${proofIndex}_${documentIndex}" class="field-background" data-parsley-required="true" placeholder="Waiver Reason" rows="5" style="min-width: 100%"></textarea>
						                                <span class="bt-flabels__error-desc">Required</span>
						                            </div>
						                        </div>
							                </div>
					            		</div>
										
										<div class="row docFieldDetailsYes${proofIndex}_${documentIndex}" style="display:none">
							                <div class="col-md-4">
						                        <div class="form-group uk-width-1-1">
						                            <div class="bt-flabels__wrapper">
						                                <label class="parsley_hide">Received Date</label>
														<div class="input-group date date-picker" data-date-format="mm/dd/yyyy">
															<input type="text" name="receivedDate${proofIndex}_${documentIndex}" id="receivedDate${proofIndex}_${documentIndex}" placeholder="Received Date" class="form-control form-control-inline date-picker" />
															<span class="input-group-btn btn default"> <i class="fa fa-calendar"></i></span>
															<span class="bt-flabels__error-desc">Required</span>
														</div>
						                            </div>
						                            <form:errors path="effectiveDate" cssClass="help-block error" />
						                        </div>
							                </div>
							                
							                <div class="col-md-4">
						                        <div class="form-group uk-width-1-1">
						                            <div class="bt-flabels__wrapper">
						                                <label class="parsley_hide">Document Date</label>
														<div class="input-group date date-picker" data-date-format="mm/dd/yyyy">
															<input type="text" name="documentDate0" id="documentDate${proofIndex}_${documentIndex}" placeholder="Document Date" class="form-control form-control-inline date-picker" />
															<span class="input-group-btn btn default"> <i class="fa fa-calendar"></i></span>
															<span class="bt-flabels__error-desc">Required</span>
														</div>
						                            </div>
						                        </div>
							                </div>
							                
							                <div class="col-md-4">
						                        <div class="form-group uk-width-1-1">
						                            <div class="bt-flabels__wrapper">
						                                <label class="parsley_hide">Expiry Date</label>
														<div class="input-group date date-picker" data-date-format="mm/dd/yyyy">
															<input type="text" name="expiryDate0" id="expiryDate${proofIndex}_${documentIndex}" placeholder="Expiry Date" class="form-control form-control-inline date-picker" />
															<span class="input-group-btn btn default"> <i class="fa fa-calendar"></i></span>
															<span class="bt-flabels__error-desc">Required</span>
														</div>
						                            </div>
						                        </div>
							                </div>
							            </div>
							            
							            <div class="row docFieldDetailsYes${proofIndex}_${documentIndex}" style="display:none">
											<div class="col-md-4">
												<div class="form-group uk-width-1-1">
													<div class="bt-flabels__wrapper">
														<label class="parsley_hide">${proofData.get(proofIndex).getJSONArray('documents').get(documentIndex).getString('documentName')}</label>
														<input type="file" class="hidden" name="file" id="file_${proofIndex}_${documentIndex}" onchange="javascript:onChangeFile('${proofIndex}','${documentIndex}');">
														<input type="text" readonly class="form-control field-background" placeholder="${proofData.get(proofIndex).getJSONArray('documents').get(documentIndex).getString('documentName')}" id="file${proofIndex}_${documentIndex}" data-parsley-required="true" data-parsley-group="docAvailable">
														<span class="bt-flabels__error-desc_date" style="right: 10px;">Required</span>
													</div>
												</div>
											</div> 
											<div class="col-md-2">
												<button type="button" class="btn btn-sm grey-gallery" id="uploadFile_${proofIndex}_${documentIndex}" value="Change" onclick="$('#file_${proofIndex}_${documentIndex}').click()">
													<i class="fa fa-folder-open-o"></i>&nbsp;Browse
												</button>
												&nbsp;&nbsp;&nbsp;
												<button type="button" class="btn btn-sm grey-gallery hidden" id="removeFile_${proofIndex}_${documentIndex}" value="Remove" onclick="javascript:removeOnClick('${proofIndex}','${documentIndex}');">
													<i class="fa fa-close"></i>
												</button>
										    </div>
										    <div class="col-md-2"></div>
										    <div class="col-md-4">
						                        <div class="form-group uk-width-1-1">
						                            <div class="bt-flabels__wrapper">
						                                <label class="parsley_hide">Reference Number</label>
						                                <input type="text" name="referenceNumber${proofIndex}_${documentIndex}" id="referenceNumber${proofIndex}_${documentIndex}" class="form-control field-background textRequired" data-parsley-required="true" placeholder="Reference Number" />
						                                <span class="bt-flabels__error-desc">Required</span>
						                            </div>
						                        </div>
							                </div>
										</div>
										
										<div class="row docFieldDetailsYes${proofIndex}_${documentIndex}" style="display:none">
							                <div class="col-md-6">
						                        <div class="form-group uk-width-1-1">
						                            <div class="bt-flabels__wrapper">
						                                <label class="parsley_hide">Comment</label>
						                                <textarea name="comment0" class="field-background" data-parsley-required="true" placeholder="Comment" rows="5" style="min-width: 100%"></textarea>
						                                <span class="bt-flabels__error-desc">Required</span>
						                            </div>
						                        </div>
							                </div>
					            		</div>
										
										<hr />
									</c:forEach>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="clearfix margin-bottom-10"></div>
			
			<div class="row">
				<div class="col-md-12">
		            <div class="page-bar">
						<ul class="page-breadcrumb">
							<li><em><strong>User Consent</strong></em></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="clearfix margin-bottom-10"></div>
			
            <c:forEach begin="0" end="${consentData.length() -1}" var="index">
            <div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<div class="col-md-12">
							<input id="userConsent_${index}" name="userConsent_${index}" type="checkbox" value="true" autocomplete="off">
						    <label class="control-label">${consentData.get(index).getString('consentDescription')}</label>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
			
		</form>
		<div class="clearfix margin-bottom-10"></div>
		<div class="clearfix margin-bottom-10"></div>
		<div class="clearfix margin-bottom-10"></div>
	</div>
	<div class="clearfix margin-bottom-10"></div>
	<div class="clearfix margin-bottom-10"></div>
	<div class="clearfix margin-bottom-10"></div>
</div>

<script>

	jQuery(document).ready(function() {
		jQuery("#subject").addClass("active");
		jQuery("#master").remove("active");
		jQuery("#dashboard").remove("active");
	});
	
	$('#saveButton').click(function() {
	    console.log("Initiating Parsley Validation.....");
	    $('#frm').parsley().validate();
	    var response = $('#frm').parsley().isValid();
	    console.log("Validation Response : " + response);
	    
	    return false;
	});
	
	$('#cancelButton').click(function() {
		location.href = "${contextPath}/kyc/subject/search";
	});
	
	function onChangeFile(i, j){
		var uploadFile = $('#file_'+i+'_'+j).val().split('\\').slice(-1)[0].toString();
		alert(uploadFile);
		$('#file'+i+'_'+j).val(uploadFile);
		if (uploadFile) {
			$('#removeFile_'+i+'_'+j).removeClass('hidden');
			$("#removeFile_"+i+'_'+j).attr('value', 'Change');
		}
	}

	function removeOnClick(i, j){
		$('#file_'+i+'_'+j).val('');
		$('#file'+i+'_'+j).val('');
		$('#removeFile_'+i+'_'+j).addClass('hidden');
		$("#file"+i+"_"+j).change();
	}
	
	function displaydocs(value, proofIndex, documentIndex) {
		if(value.checked){
			$(".document"+proofIndex+"_"+documentIndex).show(500);
			//$('#isDocumentReceivedNo'+proofIndex+'_'+documentIndex).click();
		} else {
			$(".document"+proofIndex+"_"+documentIndex).hide(300);
			$(".docFieldDetailsNo"+proofIndex+"_"+documentIndex).hide(300);
			$(".docFieldDetailsYes"+proofIndex+"_"+documentIndex).hide(300);
			$(".docFieldDetailsWaiver"+proofIndex+"_"+documentIndex).hide(300);
		}
	}

	function showdocFields(value, proofId, documentId){
		if(value == "0") {
			$(".docFieldDetailsNo"+proofId+"_"+documentId).show(500);
			$(".docFieldDetailsYes"+proofId+"_"+documentId).hide(300);
			$(".docFieldDetailsWaiver"+proofId+"_"+documentId).hide(300);
		} else if(value == "1"){
			$(".docFieldDetailsYes"+proofId+"_"+documentId).show(500);
			$(".docFieldDetailsWaiver"+proofId+"_"+documentId).hide(300);
			$(".docFieldDetailsNo"+proofId+"_"+documentId).hide(300);
		} else if(value == "2"){
			$(".docFieldDetailsWaiver"+proofId+"_"+documentId).show(500);
			$(".docFieldDetailsYes"+proofId+"_"+documentId).hide(300);
			$(".docFieldDetailsNo"+proofId+"_"+documentId).hide(300);
		}
	}
</script>