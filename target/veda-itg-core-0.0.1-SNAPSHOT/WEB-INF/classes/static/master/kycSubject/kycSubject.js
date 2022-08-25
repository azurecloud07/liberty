var instanceName;
var isSubTypeOfCounterparty;
var isCountryOfNationality;
var isGivenName;
var isRelationList;
var exemptCategory;
var isMitigationWorkflow;
var mrzWorldCheckREUrl;
jQuery(document).ready(function() {

	jQuery(".menu-dropdown").remove("active");
	jQuery("#subject").addClass("active");

	$(document).on("input", "#telephoneNumber", function () {
		var self = $(this);
		self.val(self.val().replace(/[^0-9\-]/g, ''));
	});

	var kycSubjectRequestNo = $("#kycSubjectRequestNo").val();
	if (kycSubjectRequestNo != "" && kycSubjectRequestNo != undefined) {
		$('#typeOfCounterpartyCode').attr("disabled", true);
	}
	
	mrzWorldCheckREUrl = $("#MRZCodeUrl").val();
	instanceName = $("#instanceName").val();
	isSubTypeOfCounterparty = $("#isSubTypeOfCounterparty").val();
	isCountryOfNationality = $("#isCountryOfNationality").val();
	isGivenName = $("#isGivenName").val();
	isRelationList = $("#isRelationList").val();
	exemptCategory = $("#exemptCategory").val();
	isMitigationWorkflow = $("#isMitigationWorkflow").val();
	
	$( window ).resize(function() {
		if(isRelationList == 'true'){
			$("#grid").jqxGrid({width: $( window ).width()-65});
		}
	});
});

var kycSubjectProofBOs;
var oldTotalRiskLvlValue;
var oldRelationList;
var oldExemptCat;
function showHideTabpane(id) {
	
	$('.riskElement').attr('disabled',true);
	if(screeningType == manualScreeningConstant){
		$('.riskElement').attr('disabled',false);
		pcframework.initUniform();
		ComponentsPickers.init();
	}
	
	if (id == "1"){
		if(isRelationList == 'true'){
			$("#grid").jqxGrid({width: $( window ).width()-65});
			var oldgridData = getGridData('grid');
			var oldrelationList = getRelationData(oldgridData);
			oldRelationList = oldrelationList;
		}
		
		if(exemptCategory == 'true'){
			oldExemptCat = $("#isExemptCategory").prop('checked');
			//$(".documentField").attr("data-parsley-required", false);
		}
	}
	
	$('#typeOfCounterpartyCode').attr("disabled", false);
	var formData = getKYCData("frm");
	formData = unflatten(formData);
	delete formData.manualScreening;
	delete formData._consentList;
	delete formData.kycSubjectReview;
	var kycSubjectRequestNo = $("#kycSubjectRequestNo").val();
	if (kycSubjectRequestNo != "" && kycSubjectRequestNo != undefined) {
		$('#typeOfCounterpartyCode').attr("disabled", true);
	}
	$(".mitigation-activity").attr("data-parsley-required", false);
	$('#frm').parsley().destroy();
	initParsely(jQuery);
	if (id == "2") {
		$("#countryRiskLevel").attr("data-parsley-required", false);
		$("#totalRiskLevel").attr("data-parsley-required", false);
		//$(".documentField").attr("data-parsley-required", false);
		
		var validate = false;
		if(window.event.currentTarget.className == "btn-itg btn default button-previous") {
			validate = true;
			oldTotalRiskLvlValue = $("#totalRiskLevel").val();
			oldExemptCat = undefined;
			_paq.push(['trackEvent', 'KYCSubject', 'Back','Back to previous tab']);
		}
		else {
			validate = $('#frm').parsley().validate("singleForm");
		}
		// var validate = $('#frm').parsley().validate();
		if (validate) {
			$(".typeOfCounterpartyName").html($("#typeOfCounterpartyCode option:selected").text());
			// Code commented by kunal for dynamic view details
			/*if(formData.typeOfCounterpartyCode === 'Individual') {
				$(".countryOfResidencyName").html($("#countryOfResidencyCode option:selected").text());
				$(".countryOfBirthName").html($("#countryOfBirthCode option:selected").text());
				if(instanceName === "VEDA"){
					$(".countryOfCitizenshipName").html($("#countryOfNationalityCode option:selected").text());
					$(".firstName").html(formData.firstName);
					$(".middleName").html(formData.middleName);
				}else{
					$(".countryOfCitizenshipName").html($("#countryOfCitizenshipCode option:selected").text());
					$(".givenName").html(formData.givenName);
				}
				$(".lastName").html(formData.lastName);
			}
			else {
				$(".countryOfIncorporationName").html($("#countryOfIncorporationCode option:selected").text());
				$(".registrationName").html(formData.registrationName);
				$(".registrationNumber").html(formData.registrationNumber);
			}*/
			
			$('.nav li a').removeClass("tab_error");
			_paq.push(['trackEvent', 'KYCSubject', 'Continue','Continue to next tab']);
			showHideDiv(id);
		}
	} else if (id == "3") {
		$("#countryRiskLevel").attr("data-parsley-required", true);
		$("#totalRiskLevel").attr("data-parsley-required", true);
		$(".mitigation-activity").attr("data-parsley-required", false);
		//$(".documentField").attr("data-parsley-required", false);
		var totalRiskLvlVal = $("#totalRiskLevel").val();
		 
		var validate = $('#frm').parsley().validate("kycSubjectReviewGroup");
		if (validate) {
			
			$('.riskElement').attr('disabled',false);
			
			$("#pepRiskLevel").val("No");
			if($('input[name="kycSubjectReview.isPepRisk"]:checked').val() == "true" || $('input[name="kycSubjectReview.isPepRisk"]:checked').val() == true)
				$("#pepRiskLevel").val("Yes");
			
			$("#sanctionsRiskLevel").val("No");
			if($('input[name="kycSubjectReview.isSanctionRisk"]:checked').val() == "true" || $('input[name="kycSubjectReview.isSanctionRisk"]:checked').val() == true)
				$("#sanctionsRiskLevel").val("Yes");
			
			$("#activitiesRiskLevel").val("No");
			if($('input[name="kycSubjectReview.isActivitiesRisk"]:checked').val() == "true" || $('input[name="kycSubjectReview.isActivitiesRisk"]:checked').val() == true)
				$("#activitiesRiskLevel").val("Yes");
				
			$("#lawEnforcementRiskLevel").val("No");
			if($('input[name="kycSubjectReview.isLawEnforcement"]:checked').val() == "true" || $('input[name="kycSubjectReview.isLawEnforcement"]:checked').val() == true)
				$("#lawEnforcementRiskLevel").val("Yes");
			
			$("#regulatoryEnforcementRiskLevel").val("No");
			if($('input[name="kycSubjectReview.isRegulatoryEnforcement"]:checked').val() == "true" || $('input[name="kycSubjectReview.isRegulatoryEnforcement"]:checked').val() == true)
				$("#regulatoryEnforcementRiskLevel").val("Yes");
			
			$("#otherBodiesRiskLevel").val("No");
			if($('input[name="kycSubjectReview.isOtherBodies"]:checked').val() == "true" || $('input[name="kycSubjectReview.isOtherBodies"]:checked').val() == true)
				$("#otherBodiesRiskLevel").val("Yes");	
			
			var fd = new FormData();

			$("#frm").find("input[type=file]").each(function (index, field) {
				var documentId = $(this).attr("data-document-id");
				if (field.files.length > 0) {
					const file = field.files[0];
					fd.append(documentId, file.name);
				}
			});

			var gridData = "";
			var relationList = "";
			
			var kycTemplate = {};
			if(isRelationList == 'true'){
				gridData = getGridData('grid');
				relationList = getRelationData(gridData);
				
				kycTemplate.relationList = relationList;
			}
			if(exemptCategory == 'true'){
				if( $('#isExemptCategory').length!==0)
					kycTemplate.isExemptCategory = $("#isExemptCategory").prop('checked');
				else
					kycTemplate.isExemptCategory = false;
			}
			kycTemplate.typeOfCounterPartyCode = formData.typeOfCounterpartyCode;
			kycTemplate.jurisdictionCode = formData.itgJurisdictionCode;
			kycTemplate.riskCategory = totalRiskLvlVal;
			kycTemplate.kycSubjectId = "";
			if(isSubTypeOfCounterparty == 'true')
				kycTemplate.subTypeOfCounterpartyCode = $("#subTypeOfCounterpartyCode").val();
			
            var isChangedInRelationList = false;
            if(isRelationList == 'true'){
            	if(oldRelationList != undefined)
                	isChangedInRelationList = JSON.stringify(oldRelationList) != JSON.stringify(relationList);
            }
            
            var isChangedInTotalRisk = false;
            if(oldTotalRiskLvlValue != undefined)
                isChangedInTotalRisk = oldTotalRiskLvlValue != totalRiskLvlVal;
            var isChangedInExmptCat = false;
            if(oldExemptCat != undefined)
                isChangedInExmptCat = oldExemptCat != $("#isExemptCategory").prop('checked');
            
            if(window.event.currentTarget.className != "btn-itg btn default button-previous" && ($("#templateNameDiv")[0].innerText == "" || isChangedInRelationList || isChangedInTotalRisk || isChangedInExmptCat)) {
				var url = $("#commonContextPathId").val() + '/kyc/subject/getTemplateMapping';
				ajaxCallBack("POST", url,kycTemplate,"json",function(response){
					kycSubjectProofBOs = JSON.parse(response.kycSubjectProofBOs);
					var templateName = response.templateName;
					
					$("#templateDiv").html("");
					$("#main_document_section").html("");
					proofNumber = 0;
					$("#kycTemplate").hide();
					$("#noTemplateDiv").hide();
					if(Array.isArray(kycSubjectProofBOs) && kycSubjectProofBOs.length>0){
						$("#templateNameDiv").html(templateName.join(", "));
						$("#kycTemplate").show();
						showTemplate(kycSubjectProofBOs);
						
						documentProofs = JSON.parse(response.documentProofs);
					}else{
						documentProofs = JSON.parse(response.documentProofs);
						$("#noTemplateDiv").show();
					}
			
					$(".tm_CountryRiskLevel").html('[' + $("#countryRiskLevel").val() + ']');
					$(".tm_TotalRiskLevel").html('[' + totalRiskLvlVal + ']');
					
					if(isMitigationWorkflow === 'true') {
						if(totalRiskLvlVal == 'High' || totalRiskLvlVal == 'Medium') {
							$(".info_mitigationTab").html('An additional step is added to the process due to ' + totalRiskLvlVal + ' Risk Level.');
							$(".info_mitigationTab").css({'color':'red'});
						}
						else {
							$(".info_mitigationTab").empty();
						}
					}
				});
			}
			_paq.push(['trackEvent', 'KYCSubject', 'Continue','Continue to next tab']);
			
			$('.nav li a').removeClass("tab_error");
			showHideDiv(id);
		}
	} else if (id == "4") {
		validate = $('#frm').parsley().validate("singleForm");;
		if (validate) {
			$(".mitigation-activity").attr("data-parsley-required", true);
			enableDisableMitigationRisk();
			_paq.push(['trackEvent', 'KYCSubject', 'Continue','Continue to next tab']);
			showHideDiv(id);
			$('.nav li a').removeClass("tab_error");
		}
	} else
		showHideDiv(id);
}

var documentProofs = [];
var proofNumber = 0;
var addProofDocument = function(){
	var proofDocumentFileExtensionsId = $("#proofDocumentFileExtensionsId").val();
	
	var htmlElement = "<div id='document_section_"+proofNumber+"'><hr>";
	htmlElement += "<div class='row'><div class='col-md-3'><div class='bt-form__wrapper'><div class='form-group uk-width-1-1'><div class='bt-flabels__wrapper'>" +
	"<label class='parsley_hide'>Proof</label><select id='proof_"+proofNumber+"_0' name='additionalDocuments["+proofNumber+"].proofId' class='optProof form-control select2me attributeDisabled' placeholder='Select Proof'><option value=''></option>";

	for(var i=0;i<documentProofs.length;i++){
		var proofObject = documentProofs[i];
		htmlElement += "<option value='"+proofObject.proofId+"'>"+proofObject.proofName+"</option>";
	}
	htmlElement += "</select><span class='bt-flabels__error-desc_select'>Required</span></div></div></div></div>";
	
	htmlElement += "<div class='col-md-3'><div class='bt-form__wrapper'><div class='form-group uk-width-1-1'><div class='bt-flabels__wrapper'><label class='parsley_hide'>Document</label>" +
			"<select disabled='disabled' id='additionalDocuments"+proofNumber+"_documentList0_documentId' name='additionalDocuments["+proofNumber+"].documentList[0].documentId' class='optDocument form-control select2me attributeDisabled' placeholder='Select Document'><option value=''></option></select><span class='bt-flabels__error-desc_select'>Required</span></div></div></div></div>";
    
	htmlElement += "<div class='col-md-6'><div class='row'><div class='col-md-6'><div class='form-group'><div class='bt-flabels__wrapper'><label class='parsley_hide'>Document</label>" +
	"<input type='hidden' name='additionalDocuments["+proofNumber+"].documentList[0].isDocumentSelected' value='true'/>" +
	"<input type='hidden' name='additionalDocuments["+proofNumber+"].documentList[0].documentReceived' value='1'/>" +
	"<input type='hidden' name='additionalDocuments["+proofNumber+"].documentList[0].isSentRequestToFCH' value='false'/>" +
	"<input type='file' class='hidden'  name='additionalDocuments["+proofNumber+"].documentList[0].documentFile' id='fileA_"+proofNumber+"_0' accept='"+proofDocumentFileExtensionsId+"' onchange=\"javascript:onChangeFileA('"+proofNumber+"','0');\">" +
	"<input type='text' readonly='readonly' class='form-control' id='additionalDocuments"+proofNumber+".documentList0.fileName' name='additionalDocuments["+proofNumber+"].documentList[0].fileName' placeholder='Upload Document'/>" +
	"<span class='bt-flabels__error-desc_date' style='right: 10px;'>Required</span></div></div></div>" +
	"<div class='col-md-4'><button type='button' class='btn-itg-file btn btn-sm grey-gallery uploadDocument' id='uploadFileA_"+proofNumber+"_0' onclick=\"$('#fileA_"+proofNumber+"_0').click()\"> <i class='fa fa-folder-open-o'></i>&nbsp;Browse </button> " +
	"<button type='button' class='hidden btn-itg-file btn btn-sm grey-gallery deletdDocument' value='Remove' id='removeFileA_"+proofNumber+"_0' onclick=\"javascript:removeOnClickA('"+proofNumber+"','0');\"> <i class='fa fa-trash'></i> </button></div>";
	
	htmlElement += "<div class='col-md-2'><button style='margin-left:-50px;' type='button' class='btn-itg-file btn btn-sm grey-gallery deletdDocument' onclick=\"javascript:jQuery('#document_section_"+proofNumber+"').remove();\"><i class='fa fa-close'></i></button></div></div></div></div>";
	
	htmlElement += "<div class='row'><div class='col-md-3'><div class='form-group uk-width-1-1'><div class='bt-flabels__wrapper'> <label class='parsley_hide'>Receive Date</label><div class='input-group' data-date-format='mm/dd/yyyy'>" +
			"<input type='hidden' data-attribute-name='receive-date-name-"+proofNumber+"' value='Receive Date' />" +
			"<input type='text' data-attribute-value='receive-date-value-"+proofNumber+"' data-parsley-required='false' placeholder='Receive Date' class='datePicker form-control form-control-inline attributeDisabled' />" +
			"<span class='input-group-btn btn default'><i class='fa fa-calendar'></i></span> <span class='bt-flabels__error-desc_date'>Required</span></div></div></div></div>";
	
	htmlElement += "<div class='col-md-3'><div class='form-group uk-width-1-1'><div class='bt-flabels__wrapper'> <label class='parsley_hide'>Expiry Date</label><div class='input-group' data-date-format='mm/dd/yyyy'>" +
			"<input type='hidden' data-attribute-name='expiry-date-name-"+proofNumber+"' value='Expiry Date' />" +
			"<input type='text' data-attribute-value='expiry-date-value-"+proofNumber+"' data-parsley-required='false' placeholder='Expiry Date' class='datePicker form-control form-control-inline attributeDisabled' />" +
			"<span class='input-group-btn btn default'><i class='fa fa-calendar'></i></span> <span class='bt-flabels__error-desc_date'>Required</span></div></div></div></div>";
	
	htmlElement += "<div id='documentAttribute"+proofNumber+"'></div>";
	
	htmlElement += "</div>";
	$("#main_document_section").last().append(htmlElement);
	initParsely(jQuery);
	
	$('select').select2();
	$('select').select2({'allowClear':true});
	
	pcframework.initUniform();
	ComponentsPickers.init();
	$(".datePicker" ).datepicker({
		changeMonth: true,
   	    changeYear: true,
   	    yearRange: '0:+100'
    });
	proofNumber++;
};

$(document).on('click','#btnAddDocument',function(){
	_paq.push(['trackEvent', 'KYCSubject', 'AdditionalDocument','Adding additional document']);
	addProofDocument();
});

$(document).on('change','.optProof',function(){
	var lastItem = this.id.split("_")[1];
	var documentId = "additionalDocuments"+ lastItem + "_documentList0_documentId";
	var $option = $(this).find('option:selected');
    var value = $option.val();
    
    validateTemplateProof(lastItem,false);
    if(value==''){
    	$('#'+documentId).html("<option value=''></option>");
    	$('#'+documentId).trigger('change');
    	$('#'+documentId).attr("disabled", true);
    	return;
    }
    
    $("#documentAttribute"+lastItem).html("");
    $('#'+documentId).attr("disabled", false);
    $('#'+documentId).html("<option value=''></option>");
    var url = $("#commonContextPathId").val() + '/kyc/proof?proofId='+value;
	ajaxCallBack("GET", url,"","json",function(response){
		if(response.length>0){
			var documentList = response[0].documentList;
			for(var i=0;i<documentList.length;i++){
				var documentObject = documentList[i];
				$('#'+documentId).append($('<option>',{value:documentObject.documentId}).text(documentObject.documentName));
			}
			$('#'+documentId).trigger('change');
		}
	});
});

$(document).on('change','select.optDocument',function(){
	var $option = $(this).find('option:selected');
    var selectedId = this.id;
	var value = $option.val();
	
	var lastItem = selectedId.split("_")[0];
	var rowNumber = lastItem[lastItem.length -1];
	$("#documentAttribute"+rowNumber).html("");
	
	if(value!=""){
		if(jQuery.inArray(value, counts) !== -1){
	    	bootbox.alert("Same document is already selected please select another document!", function () {});
	    	$("#"+selectedId).select2("val", "");
	    	validateTemplateProof(rowNumber,false);
	    	return;
	    }
		$("select.optDocument" ).each(function( index ) {
			var $opt = $(this).find('option:selected');
			var tempId = this.id;
		    if(selectedId != tempId && value==$opt.val()){
		    	bootbox.alert("Same document is already selected please select another document!", function () {});
		    	$("#"+selectedId).select2("val", "");
		    }else{
		    	var url = $("#commonContextPathId").val() + '/kyc/document?documentId='+value;
		    	ajaxCallBack("GET", url,"","json",function(response){
		    		if(response.length>0){
		    			var htmlElement = "";
		    			var attributeList = response[0].documentList;
		    			for(var i=0;i<attributeList.length;i++){
		    				
		    				var field_name = "additionalDocuments["+rowNumber+"].documentList[0].documentAttributeList["+i+"].documentAttributeName" ;
		    				var value_field_name = "additionalDocuments["+rowNumber+"].documentList[0].documentAttributeList["+i+"].documentAttributeValue";
		    				
		    				if(attributeList[i].documentAttributeName == 'Receive Date'){
		    					$('[data-attribute-name="receive-date-name-' + rowNumber + '"]').attr("name",field_name);
		    					$('[data-attribute-value="receive-date-value-' + rowNumber + '"]').attr("name",value_field_name);
		    				}else if(attributeList[i].documentAttributeName == 'Expiry Date'){
		    					$('[data-attribute-name="expiry-date-name-' + rowNumber + '"]').attr("name",field_name);
		    					$('[data-attribute-value="expiry-date-value-' + rowNumber + '"]').attr("name",value_field_name);
		    				}else{
		    					htmlElement += "<div class='col-md-3'><input type='hidden' name='"+field_name+"' value='"+attributeList[i].documentAttributeName+"'/>" +
				    			"<input type='hidden' name='"+value_field_name+"' /></div>";
		    				}
		    			}
		    			$("#documentAttribute"+rowNumber).html(htmlElement);
		    		}
		    	});
		    }
		});
		validateTemplateProof(rowNumber,true);
	}else{
		validateTemplateProof(rowNumber,false);
	}
});

var validateTemplateProof = function(rowNumber,validate){
	var documentField = "additionalDocuments["+rowNumber+"].documentList[0].fileName";
	var fileField = "additionalDocuments["+rowNumber+"].documentList[0].documentFile";
	var dateField = "data-attribute-value='receive-date-value-" + rowNumber + "'";
	var brnRemove = "removeFileA_"+rowNumber+"_0";
	var isSentRequestToFCHField = "additionalDocuments["+rowNumber+"].documentList[0].isSentRequestToFCH";
	
	$("[name='"+documentField+"']").val('');
	$("[name='"+fileField+"']").val('');
	$('#' + brnRemove).addClass('hidden');
	$('['+dateField+']').val('');
	
	if(validate){
		$("[name='"+documentField+"']").attr("data-parsley-required",true);
		$("[name='"+documentField+"']").addClass("field-background");
		
		$('['+dateField+']').attr("data-parsley-required",true);
		$('['+dateField+']').addClass("field-background");
		$("[name='"+isSentRequestToFCHField+"']").val(true);
	}else{
		$("[name='"+documentField+"']").attr("data-parsley-required",false);
		$("[name='"+documentField+"']").removeClass("field-background");
		$("[name='"+documentField+"']").closest("div.bt-flabel__float").removeClass("bt-flabels__error");
		
		$('['+dateField+']').attr("data-parsley-required",false);
		$('['+dateField+']').removeClass("field-background");
		$('['+dateField+']').closest("div.bt-flabel__float").removeClass("bt-flabels__error");
		$("[name='"+isSentRequestToFCHField+"']").val(false);
	}
}

var showTemplate = function(proofList){
	var isRequestDocument = $("#isRequestDocument").val();
	var htmlElement = "";
	var proofDocumentFileExtensionsId = $("#proofDocumentFileExtensionsId").val();
	htmlElement += "<div class='row'><div class='col-md-3 col-sm-3 col-xs-3'><ul class='nav nav-tabs' style='border-right: 1px solid #ddd; border-bottom: 0;'>";
	
	if(isRequestDocument === "true"){
		htmlElement +=  "<li class='inv-tabs active' style='width: 100%;'><a href='#tab_0' class='templateDisableAnchor' data-toggle='tab'>Digital Channel</a></li>";
	}
	
	for(var i=0;i<proofList.length;i++){
		var proofObject = proofList[i];
		if(isRequestDocument === "true"){
			var count = i+1;
			htmlElement +=  "<li class='inv-tabs' style='width: 100%;'><a href='#tab_" + count + "' class='templateDisableAnchor' data-toggle='tab'>"+proofObject.proofName+"</a></li>";
		}else{
			var active = "";
			if(i==0)
				active = "active";
			
			htmlElement +=  "<li class='inv-tabs "+active+"' style='width: 100%;'><a href='#tab_" + i + "' class='templateDisableAnchor' data-toggle='tab'>"+proofObject.proofName+"</a></li>";
		}
	}
	htmlElement += "</ul></div><div class='col-md-9 col-sm-9 col-xs-9'><div class='tab-content document-tab'>";
	
	if(isRequestDocument === "true"){
		htmlElement += "<div class='tab-pane fade in active' id='tab_0'>";
		htmlElement += "<div class='row'><div class='col-md-12'><label class='bold'>To Send Request To The KYC Subject for Documents</label></div></div><br><br>";
		htmlElement += "<div class='col-md-6'><div class='form-group'><label class='bold'>Business Comment</label><textarea id='businessComment' placeholder='Insert Comment For User (Optional)' rows='5' style='min-width: 100%' maxlength='500'></textarea></div></div><div class='col-md-6'></div><br>";
		if($("#emailAddress").val() != '')
          	htmlElement += "<div class='row' id='requestDocumentDiv' style='display:block;'><div class='col-md-12'><button type='button' class='btn-itg-file btn btn-sm grey-gallery' id='btnrequestDocument'>&nbsp;Request Document</button></div></div>";
        else	
          	htmlElement += "<div class='row' id='requestDocumentDiv' style='display:block;'><div class='col-md-12'><button type='button' class='btn-itg-file btn btn-sm grey-gallery' id='btnrequestDocument' disabled='disabled'>&nbsp;Request Document</button></div></div>";
		//end tab_0
		htmlElement += "</div>";
	}
	
	for(var i=0;i<proofList.length;i++){
		var proofObject = proofList[i];
		if(isRequestDocument === "true"){
			var count = i+1;
			htmlElement += "<div class='tab-pane fade in' id='tab_"+count+"'><input type='hidden' name='proofList["+i+"].proofId' value='"+proofObject.proofId+"'/>";
		}else{
			var active = "";
			if(i==0)
				active = "active";
			
			htmlElement += "<div class='tab-pane fade in "+active+"' id='tab_"+i+"'><input type='hidden' name='proofList["+i+"].proofId' value='"+proofObject.proofId+"'/>";
		}
		var documentList = proofObject.documentList;
		var documentAttributeDataLength = "255";
		for(var j=0;j<documentList.length;j++){
			var documentObject = documentList[j];
			
			htmlElement += "<div class='row'><div class='col-md-4'><div class='form-group'><input type='hidden' id='isDocSelected"+i+"_"+j+"_hidden' name='proofList["+i+"].documentList["+j+"].isDocumentSelected' /><input type='hidden' id='isSentRequestToFCH"+i+"_"+j+"_hidden' name='proofList["+i+"].documentList["+j+"].isSentRequestToFCH' value='false' /><input type='checkbox' class='documentsDisable' name='proofList["+i+"].documentList["+j+"].documentId' id='isDocSelected"+i+"_"+j+"' onclick=\"javascript:displaydocs(this,\'"+i+"\',\'"+j+"\',\'"+documentObject.documentId+"\',\'"+documentObject.documentAttributeList.length+"\');\">" +
					"<label class='control-label'>"+documentObject.documentName+"</label></div></div><div class='col-md-8 document"+i+"_"+j+"' style='display: none'>" +
					"<div class='radio-list'> <label class='radio-inline'><b>Document Received&nbsp;:&nbsp;</b></label> <label class='radio-inline'>" +
					"<input type='radio' checked='checked' name='proofList["+i+"].documentList["+j+"].documentReceived' id='isDocumentReceivedYes"+i+"_"+j+"' value='1' onclick=\"showdocFields(this.value,\'"+i+"\',\'"+j+"\',\'"+documentObject.documentAttributeList.length+"\')\"><span>&nbsp;Yes&nbsp;&nbsp;</span></label>&nbsp;</label> &nbsp;" +
					"<label class='radio-inline'><input type='radio' name='proofList["+i+"].documentList["+j+"].documentReceived' id='isDocumentReceivedNo"+i+"_"+j+"' value='0' onclick=\"showdocFields(this.value,\'"+i+"\',\'"+j+"\',\'"+documentObject.documentAttributeList.length+"\')\"><span>&nbsp;No&nbsp;&nbsp;</span></label>&nbsp;" +
					"<label class='radio-inline'><input type='radio' name='proofList["+i+"].documentList["+j+"].documentReceived' id='isDocumentReceivedWaiver"+i+"_"+j+"' value='2' onclick=\"showdocFields(this.value,\'"+i+"\',\'"+j+"\',\'"+documentObject.documentAttributeList.length+"\')\"><span>&nbsp;Waiver&nbsp;&nbsp;</span></label>&nbsp;</div></div></div>" +
					"<input type='hidden' name='proofList["+i+"].documentList["+j+"].isIndividualDoc' value='"+documentObject.isIndividualDoc+"' />" +
					"<input type='hidden' name='proofList["+i+"].documentList["+j+"].isOcrEligibleDoc' value='"+documentObject.isOcrEligibleDoc+"' />" +
					"<input type='hidden' name='proofList["+i+"].documentList["+j+"].isExpiryDateMandatory' value='"+documentObject.isExpiryDateMandatory+"' />";
					if(documentObject.isOcrEligibleDoc) {
						htmlElement += "<input type='hidden' id='proofList"+i+".documentList"+j+".isMRZMatches' name='proofList["+i+"].documentList["+j+"].isMRZMatches' value='"+documentObject.isMRZMatches+"' />" +
						"<input type='hidden' id='proofList"+i+".documentList"+j+".worldCheckMRZCodeList0' name='proofList["+i+"].documentList["+j+"].worldCheckMRZCodeList[0]' />"+
						"<input type='hidden' id='proofList"+i+".documentList"+j+".worldCheckMRZCodeList1' name='proofList["+i+"].documentList["+j+"].worldCheckMRZCodeList[1]' />"+
						"<input type='hidden' id='proofList"+i+".documentList"+j+".worldCheckMRZCodeList2' name='proofList["+i+"].documentList["+j+"].worldCheckMRZCodeList[2]' />"+
						"<input type='hidden' id='proofList"+i+".documentList"+j+".ocrMRZCodeList0' name='proofList["+i+"].documentList["+j+"].ocrMRZCodeList[0]' />"+
						"<input type='hidden' id='proofList"+i+".documentList"+j+".ocrMRZCodeList1' name='proofList["+i+"].documentList["+j+"].ocrMRZCodeList[1]' />";
					}
					htmlElement += "<div class='row docFieldDetailsNo"+i+"_"+j+"' style='display: none'><div class='col-md-4'><div class='form-group uk-width-1-1'><div class='bt-flabels__wrapper'>" +
					"<label class='parsley_hide'>Due Date</label><div class='input-group' data-date-format='mm/dd/yyyy'><input type='text' id='proofList"+i+".documentList"+j+".dueDate' name='proofList["+i+"].documentList["+j+"].dueDate' " +
					"data-parsley-required='false' placeholder='Due Date' class='dueDatePicker form-control field-background form-control-inline' /> <span class='input-group-btn btn default'><i class='fa fa-calendar'></i></span> <span class='bt-flabels__error-desc_date'>Required</span></div></div></div></div></div>" +
					
					"<div class='row docFieldDetailsWaiver"+i+"_"+j+"' style='display: none'><div class='col-md-6'><div class='form-group uk-width-1-1'><div class='bt-flabels__wrapper'>" +
					"<label class='parsley_hide'>Waiver Reason</label><textarea id='proofList"+i+".documentList"+j+".waiverReason' name='proofList["+i+"].documentList["+j+"].waiverReason' class='field-background' data-parsley-required='false' placeholder='Waiver Reason' rows='5' style='min-width: 100%' maxlength='500'/><span class='bt-flabels__error-desc'>Required</span></div></div></div></div>" +
					
					"<div class='row docFieldDetailsYes"+i+"_"+j+"' style='display: none'>";
					
			var documentAttributeList = documentObject.documentAttributeList;
			for(var k=0;k<documentAttributeList.length;k++){
				var attributeObject = documentAttributeList[k];
				
				htmlElement += "<div class='col-md-4'>" +
						"<div class='form-group uk-width-1-1'>" +
							"<div class='bt-flabels__wrapper'>" +
								"<label class='parsley_hide'>"+attributeObject.documentAttributeName+"</label>" +
									"<input type='hidden' name='proofList["+i+"].documentList["+j+"].documentAttributeList["+k+"].documentAttributeName' value='"+attributeObject.documentAttributeName+"' />" +
									"<input type='hidden' name='proofList["+i+"].documentList["+j+"].documentAttributeList["+k+"].documentAttributeDataType' value='"+attributeObject.documentAttributeDataType+"' />" +
									"<input type='hidden' name='proofList["+i+"].documentList["+j+"].documentAttributeList["+k+"].isMandatory' value='"+attributeObject.isMandatory+"' />";
				
				var fieldBackground = "";
				if(attributeObject.documentAttributeName=="Receive Date")
					fieldBackground = "field-background attributeDisable";
					
				if(attributeObject.isMandatory)
					fieldBackground = "field-background attributeDisable";
				
				if(attributeObject.documentAttributeDataType == 'Date'){
					htmlElement += "<div class='input-group' data-date-format='mm/dd/yyyy' data-date-end-date='+0d'>" +
										"<input type='text' data-attribute-name='"+attributeObject.documentAttributeName+"' id='proofList"+i+".documentList"+j+".documentAttributeList"+k+".documentAttributeValue' name='proofList["+i+"].documentList["+j+"].documentAttributeList["+k+"].documentAttributeValue' placeholder='"+attributeObject.documentAttributeName+"' data-parsley-required='false' class='documentField datePicker form-control form-control-inline attributeDisabled "+fieldBackground+"'/>" +
												"<span class='input-group-btn btn default'><i class='fa fa-calendar'></i></span><span class='bt-flabels__error-desc_date'>Required</span>" +
									"</div>";
				}else{
					if(attributeObject.documentAttributeDataLength != null && attributeObject.documentAttributeDataLength != ""){
						documentAttributeDataLength = attributeObject.documentAttributeDataLength;
					}
					htmlElement += "<input type='text' data-attribute-name='"+attributeObject.documentAttributeName+"' id='proofList"+i+".documentList"+j+".documentAttributeList"+k+".documentAttributeValue' name='proofList["+i+"].documentList["+j+"].documentAttributeList["+k+"].documentAttributeValue' placeholder='"+attributeObject.documentAttributeName+"' maxlength='"+documentAttributeDataLength+"' data-parsley-required='false' class='form-control attributeDisabled "+fieldBackground+"' /> <span class='bt-flabels__error-desc'>Required</span>";
				}
				htmlElement += "</div></div></div>";
			}
			
			if(documentObject.isOcrEligibleDoc) {
				var passportDocAttrList = documentObject.passportDocumentAttributeList;
				for(var k=0;k<passportDocAttrList.length;k++) {
					var passportAttrObject = passportDocAttrList[k];
					
					htmlElement += "<div class='col-md-4'>" +
							"<div class='form-group uk-width-1-1'>" +
								"<div class='bt-flabels__wrapper'>" +
									"<label class='parsley_hide'>"+passportAttrObject.documentAttributeName+"</label>" +
										"<input type='hidden' name='proofList["+i+"].documentList["+j+"].passportDocumentAttributeList["+k+"].documentAttributeName' value='"+passportAttrObject.documentAttributeName+"' />" +
										"<input type='hidden' name='proofList["+i+"].documentList["+j+"].passportDocumentAttributeList["+k+"].documentAttributeDataType' value='"+passportAttrObject.documentAttributeDataType+"' />" +
										"<input type='hidden' name='proofList["+i+"].documentList["+j+"].passportDocumentAttributeList["+k+"].isMandatory' value='"+passportAttrObject.isMandatory+"' />" +
										"<input type='hidden' name='proofList["+i+"].documentList["+j+"].passportDocumentAttributeList["+k+"].isOCRValue' value='"+passportAttrObject.isOCRValue+"' />";
					
					if(passportAttrObject.documentAttributeDataType == 'Date'){
						htmlElement += "<div class='input-group' data-date-format='mm/dd/yyyy' data-date-end-date='+0d'>" +
											"<input type='text' data-attribute-name='"+passportAttrObject.documentAttributeName+"' id='proofList"+i+".documentList"+j+".passportDocumentAttributeList"+k+".documentAttributeValue' name='proofList["+i+"].documentList["+j+"].passportDocumentAttributeList["+k+"].documentAttributeValue' placeholder='"+passportAttrObject.documentAttributeName+"' data-parsley-required='false' class='documentField datePicker form-control form-control-inline field-background psPortFld' disabled='disabled'/>" +
													"<span class='input-group-btn btn default'><i class='fa fa-calendar'></i></span><span class='bt-flabels__error-desc_date'>Required</span>"+
													"<span class='ocrTextSpan' id='ocrTextSpan_"+i+"_"+j+"_"+k+"' style='right:50px;z-index:2;display:none'>OCR</span>" +
										"</div>";
					}else{
						if(passportAttrObject.documentAttributeDataLength != null && passportAttrObject.documentAttributeDataLength != ""){
							documentAttributeDataLength = passportAttrObject.documentAttributeDataLength;
						}
						htmlElement += "<input type='text' data-attribute-name='"+passportAttrObject.documentAttributeName+"' id='proofList"+i+".documentList"+j+".passportDocumentAttributeList"+k+".documentAttributeValue' name='proofList["+i+"].documentList["+j+"].passportDocumentAttributeList["+k+"].documentAttributeValue' placeholder='"+passportAttrObject.documentAttributeName+"' maxlength='"+documentAttributeDataLength+"' data-parsley-required='false' class='form-control field-background psPortFld' disabled='disabled' /> <span class='bt-flabels__error-desc'>Required</span>"+
								"<span class='ocrTextSpan' id='ocrTextSpan_"+i+"_"+j+"_"+k+"' style='display:none'>OCR</span>";
					}
					htmlElement += "</div></div></div>";
				}
			}
			htmlElement += "</div>";
			
			htmlElement += "<div class='row docFieldDetailsYes"+i+"_"+j+"' style='display: none'>" +
								"<div class='col-md-4'>" +
									"<div class='form-group uk-width-1-1'><div class='bt-flabels__wrapper'>" +
										"<label class='parsley_hide'>"+documentObject.documentName+"</label>" +
										"<input type='file' data-document-id='"+documentObject.documentId+"' class='hidden' name='proofList["+i+"].documentList["+j+"].documentFile' id='file_"+i+"_"+j+"' onchange=\"javascript:onChangeFile('"+i+"','"+j+"');\" accept='"+proofDocumentFileExtensionsId+"'>" +
										"<input type='text' readonly='true' id='proofList"+i+".documentList"+j+".fileName' name='proofList["+i+"].documentList["+j+"].fileName' class='documentField form-control field-background attributeDisable' placeholder='"+documentObject.documentName+"' data-parsley-required='false' data-parsley-group='docAvailable' />" +
										"<span class='bt-flabels__error-desc_date' style='right: 10px;'>Required</span>" +
									"</div></div>" +
								"</div>" +
								"<div class='col-md-2'>" +
									"<button type='button' class='btn-itg-file btn btn-sm grey-gallery uploadDocument' id='uploadFile_"+i+"_"+j+"' value='Change' onclick=\"$('#file_"+i+"_"+j+"\').click()\"> <i class='fa fa-folder-open-o'></i>&nbsp;Browse </button>&nbsp;&nbsp;&nbsp;" +
									"<button type='button' class='btn-itg-file btn btn-sm grey-gallery hidden deletdDocument' id='removeFile_"+i+"_"+j+"' value='Remove' onclick=\"javascript:removeOnClick('"+i+"','"+j+"');\"><i class='fa fa-trash'></i> </button>" +
								"</div>" +
								"<div class='col-md-2'></div>" +
								"<div class='col-md-4'>" +
									"<div class='form-group uk-width-1-1'><div class='bt-flabels__wrapper'>" +
										"<label class='parsley_hide'>Reference Number</label>" +
										"<input type='text' id='proofList"+i+".documentList"+j+".referenceNumber' name='proofList["+i+"].documentList["+j+"].referenceNumber' class='form-control textRequired attributeDisabled' data-parsley-required='false' placeholder='Reference Number' maxlength='255'/>" +
										"<span class='bt-flabels__error-desc'>Required</span>" +
									"</div>" +
								"</div>" +
							"</div></div>";

			htmlElement += "<div class='row docFieldDetailsYes"+i+"_"+j+"' style='display: none'>" +
								"<div class='col-md-6'><div class='form-group uk-width-1-1'><div class='bt-flabels__wrapper'> <label class='parsley_hide'>Comment</label>" +
								"<textarea id='proofList"+i+".documentList"+j+".comment' name='proofList["+i+"].documentList["+j+"].comment' class='field-background attributeDisabled' data-parsley-required='false' placeholder='Comment' rows='5' style='min-width: 100%' maxlength='500'></textarea> <span class='bt-flabels__error-desc'>Required</span></div></div></div></div>";
			
			if(documentObject.isOcrEligibleDoc) {
				htmlElement += "<div class='row docFieldDetailsYes"+i+"_"+j+"' style='display: none'><div class='passportStatusDiv' style='display: none'>" +
						"<div class='row'><div class='col-md-2'><label class='noteLabel bold'>Passport Status</label></div><div class='col-md-2'><img id='pStatusImg' style='height: 20px;width:20px;' src=''><label class='noteLabel passportStatus' style='text-indent: 10px'></label></div><div class='col-md-3'><label class='noteLabel'>Click on the status to show details</label></div></div>" +
						"<input type='hidden' id='proofList"+i+".documentList"+j+".passPortStatus' name='proofList["+i+"].documentList["+j+"].passPortStatus' />" +					
						"<div class='row'><div class='col-md-2'><label class='noteLabel bold'>Actioned By</label></div><div class='col-md-2'><label class='noteLabel actionedBy'></label></div></div>" +
						"<input type='hidden' id='proofList"+i+".documentList"+j+".verifyActionedBy' name='proofList["+i+"].documentList["+j+"].verifyActionedBy' />" +	
						"<div class='row'><div class='col-md-2'><label class='noteLabel bold'>Date</label></div><div class='col-md-2'><label class='noteLabel passportScreenDate'></label></div></div>" +
						"<input type='hidden' id='proofList"+i+".documentList"+j+".passportVerificationDate' name='proofList["+i+"].documentList["+j+"].passportVerificationDate' />" +	
						"</div></div>";
			}
			htmlElement += "<hr />";
			
		}
		htmlElement += "</div>";
	}
	htmlElement += "</div></div></div>";
	$("#templateDiv").html(htmlElement);
	pcframework.initUniform();
	ComponentsPickers.init();
	$(".datePicker" ).datepicker({
		changeMonth: true,
   	    changeYear: true,
   	    yearRange: '1800:+100'
    });
	$(".dueDatePicker" ).datepicker({
		changeMonth: true,
   	    changeYear: true,
   	    maxDate: "+60d",
   	    minDate: "0"
    });
	initParsely(jQuery);
	counts = [];
}

var showDocuments = function (data) {
	var unUsedDiv = '';
	var usedDiv = '';

	var unUsedDocument = JSON.parse(data.unUsedDocument);
	var usedDocument = JSON.parse(data.usedDocument);

	if (usedDocument.length > 0) {
		for (var i = 0; i < usedDocument.length; i++) {
			usedDiv += "<div class='col-md-4'><div class='portlet'><div class='portlet-title'><div class='caption'><i class='parsley_hide'></i>" + usedDocument[i].proofName + "</div><div class='tools'><a href='javascript:;' class='collapse' data-original-title='' title=''></a></div></div><div class='portlet-body'><div class='panel-group accordion' id='tab3_template" + i + "'>";
			var documentList = usedDocument[i].documentList;
			for (var j = 0; j < documentList.length; j++) {
				if (documentList[j].documentReceived == "1") {
					usedDiv += "<div class='panel panel-default'><div class='panel-heading'><h4 class='panel-title'><a class='accordion-toggle accordion-toggle-styled collapsed' data-toggle='collapse' data-parent='#accordion_" + j + "' href='#tab3_template1_collapse_" + i + "_" + j + "'>" + documentList[j].documentName + "<span style='float:right'>[Received: YES]</span></a></h4></div><div id='tab3_template1_collapse_" + i + "_" + j + "' class='panel-collapse collapse' style='height: 0px;'><div class='panel-body'><div class='form-group'><div class='col-md-12'>";
					var attributList = documentList[j].documentAttributeList;
					for (var k = 0; k < attributList.length; k++) {
						usedDiv += "<div class='row'><div class='col-md-6'><label class='control-label bold'>" + attributList[k].documentAttributeName + "</label></div><div class='col-md-6'><p class='form-control-static'><span>" + attributList[k].documentAttributeValue + "</span></p></div></div>";
					}
					var comment = "&nbsp;"
					if(documentList[j].comment != null && documentList[j].comment != '')
						comment = documentList[j].comment;
					var referenceNumber = "&nbsp;"
					if(documentList[j].referenceNumber != null && documentList[j].referenceNumber != '')
						referenceNumber = documentList[j].referenceNumber;
					usedDiv += "<div class='row'><div class='col-md-6'><label class='control-label bold'>Document:</label></div><div class='col-md-6'><label class='docName doc-name-align'><i class='fa fa-paperclip'></i>  " + documentList[j].fileName + "</label></div></div><div class='row'><div class='col-md-6'><label class='control-label bold'>Reference Number:</label></div><div class='col-md-6'><p class='form-control-static doc-name-align'><span>" + referenceNumber + "</span></p></div></div><div class='row'><div class='col-md-6'><label class='control-label bold'>Comment:</label></div><div class='col-md-6'><p class='form-control-static doc-name-align'><span>" + comment + "</span></p></div></div></div></div></div></div></div>";
				}
			}
			usedDiv += "</div></div></div></div>";
		}
	} else
		usedDiv = '<div class="col-md-12"><label class="text-danger">No Document found</label></div>';

	if (unUsedDocument.length > 0) {
		for (var i = 0; i < unUsedDocument.length; i++) {
			unUsedDiv += "<div class='col-md-4'><div class='portlet'><div class='portlet-title'><div class='caption'><i class='parsley_hide'></i>" + unUsedDocument[i].proofName + "</div><div class='tools'><a href='javascript:;' class='collapse' data-original-title='' title=''></a></div></div><div class='portlet-body'><div class='panel-group accordion' id='tab3_template" + i + "'>";
			var documentList = unUsedDocument[i].documentList;
			for (var j = 0; j < documentList.length; j++) {
				if (documentList[j].documentReceived == "1") {
					unUsedDiv += "<div class='panel panel-default'><div class='panel-heading'><h4 class='panel-title'><a class='accordion-toggle accordion-toggle-styled collapsed' data-toggle='collapse' data-parent='#accordion_" + j + "' href='#tab3_template1_unused_collapse_" + i + "_" + j + "'>" + documentList[j].documentName + "<span style='float:right'>[Received: YES]</span></a></h4></div><div id='tab3_template1_unused_collapse_" + i + "_" + j + "' class='panel-collapse collapse' style='height: 0px;'><div class='panel-body'><div class='form-group'><div class='col-md-12'>";
					var attributList = documentList[j].documentAttributeList;
					for (var k = 0; k < attributList.length; k++) {
						unUsedDiv += "<div class='row'><div class='col-md-6'><label class='control-label bold'>" + attributList[k].documentAttributeName + "</label></div><div class='col-md-6'><p class='form-control-static'><span>" + attributList[k].documentAttributeValue + "</span></p></div></div>";
					}
					var comment = "&nbsp;"
					if(documentList[j].comment != null && documentList[j].comment != '')
						comment = documentList[j].comment;
					var referenceNumber = "&nbsp;"
					if(documentList[j].referenceNumber != null && documentList[j].referenceNumber != '')
						referenceNumber = documentList[j].referenceNumber;
					unUsedDiv += "<div class='row'><div class='col-md-6'><label class='control-label bold'>Document:</label></div><div class='col-md-6'><label class='docName doc-name-align'><i class='fa fa-paperclip'></i>  " + documentList[j].fileName + "</label></div></div><div class='row'><div class='col-md-6'><label class='control-label bold'>Reference Number:</label></div><div class='col-md-6'><p class='form-control-static doc-name-align'><span>" + referenceNumber + "</span></p></div></div><div class='row'><div class='col-md-6'><label class='control-label bold'>Comment:</label></div><div class='col-md-6'><p class='form-control-static doc-name-align'><span>" + comment + "</span></p></div></div></div></div></div></div></div>";
				}
			}
			unUsedDiv += "</div></div></div></div>";
		}
	} else
		unUsedDiv = '<div class="col-md-12"><label class="text-danger">No Document found</label></div>';

	$("#kycTemplateName").text("[" + data.templateName + "]");
	$("#unUsedProofDiv").html(unUsedDiv);
	$("#usedProofDiv").html(usedDiv);
};

var showHideDiv = function (id) {
	$('#saveButton').attr("disabled", true);
	var totalRiskLevel = $("#totalRiskLevel").val();
	var typeOfCounterpartyCode = $("#typeOfCounterpartyCode").val();
	
	if(isMitigationWorkflow === 'true') {
		if(totalRiskLevel == "High" || totalRiskLevel == "Medium" || typeOfCounterpartyCode === 'Entity'){
			$(".metigation").show(500);
			$("#btnContinueMitigation").show(500);
		}else{
			$(".metigation").hide(300);
			$("#btnContinueMitigation").hide(300);
		}
	}
	else {
		$(".metigation").show(500);
		$("#btnContinueMitigation").show(500);
	}
	
	 if ((id == "3" && totalRiskLevel == "Low" && typeOfCounterpartyCode == 'Individual' && isMitigationWorkflow === 'true') || id == "4")
		 $('#saveButton').attr("disabled", false);

	var tabId = "tab" + id;
	$(".tab_pane").hide(300);
	$("#" + tabId).show(500);
	$(".nav_li").removeClass('active');
	$("#nav_li_" + id).addClass('active');
};

$("#typeOfCounterpartyCode").change(function () {
	// document.getElementById("userProof").innerHTML = "";
	//loadSectionTabs(this.value,$("#instanceName").val(),false,null,null);
	var typeOfCounterpartyCode = this.value;
	if (typeOfCounterpartyCode != null && typeOfCounterpartyCode != "") {
		$('.contactDetails').attr("disabled", false);
		$('#frm').parsley().destroy();
		$('#frm').attr("method", "post");
		$('#frm').attr("action", $("#commonContextPathId").val() + "/kyc/subject/addPage");
		$('#frm').submit();
		buffer();
	}
	/* else {
		document.getElementById('userProofAndConsent').style.display = 'none';
	}*/
});

var counts = [];

function displaydocs(value, proofIndex, documentIndex, documentId, attributeCount) {
	console.log("proofIndex  ::" + proofIndex + " documentIndex :: " + documentIndex + " documentId :: " + documentId);
	var formData = getKYCData("frm");
	formData = unflatten(formData);
	var passportFldLen = 0;
	if(formData.proofList[proofIndex].documentList[documentIndex].isOcrEligibleDoc == 'true') {
		passportFldLen = formData.proofList[proofIndex].documentList[documentIndex].passportDocumentAttributeList.length;
	}
	if (value.checked) {
		$('#uniform-isDocumentReceivedYes' + proofIndex + "_" + documentIndex + ">span").addClass("checked");
		//on check of document showing the default yes fields with parsely validation
		$(".docFieldDetailsYes" + proofIndex + "_" + documentIndex).show(300);
		document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.fileName').setAttribute('data-parsley-required', 'true');
		document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.fileName').dispatchEvent(new Event("change"));

		document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.referenceNumber').setAttribute('data-parsley-required', 'false');
		document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.referenceNumber').dispatchEvent(new Event("change"));

		document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.comment').setAttribute('data-parsley-required', 'false');
		document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.comment').dispatchEvent(new Event("change"));

		var documentAttributeList = formData.proofList[proofIndex].documentList[documentIndex].documentAttributeList;
		for (var i = 0; i < attributeCount; i++) {
			if(document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.documentAttributeList' + i + '.documentAttributeValue').getAttribute('data-attribute-name') == "Receive Date")
				document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.documentAttributeList' + i + '.documentAttributeValue').setAttribute('data-parsley-required', 'true');
			document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.documentAttributeList' + i + '.documentAttributeValue').dispatchEvent(new Event("change"));
			
			if(documentAttributeList[i].isMandatory == 'true') {
				document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.documentAttributeList' + i + '.documentAttributeValue').setAttribute('data-parsley-required', 'true');
				document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.documentAttributeList' + i + '.documentAttributeValue').dispatchEvent(new Event("change"));
			}
			
		}
		if(formData.proofList[proofIndex].documentList[documentIndex].isOcrEligibleDoc == 'true') {
			for (var i = 0; i < passportFldLen; i++) {
				document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.passportDocumentAttributeList' + i + '.documentAttributeValue').setAttribute('data-parsley-required', 'true');
				document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.passportDocumentAttributeList' + i + '.documentAttributeValue').dispatchEvent(new Event("change"));
			}
		}
		//Parsley validation setting false
		document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.dueDate').setAttribute('data-parsley-required', 'false');
		document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.dueDate').dispatchEvent(new Event("change"));

		document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.waiverReason').setAttribute('data-parsley-required', 'false');
		document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.waiverReason').dispatchEvent(new Event("change"));
		
		var additionaldocFlag = false;
		$("select.optDocument" ).each(function( index ) {
			var $opt = $(this).find('option:selected');
			if(documentId == $opt.val())
		    	additionaldocFlag = true;
		});
		
		if (jQuery.inArray(documentId, counts) !== -1 || additionaldocFlag) {
			$('#isDocSelected' + proofIndex + "_" + documentIndex).prop("checked", false);
			$('#isDocSelected' + proofIndex + "_" + documentIndex + '_hidden').val("false");
			$('#isDocSelected' + proofIndex + "_" + documentIndex).val("");
			$(".document" + proofIndex + "_" + documentIndex).hide(300);
			$(".docFieldDetailsNo" + proofIndex + "_" + documentIndex).hide(300);
			$(".docFieldDetailsYes" + proofIndex + "_" + documentIndex).hide(300);
			$(".docFieldDetailsWaiver" + proofIndex + "_" + documentIndex).hide(300);
			bootbox.alert("Same document is already selected please select another document!", function () {});


			document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.fileName').setAttribute('data-parsley-required', 'false');
			document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.fileName').dispatchEvent(new Event("change"));

			document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.referenceNumber').setAttribute('data-parsley-required', 'false');
			document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.referenceNumber').dispatchEvent(new Event("change"));

			document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.comment').setAttribute('data-parsley-required', 'false');
			document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.comment').dispatchEvent(new Event("change"));

			for (var i = 0; i < attributeCount; i++) {
				document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.documentAttributeList' + i + '.documentAttributeValue').setAttribute('data-parsley-required', 'false');
				document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.documentAttributeList' + i + '.documentAttributeValue').dispatchEvent(new Event("change"));
			}

		} else {
			$('#isDocSelected' + proofIndex + "_" + documentIndex + '_hidden').val("true");
			$('#isDocSelected' + proofIndex + "_" + documentIndex).val(documentId);
			var name = "proofList["+proofIndex+"].documentList["+documentIndex+"].isSentRequestToFCH";
			$('[name="'+name+'"]').val(true);
			$(".document" + proofIndex + "_" + documentIndex).show(500);
			counts.push(documentId);
		}
	} else {
		$('#uniform-isDocumentReceivedYes' + proofIndex + "_" + documentIndex + ">span").removeClass("checked");
		$('#uniform-isDocumentReceivedNo' + proofIndex + "_" + documentIndex + ">span").removeClass("checked");
		$('#uniform-isDocumentReceivedWaiver' + proofIndex + "_" + documentIndex + ">span").removeClass("checked");

		//on uncheck of document hiding the default yes fields with no parsely validation
		document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.fileName').setAttribute('data-parsley-required', 'false');
		document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.fileName').dispatchEvent(new Event("change"));

		document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.referenceNumber').setAttribute('data-parsley-required', 'false');
		document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.referenceNumber').dispatchEvent(new Event("change"));

		document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.comment').setAttribute('data-parsley-required', 'false');
		document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.comment').dispatchEvent(new Event("change"));

		for (var i = 0; i < attributeCount; i++) {
			document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.documentAttributeList' + i + '.documentAttributeValue').setAttribute('data-parsley-required', 'false');
			document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.documentAttributeList' + i + '.documentAttributeValue').dispatchEvent(new Event("change"));
		}
		if(formData.proofList[proofIndex].documentList[documentIndex].isOcrEligibleDoc == 'true') {
			for (var i = 0; i < passportFldLen; i++) {
				document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.passportDocumentAttributeList' + i + '.documentAttributeValue').setAttribute('data-parsley-required', 'false');
				document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.passportDocumentAttributeList' + i + '.documentAttributeValue').dispatchEvent(new Event("change"));
			}
		}

		$('#isDocSelected' + proofIndex + "_" + documentIndex + '_hidden').val("false");
		$('#isDocSelected' + proofIndex + "_" + documentIndex).val("");
		var name = "proofList["+proofIndex+"].documentList["+documentIndex+"].isSentRequestToFCH";
		$('[name="'+name+'"]').val(false);
		$(".document" + proofIndex + "_" + documentIndex).hide(300);
		$(".docFieldDetailsNo" + proofIndex + "_" + documentIndex).hide(300);
		$(".docFieldDetailsYes" + proofIndex + "_" + documentIndex).hide(300);
		$(".docFieldDetailsWaiver" + proofIndex + "_" + documentIndex).hide(300);

		var i;
		while ((i = counts.indexOf(documentId)) != -1) {
			counts.splice(i, 1);
		}
		document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.dueDate').setAttribute('data-parsley-required', 'false');
		document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.waiverReason').setAttribute('data-parsley-required', 'false');
	}
}

function onChangeFileA(i, j) {
	var fileInput = document.getElementById("fileA_" + i + "_" + j);
	var file = fileInput.files[0];
	if (file.size > 105300000) {
		bootbox.alert("File size exceeds 100 MB", function () {});
		$('#fileA_' + i + '_' + j).val('');
		$('#fileA' + i + '_' + j).val('');
		document.getElementById('additionalDocuments' + i + '.documentList' + j + '.fileName').value = '';
		$('#removeFileA_' + i + '_' + j).addClass('hidden');
		$("#fileA" + i + "_" + j).change();
		return false;
	}

	var uploadFile = $('#fileA_' + i + '_' + j).val().split('\\').slice(-1)[0].toString();
	if (uploadFile != "") {
		var acceptedFileExtn = document.getElementById("fileA_" + i + "_" + j).getAttribute("accept");
		if (acceptedFileExtn != undefined && acceptedFileExtn != "") {
			var acceptedFileExtnArray = acceptedFileExtn.split(",");
			var fileExtn = uploadFile.split('.');
			
			var specialCharArr = ["%", "&", "'"];
			if(fileExtn[0].includes(specialCharArr[0]) || fileExtn[0].includes(specialCharArr[1]) || fileExtn[0].includes(specialCharArr[2])) {
				bootbox.alert({
					message: "File name should not contain the following " + specialCharArr + " character(s).",
					buttons: {
						ok: {
							label: 'OK',
							className: 'alert-yes btn btn-sm grey-gallery',
						}
					},
					callback: function () {
						$('#fileA_' + i + '_' + j).val('');
						$('#fileA' + i + '_' + j).val('');
						document.getElementById('additionalDocuments' + i + '.documentList' + j + '.fileName').value = '';
						$('#removeFileA_' + i + '_' + j).addClass('hidden');
						$("#fileA" + i + "_" + j).change();
					}
				});
			}
			
			if (acceptedFileExtnArray.includes("." + fileExtn[fileExtn.length - 1].toLowerCase())) {
				$('#fileA' + i + '_' + j).val(uploadFile);
				document.getElementById('additionalDocuments' + i + '.documentList' + j + '.fileName').value = uploadFile;
				$('#removeFileA_' + i + '_' + j).removeClass('hidden');
				$("#removeFileA_" + i + '_' + j).attr('value', 'Change');
				_paq.push(['trackEvent', 'KYCSubject', 'UploadDocument','Uploading additional document']);
			} else {
				bootbox.alert({
					message: "You have selected incorrect file! Please select file with " + acceptedFileExtn + " extension(s).",
					buttons: {
						ok: {
							label: 'OK',
							className: 'alert-yes btn btn-sm grey-gallery',
						}
					},
					callback: function () {
						$('#fileA_' + i + '_' + j).val('');
						$('#fileA' + i + '_' + j).val('');
						document.getElementById('additionalDocuments' + i + '.documentList' + j + '.fileName').value = '';
						$('#removeFileA_' + i + '_' + j).addClass('hidden');
						$("#fileA" + i + "_" + j).change();
					}
				});
			}
		}
	}
}

function removeOnClickA(i, j) {
	$('#fileA_' + i + '_' + j).val('');
	$('#fileA' + i + '_' + j).val('');
	document.getElementById('additionalDocuments' + i + '.documentList' + j + '.fileName').value = '';
	$('#removeFileA_' + i + '_' + j).addClass('hidden');
	$("#fileA" + i + "_" + j).change();
	_paq.push(['trackEvent', 'KYCSubject', 'RemoveDocument','Removing uploaded additional document']);
}

var passPortDocument;
var imageHeight;
var imageWidth;
var passportUploaded = false;
function onChangeFile(i, j) {
	var fileInput = document.getElementById("file_" + i + "_" + j);
	var file = fileInput.files[0];
	if (file.size > 105300000) {
		bootbox.alert("File size exceeds 100 MB", function () {});
		$('#file_' + i + '_' + j).val('');
		$('#file' + i + '_' + j).val('');
		document.getElementById('proofList' + i + '.documentList' + j + '.fileName').value = '';
		$('#removeFile_' + i + '_' + j).addClass('hidden');
		$("#file" + i + "_" + j).change();
		return false;
	}

	var uploadFile = $('#file_' + i + '_' + j).val().split('\\').slice(-1)[0].toString();
	if (uploadFile != "") {
		var acceptedFileExtn = document.getElementById("file_" + i + "_" + j).getAttribute("accept");
		if (acceptedFileExtn != undefined && acceptedFileExtn != "") {
			var acceptedFileExtnArray = acceptedFileExtn.split(",");
			var fileExtn = uploadFile.split('.');
			
			var specialCharArr = ["%", "&", "'"];
			if(fileExtn[0].includes(specialCharArr[0]) || fileExtn[0].includes(specialCharArr[1]) || fileExtn[0].includes(specialCharArr[2])) {
				
				bootbox.alert({
					message: "File name should not contain the following " + specialCharArr + " character(s).",
					buttons: {
						ok: {
							label: 'OK',
							className: 'alert-yes btn btn-sm grey-gallery',
						}
					},
					callback: function () {
						$('#file_' + i + '_' + j).val('');
						$('#file' + i + '_' + j).val('');
						document.getElementById('proofList' + i + '.documentList' + j + '.fileName').value = '';
						$('#removeFile_' + i + '_' + j).addClass('hidden');
						$("#file" + i + "_" + j).change();
					}
				});
				
			}
			
			if (acceptedFileExtnArray.includes("." + fileExtn[fileExtn.length - 1].toLowerCase())) {
				$('#file' + i + '_' + j).val(uploadFile);
				document.getElementById('proofList' + i + '.documentList' + j + '.fileName').value = uploadFile;
				$('#removeFile_' + i + '_' + j).removeClass('hidden');
				$("#removeFile_" + i + '_' + j).attr('value', 'Change');
				_paq.push(['trackEvent', 'KYCSubject', 'UploadDocument','Uploading template document']);
				
				var formData = getKYCData("frm");
				formData = unflatten(formData);
				var proofList = formData.proofList;
				if(proofList[i].documentList[j].isOcrEligibleDoc == 'true') {
					passPortDocument = "proofList"+ i +".documentList" + j;
					if (file) {
						var reader = new FileReader();
						reader.onload = function (e) {
							$('#passportImg, #vpassportImg').attr('src', e.target.result);
							var imgEle = document.getElementById("passportImg");
							imageHeight = imgEle.naturalHeight;
							imageWidth = imgEle.naturalWidth;
							passportOperations(i,j,proofList, file);
						};
						reader.readAsDataURL(file);
					}
				}
			} else {
				bootbox.alert({
					message: "You have selected incorrect file! Please select file with " + acceptedFileExtn + " extension(s).",
					buttons: {
						ok: {
							label: 'OK',
							className: 'alert-yes btn btn-sm grey-gallery',
						}
					},
					callback: function () {
						$('#file_' + i + '_' + j).val('');
						$('#file' + i + '_' + j).val('');
						document.getElementById('proofList' + i + '.documentList' + j + '.fileName').value = '';
						$('#removeFile_' + i + '_' + j).addClass('hidden');
						$("#file" + i + "_" + j).change();
					}
				});
			}
		}
	}
}

function removeOnClick(i, j) {
	$('#file_' + i + '_' + j).val('');
	$('#file' + i + '_' + j).val('');
	document.getElementById('proofList' + i + '.documentList' + j + '.fileName').value = '';
	$('#removeFile_' + i + '_' + j).addClass('hidden');
	$("#file" + i + "_" + j).change();
	
	var formData = getKYCData("frm");
	formData = unflatten(formData);
	var proofList = formData.proofList;
	if(proofList[i].documentList[j].isOcrEligibleDoc == 'true') {
		$('#pStatusImg').attr("src", "");
		$('.passportStatus').text("");
		$('.actionedBy').text("");
		$('.passportScreenDate').text("");
		$('.passportStatusDiv').hide();
		$('.removeOptFld').remove();
		$('.psPortFld').val('');
		$('[id^="ocrTextSpan_"]').css({"display":"none"});
		document.getElementById('proofList' + i + '.documentList' + j + '.worldCheckMRZCodeList0').value = '';
		document.getElementById('proofList' + i + '.documentList' + j + '.worldCheckMRZCodeList1').value = '';
		document.getElementById('proofList' + i + '.documentList' + j + '.worldCheckMRZCodeList2').value = '';
		document.getElementById('proofList' + i + '.documentList' + j + '.ocrMRZCodeList0').value = '';
		document.getElementById('proofList' + i + '.documentList' + j + '.ocrMRZCodeList1').value = '';
		document.getElementById('proofList' + i + '.documentList' + j + '.isMRZMatches').value = false;
		setIsOCRValueTrueOrFalseForAll(i, j, proofList, false);
	}
	_paq.push(['trackEvent', 'KYCSubject', 'RemoveDocument','Removing uploaded document']);
}

function showdocFields(value, proofId, documentId, attributeCount) {
	console.log("proofIndex  ::" + proofId + " documentIndex :: " + documentId + " attributeCount :: " + attributeCount);
	if (value == "0") {
		$(".docFieldDetailsNo" + proofId + "_" + documentId).show(500);
		$(".docFieldDetailsYes" + proofId + "_" + documentId).hide(300);
		$(".docFieldDetailsWaiver" + proofId + "_" + documentId).hide(300);

		//Parsley validation setting true
		document.getElementById('proofList' + proofId + '.documentList' + documentId + '.dueDate').setAttribute('data-parsley-required', 'true');
		document.getElementById('proofList' + proofId + '.documentList' + documentId + '.dueDate').dispatchEvent(new Event("change"));

		//Parsley validation setting false
		document.getElementById('proofList' + proofId + '.documentList' + documentId + '.fileName').setAttribute('data-parsley-required', 'false');
		document.getElementById('proofList' + proofId + '.documentList' + documentId + '.fileName').dispatchEvent(new Event("change"));

		document.getElementById('proofList' + proofId + '.documentList' + documentId + '.referenceNumber').setAttribute('data-parsley-required', 'false');
		document.getElementById('proofList' + proofId + '.documentList' + documentId + '.referenceNumber').dispatchEvent(new Event("change"));

		document.getElementById('proofList' + proofId + '.documentList' + documentId + '.comment').setAttribute('data-parsley-required', 'false');
		document.getElementById('proofList' + proofId + '.documentList' + documentId + '.comment').dispatchEvent(new Event("change"));

		document.getElementById('proofList' + proofId + '.documentList' + documentId + '.waiverReason').setAttribute('data-parsley-required', 'false');
		document.getElementById('proofList' + proofId + '.documentList' + documentId + '.waiverReason').dispatchEvent(new Event("change"));

		for (var i = 0; i < attributeCount; i++) {
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.documentAttributeList' + i + '.documentAttributeValue').setAttribute('data-parsley-required', 'false');
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.documentAttributeList' + i + '.documentAttributeValue').dispatchEvent(new Event("change"));
		}

	} else if (value == "1") {
		//Parsley validation setting true
		document.getElementById('proofList' + proofId + '.documentList' + documentId + '.fileName').setAttribute('data-parsley-required', 'true');
		document.getElementById('proofList' + proofId + '.documentList' + documentId + '.fileName').dispatchEvent(new Event("change"));

		document.getElementById('proofList' + proofId + '.documentList' + documentId + '.referenceNumber').setAttribute('data-parsley-required', 'false');
		document.getElementById('proofList' + proofId + '.documentList' + documentId + '.referenceNumber').dispatchEvent(new Event("change"));

		document.getElementById('proofList' + proofId + '.documentList' + documentId + '.comment').setAttribute('data-parsley-required', 'false');
		document.getElementById('proofList' + proofId + '.documentList' + documentId + '.comment').dispatchEvent(new Event("change"));

		for (var i = 0; i < attributeCount; i++) {
			if(document.getElementById('proofList' + proofId + '.documentList' + documentId + '.documentAttributeList' + i + '.documentAttributeValue').getAttribute('data-attribute-name') == "Receive Date")
				document.getElementById('proofList' + proofId + '.documentList' + documentId + '.documentAttributeList' + i + '.documentAttributeValue').setAttribute('data-parsley-required', 'true');
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.documentAttributeList' + i + '.documentAttributeValue').dispatchEvent(new Event("change"));
		}

		//Parsley validation setting false
		document.getElementById('proofList' + proofId + '.documentList' + documentId + '.dueDate').setAttribute('data-parsley-required', 'false');
		document.getElementById('proofList' + proofId + '.documentList' + documentId + '.dueDate').dispatchEvent(new Event("change"));

		document.getElementById('proofList' + proofId + '.documentList' + documentId + '.waiverReason').setAttribute('data-parsley-required', 'false');
		document.getElementById('proofList' + proofId + '.documentList' + documentId + '.waiverReason').dispatchEvent(new Event("change"));

		$(".docFieldDetailsYes" + proofId + "_" + documentId).show(500);
		$(".docFieldDetailsWaiver" + proofId + "_" + documentId).hide(300);
		$(".docFieldDetailsNo" + proofId + "_" + documentId).hide(300);
	} else if (value == "2") {
		//Parsley validation setting true
		document.getElementById('proofList' + proofId + '.documentList' + documentId + '.waiverReason').setAttribute('data-parsley-required', 'true');
		document.getElementById('proofList' + proofId + '.documentList' + documentId + '.waiverReason').dispatchEvent(new Event("change"));

		//Parsley validation setting false
		document.getElementById('proofList' + proofId + '.documentList' + documentId + '.dueDate').setAttribute('data-parsley-required', 'false');
		document.getElementById('proofList' + proofId + '.documentList' + documentId + '.dueDate').dispatchEvent(new Event("change"));

		document.getElementById('proofList' + proofId + '.documentList' + documentId + '.fileName').setAttribute('data-parsley-required', 'false');
		document.getElementById('proofList' + proofId + '.documentList' + documentId + '.fileName').dispatchEvent(new Event("change"));

		document.getElementById('proofList' + proofId + '.documentList' + documentId + '.referenceNumber').setAttribute('data-parsley-required', 'false');
		document.getElementById('proofList' + proofId + '.documentList' + documentId + '.referenceNumber').dispatchEvent(new Event("change"));

		document.getElementById('proofList' + proofId + '.documentList' + documentId + '.comment').setAttribute('data-parsley-required', 'false');
		document.getElementById('proofList' + proofId + '.documentList' + documentId + '.comment').dispatchEvent(new Event("change"));

		for (var i = 0; i < attributeCount; i++) {
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.documentAttributeList' + i + '.documentAttributeValue').setAttribute('data-parsley-required', 'false');
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.documentAttributeList' + i + '.documentAttributeValue').dispatchEvent(new Event("change"));
		}
		$(".docFieldDetailsWaiver" + proofId + "_" + documentId).show(500);
		$(".docFieldDetailsYes" + proofId + "_" + documentId).hide(300);
		$(".docFieldDetailsNo" + proofId + "_" + documentId).hide(300);
	}
}

var screeningResult = [];
var kycSubjectId = "";
$('#sendForScreening').click(function () {
	var instanceName = $("#instanceName").val();
	//clearRiskElement();
	screeningType = autoScreeningConstant;
	_paq.push(['trackEvent', 'KYCSubject', 'AutomaticScreening','Fetching auto screening result']);
	jQuery("#screeningResultJqxgrid").jqxGrid("refresh");
	$('#frm').parsley().destroy();
	initParsely(jQuery);
	$("#countryRiskLevel").attr("data-parsley-required", false);
	$("#totalRiskLevel").attr("data-parsley-required", false);
	//$(".documentField").attr("data-parsley-required", false);
	var validate = $('#frm').parsley().validate("singleForm");
	if (validate) {
		var proofCount = 0;
		/*$('.document-tab').find('input[type="checkbox"]:checked').each(function () {
			var docValue = this.value;
			proofCount++;
		});*/
		/*if (proofCount == 0) {
			bootbox.alert("At least one document must be selected in support of this KYC Subject!", function () {});
			return false;
		} else {*/
			$('#saveScreeningRequest').attr("disabled", true);
			$('#typeOfCounterpartyCode').attr("disabled", false);
			var formData = getKYCData("frm");
			formData = unflatten(formData);
			
			var kycSubjectRequestNo = $("#kycSubjectRequestNo").val();
			if (kycSubjectRequestNo != "" && kycSubjectRequestNo != undefined) {
				$('#typeOfCounterpartyCode').attr("disabled", true);
			}
			var requestData = {};
			requestData.counterPartyType = formData.typeOfCounterpartyCode;
			requestData.referenceId = $("#referenceId").val();
			if(isRelationList == 'true'){
				var gridData = getGridData('grid');
				var roleCodeList = getRelationRoleCodeList(gridData);
				requestData.roleCodeListStr = roleCodeList.toString();
			}
			if(formData.typeOfCounterpartyCode == "Individual"){
				requestData.lastName = formData.lastName;
				requestData.genderCode = (formData.genderCode != undefined && formData.genderCode != '') ? formData.genderCode : '';
				requestData.dateOfBirth = formData.dateOfBirth;
				requestData.countryOfResidency = formData.countryOfResidencyCode;
				requestData.countryOfBirth = formData.countryOfBirthCode;
				if(isCountryOfNationality == 'true')
					requestData.countryOfCitizenship = formData.countryOfNationalityCode;
				else
					requestData.countryOfCitizenship = formData.countryOfCitizenshipCode;
				
				if(isGivenName == 'true'){
					requestData.givenName = formData.givenName;
					//--$("#lblGivenName").html(formData.givenName);
					//--$("#lblCountryOfCitizenship").html($("#countryOfCitizenshipCode option:selected").text());
				}else{
					requestData.firstName = formData.firstName;
					requestData.middleName = formData.middleName;
					//--$("#lblCountryOfCitizenship").html($("#countryOfNationalityCode option:selected").text());
					//--$("#lblFirstName").html(formData.firstName);
					//--$("#lblMiddleName").html(formData.middleName);
				}
				
				//--$("#lblLastName").html(formData.lastName);
				//--$("#lblDOB").html(formData.dateOfBirth);
				//--$("#lblCountryOfResidence").html($("#countryOfResidencyCode option:selected").text());
				
			}else{
				requestData.registrationName = formData.registrationName;
				requestData.dateOfIncorporation = formData.dateOfIncorporation;
				requestData.countryOfIncorporation = formData.countryOfIncorporationCode;
				
				//--$("#lblRegistrationName").html(formData.registrationName);
				//--$("#lblRegistrationNumber").html(formData.registrationNumber);
				//--$("#lblDateOfIncorp").html(formData.dateOfIncorporation);
				//--$("#lblCountryOfIncorp").html($("#countryOfIncorporationCode option:selected").text());
			}
			setAutoScreeningViewData(formData.typeOfCounterpartyCode);
			scroolTop();
			var url = $("#commonContextPathId").val() + '/kyc/subject/screeningResult';
			ajaxCallBack("POST", url,requestData,"json",function(response){
				if (response.statusCode == "503"){
					bootbox.alert("404 Cannot Return Response", function () {});
					return false;
				}
				if ('connectionError' in response){
					bootbox.alert("Risk Engine service is temporarily unavailable", function () {});
					return false;
				}
				
				screeningResult = response.screeningResult;
				var screeningLocalData = response.screeningResult;
				KycSubjectId = response.kycSubjectId;
				var screeningDataSource =
				{
					datatype: "json",
					localdata: screeningLocalData,
					datafields: [{name:	'KycSubjectId',type: 'string'},
								{ name:	'ScreeningData',type: 'string'},
								{ name:	'ProfileJson',type: 'string'},
								{ name: 'ResultId',type: 'string'},
								{ name: 'ScreeningSolution',	type: 'string'},
								{ name: 'Comments',type: 'string'},
								{ name: 'EntityType',type: 'string'},
								{ name: 'FullName',type: 'string'},
								{ name: 'MatchScore',type: 'string'},
								{ name: 'ReasonListed',type: 'string'},
								{ name: 'Action',type: 'string'}
								]
				};
				
				var screeningDataAdapter = new $.jqx.dataAdapter(screeningDataSource);
				$("#screeningResultJqxgrid").jqxGrid({
					width: '100%',
					source: screeningDataAdapter,
					theme: 'ITGtheme',
					autoloadstate: false,
					autosavestate: false,
					groupable: true,
					groupsexpandedbydefault: true,
					sortable: true,
					pageable: true,
					height: 300,
					showfilterrow: true,
					filterable: true,
					enabletooltips: true,
			        columnsresize: true,
			        columnsreorder: true,
			        selectionmode: 'checkbox',
					rowsheight: 50,
					columns: [
					  { text: 'Kyc Subject Id', 	datafield: 'KycSubjectId',		filtertype: 'input', hidden: true},
					  { text: 'Screening Solution', datafield: 'ScreeningSolution',	filtertype: 'input', width: '15%', align: 'left'},
					  { text: 'Comments', 			datafield: 'Comments', 			filtertype: 'input', width: '10%', align: 'left'},
					  { text: 'Entity Type', 		datafield: 'EntityType', 		filtertype: 'input', width: '10%', align: 'left'},
					  { text: 'Name',	 			datafield: 'FullName', 			filtertype: 'input', width: '15%', align: 'left'},
					  { text: 'Match Score', 		datafield: 'MatchScore', 		filtertype: 'input', width: '10%', align: 'left'},
					  { text: 'Reason Listed',		datafield: 'ReasonListed',		filtertype: 'input', width: '15%', align: 'left'},
					  { text: 'Reference ID', 		datafield: 'ResultId',			filtertype: 'input', width: '15%',key: true},
					  { text: 'Action', 			datafield: 'Action', 			filtertype: 'input', align: 'left', enabletooltips:false}
					],
					pageSize:screeningLocalData.length,
					pageSizeOptions:["5","10","20",screeningLocalData.length]				
				});
				
				$('#screeningResultJqxgrid').show();
				//$("#screeningResultJqxgrid").jqxGrid('selectrow', 0);
				$('#screeningResultModalId').modal('toggle');
				
				try{
					$("#screeningResultJqxgrid").jqxGrid('clearselection');
				}catch(err){
					console.log(err.message);
				}
				try{
					var isExist = false;
					var rows = $('#screeningResultJqxgrid').jqxGrid('getrows');
	                var rowsCount = rows.length;
	                for (var i = 0; i < rowsCount; i++) {
	                    var value = $('#screeningResultJqxgrid').jqxGrid('getcellvalue', i, "ResultId");
	                    if (uniqueScreeningIds.includes(value)) {
	                        $('#screeningResultJqxgrid').jqxGrid('selectrow', i);
	                        isExist = true;
	                    };
	                };
					if(!isExist){
						clearRiskElement();
						uniqueScreeningIds = [];
						try{
							$("#screeningResultJqxgrid").jqxGrid('clearselection');
						}catch(err){
							console.log(err.message);
						}
					}
					if(isExist)
						$('#saveScreeningRequest').attr("disabled", false);
				}catch(err){
					console.log(err.message);
				}
			});
		//}
	}
});

var isComputed = false;
$("#computeButton").click(function () {
	var instanceName = $("#instanceName").val();
	_paq.push(['trackEvent', 'KYCSubject', 'ComputeRisk', 'Computing risk']);
	var rows = $("#screeningResultJqxgrid").jqxGrid('selectedrowindexes');
    var selectedRecords = new Array();
    var screeningSolutionNames = new Array();
    var scrnResultsJsonArray = new Array();
    var refIdJsonArray = new Array();
    var typeOfCounterParty = $("#typeOfCounterpartyCode").val();
    var flag = false;
    for (var m = 0; m < rows.length; m++) {
        var scrnResultsJson = {'Id':'','ScreeningSolution':'','Comments':'','EntityType':'','FullName':'','MatchScore':'','ReasonListed':'','ResultId':''};
    	var row = $("#screeningResultJqxgrid").jqxGrid('getrowdata', rows[m]);
        selectedRecords[m] = row;
        if ($.inArray(row.ScreeningSolution, screeningSolutionNames) != -1){
        	console.log("found");
        	flag = true;
        }
        
        scrnResultsJson.ScreeningSolution = row.ScreeningSolution;
        //scrnResultsJson.Comments = row.Comments;
        scrnResultsJson.EntityType = row.EntityType;
        scrnResultsJson.FullName = row.FullName;
        scrnResultsJson.MatchScore = row.MatchScore;
        scrnResultsJson.ResultId = row.ResultId;
		scrnResultsJson.json = JSON.stringify(row.ScreeningData);
		scrnResultsJson.profileJson = JSON.stringify(row.ProfileJson);
		
        var ReasonListed = "";
        if($.isArray(row.ReasonListed)){
        	ReasonListed = row.ReasonListed.toString()
        }else{
        	ReasonListed = row.ReasonListed.split(":").toString();
        }
        scrnResultsJson.ReasonListed = ReasonListed;
        scrnResultsJsonArray.push(scrnResultsJson);
        screeningSolutionNames.push(row.ScreeningSolution);
        refIdJsonArray.push(row.ResultId);
    }
    if(selectedRecords.length<=0){
    	var scrnResultsJson = {'ScreeningSolution':'none','ReasonListed':''};
    	var fullName = "";
    	if(typeOfCounterParty == "Individual"){
        	if(isGivenName == 'true'){
        		fullName = $("#givenName").val();
			}else{
				fullName = $("#firstName").val();
				if ($("#middleName").val() != "")
					fullName = fullName + " " + $("#middleName").val();
			}
				
        }else
        	fullName = $("#registrationName").val();
    	
    	selectedRecords.push({'FullName':fullName,'KycSubjectId':KycSubjectId});
        scrnResultsJsonArray.push(scrnResultsJson);
    }
    if(flag){
    	var html = '<div class="alert alert-danger alertHide" style="padding: 9px; display:none;"><i class="fa fa-warning"></i>&nbsp;'+
    			   '<label>Duplicate screening solutions found</label><button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button></div>';
    	$("#screeningErrorDiv").html(html);
    	$(".alertHide").show();
    	return false;
    }
    
    if(selectedRecords.length>0) {
    	$.ajax({
			url : $("#commonContextPathId").val() +"/kyc/subject/screeningDuplicateFetch",
			type : 'POST',
			dataType : 'text',
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(refIdJsonArray),
			success : function(result) {
				
				var subjScrenDuplJsn = JSON.parse(result);
				
				if(Array.isArray(subjScrenDuplJsn) && subjScrenDuplJsn.length > 0){
					
					jQuery("#duplicateReferJqxgrid").jqxGrid("refresh");
					
					if(typeOfCounterParty == "Individual"){
						datafields = [	{name:"kycSubjectRequestNumber",type:"string"},
										{name:"name",type:"string"},
										{name:"typeOfCounterparty",type:"string"},
										{name:"countryOfCitizenshipName",type:"string"},
										{name:"dateOfBirth",type:"date"},
										{name:"action",type:"string"}
									];
						columns = [	  { text: 'Request Number', datafield: 'kycSubjectRequestNumber', filtertype: 'input', width: '15%', align: 'left'},
									  { text: 'Counterparty Type', datafield: 'typeOfCounterparty', filtertype: 'input', width: '15%', align: 'left'},
									  { text: 'Name', datafield: 'name', filtertype: 'input', width: '25%', align: 'left'},
									  { text: 'Country Of Citizenship',	datafield: 'countryOfCitizenshipName', filtertype: 'input', width: '15%', align: 'left'},
									  { text: 'Date of Birth', datafield: 'dateOfBirth', filtertype: 'range', width: '10%', align: 'left' , cellsformat: 'dd-MMM-yyyy'},  
									  { text: 'Action', datafield: 'action', filtertype: 'input', width: '20%', align: 'center' , enabletooltips:false}
								];
					} else {
						datafields = [	{name:'kycSubjectRequestNumber',type:'string'},
										{name:'name',type:'string'},
										{name:'typeOfCounterparty',type: 'string'},
										{name:'countryOfIncorporationName',type:'string'},
										{name:'registrationNumber',type:'date'},
										{name:'action',type:'string'}
									];
						columns = [	{text:"Request Number",datafield:"kycSubjectRequestNumber",filtertype:"input",width:"15%",align:"left"},
									{text:"Counterparty Type",datafield:"typeOfCounterparty",filtertype:"input",width:"15%",align:"left"},
									{text:"Registration Name",datafield:"name",filtertype:"input",width:"20%",align:"left"},
									{text:"Registration Number",datafield:"registrationNumber",filtertype:"input",width:"15%",align:"left"},
									{text:"Country of Incorporation",datafield:"countryOfIncorporationName",filtertype:"input",width:"15%",align:"left"},
									{text:"Action",datafield:"action",filtertype:"input",width:"20%",align:"center",enabletooltips:false}
								];
					}
					
					var subjScrnDataSource =
					{
						datatype: "json",
						localdata: subjScrenDuplJsn,
						datafields: datafields,
					};
					var subjectDataAdapter = new $.jqx.dataAdapter(subjScrnDataSource);
					// Create jqxGrid
					$("#duplicateReferJqxgrid").jqxGrid(
					{
						width: '100%',
						source: subjectDataAdapter,
						autoloadstate: false,
						autosavestate: false,
						groupable: false,
						groupsexpandedbydefault: false,
						sortable: true,
						pageable: true,
						theme: 'ITGtheme',
						height: 340,
						selectionmode: 'multiplecellsextended',
						showfilterrow: true,
						filterable: true,
						enabletooltips: true,
				        columnsresize: true,
				        columnsreorder: true,
						rowsheight: 50,
						columns: columns,
						pageSize:subjScrenDuplJsn.length,
						pageSizeOptions:["5","10","20",subjScrenDuplJsn.length]				
					});
					
					$('#duplicateReferJqxgrid').show();
					//$("#screeningResultJqxgrid").jqxGrid('selectrow', 0);
					$('#duplicateReferModalId').modal('toggle');
					
					try{
						$("#duplicateReferJqxgrid").jqxGrid('clearselection');
					}catch(err){
						console.log(err.message);
					}
				}
				else if(subjScrenDuplJsn.length == 0) {
					// var requestData = {"FirstName":"","LastName":"","FullName":"","Gender":"","CountryOfCitizenship":"","CountryLocation":"","EntityType":"","DateOfBirth":"","KycSubjectId":"","scrnResultsJson":"","IsComputeAction":false,"IsRAFScreening":true,"CountryOfBirth":"","RegisteredCountry":""};
					var requestData = {"FirstName":"","GivenName":"","LastName":"","MiddleName":"","FullName":"","Gender":"","CountryOfCitizenship":"","CountryLocation":"","EntityType":"","DateOfBirth":"","KycSubjectId":"","scrnResultsJson":"","IsComputeAction":false,"IsRAFScreening":true,"CountryOfBirth":"","RegisteredCountry":"","roleCodeListStr":""};
				    
				    requestData.FullName =	selectedRecords[0].FullName;
				    requestData.KycSubjectId = selectedRecords[0].KycSubjectId;
				    requestData.scrnResultsJson = JSON.stringify(scrnResultsJsonArray);
				    
				    if(typeOfCounterParty == "Individual"){
				    	requestData.LastName = $("#lastName").val();
						requestData.Gender = ($("#genderCode").val() != undefined && $("#genderCode").val() != '') ? $("#genderCode").val() : '';
				    	requestData.EntityType = typeOfCounterParty;
				    	if(isGivenName == 'true'){
				    		requestData.GivenName = $("#givenName").val();
				    	}else{
				    		requestData.FirstName = $("#firstName").val();
							requestData.MiddleName = $("#middleName").val();
				    	}
				    	
				    	if(isCountryOfNationality == 'true')
				    		requestData.CountryOfCitizenship = $("#countryOfNationalityCode").val();
				    	else
				    		requestData.CountryOfCitizenship = $("#countryOfCitizenshipCode").val();
				    	
				    	/*if (instanceName === "VEDA") {
							requestData.FirstName = $("#firstName").val();
							requestData.MiddleName = $("#middleName").val();
							requestData.CountryOfCitizenship = $("#countryOfNationalityCode").val();
						} else {
							requestData.GivenName = $("#givenName").val();
							requestData.CountryOfCitizenship = $("#countryOfCitizenshipCode").val();
						}*/
				    	requestData.CountryLocation = $("#countryOfResidencyCode").val();
				    	requestData.CountryOfBirth = $("#countryOfBirthCode").val();
				    	requestData.DateOfBirth = $("#dateOfBirth").val();
	
				    	if(isRelationList == 'true'){
				    		var gridData = getGridData('grid');
							var roleCodeList = getRelationRoleCodeList(gridData);
							requestData.roleCodeListStr = roleCodeList.toString();
						}
				    }else{
				    	requestData.EntityType = typeOfCounterParty;
				    	requestData.FullName = $("#registrationName").val();
				    	requestData.RegisteredCountry = $("#countryOfIncorporationCode").val();
				    }
				    
				    var url = $("#commonContextPathId").val() + '/kyc/subject/screeningCompute';
					ajaxCallBack("POST", url,requestData,"json",function(response){
						clearRiskElement();
						isComputed = true;
						var computedData = response;
						$('#saveScreeningRequest').attr("disabled", false);
						
						$("#computedPepId").val(false);
						$("#computedPep").text('No');
						$("#computedNegativeMediaId").val(false);
						$("#computedNegativeMedia").text('No');
						$("#computedSanctionsId").val(false);
						$("#computedSanctions").text('No');
						$("#computedLawEnforcementId").val(false);
						$("#computedLawEnforcement").text('No');
						$("#computedRegulatoryEnforcementId").val(false);
						$("#computedRegulatoryEnforcement").text('No');
						$("#computedOtherBodiesId").val(false);
						$("#computedOtherBodies").text('No');
						
						if(computedData.IsPEP == true){
							$("#computedPep").text('Yes');
							$("#computedPepId").val(true);
							$("#computedPep").addClass("high-yes-risk");
						}else{
							$("#computedPep").removeClass("high-yes-risk");
						}
						
						if(computedData.IsNegativeMedia == true){
							$("#computedNegativeMedia").text('Yes');
							$("#computedNegativeMediaId").val(true);
							$("#computedNegativeMedia").addClass("high-yes-risk");
						}else{
							$("#computedNegativeMedia").removeClass("high-yes-risk");
						}
						
						if(computedData.IsSanction == true){
							$("#computedSanctions").text('Yes');
							$("#computedSanctionsId").val(true);
							$("#computedSanctions").addClass("high-yes-risk");
						}else{
							$("#computedSanctions").removeClass("high-yes-risk");
						}
						
						if(computedData.IsLawEnforcement == true){
							$("#computedLawEnforcement").text('Yes');
							$("#computedLawEnforcementId").val(true);
							$("#computedLawEnforcement").addClass("high-yes-risk");
						}else{
							$("#computedLawEnforcement").removeClass("high-yes-risk");
						}
						
						if(computedData.IsRegulatoryEnforcement == true){
							$("#computedRegulatoryEnforcement").text('Yes');
							$("#computedRegulatoryEnforcementId").val(true);
							$("#computedRegulatoryEnforcement").addClass("high-yes-risk");
						}else{
							$("#computedRegulatoryEnforcement").removeClass("high-yes-risk");
						}
						
						if(computedData.IsOtherBodies == true){
							$("#computedOtherBodies").text('Yes');
							$("#computedOtherBodiesId").val(true);
							$("#computedOtherBodies").addClass("high-yes-risk");
						}else{
							$("#computedOtherBodies").removeClass("high-yes-risk");
						}
						
						if(computedData.RiskRating != '' && computedData.RiskRating != null){
				    		$("#computedRiskRating").text(computedData.RiskRating);
				    		if(computedData.RiskRating == "High" || computedData.RiskRating == "No Go"){
				    			$("#computedRiskRating").addClass("high-yes-risk");
				    		}else{
				    			$("#computedRiskRating").removeClass("high-yes-risk");
				    		}
				    		$("#computedRiskRatingId").val(computedData.RiskRating);
				    	}else{
				    		$('#saveScreeningRequest').attr("disabled", true);
				    	}
				    	
				    	if(computedData.RiskScore != '' && computedData.RiskScore != null){
				    		$("#computedRiskScore").text(computedData.RiskScore);
				    		$("#computedRiskScoreId").val(computedData.RiskScore);
				    	}else{
				    		$('#saveScreeningRequest').attr("disabled", true);
				    	}
				    	
				    	if(computedData.CountryRisk != '' && computedData.CountryRisk != null){
				    		$("#computedCountryRisk").text(computedData.CountryRisk);
				    		if(computedData.CountryRisk == "High" || computedData.CountryRisk == "No Go"){
				    			$("#computedCountryRisk").addClass("high-yes-risk");
				    		}else{
				    			$("#computedCountryRisk").removeClass("high-yes-risk");
				    		}
				    		$("#computedCountryRiskId").val(computedData.CountryRisk);
				    	}else{
				    		$('#saveScreeningRequest').attr("disabled", true);
				    	}
				    	
				    	if(computedData.SelectedScreeningSolution != ''){
				    		$("#computedSelectedScreeningSolution").text(computedData.SelectedScreeningSolution);
				    		$("#computedSelectedScreeningSolutionId").val(computedData.SelectedScreeningSolution);
				    	}
				    	
				    	if(computedData.riskScoreCalculatedAt != ''){
				    		$("#computedRiskScoreCalculatedAt").text(computedData.riskScoreCalculatedAt);
				    		$("#computedRiskScoreCalculatedAtId").val(computedData.riskScoreCalculatedAt);
				    	}
				    	//--$('#saveScreeningRequest').attr("disabled", false);
					});
					
				    console.log(requestData);
				}
			}
    	});
    }
});

var clearRiskElement = function(){
	$("#computedPep").text('-');
	$("#computedPep").removeClass("high-yes-risk");
	$("#computedNegativeMedia").text('-');
	$("#computedNegativeMedia").removeClass("high-yes-risk");
	$("#computedSanctions").text('-');
	$("#computedSanctions").removeClass("high-yes-risk");
	$("#computedLawEnforcement").text('-');
	$("#computedLawEnforcement").removeClass("high-yes-risk");
	$("#computedRegulatoryEnforcement").text('-');
	$("#computedRegulatoryEnforcement").removeClass("high-yes-risk");
	$("#computedOtherBodies").text('-');
	$("#computedOtherBodies").removeClass("high-yes-risk");
	$("#computedRiskRating").text('-');
	$("#computedRiskRating").removeClass("high-yes-risk");
	$("#computedRiskScore").text('-');
	$("#computedCountryRisk").text('-');
	$("#computedCountryRisk").removeClass("high-yes-risk");
	$("#computedSelectedScreeningSolution").text('-');
	$("#computedRiskScoreCalculatedAt").text('-');
}

var showScreeningData = function(manualScreenShowURL, referenceId, counterPartyType){
		
	var manualScreenShowURL = manualScreenShowURL+referenceId+","+counterPartyType+",World-Check,false,kyc";
	
	window.open(manualScreenShowURL, "vedaNewWindow", "toolbar=no, scrollbars=yes, resizable=no, top=50, left=100, width=1000, height=500");
	/*
	for(var i=0;i<screeningResult.length;i++){
		if(screeningResult[i].UID==id){
			console.log(screeningResult[i]);
			$("#screeningDataDiv").html(JSON.stringify(screeningResult[i].ScreeningData,null,2));
			$('#screeningDataModal').modal('toggle');
		}
	}
	*/
};

var uniqueScreeningIds = [];
$('#saveScreeningRequest').click(function () {
	
	// Call Function To Set KYC Subject Details On Screening, Document Upload And Mitigation Screen
	setSubjectDetails();
	
	var instanceName = $("#instanceName").val();
	_paq.push(['trackEvent', 'KYCSubject', 'SaveRisk', 'Saving risk and screening details']);
	var riskRating = $("#computedRiskRatingId").val();
	var countryRisk = $("#computedCountryRiskId").val();
	
	if(riskRating == noGoConstant || countryRisk == noGoConstant) {
		bootbox.confirm({
			message: "This is a No Go subject, the record will be put into No Go status, please notify compliance & your manager.",
			buttons: {
				confirm: {
					label: 'Submit',
					className: 'alert-yes btn btn-sm grey-gallery'
				},
				cancel: {
					label: 'Cancel',
					className: 'alert-no btn btn-sm btn-default'
				}
			},
			callback: function (result) {
				if (result) {
					$('#typeOfCounterpartyCode').attr("disabled", false);
					var manualScreeningObject = {};
					manualScreeningObject.isPepRisk = $("#computedPepId").val();
					manualScreeningObject.pepRiskLevel = $("#computedPep").text();
					manualScreeningObject.isSanctionRisk = $("#computedSanctionsId").val();
					manualScreeningObject.sanctionsRiskLevel = $("#computedSanctions").text();
					manualScreeningObject.isActivitiesRisk = $("#computedNegativeMediaId").val();
					manualScreeningObject.activitiesRiskLevel = $("#computedNegativeMedia").text();
					manualScreeningObject.isLawEnforcement = $("#computedLawEnforcementId").val();
					manualScreeningObject.lawEnforcementRiskLevel = $("#computedLawEnforcement").text();
					manualScreeningObject.isRegulatoryEnforcement = $("#computedRegulatoryEnforcementId").val();
					manualScreeningObject.regulatoryEnforcementRiskLevel = $("#computedRegulatoryEnforcement").text();
					manualScreeningObject.isOtherBodies = $("#computedOtherBodiesId").val();
					manualScreeningObject.otherBodiesRiskLevel = $("#computedOtherBodies").text();
					
					manualScreeningObject.countryRiskLevel =  $("#computedCountryRiskId").val();
					manualScreeningObject.totalRiskLevel = $("#computedRiskRatingId").val();
					manualScreeningObject.riskScore = $("#computedRiskScoreId").val();
					manualScreeningObject.selectedScreeningSolution = $("#computedSelectedScreeningSolutionId").val();
					manualScreeningObject.runAt = $("#computedRiskScoreCalculatedAtId").val();
					manualScreeningObject.isAutoScreening = true;
					manualScreeningObject.screeningType = screeningType;
					
					var getselectedrowindexes = $('#screeningResultJqxgrid').jqxGrid('getselectedrowindexes');

					var selectedScreeningResult = [];
					uniqueScreeningIds = [];
					for(var i = 0; i < getselectedrowindexes.length; i++){
						var selectedRowData = $('#screeningResultJqxgrid').jqxGrid('getrowdata', getselectedrowindexes[i]);
						uniqueScreeningIds.push(selectedRowData['ResultId']);
						selectedScreeningResult.push(selectedRowData);
					}
					manualScreeningObject.requestId = uniqueScreeningIds;
					manualScreeningObject.screeningResult = selectedScreeningResult;
					
					$("input[name='kycSubjectReview.isPepRisk'][value='"+manualScreeningObject.isPepRisk+"']").prop('checked', true);
					$("input[name='kycSubjectReview.isSanctionRisk'][value='"+manualScreeningObject.isSanctionRisk+"']").prop('checked', true);
					$("input[name='kycSubjectReview.isActivitiesRisk'][value='"+manualScreeningObject.isActivitiesRisk+"']").prop('checked', true);
					$("input[name='kycSubjectReview.isLawEnforcement'][value='"+manualScreeningObject.isLawEnforcement+"']").prop('checked', true);
					$("input[name='kycSubjectReview.isRegulatoryEnforcement'][value='"+manualScreeningObject.isRegulatoryEnforcement+"']").prop('checked', true);
					$("input[name='kycSubjectReview.isOtherBodies'][value='"+manualScreeningObject.isOtherBodies+"']").prop('checked', true);
					$("#countryRiskLevel").val(manualScreeningObject.countryRiskLevel);
					$('#countryRiskLevel').trigger('change');
					$("#totalRiskLevel").val(manualScreeningObject.totalRiskLevel);
					$('#totalRiskLevel').trigger('change');
					pcframework.initUniform();
					ComponentsPickers.init();
					
					$('.riskElement').attr('disabled',true);
					
					$("#referenceId").val(KycSubjectId);
					$("#manualScreeningDetails").val(JSON.stringify(manualScreeningObject));
					
					var relationList = [];
					if(isRelationList == 'true'){
						var gridData = getGridData('grid');
						var relationList = getRelationData(gridData);
						$("#relationListString").val(JSON.stringify(relationList));
					}
					
					$("#screeningType").val(screeningType);
					$('.contactDetails').attr("disabled", false);
					$('#frm').attr("method", "post");
					$('#frm').attr("action", $("#commonContextPathId").val() + "/kyc/subject/add");
					$('#frm').submit();
					buffer();
				}
			}
		});
	}
	else {
		var validate = $('#frm').parsley().validate("singleForm");
		if (validate) {
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
					if (result) {
						$('#typeOfCounterpartyCode').attr("disabled", false);
						var manualScreeningObject = {};
						manualScreeningObject.isPepRisk = $("#computedPepId").val();
						manualScreeningObject.pepRiskLevel = $("#computedPep").text();
						manualScreeningObject.isSanctionRisk = $("#computedSanctionsId").val();
						manualScreeningObject.sanctionsRiskLevel = $("#computedSanctions").text();
						manualScreeningObject.isActivitiesRisk = $("#computedNegativeMediaId").val();
						manualScreeningObject.activitiesRiskLevel = $("#computedNegativeMedia").text();
						manualScreeningObject.isLawEnforcement = $("#computedLawEnforcementId").val();
						manualScreeningObject.lawEnforcementRiskLevel = $("#computedLawEnforcement").text();
						manualScreeningObject.isRegulatoryEnforcement = $("#computedRegulatoryEnforcementId").val();
						manualScreeningObject.regulatoryEnforcementRiskLevel = $("#computedRegulatoryEnforcement").text();
						manualScreeningObject.isOtherBodies = $("#computedOtherBodiesId").val();
						manualScreeningObject.otherBodiesRiskLevel = $("#computedOtherBodies").text();
						
						manualScreeningObject.countryRiskLevel =  $("#computedCountryRiskId").val();
						manualScreeningObject.totalRiskLevel = $("#computedRiskRatingId").val();
						manualScreeningObject.riskScore = $("#computedRiskScoreId").val();
						manualScreeningObject.selectedScreeningSolution = $("#computedSelectedScreeningSolutionId").val();
						manualScreeningObject.runAt = $("#computedRiskScoreCalculatedAtId").val();
						manualScreeningObject.isAutoScreening = true;
						manualScreeningObject.screeningType = screeningType;
						
						var getselectedrowindexes = $('#screeningResultJqxgrid').jqxGrid('getselectedrowindexes');
	
						var selectedScreeningResult = [];
						uniqueScreeningIds = [];
						for(var i = 0; i < getselectedrowindexes.length; i++){
							var selectedRowData = $('#screeningResultJqxgrid').jqxGrid('getrowdata', getselectedrowindexes[i]);
							uniqueScreeningIds.push(selectedRowData['ResultId']);
							selectedScreeningResult.push(selectedRowData);
						}
						manualScreeningObject.requestId = uniqueScreeningIds;
						manualScreeningObject.screeningResult = selectedScreeningResult;
						//var KycSubjectId = screeningResult[0].KycSubjectId;
						
						$("input[name='kycSubjectReview.isPepRisk'][value='"+manualScreeningObject.isPepRisk+"']").prop('checked', true);
						$("input[name='kycSubjectReview.isSanctionRisk'][value='"+manualScreeningObject.isSanctionRisk+"']").prop('checked', true);
						$("input[name='kycSubjectReview.isActivitiesRisk'][value='"+manualScreeningObject.isActivitiesRisk+"']").prop('checked', true);
						$("input[name='kycSubjectReview.isLawEnforcement'][value='"+manualScreeningObject.isLawEnforcement+"']").prop('checked', true);
						$("input[name='kycSubjectReview.isRegulatoryEnforcement'][value='"+manualScreeningObject.isRegulatoryEnforcement+"']").prop('checked', true);
						$("input[name='kycSubjectReview.isOtherBodies'][value='"+manualScreeningObject.isOtherBodies+"']").prop('checked', true);
						$("#countryRiskLevel").val(manualScreeningObject.countryRiskLevel);
						$('#countryRiskLevel').trigger('change');
						$("#totalRiskLevel").val(manualScreeningObject.totalRiskLevel);
						$('#totalRiskLevel').trigger('change');
						$("#mitigationRiskLevel").val(manualScreeningObject.totalRiskLevel);
						$('#mitigationRiskLevel').trigger('change');
						pcframework.initUniform();
						ComponentsPickers.init();
						
						$('.riskElement').attr('disabled',true);
						
						$("#referenceId").val(KycSubjectId);
						$("#manualScreeningDetails").val(JSON.stringify(manualScreeningObject));
						
						$('#screeningResultModalId').modal('toggle');
						showHideTabpane('2');
					}
				}
			});
		}
	}
	
});

$('#saveButton').click(function () {
	var instanceName = $("#instanceName").val();
	var validate = $('#frm').parsley().validate("singleForm");

	if($("#typeOfCounterpartyCode").val() === 'Entity' && $("#registrationNumber").val() === '') {
		bootbox.alert("Registration Number field must be entered in support of this KYC Subject!", function () {});
		showHideTabpane('1');
		return false;
	}
	var message;
	if($("#totalRiskLevel").val() === noGoConstant || $("#countryRiskLevel").val() === noGoConstant) {
		message = "This is a No Go subject, the record will be put into No Go status, please notify compliance & your manager.";
	} else {
		if($("#typeOfCounterpartyCode").val() == 'Individual' && ($("#pepRiskLevel").val() == 'Yes' || $("#sanctionsRiskLevel").val() == 'Yes'))
			message = "Has approval been obtained for this PEP or Sanctioned subject according to the relevant procedure?";
		else	
			message = "Are you sure you want to submit?";
	}
	
	if (validate) {
		bootbox.confirm({
			message: message,
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
				if (result) {
					
					EnableDocumentForDocumentConfig();					
					$('#typeOfCounterpartyCode').attr("disabled", false);
					
					if(screeningType == manualScreeningConstant){
						var manualScreeningObject = {};
						manualScreeningObject.isPepRisk = $('input[name="kycSubjectReview.isPepRisk"]:checked').val();
						manualScreeningObject.pepRiskLevel = $("#pepRiskLevel").val();
						manualScreeningObject.isSanctionRisk = $('input[name="kycSubjectReview.isSanctionRisk"]:checked').val();
						manualScreeningObject.sanctionsRiskLevel = $("#sanctionsRiskLevel").val();
						manualScreeningObject.isActivitiesRisk = $('input[name="kycSubjectReview.isActivitiesRisk"]:checked').val();
						manualScreeningObject.activitiesRiskLevel = $("#activitiesRiskLevel").val();
						manualScreeningObject.isLawEnforcement = $('input[name="kycSubjectReview.isLawEnforcement"]:checked').val();
						manualScreeningObject.lawEnforcementRiskLevel = $("#lawEnforcementRiskLevel").val();
						manualScreeningObject.isRegulatoryEnforcement = $('input[name="kycSubjectReview.isRegulatoryEnforcement"]:checked').val();
						manualScreeningObject.regulatoryEnforcementRiskLevel = $("#regulatoryEnforcementRiskLevel").val();
						manualScreeningObject.isOtherBodies = $('input[name="kycSubjectReview.isOtherBodies"]:checked').val();
						manualScreeningObject.otherBodiesRiskLevel = $("#otherBodiesRiskLevel").val();
						
						manualScreeningObject.countryRiskLevel = $("#countryRiskLevel").val();
						manualScreeningObject.totalRiskLevel = $("#totalRiskLevel").val();
						manualScreeningObject.isAutoScreening = false;
						manualScreeningObject.screeningType = screeningType;
						$("#manualScreeningDetails").val(JSON.stringify(manualScreeningObject));
					}
					
					var relationList = [];
					if(isRelationList == 'true'){
						var gridData = getGridData('grid');
						var relationList = getRelationData(gridData);
						$("#relationListString").val(JSON.stringify(relationList));
					}
					
					_paq.push(['trackEvent', 'KYCSubject', 'Submit','Submitting subject']);
					
					$("#screeningType").val(screeningType);
					$('.psPortFld').attr("disabled", false);
					$('.contactDetails').attr("disabled", false);
					$('#frm').attr("method", "post");
					$('#frm').attr("action", $("#commonContextPathId").val() + "/kyc/subject/add");
					$('#frm').submit();
					buffer();
				}
			}
		});
	}
});

$('#saveKycButton').click(function () {
	var instanceName = $("#instanceName").val();
	$('#frm').parsley().destroy();
	
	var textCount = 0;
	var dropDownCount = 0;
	$('.form-body').find('input[type="text"]').each(function () {		
		 if (this.value != "") {			
			 textCount++;	          
	       } 
		
	});
	
	if($("#typeOfCounterpartyCode option:selected").text() === '') {
		bootbox.alert("Counterparty Type field must be entered in support of this KYC Subject!", function () {});
		return false;
	}
	
	var itgJurisdiction = document.getElementById("itgJurisdictionCode");
    var itgJurisdictionVal = itgJurisdiction.options[itgJurisdiction.selectedIndex].value;
	
	var typeOfCounterParty = $("#typeOfCounterpartyCode").val();
	if(typeOfCounterParty == "Individual") {
		var countryOfResidence = document.getElementById("countryOfResidencyCode");
	    var countryOfResidenceVal = countryOfResidence.options[countryOfResidence.selectedIndex].value;
	
	    var countryOfBirth = document.getElementById("countryOfBirthCode");
	    var countryOfBirthVal = countryOfBirth.options[countryOfBirth.selectedIndex].value;
	    var countryOfCitizenship = "";
	    if(isCountryOfNationality == 'true'){
    		countryOfCitizenship = document.getElementById("countryOfNationalityCode");
    	}else{
    		countryOfCitizenship = document.getElementById("countryOfCitizenshipCode");
    	}
		
	    var countryOfCitizenshipVal = countryOfCitizenship.options[countryOfCitizenship.selectedIndex].value;
	    
		if (textCount == 1 && itgJurisdictionVal == '' && countryOfResidenceVal == '' && countryOfBirthVal == '' && countryOfCitizenshipVal == '') {
			bootbox.alert("At least one field must be entered in support of this KYC Subject!", function () {});
			return false;
		}
	}
	else {
		if (textCount == 1 && itgJurisdictionVal == '' && $("#registrationName").val() == '' && $("#dateOfIncorporation").val() == '' && $("#countryOfIncorporationCode").val() == '') {
			bootbox.alert("At least one field must be entered in support of this KYC Subject!", function () {});
			return false;
		}
	}
	
	if (itgJurisdictionVal == '') {
		bootbox.alert("ITG Jurisdiction field must be entered in support of this KYC Subject!", function () {});
		return false;
	}

	var fileExist = false;
	$(".document-tab").find('input').each(function(){
		if(this.type == "file"){
			if($("#"+this.id).val() != '')
				fileExist = true;
		}
	});
	
	if(fileExist && $("#itgJurisdictionCode").val()==""){
		bootbox.alert("Please select ITG Jurisdiction for file submission!", function () {});
		return false;
	}
	
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
			if (result) {
				
				EnableDocumentForDocumentConfig();
				$('#typeOfCounterpartyCode').attr("disabled", false);
				
				if(screeningType == manualScreeningConstant){
					var manualScreeningObject = {};
					manualScreeningObject.isPepRisk = $('input[name="kycSubjectReview.isPepRisk"]:checked').val();
					manualScreeningObject.pepRiskLevel = $("#pepRiskLevel").val();
					manualScreeningObject.isSanctionRisk = $('input[name="kycSubjectReview.isSanctionRisk"]:checked').val();
					manualScreeningObject.sanctionsRiskLevel = $("#sanctionsRiskLevel").val();
					manualScreeningObject.isActivitiesRisk = $('input[name="kycSubjectReview.isActivitiesRisk"]:checked').val();
					manualScreeningObject.activitiesRiskLevel = $("#activitiesRiskLevel").val();
					manualScreeningObject.isLawEnforcement = $('input[name="kycSubjectReview.isLawEnforcement"]:checked').val();
					manualScreeningObject.lawEnforcementRiskLevel = $("#lawEnforcementRiskLevel").val();
					manualScreeningObject.isRegulatoryEnforcement = $('input[name="kycSubjectReview.isRegulatoryEnforcement"]:checked').val();
					manualScreeningObject.regulatoryEnforcementRiskLevel = $("#regulatoryEnforcementRiskLevel").val();
					manualScreeningObject.isOtherBodies = $('input[name="kycSubjectReview.isOtherBodies"]:checked').val();
					manualScreeningObject.otherBodiesRiskLevel = $("#otherBodiesRiskLevel").val();
					manualScreeningObject.countryRiskLevel = $("#countryRiskLevel").val();
					manualScreeningObject.totalRiskLevel = $("#totalRiskLevel").val();
					manualScreeningObject.isAutoScreening = false;
					manualScreeningObject.screeningType = screeningType;
					$("#manualScreeningDetails").val(JSON.stringify(manualScreeningObject));
				}
				
				$("#screeningType").val(screeningType);
				
				var relationList = [];
				if(isRelationList == 'true'){
					var gridData = getGridData('grid');
					var relationList = getRelationData(gridData);
					$("#relationListString").val(JSON.stringify(relationList));
				}
				
				_paq.push(['trackEvent', 'KYCSubject', 'Save','Saving subject']);
				$('.psPortFld').attr("disabled", false);
				$('.contactDetails').attr("disabled", false);
				$('#frm').attr("method", "post");
				$('#frm').attr("action", $("#commonContextPathId").val() + "/kyc/subject/saveKYC");
				$('#frm').submit();
				buffer();
			}
		}
	});
});

var getRelationData = function(gridData){
	var relationList = [];
	for(var i=0;i<gridData.length;i++){
		var gridObject = gridData[i];
		var relationObject = {"jurisdictionCode":"","jurisdictionName":"","legalEntityCode":"","legalEntityName":"","roleCode":"","roleName":"","appointmentDate":"","resignationDate":"","clientName":"","clientShortcode":"","clientEntityId":"","entityType":""};
		if(getObjectValue("jurisdictionCode",gridObject) != null)
			relationObject.jurisdictionCode = getObjectValue("jurisdictionCode",gridObject);
		if(getObjectValue("jurisdictionName",gridObject) != null)
			relationObject.jurisdictionName = getObjectValue("jurisdictionName",gridObject);
		if(getObjectValue("legalEntityCode",gridObject) != null)
			relationObject.legalEntityCode = getObjectValue("legalEntityCode",gridObject);
		if(getObjectValue("legalEntityName",gridObject) != null)
			relationObject.legalEntityName = getObjectValue("legalEntityName",gridObject);
		if(getObjectValue("roleCode",gridObject) != null)
			relationObject.roleCode = getObjectValue("roleCode",gridObject);
		if(getObjectValue("roleName",gridObject) != null)
			relationObject.roleName = getObjectValue("roleName",gridObject);
		if(getObjectValue("clientName",gridObject) != null)
			relationObject.clientName = getObjectValue("clientName",gridObject);
		if(getObjectValue("clientShortcode",gridObject) != null)
			relationObject.clientShortcode = getObjectValue("clientShortcode",gridObject);
		if(getObjectValue("appointmentDate",gridObject) != null)
			relationObject.appointmentDate = getSimplifiedDate(getObjectValue("appointmentDate",gridObject));
		if(getObjectValue("resignationDate",gridObject) != null)
			relationObject.resignationDate = getSimplifiedDate(getObjectValue("resignationDate",gridObject));
		if(getObjectValue("clientEntityId",gridObject) != null)
			relationObject.clientEntityId = getObjectValue("clientEntityId",gridObject);
		if(getObjectValue("entityType",gridObject) != null)
			relationObject.entityType = getObjectValue("entityType",gridObject);
		
		relationList.push(relationObject);
	}
	return relationList;
}

var getRelationRoleCodeList = function(gridData){
	var roleCodeList = [];
	for(var i=0;i<gridData.length;i++){
		var gridObject = gridData[i];
		if(getObjectValue("roleCode",gridObject) != null)
			roleCodeList.push(getObjectValue("roleCode",gridObject));
	}
	return roleCodeList;
}


var noGoConstant = "No Go";
var manualScreeningConstant = "Manual Screening";
var autoScreeningConstant = "Auto Screening";
var screeningType = "";
$("#manualScreening").click(function(){
	screeningType = manualScreeningConstant;
	var instanceName = $("#instanceName").val();
	
	var validate = $('#frm').parsley().validate("singleForm");
	console.log("validate:::",validate);
	if (validate) {
		setSubjectDetails();
		_paq.push(['trackEvent', 'KYCSubject', 'ManualScreening']);
		showHideTabpane('2');
	}
});

$(".MITQ").click(function () {
	var MITQ1 = $("input[name='MITQ1']:checked").val();
	var MITQ2 = $("input[name='MITQ2']:checked").val();
	$('.PASS').addClass('hidden');
	$('.FAIL').removeClass('hidden');
	$("#finalResult").val("FAIL");
	if (MITQ1 == "PASS" && MITQ2 == "PASS") {
		$("#finalResult").val("PASS");
		$('.PASS').removeClass('hidden');
		$('.FAIL').addClass('hidden');
	}
});

$('#cancelButton').click(function () {
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
			if (result) {
				if ($("#isDashboardRequestId").val() != null && $("#isDashboardRequestId").val() != "")
					location.href = $("#commonContextPathId").val() + "/dashboard";
				else
					location.href = $("#commonContextPathId").val() + "/kyc/subject/search";
				buffer();
			}
		}
	});
});

var proofCount = 0;
function addMoreProof(activityId) {
	var acceptedFileExtn = $("#mitigationFileExtensionsId").val();
	proofCount++;
	var proofRow = '<div class="row" id="proofRow_'+activityId+'_'+proofCount+'">'+
						'<div class="col-md-6">'+
							'<div class="form-group">'+
								'<div class="bt-flabels__wrapper">'+
									'<label class="parsley_hide">Proof/Evidence</label>'+
									'<input type="hidden" name="mitigation.mitigationActivityList['+activityId+'].mitigationProofList['+proofCount+'].fileId" value= "'+proofCount+'"/>'+
									'<input type="file" class="hidden" name="mitigation.mitigationActivityList['+activityId+'].mitigationProofList['+proofCount+'].documentFile" id="mitigationFile_'+activityId+'_'+proofCount+'" onchange="javascript:onChangeMitigationFile(\''+activityId+'_'+proofCount+'\');" accept="'+acceptedFileExtn+'">'+
									'<input type="text" readonly="true" class="form-control file'+activityId+'_'+proofCount+'" placeholder="Proof/Evidence" name="mitigation.mitigationActivityList['+activityId+'].mitigationProofList['+proofCount+'].documentName" id="mitigationFile'+activityId+'_'+proofCount+'">'+
									'<span class="bt-flabels__error-desc_date" style="right: 10px;">Required</span>'+
								'</div>'+
							'</div>'+
						'</div> '+
						'<div class="col-md-4">'+
							'<button type="button" class="btn-itg-file btn btn-sm grey-gallery" id="mitigationUploadFile_'+activityId+'_'+proofCount+'" value="Change" onclick="$(\'#mitigationFile_'+activityId+'_'+proofCount+'\').click()">'+
								'<i class="fa fa-folder-open-o"></i>&nbsp;Browse'+
							'</button>&nbsp;'+
								
							'<button type="button" class="btn-itg-file btn btn-sm grey-gallery hidden" id="mitigationRemoveFile_'+activityId+'_'+proofCount+'" value="Remove" onclick="javascript:removeMitigationOnClick(\''+activityId+'_'+proofCount+'\');">'+
								'<i class="fa fa-trash"></i>'+
							'</button>'+
						'</div>'+
						'<div class="col-md-2">'+
							'<button type="button" class="btn-itg-file btn btn-sm grey-gallery" onclick="javascript:jQuery(\'#proofRow_'+activityId+'_'+proofCount+'\').remove();" value="">'+
								'<i class="fa fa-close"></i>'+
							'</button>'+
						'</div>'+
					'</div>';
	_paq.push(['trackEvent', 'KYCSubject', 'AddProof','Adding proof on mitigation']);
	jQuery('#multiRowProof_'+activityId).append(proofRow);
}

var activityRowCount = 0;
$('#addMoreActivity').click(function(){
var acceptedFileExtn = $("#mitigationFileExtensionsId").val();
activityRowCount ++;
var activityRow = '<div class="row" id="activityRow_'+activityRowCount+'">'+
					'<hr />'+
					'<div class="col-md-3">'+
						'<div class="bt-form__wrapper">'+
							'<div class="form-group uk-width-1-1">'+
								'<div class="bt-flabels__wrapper">'+
									'<label class="parsley_hide">Activity Performed</label>'+
									'<input type="hidden" name="mitigation.mitigationActivityList['+activityRowCount+'].activityId" value= "'+activityRowCount+'"/>'+
									'<input type="text" id="mitigation.mitigationActivityList'+activityRowCount+'.activityPerformed" name="mitigation.mitigationActivityList['+activityRowCount+'].activityPerformed" class="form-control field-background mitigation-activity" placeholder="Activity Performed" data-parsley-required="true" data-parsley-group="kycSubjectMitigationGroup" maxlength="255" />'+
									'<span class="bt-flabels__error-desc">Required</span>'+
								'</div>'+
							'</div>'+
						'</div>'+
					'</div>'+
						
					'<div class="col-md-3">'+
						'<div class="bt-form__wrapper">'+
							'<div class="form-group uk-width-1-1">'+
								'<div class="bt-flabels__wrapper">'+
									'<div class="parsley_hide">'+
										'<label class="parsley_hide">Activity Description</label>'+
										'<textarea id="mitigation.mitigationActivityList'+activityRowCount+'.activityDescription" name="mitigation.mitigationActivityList['+activityRowCount+'].activityDescription" class="field-background mitigation-activity" data-parsley-required="true" data-parsley-group="kycSubjectMitigationGroup" placeholder="Activity Description" rows="5" style="min-width:100%;"></textarea>'+
										'<span class="bt-flabels__error-desc">Required</span>'+
									'</div>'+
								'</div>'+
							'</div>'+
						'</div>'+
					'</div>'+
						
					'<div class="col-md-4" id="multiRowProof_'+activityRowCount+'">'+
						'<div class="row" id="proofRow_'+activityRowCount+'_0">'+
							'<div class="col-md-6">'+
								'<div class="form-group">'+
									'<div class="bt-flabels__wrapper">'+
										'<label class="parsley_hide">Proof/Evidence</label>'+
										'<input type="hidden" name="mitigation.mitigationActivityList['+activityRowCount+'].mitigationProofList[0].fileId" value= "'+activityRowCount+'"/>'+
										'<input type="file" class="hidden" name="mitigation.mitigationActivityList['+activityRowCount+'].mitigationProofList[0].documentFile" id="mitigationFile_'+activityRowCount+'_0" onchange="javascript:onChangeMitigationFile(\''+activityRowCount+'_0\');" accept="'+acceptedFileExtn+'">'+
										'<input type="text" readonly="true" class="form-control file'+activityRowCount+'_0" placeholder="Proof/Evidence" name="mitigation.mitigationActivityList['+activityRowCount+'].mitigationProofList[0].documentName" id="mitigationFile'+activityRowCount+'_0">'+
										'<span class="bt-flabels__error-desc_date" style="right: 10px;">Required</span>'+
									'</div>'+
								'</div>'+
							'</div> '+
							'<div class="col-md-4">'+
								'<button type="button" class="btn-itg-file btn btn-sm grey-gallery" id="mitigationUploadFile_'+activityRowCount+'_0" value="Change" onclick="$(\'#mitigationFile_'+activityRowCount+'_0\').click()">'+
									'<i class="fa fa-folder-open-o"></i>&nbsp;Browse'+
								'</button>&nbsp;'+
									
								'<button type="button" class="btn-itg-file btn btn-sm grey-gallery hidden" id="mitigationRemoveFile_'+activityRowCount+'_0" value="Remove" onclick="javascript:removeMitigationOnClick(\''+activityRowCount+'_0\');">'+
									'<i class="fa fa-trash"></i>'+
								'</button>'+
							'</div>'+
							'<div class="col-md-2">'+
								'<button type="button" class="btn-itg-file btn btn-sm grey-gallery" onclick="javascript:addMoreProof('+activityRowCount+')" value="Add More">'+
									'<i class="fa fa-plus"></i> Add Proof'+
								'</button>'+
							'</div>'+
						'</div>'+
					'</div>'+
					
					'<div class="col-md-2">'+
						'<button type="button" class="btn-itg-file btn btn-sm grey-gallery pull-right" onclick="javascript:jQuery(\'#activityRow_'+activityRowCount+'\').remove();" value="Remove">'+
							'<i class="fa fa-close"></i>'+
						'</button>'+
					'</div>'+
				'</div>';
	_paq.push(['trackEvent', 'KYCSubject', 'AddActivity','Adding activity on mitigation']);
	jQuery('#activitySection').append(activityRow);
});

function onChangeMitigationFile(i){
	
	var fileInput = document.getElementById("mitigationFile_" + i);
	
	if(fileInput.files.length > 0) {
		var file = fileInput.files[0];
		if (file.size > 105300000) {
			bootbox.alert("File size exceeds 100 MB", function () {});
			$('#mitigationFile_' + i).val('');
			$('#mitigationFile' + i).val('');
			//document.getElementById('proofList' + i + '.documentList' + j + '.fileName').value = '';
			$('#mitigationRemoveFile_' + i).addClass('hidden');
			$("#mitigationFile" + i).change();
			return false;
		}
		
		var uploadFile = $('#mitigationFile_'+i).val().split('\\').slice(-1)[0].toString();
		if (uploadFile != "") {
			var acceptedFileExtn = document.getElementById("mitigationFile_"+i).getAttribute("accept");
			if(acceptedFileExtn != undefined && acceptedFileExtn != ""){
				var acceptedFileExtnArray = acceptedFileExtn.split(",");
				console.log("acceptedFileExtnArray : "+acceptedFileExtnArray);
				var fileExtn = uploadFile.split('.');
				console.log("fileExtn : "+fileExtn);
				
				var specialCharArr = ["%", "&", "'"];
				if(fileExtn[0].includes(specialCharArr[0]) || fileExtn[0].includes(specialCharArr[1]) || fileExtn[0].includes(specialCharArr[2])) {
					bootbox.alert({
						message: "File name should not contain the following " + specialCharArr + " character(s).",
						buttons: {
							ok: {
								label: 'OK',
								className: 'alert-yes btn btn-sm grey-gallery',
							}
						},
						callback: function () {
							$('#mitigationFile_'+i).val('');
							$('#mitigationFile'+i).val('');
							$('#mitigationRemoveFile_'+i).addClass('hidden');
							$("#mitigationFile"+i).change();
						}
					});
				}
				
				if(acceptedFileExtnArray.includes("."+fileExtn[fileExtn.length-1].toLowerCase())){
					$('#mitigationFile'+i).val(uploadFile);
					$('#mitigationRemoveFile_'+i).removeClass('hidden');
					$("#mitigationRemoveFile_"+i).attr('value', 'Change');
					_paq.push(['trackEvent', 'KYCSubject', 'UploadDocument','Uploading mitigation document']);
				} else {
					bootbox.alert({
						message: "You have selected incorrect file! Please select file with " + acceptedFileExtn + " extension(s).",
						buttons: {
				        	ok: {
				        		label: 'OK',
				        		className: 'alert-yes btn btn-sm grey-gallery',
				        	}
						},
						callback: function(){
							$('#mitigationFile_'+i).val('');
							$('#mitigationFile'+i).val('');
							$('#mitigationRemoveFile_'+i).addClass('hidden');
							$("#mitigationFile"+i).change();
						}
					});
				}
			}
		}
	}
}

function removeMitigationOnClick(i){
	$('#mitigationFile_'+i).val('');
	$('#mitigationFile'+i).val('');
	$('#mitigationRemoveFile_'+i).addClass('hidden');
	$("#mitigationFile"+i).change();
}

function checkMandFldsFilled() {
	var isAllFldFilled = false;
	
	var typeOfCounterpartyCode = $("#typeOfCounterpartyCode").val();
	if(typeOfCounterpartyCode === 'Individual') {
		var lastName = $("#lastName").val();
		var dateOfBirth = $("#dateOfBirth").val();
		var citizenship = "";
		var firstName = "";
		if(isCountryOfNationality == 'true')
			citizenship = $("#countryOfNationalityCode option:selected").text();
		else
			citizenship = $("#countryOfCitizenshipCode option:selected").text();
		
		if(isGivenName == 'true'){
			firstName = $("#givenName").val();
		}else{
			firstName = $("#firstName").val();
		}
		
		if(firstName != '' && lastName != '' && dateOfBirth != '' && citizenship != '' && typeOfCounterpartyCode != '') {
			isAllFldFilled = true;
		}
	}
	else if(typeOfCounterpartyCode === 'Entity') {
		var registrationName = $("#registrationName").val();
		var registrationNumber = $("#registrationNumber").val();
		var countryOfIncorporationCode = $("#countryOfIncorporationCode option:selected").text();
		if(registrationName != '' && countryOfIncorporationCode != '' && registrationNumber != '') {
			isAllFldFilled = true;
		}
	}
	
	return isAllFldFilled;
}

// $('#firstName, #givenName, #lastName, #dateOfBirth, #countryOfCitizenshipCode, #registrationName, #registrationNumber, #countryOfIncorporationCode').change(function(){
$(document).on('change', '#firstName, #givenName, #lastName, #dateOfBirth, #countryOfCitizenshipCode, #registrationName, #registrationNumber, #countryOfIncorporationCode', function() {
	$(this).val($.trim($(this).val()));
	
	var isAllFldFilled = checkMandFldsFilled();
	
	if(isAllFldFilled) {
		var typeOfCounterpartyCode = $("#typeOfCounterpartyCode").val();
		var requestData = {"typeOfCounterpartyCode":""};
		var dataFldsKYC = [];
		var dataColumnsKYC = [];
		
		if(typeOfCounterpartyCode === 'Individual') {
			// var requestData = {"firstName":"","middleName":"","lastName":"","dateOfBirth":"","countryOfCitizenshipName":"", "typeOfCounterpartyCode":""};
			requestData.lastName = $("#lastName").val();
			requestData.dateOfBirth = $("#dateOfBirth").val();
			if(isCountryOfNationality == 'true')
				requestData.countryOfCitizenshipName = $("#countryOfNationalityCode option:selected").text();
			else
				requestData.countryOfCitizenshipName = $("#countryOfCitizenshipCode option:selected").text();
			
			if(isGivenName == 'true') {
				requestData.givenName = $("#givenName").val();
			}else{
				requestData.firstName = $("#firstName").val();
				requestData.middleName = $("#middleName").val();
			}
			
			requestData.typeOfCounterpartyCode = typeOfCounterpartyCode;
			
			dataFldsKYC = [	{ name: 'kycSubjectRequestNumber', 	type: 'string'},
							{ name: 'name', 					type: 'string'},
							{ name: 'typeOfCounterparty', 		type: 'string'},
							{ name: 'countryOfCitizenshipName', type: 'string'},
							{ name: 'dateOfBirth',				type: 'date'},		
							{ name: 'action', 					type: 'string'}
						];
		
			dataColumnsKYC = [	{ text: 'Request Number', datafield: 'kycSubjectRequestNumber', filtertype: 'input', width: '15%', align: 'left'},
						  		{ text: 'Counterparty Type', datafield: 'typeOfCounterparty', filtertype: 'input', width: '15%', align: 'left'},
						  		{ text: 'Name', datafield: 'name', filtertype: 'input', width: '25%', align: 'left'},
						  		{ text: 'Country of Citizenship',	datafield: 'countryOfCitizenshipName', filtertype: 'input', width: '15%', align: 'left'},
						  		{ text: 'Date of Birth', datafield: 'dateOfBirth', filtertype: 'range', width: '10%', align: 'left' , cellsformat: 'dd-MMM-yyyy'},  
						  		{ text: 'Action', datafield: 'action', filtertype: 'input', width: '20%', align: 'center' , enabletooltips:false}
						];
		}
		else if(typeOfCounterpartyCode === 'Entity') {
		    requestData.registrationName = $("#registrationName").val();
			requestData.registrationNumber = $("#registrationNumber").val();
			requestData.countryOfIncorporationCode = $("#countryOfIncorporationCode option:selected").val();
			requestData.typeOfCounterpartyCode = typeOfCounterpartyCode;
			
			dataFldsKYC = [	{name:'kycSubjectRequestNumber',type:'string'},
							{name:'name',type:'string'},
							{name:'typeOfCounterparty',type: 'string'},
							{name:'countryOfIncorporationName',type:'string'},
							{name:'registrationNumber',type:'string'},
							{name:'action',type:'string'}
						];
						
			dataColumnsKYC = [	{text:"Request Number",datafield:"kycSubjectRequestNumber",filtertype:"input",width:"15%",align:"left"},
								{text:"Counterparty Type",datafield:"typeOfCounterparty",filtertype:"input",width:"15%",align:"left"},
								{text:"Registration Name",datafield:"name",filtertype:"input",width:"20%",align:"left"},
								{text:"Registration Number",datafield:"registrationNumber",filtertype:"input",width:"15%",align:"left"},
								{text:"Country of Incorporation",datafield:"countryOfIncorporationName",filtertype:"input",width:"15%",align:"left"},
								{text:"Action",datafield:"action",filtertype:"input",width:"20%",align:"center",enabletooltips:false}
						];
		}
		
	    $.ajax({
			url : $("#commonContextPathId").val() +"/kyc/subject/checkDuplicate",
			type : 'POST',
			dataType : 'text',
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(requestData),
			success : function(result) {
				
				var subjectSearchJson = JSON.parse(result);
				
				if(Array.isArray(subjectSearchJson) && subjectSearchJson.length > 0){
					
					jQuery("#duplicateRecordJqxgrid").jqxGrid("refresh");
					
					var subjectDataSource =
					{
						datatype: "json",
						localdata: subjectSearchJson,
						datafields: dataFldsKYC
					};
					var subjectDataAdapter = new $.jqx.dataAdapter(subjectDataSource);
					// Create jqxGrid
					$("#duplicateRecordJqxgrid").jqxGrid(
					{
						width: '100%',
						source: subjectDataAdapter,
						autoloadstate: false,
						autosavestate: false,
						groupable: false,
						groupsexpandedbydefault: false,
						sortable: true,
						pageable: true,
						theme: 'ITGtheme',
						height: 340,
						selectionmode: 'multiplecellsextended',
						showfilterrow: true,
						filterable: true,
						enabletooltips: true,
				        columnsresize: true,
				        columnsreorder: true,
						rowsheight: 50,
						columns: dataColumnsKYC,
						pageSize:subjectSearchJson.length,
						pageSizeOptions:["5","10","20",subjectSearchJson.length]				
					});
					
					$('#duplicateRecordJqxgrid').show();
					//$("#screeningResultJqxgrid").jqxGrid('selectrow', 0);
					$('#duplicateRecordsModalId').modal('toggle');
					
					try{
						$("#duplicateRecordJqxgrid").jqxGrid('clearselection');
					}catch(err){
						console.log(err.message);
					}
				}
			}
	    });
	}
});

$('#middleName').change(function(){
	$(this).val($.trim($(this).val()));
});

$("#resignationDate, #dateOfIncorporation").keyup(function(e) {
    if(e.keyCode == 8 || e.keyCode == 46) {
        $.datepicker._clearDate(this);
    }
});

$('#countryRiskLevel, #totalRiskLevel').change(function(){
	if($("#countryRiskLevel").val() == noGoConstant || $("#totalRiskLevel").val() == noGoConstant) {
		$("#btnContinue").attr("disabled", true);
		$("#saveKycButton").attr("disabled", true);
		$('#saveButton').attr("disabled", false);
	}
	else {
		$("#btnContinue").attr("disabled", false);
		$("#saveKycButton").attr("disabled", false);
		$('#saveButton').attr("disabled", true);
	}
});

// $('#btnrequestDocument').click(function () {
$(document).on('click', '#btnrequestDocument', function(){	
	var formData = getKYCData("frm");
	formData = unflatten(formData);
	var proofList = formData.proofList;
	var additionalProofList = formData.additionalDocuments;
	var commonSelectedPrfIdList = [];
	var docRequestJson = {};
	
	if(proofList === undefined && additionalProofList === undefined) {
		bootbox.alert("No Documents to Request.", function () {});
	}
	else {
		var selectedPrfId = [];
		var selectedDocIdAllList = [];
		var selectedPrfVsDocList = {};
		if(proofList !== undefined) {
			for(var i=0; i<proofList.length; i++) {
				var eachProofobj = proofList[i];
				var docListForPrf = eachProofobj.documentList;
				
				var selectedDocIdList = [];
				for(var j=0; j<docListForPrf.length; j++) {
					var eachDocobj = docListForPrf[j];
					if(eachDocobj.isDocumentSelected === 'true' && eachDocobj.documentReceived !== '2') {
						selectedDocIdList.push(eachDocobj.documentId);
						selectedDocIdAllList.push(eachDocobj.documentId);
					}
				}
				if(selectedDocIdList.length > 0) {
					selectedPrfId.push(eachProofobj.proofId);
					commonSelectedPrfIdList.push(eachProofobj.proofId);
					selectedPrfVsDocList[eachProofobj.proofId] = selectedDocIdList;
				}
			}
		}
		var selectedAdditionalPrfId = [];
		var selectedAdditionalDocIdAllList = [];
		var selectedAdditionalPrfVsDocList = {};
		if(additionalProofList !== undefined) {
			for(var i=0; i<additionalProofList.length; i++) {
				var eachProofobj = additionalProofList[i];
				if(eachProofobj !== undefined) {
					var eachProofId = eachProofobj.proofId;
					if(eachProofId !== '') {
						var docListForPrf = eachProofobj.documentList;
						var selectedDocIdList = [];
						for(var j=0; j<docListForPrf.length; j++) {
							var eachDocobj = docListForPrf[j];
							if(eachDocobj.documentId !== '') {
								if(eachDocobj.isDocumentSelected === 'true' && eachDocobj.isSentRequestToFCH  === 'true') {
									selectedDocIdList.push(eachDocobj.documentId);
									selectedAdditionalDocIdAllList.push(eachDocobj.documentId);
								}
							}
						}
						if(selectedDocIdList.length > 0) {
							selectedAdditionalPrfId.push(eachProofId);
							commonSelectedPrfIdList.push(eachProofId);
							if(eachProofId in selectedAdditionalPrfVsDocList) {
								var exsDocIdList = selectedAdditionalPrfVsDocList[eachProofId];
								var updatedDocIdList = exsDocIdList.concat(selectedDocIdList);
								selectedAdditionalPrfVsDocList[eachProofId] = updatedDocIdList;
							}
							else {
								selectedAdditionalPrfVsDocList[eachProofId] = selectedDocIdList;
							}
						}
					}
				}
			}
		}
		
		if(commonSelectedPrfIdList.length == 0) {
			bootbox.alert("No Documents to Request.", function () {});
		}
		else {
			var filteredPrfList = kycSubjectProofBOs.filter(item => selectedPrfId.includes(item.proofId));
			filteredPrfList.forEach(e => {
				e.documentList = e.documentList.filter(item => selectedPrfVsDocList[e.proofId].includes(item.documentId));
				e.documentList.forEach(e1 => {
					delete e1.isMandatory;
					delete e1.isDocumentDeleted;
					delete e1.isDocumentSelected;
					delete e1.isSentRequestToFCH;
				});
			});
			
			var filteredAddPrfList = documentProofs.filter(item => selectedAdditionalPrfId.includes(item.proofId));
			filteredAddPrfList.forEach(e => {
				e.documentList = e.documentList.filter(item => selectedAdditionalPrfVsDocList[e.proofId].includes(item.documentId));
				e.documentList.forEach(e1 => {
					delete e1.isMandatory;
					delete e1.isDocumentDeleted;
					delete e1.isDocumentSelected;
					delete e1.isSentRequestToFCH;
				});
			});
			
			var filteredCommonPrfList = filteredPrfList.concat(filteredAddPrfList);
			
			var typeOfCounterParty = $("#typeOfCounterpartyCode").val();
			//var emailId;
			var KycPartyType;
			if(typeOfCounterParty === 'Individual') {
				docRequestJson.givenName = formData.givenName;
				docRequestJson.lastName = formData.lastName;
				docRequestJson.name = formData.givenName + ' ' + formData.lastName; // for FCH
				docRequestJson.dateOfBirth = formData.dateOfBirth;
				docRequestJson.genderCode = $("#genderCode").val();
				docRequestJson.genderName = $("#genderCode option:selected").text();
				docRequestJson.itgJurisdictionCode = $("#itgJurisdictionCode").val();
				docRequestJson.itgJurisdictionName = $("#itgJurisdictionCode option:selected").text();
				docRequestJson.countryOfCitizenshipCode = $("#countryOfCitizenshipCode").val();
				docRequestJson.countryOfCitizenshiName = $("#countryOfCitizenshipCode option:selected").text();
				docRequestJson.countryOfBirthCode = $("#countryOfBirthCode").val();
				docRequestJson.countryOfBirthName = $("#countryOfBirthCode option:selected").text();
				docRequestJson.countryOfResidencyCode = $("#countryOfResidencyCode").val();
				docRequestJson.countryOfResidencyName = $("#countryOfResidencyCode option:selected").text();
				// emailId = $("#emailAddress").val();
				KycPartyType = $("#kycPartyType").val();
			} else if(typeOfCounterParty === 'Entity') {
				docRequestJson.registrationName = formData.registrationName;
				docRequestJson.countryOfIncorporationCode = $("#countryOfIncorporationCode").val();
				docRequestJson.countryOfIncorporationName = $("#countryOfIncorporationCode option:selected").text();
				// emailId = $("#clubContactEmailId").text();
				KycPartyType = $("#kycPartyType").text() != '-' ? $("#kycPartyType").text() : "";
			}
			
			docRequestJson.relatedPartyType = $("#typeOfCounterpartyCode option:selected").text();
			docRequestJson.emailId = formData.emailAddress;
			docRequestJson.residentialAddress = formData.residentialAddress;
			docRequestJson.stateCity = formData.stateCity;
			docRequestJson.zipCode = formData.zipCode;
			docRequestJson.emailId = $("#emailAddress").val();
			docRequestJson.businessComment = $("#businessComment").val();
			docRequestJson.KycPartyType= KycPartyType;
			docRequestJson.proofList = filteredCommonPrfList;
			
			var relationList = [];
			var gridData = getGridData('grid');
			relationList = getRelationData(gridData);
			$("#relationListString").val(JSON.stringify(relationList));
			
			var relationJsnArr = [];
			for(var i=0; i<relationList.length;i++) {
				var relationJsn = {};
				var eachJsn = relationList[i];
				relationJsn.clientName = eachJsn.clientName;
				relationJsn.clientId = eachJsn.clientShortcode;
				relationJsn.legalEntityId = eachJsn.clientEntityId;
				relationJsn.legalEntityName = eachJsn.legalEntityName;
				relationJsn.legalEntityType = eachJsn.entityType;
				relationJsn.jurisdiction = eachJsn.jurisdictionName;
				relationJsn.roleName = eachJsn.roleName;
				relationJsnArr.push(relationJsn);
			}
			if(KycPartyType === '' && relationList.length > 0)
				docRequestJson.relationDetails = relationJsnArr;
			
			console.log("docRequestJson --" + docRequestJson);
			$("#docRequestJsonString").val(JSON.stringify(docRequestJson));
			
			if(!jQuery.isEmptyObject(docRequestJson)) {
				$('#frm').parsley().destroy();
				$('#typeOfCounterpartyCode').attr("disabled", false);
				var manualScreeningObject = {};		
				if(screeningType == manualScreeningConstant) {
					manualScreeningObject.isPepRisk = $('input[name="kycSubjectReview.isPepRisk"]:checked').val();
					manualScreeningObject.pepRiskLevel = $("#pepRiskLevel").val();
					manualScreeningObject.isSanctionRisk = $('input[name="kycSubjectReview.isSanctionRisk"]:checked').val();
					manualScreeningObject.sanctionsRiskLevel = $("#sanctionsRiskLevel").val();
					manualScreeningObject.isActivitiesRisk = $('input[name="kycSubjectReview.isActivitiesRisk"]:checked').val();
					manualScreeningObject.activitiesRiskLevel = $("#activitiesRiskLevel").val();
					manualScreeningObject.isLawEnforcement = $('input[name="kycSubjectReview.isLawEnforcement"]:checked').val();
					manualScreeningObject.lawEnforcementRiskLevel = $("#lawEnforcementRiskLevel").val();
					manualScreeningObject.isRegulatoryEnforcement = $('input[name="kycSubjectReview.isRegulatoryEnforcement"]:checked').val();
					manualScreeningObject.regulatoryEnforcementRiskLevel = $("#regulatoryEnforcementRiskLevel").val();
					manualScreeningObject.isOtherBodies = $('input[name="kycSubjectReview.isOtherBodies"]:checked').val();
					manualScreeningObject.otherBodiesRiskLevel = $("#otherBodiesRiskLevel").val();
					manualScreeningObject.countryRiskLevel = $("#countryRiskLevel").val();
					manualScreeningObject.totalRiskLevel = $("#totalRiskLevel").val();
					manualScreeningObject.isAutoScreening = false;
					manualScreeningObject.screeningType = screeningType;
				}
				else {
					manualScreeningObject.isPepRisk = $("#computedPepId").val();
					manualScreeningObject.pepRiskLevel = $("#computedPep").text();
					manualScreeningObject.isSanctionRisk = $("#computedSanctionsId").val();
					manualScreeningObject.sanctionsRiskLevel = $("#computedSanctions").text();
					manualScreeningObject.isActivitiesRisk = $("#computedNegativeMediaId").val();
					manualScreeningObject.activitiesRiskLevel = $("#computedNegativeMedia").text();
					manualScreeningObject.isLawEnforcement = $("#computedLawEnforcementId").val();
					manualScreeningObject.lawEnforcementRiskLevel = $("#computedLawEnforcement").text();
					manualScreeningObject.isRegulatoryEnforcement = $("#computedRegulatoryEnforcementId").val();
					manualScreeningObject.regulatoryEnforcementRiskLevel = $("#computedRegulatoryEnforcement").text();
					manualScreeningObject.isOtherBodies = $("#computedOtherBodiesId").val();
					manualScreeningObject.otherBodiesRiskLevel = $("#computedOtherBodies").text();
					
					manualScreeningObject.countryRiskLevel =  $("#computedCountryRiskId").val();
					manualScreeningObject.totalRiskLevel = $("#computedRiskRatingId").val();
					manualScreeningObject.riskScore = $("#computedRiskScoreId").val();
					manualScreeningObject.selectedScreeningSolution = $("#computedSelectedScreeningSolutionId").val();
					manualScreeningObject.runAt = $("#computedRiskScoreCalculatedAtId").val();
					manualScreeningObject.isAutoScreening = true;
					manualScreeningObject.screeningType = screeningType;
					
					var getselectedrowindexes = $('#screeningResultJqxgrid').jqxGrid('getselectedrowindexes');
		
					var selectedScreeningResult = [];
					uniqueScreeningIds = [];
					for(var i = 0; i < getselectedrowindexes.length; i++){
						var selectedRowData = $('#screeningResultJqxgrid').jqxGrid('getrowdata', getselectedrowindexes[i]);
						uniqueScreeningIds.push(selectedRowData['ResultId']);
						selectedScreeningResult.push(selectedRowData);
					}
					manualScreeningObject.requestId = uniqueScreeningIds;
					manualScreeningObject.screeningResult = selectedScreeningResult;
				}
				$("#manualScreeningDetails").val(JSON.stringify(manualScreeningObject));
				$("#screeningType").val(screeningType);
				
				$('.contactDetails').attr("disabled", false);
				$('#frm').attr("method", "post");
				$('#frm').attr("action", $("#commonContextPathId").val() + "/kyc/subject/saveKYC");
				$('#frm').submit();
				buffer();
			}
			/*
			var url = $("#commonContextPathId").val() + '/kyc/subject/sendRequestForDocuments';
			ajaxCallBack("POST", url, docRequestJson, "json", function(response) {
				
				console.log("response -- "+response);
				if("Success" in response) {
				}
				else {
					var errMsg = response.Error;
					bootbox.alert("Error : " + errMsg, function () {});
					return false;
				}
			});
			*/
		}
	}
});

function setSubjectDetails(){
	var schema = "";
	var typeOfCounterpartyCode = $("#typeOfCounterpartyCode").val();
	if(typeOfCounterpartyCode === "Individual"){
		schema = JSON.parse($("#individualSchema").val());
	}else{
		schema = JSON.parse($("#entitySchema").val());
	}
	var propertyArray = getViewSchema(schema);
	var finalViewArray = [];
	for(var i = 0; i < propertyArray.length; i++){
		var propertiesObject= propertyArray[i].properties;
		var objectArray = Object.entries(propertiesObject);

		objectArray.forEach(([key, value]) => {
		  var fieldObject = value;
		  var objects = {};
		  if(fieldObject.hasOwnProperty('isDisplay') && fieldObject.isDisplay == true){
			  if(fieldObject.hasOwnProperty('enum'))
				  objects["type"] = "dropDown";
			  else
				  objects["type"] = "String";
			  
			  objects["fieldId"] = key;
			  objects["title"] = fieldObject.title;
			  objects["group"] = fieldObject.group;
			  objects["viewOrder"] = fieldObject.viewOrder;
			  
			  finalViewArray.push(objects);
		  }
		});
	}
	finalViewArray.sort(function(a, b) {
    	if(a.hasOwnProperty('viewOrder'))
    		return a.viewOrder - b.viewOrder;
    });
	
	createSubjectViewDiv(finalViewArray);
}

var getViewSchema = function(schema){
	var propertyArray = [];
	$.each(schema.properties, function(k, v) {
		v.sectionKey = k;
		propertyArray.push(v);
    });
	propertyArray.sort(function(a, b) {
    	if(a.hasOwnProperty('propertyOrder'))
    		return a.propertyOrder - b.propertyOrder;
    });
	return propertyArray;
}

function createSubjectViewDiv(finalViewArray){
	var divOneHtml = "<div class='col-md-4'>"+
						"<div class='note note-grey-gallery'>"+
							"<p>"+
							"<label class='noteLabel bold'>Counterparty (CP) Type  :&nbsp;&nbsp;</label>"+ 
                            "<label class='noteLabel'>"+$("#typeOfCounterpartyCode option:selected").text()+"</label>"+
                            "<br>";
	var divTwoHtml = "<div class='col-md-4'>"+
						"<div class='note note-grey-gallery'>"+
							"<p>";
	for(var i = 0; i < finalViewArray.length; i++){
		var viewObject = finalViewArray[i];
		var fieldValue = "";
		if(viewObject.type === "String")
			fieldValue = $("#"+viewObject.fieldId).val();
		else
			fieldValue = $("#"+viewObject.fieldId+" option:selected").text();
		if(viewObject.group == 1){
			//--console.log("inside group 1...");
			divOneHtml += "<label class='noteLabel bold'>"+viewObject.title+" :&nbsp;&nbsp;</label>"+
                "<label class='noteLabel'>"+fieldValue+"</label>"+
                "<br />";
		}else if(viewObject.group == 2){
			//--console.log("inside group 2...");
			divTwoHtml += "<label class='noteLabel bold'>"+viewObject.title+" :&nbsp;&nbsp;</label>"+
            "<label class='noteLabel'>"+fieldValue+"</label>"+
            "<br />";
		}
	}
	divOneHtml += "</p>"+
			"</div>"+
		"</div>";
	divTwoHtml += "</p>"+
			"</div>"+
		"</div>";
	$(".viewTab1").html(divOneHtml);
	$(".viewTab2").html(divTwoHtml);
}

function setAutoScreeningViewData(typeOfCounterpartyCode){
	var schema = "";
	if(typeOfCounterpartyCode === "Individual"){
		schema = JSON.parse($("#individualSchema").val());
	}else{
		schema = JSON.parse($("#entitySchema").val());
	}
	var propertyArray = getViewSchema(schema);
	var finalViewArray = [];
	for(var i = 0; i < propertyArray.length; i++){
		var propertiesObject= propertyArray[i].properties;
		var objectArray = Object.entries(propertiesObject);

		objectArray.forEach(([key, value]) => {
		  var fieldObject = value;
		  var objects = {};
		  if(fieldObject.hasOwnProperty('isAutoScreeningView') && fieldObject.isAutoScreeningView == true){
			  if(fieldObject.hasOwnProperty('enum'))
				  objects["type"] = "dropDown";
			  else if(fieldObject.hasOwnProperty('format') && fieldObject.format === "date")
                  objects["type"] = "date";
			  else
				  objects["type"] = "String";
			  
			  objects["fieldId"] = key;
			  objects["title"] = fieldObject.title;
			  objects["viewOrder"] = fieldObject.isAutoScreeningViewOrder;
			  
			  finalViewArray.push(objects);
		  }
		});
	}
	finalViewArray.sort(function(a, b) {
    	if(a.hasOwnProperty('viewOrder'))
    		return a.viewOrder - b.viewOrder;
    });
	
	createAutoScreeningViewDiv(finalViewArray);
}

function createAutoScreeningViewDiv(finalViewArray){
	var htmlElement = "";
	for(var i = 0; i < finalViewArray.length; i++){
		var viewObject = finalViewArray[i];
		var fieldValue = "";
		if(viewObject.type === "String")
			fieldValue = $("#"+viewObject.fieldId).val();
		else
			fieldValue = $("#"+viewObject.fieldId+" option:selected").text();
		
		if(viewObject.type === "date"){
            var monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
            var date = new Date($("#"+viewObject.fieldId).val())
            date.setDate(date.getDate() - 0);
            date = date.getDate()+"-"+monthNames[date.getMonth()]+"-"+date.getFullYear();
            console.log("date",date);
            fieldValue = date;
        }
		
		if(fieldValue === '' || fieldValue == null)
			fieldValue = "-";
		
		htmlElement += "<label class='control-label col-md-2 bold'>"+viewObject.title+":</label>"+
        "<div class='col-md-2'>"+
        "<p class='form-control-static doc-name-align'>"+fieldValue+"</p>"+
        "</div>";
	}
	console.log("htmlElement:::",htmlElement);
	$(".isAutoScreeningTab").html(htmlElement);
}

$('input.mitigation-activity').change(enableDisableMitigationRisk);
$('textarea.mitigation-activity').change(enableDisableMitigationRisk);
$('.MITQ').click(enableDisableMitigationRisk);

function enableDisableMitigationRisk() {
    var anyOneEmpty = false;
	$('.mitigation-activity').each(function() {
		if($(this).val() === '')
			anyOneEmpty = true;
	});
	var anyOneFail = false;
	$('.MITQ').each(function() { 
		if ($(this).is(':checked') &&  $(this).val() === 'FAIL') {
			anyOneFail = true;
		}
	});
    if(!anyOneEmpty && !anyOneFail)
		$('#mitigationRiskLevel, #mitigationComment').attr("disabled", false);
    else
    	$('#mitigationRiskLevel, #mitigationComment').attr("disabled", true);
}

function httpGetRESTCall(theUrl) {
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.open( "GET", theUrl, false ); // false for synchronous request
    xmlHttp.send( null );
    return xmlHttp.responseText;
}

function setPassportFields(passportFldsData) {
	var results = passportFldsData.results;
	var countryData = JSON.parse($("#countryData").val());
	
	for(var i in results) {
		var each = results[i];
		
		if(each.name == 'DocumentCode' && each.mrzCharacters == 'P<') {
			$("#pDocType, #vDocType").val(each.readableValue.toUpperCase());
		}
		if(each.name == 'PassportNumber' && each.mrzCharacters != '') {
			$("#pPassportNum, #vPassportNum").val(each.readableValue);
		}
		if(each.name == 'Name') {
			var mrzCharacters = each.mrzCharacters;
			var mrzCharactersArr = mrzCharacters.split('<<');
			var surName = mrzCharactersArr[0].replaceAll('<', ' ');
			var givenName = mrzCharactersArr[1].replaceAll('<', ' ');
			
			$("#pGivenName, #vGivenName").val(givenName.trim());
			$("#pSurname, #vSurname").val(surName.trim());
		}
		if(each.name == 'IssuingState') {
			$("#pIssueState, #vIssueState").val(each.mrzCharacters);
		}
		if(each.name == 'Nationality') {
			$.each(countryData, function(key,eachCountry) {
			    if(each.mrzCharacters == eachCountry.ISO3166_1_alpha_3)
					$("#pNationality, #vNationality").val(eachCountry.Country_shortcode).change();
			});
		}
		if(each.name == 'DateOfBirth') {
			var mrzCharacters = each.mrzCharacters; // 590923
			if(each.readableValue != '') {
				var mrzCharactersArr = mrzCharacters.match(/.{1,2}/g); // ["59", "09", "23"]
				var currYear = new Date().getFullYear().toString().substr(-2);
				var birthYear = '';
				if(Number(mrzCharactersArr[0]) > currYear)
					birthYear = Number(mrzCharactersArr[0]) + Number(1900);
				else
					birthYear = Number(mrzCharactersArr[0]) + Number(2000);
				
				var birthDate = mrzCharactersArr[1]+"/"+mrzCharactersArr[2]+"/"+birthYear;	
				$("#pDateOfBirth, #vDateOfBirth").val(birthDate); // 09/23/1959
			}
		}
		if(each.name == 'DateOfExpiry') {
			var mrzCharacters = each.mrzCharacters; // 590923
			if(each.readableValue != '') {
				var mrzCharactersArr = mrzCharacters.match(/.{1,2}/g); // ["59", "09", "23"]
			var currYear = new Date().getFullYear().toString().substr(-2);
			var expiryYear = Number(mrzCharactersArr[0]) + Number(2000);
			
			var expiryDate = mrzCharactersArr[1]+"/"+mrzCharactersArr[2]+"/"+expiryYear;	
			$("#pExpiryDate, #vExpiryDate").val(expiryDate); // 09/23/1959
			
			checkIsPassportExpired(expiryYear+"-"+mrzCharactersArr[1]+"-"+mrzCharactersArr[2]);
			}
		}
		if(each.name == 'Sex') {
			var genderData = JSON.parse($("#genderData").val());
			$.each(genderData, function(key,eachGender) {
			    if(each.mrzCharacters == eachGender.Gender_Value)
					$("#pGender, #vGender").val(eachGender.Gender_shortcode).change();
			});
		}
	}
	
	$('#vPassportNum').attr("disabled", true);
    $('#vGivenName').attr("disabled", true);
    $('#vSurname').attr("disabled", true);
	$('#vGender').attr("disabled", true);
	$('#vDateOfBirth').attr("disabled", true);
	$('#vIssueState').attr("disabled", true);
	$('#vNationality').attr("disabled", true);
	$('#vExpiryDate').attr("disabled", true);
	$('#vDocType').attr("disabled", true);
}

function createMRZUrlWithFields(theUrl){
	
	theUrl = theUrl + '?givenName='+ $('#pGivenName').val() +
	'&lastName=' + $('#pSurname').val() +
	'&gender=' + $("#pGender option:selected").text().toUpperCase() +
	'&pIssuingState=' + $("#pIssueState").val() +
	'&nationality=' + $("#pNationality option:selected").text() +
	'&dateOfBirth=' + $('#pDateOfBirth').val() +
	'&pdocumentType=' + $('#pDocType').val() +
	'&passportNumber=' + $('#pPassportNum').val() +
	'&pdateofExpiry=' + $('#pExpiryDate').val();
	
	return theUrl;
}

let angle = [0, 90, 180, 270];
let current = 0;
function rotateImage(id) {
	var h=jQuery("#"+id).height();
	var w=jQuery("#"+id).width();
	$('#'+ id).css("width",""+h+"px");
	$('#'+ id).css("height",""+w+"px");
	current++;
	if(current == 4)
		current = 0;
	$('#'+id).css('transform', 'rotate(' + angle[current] + 'deg)');
	if(current == 1 || current == 3) {
		$('#'+ id).css("margin-left","45px");
		$('#'+ id).css("margin-top","-42px");
	}
	else {
		$('#'+ id).css("margin-left","");
		$('#'+ id).css("margin-top","");
	}
}

$('#validPassport').click(function () {
	setPopupFldToDocFields(passPortDocument);
	$('.passportStatusDiv').show();
	$('.passportStatus').text('');
	$('#pStatusImg').attr("src", "/digiKYC/assets/global/img/verified.png");
	$('.passportStatus').append('<button type="button" class="btn-remark btn-link" data-toggle="modal" data-target="#verifiedPassportModal">Screened and verified</button>');
	$('.actionedBy').text($('#userName').val());
	$('.passportScreenDate').text(getSimplifiedDate(new Date()));
	
	document.getElementById(passPortDocument + '.passPortStatus' ).value = $('.passportStatus').text();
	document.getElementById(passPortDocument + '.verifyActionedBy' ).value = $('.actionedBy').text();
	var dateVal = parseDateStr($('.passportScreenDate').text())
	document.getElementById(passPortDocument + '.passportVerificationDate' ).value =  dateVal.getMonth()+1 +"/" + dateVal.getDate() + "/" + dateVal.getFullYear();
	
	$('#comparePassportModal').modal('toggle');
});

$('#clsPPmodal').click(function () {
	setPopupFldToDocFields(passPortDocument);
	$('.passportStatusDiv').show();
	$('.passportStatus').text('');
	$('#pStatusImg').attr("src", "/digiKYC/assets/global/img/needToVerify.png");
	$('.passportStatus').append('<button type="button" class="btn-remark btn-link" data-toggle="modal" data-target="#comparePassportModal">Need to be verified</button>');
	$('.passportScreenDate').text(getSimplifiedDate(new Date()));
	
	document.getElementById(passPortDocument + '.passPortStatus' ).value = $('.passportStatus').text();
	var dateVal = parseDateStr($('.passportScreenDate').text())
	document.getElementById(passPortDocument + '.passportVerificationDate' ).value =  dateVal.getMonth()+1 +"/" + dateVal.getDate() + "/" + dateVal.getFullYear();
});
	
$('#invalidPassport').click(function () {
	setPopupFldToDocFields(passPortDocument);
	$('.passportStatusDiv').show();
	$('.passportStatus').text('');
	$('#pStatusImg').attr("src", "/digiKYC/assets/global/img/rejected.png");
	$('.passportStatus').append('<button type="button" class="btn-remark btn-link" data-toggle="modal" data-target="#verifiedPassportModal">Rejected</button>');
	$('.actionedBy').text($('#userName').val());
	$('.passportScreenDate').text(getSimplifiedDate(new Date()));
	
	document.getElementById(passPortDocument + '.passPortStatus' ).value = $('.passportStatus').text();
	document.getElementById(passPortDocument + '.verifyActionedBy' ).value = $('.actionedBy').text();
	var dateVal = parseDateStr($('.passportScreenDate').text())
	document.getElementById(passPortDocument + '.passportVerificationDate' ).value =  dateVal.getMonth()+1 +"/" + dateVal.getDate() + "/" + dateVal.getFullYear();
	
	$('#comparePassportModal').modal('toggle');
});


$(".passportfields").change(function () {
	$("#rescreenRow").show();
	$("#worldChkMRZDiv").hide();
	$("#iCAOconfirmedDiv").hide();
	$("#confirmationDiv").hide();
	if(this.id == "pExpiryDate") {
		var dateArr = this.value.split("/");
		checkIsPassportExpired(dateArr[2]+"-"+dateArr[0]+"-"+dateArr[1]);
	}
	$(".footerBtns").hide();
	if(passportUploaded) {
		$("#v"+this.id.substring(1)).val(this.value);
		var i = passPortDocument.charAt(9);
		var j = passPortDocument.charAt(23);
		var formData = getKYCData("frm");
		formData = unflatten(formData);
		var fldsLength = formData.proofList[i].documentList[j].passportDocumentAttributeList.length;
		for(var k=0; k<fldsLength; k++) {
			var fieldEleName = document.getElementById(passPortDocument +'.passportDocumentAttributeList' +k+'.documentAttributeValue').getAttribute('data-attribute-name');
			var popupFldName;
			if(this.id == 'pExpiryDate' || this.id == 'pDateOfBirth')
				popupFldName = this.parentElement.parentElement.firstElementChild.textContent;
			else
				popupFldName = this.parentElement.firstElementChild.textContent;
			if(fieldEleName == popupFldName)
				document.getElementsByName("proofList["+i+"].documentList["+j+"].passportDocumentAttributeList["+k+"].isOCRValue")[0].value = false;
		}
	}
});

$("#reScreenBtn").click(function () {
	$('#rescreenRow').hide();
	$('.footerBtns').hide();
	getWCMRZandSetValues();
	checkIsPassportExpired($('#pExpiryDate').val());
});

function addOptionalFiledstToPopup(documentAttributeList) {
	for(var i in documentAttributeList) {
		var eachAttr = documentAttributeList[i];
		if(eachAttr.documentAttributeName != 'Receive Date' && eachAttr.documentAttributeName != 'Expiry Date') {
			var htmlEle = "<div class='col-md-6 removeOptFld'><label class='noteLabel bold'>" + eachAttr.documentAttributeName + "</label>";
			if(eachAttr.documentAttributeDataType == 'Date') {
				htmlEle += "<div class='input-group date'><input type='text' value='"+ eachAttr.documentAttributeValue +"' class='form-control datePicker form-control-inline passportfields optionalFld' /><span class='input-group-btn btn default'> <i class='fa fa-calendar'></i></span></div>";
			}
			else {
				htmlEle += "<input type='text' class='form-control passportfields optionalFld' maxlength='255' value='" + eachAttr.documentAttributeValue +"' />"
			}
			$('#passportPopupFlds, #vpassportPopupFlds').append(htmlEle);
		}
	}
	$('#vpassportPopupFlds .optionalFld').attr("disabled", true);
}

var passportFldsData;
function passportOperations(i, j, proofList, file) {
	$('.removeOptFld').remove();
	passportFldsData = processImage(file, imageHeight, imageWidth);
	setPassportFields(passportFldsData);
	addOptionalFiledstToPopup(proofList[i].documentList[j].documentAttributeList);
	getWCMRZandSetValues();
	
	$("#rescreenRow").hide();
	$('#comparePassportModal').modal('toggle');
	passportUploaded = true;
	setIsOCRValueTrueOrFalseForAll(i, j, proofList, true);
}

function compareMRZcodes(mrzLinesFromOCR, mrzLinesFromWC) {
	var matched = true;
	var line0WC = mrzLinesFromWC[0].replaceAll('*', '<');
	if(line0WC !== mrzLinesFromOCR[0])
		matched = false;
	var line1WC = mrzLinesFromWC[1].substring(0, mrzLinesFromWC[1].length - 16);
	var line1OCR = mrzLinesFromOCR[1].substring(0, mrzLinesFromOCR[1].length - 16);
	if(line1WC !== line1OCR)
		matched = false;
	return matched;
}

function parseDateStr(dateStr) {
  var months = {jan:0, feb:1, mar:2, apr:3, may:4, jun:5, jul:6, aug:7, sep:8, oct:9, nov:10, dec:11};
  var p = dateStr.split('-');
  return new Date(p[2], months[p[1].toLowerCase()], p[0]);
}

function processImage(imgFile, imageHeight, imageWidth) {
	
	var passPortOCRData = null;
	var formData = new FormData();
	formData.append("profileImage", imgFile);
	formData.append("imageWidth", imageWidth);
	formData.append("imageHeight", imageHeight);
	formData.append("pageNumber", 1);
	
	$.ajax({
	      url: $("#ocrServiceHostPort").val(),
	      data: formData,
	      processData: false,
	      contentType: false,
	      async: false,
	      type: "POST",
	      success: function (data) {
	        passPortOCRData = data;
	      }
	});
	
	return passPortOCRData;
}

function checkIsPassportExpired(_expiryDate){

	var expiryDate=new Date(_expiryDate); //yyyy-mm-dd hh:mm:ss
	var currentdate=new Date(); //fetch the current date value
	if(expiryDate.getTime()<currentdate.getTime()) {
		$('.passportExpiryDate, .vpassportExpiryDate').css("color", "#ff0000");
		$('.passportExpiryError, .vpassportExpiryError').show();
		$('#pExpiryDate, #vExpiryDate').css('border','1px solid #ff0000');
		$('#pExpiryDate, #vExpiryDate').css('color','#ff0000');
		 
		$("#rescreenRow").hide();
		$('#mrzLine0, #vmrzLine0').val('');
		$('#mrzLine1, #vmrzLine1').val('');
		$("#worldChkMRZDiv, #vworldChkMRZDiv").hide();
		$("#iCAOconfirmedDiv, #viCAOconfirmedDiv").hide();
		$(".footerBtns").hide();
		return true;
	}else{
		$('.passportExpiryError, .vpassportExpiryError').hide();
		if($(".passportExpiryDate").css('color') === "rgb(255, 0, 0)"){
			$('.passportExpiryDate, .vpassportExpiryDate').css("color", "#000000");
			$('#pExpiryDate, #vExpiryDate').css('border','1px solid #000000');
			$('#pExpiryDate, #vExpiryDate').css('color','#000000');
			$(".footerBtns").show();
		}
		return false;
	}
}

$('#confirmationChkBox').change(function() {
    if($(this).is(":checked")) {
		$("#vconfirmationChkBox").prop('checked', true);
		document.getElementById(passPortDocument +'.isMRZMatches').value = true;
	}
	else {
		$("#vconfirmationChkBox").prop('checked', false);
		document.getElementById(passPortDocument +'.isMRZMatches').value = false;
	}
    	
    $.uniform.restore("input:checkbox");
    $('#vconfirmationChkBox').attr("disabled", true);
});

function getWCMRZandSetValues() {
	var mrzCodeUrlWithParams = createMRZUrlWithFields(mrzWorldCheckREUrl);
	var mrzResp = httpGetRESTCall(mrzCodeUrlWithParams);
	var mrzJSON = JSON.parse(mrzResp);
	
	if(passportFldsData != undefined) {
		document.getElementById(passPortDocument +'.ocrMRZCodeList0').value = passportFldsData.lines[0];
		document.getElementById(passPortDocument +'.ocrMRZCodeList1').value = passportFldsData.lines[1];
	}
	
	if(mrzJSON != null && !mrzJSON.hasOwnProperty("Message")) {
		mrzJSON = JSON.parse(mrzJSON);
		if(mrzJSON.hasOwnProperty("lines")) {
			$('#mrzLine0, #vmrzLine0').val(mrzJSON.lines[0]);
			document.getElementById(passPortDocument +'.worldCheckMRZCodeList0').value = mrzJSON.lines[0];
			$('#mrzLine1, #vmrzLine1').val(mrzJSON.lines[1]);
			document.getElementById(passPortDocument +'.worldCheckMRZCodeList1').value = mrzJSON.lines[1];
			$('#mrzLine0, #vmrzLine0, #mrzLine1, #vmrzLine1').attr("disabled", true);
			$("#worldChkMRZDiv, #vworldChkMRZDiv").show();
		}
		if(mrzJSON.hasOwnProperty("isConformICAO") && mrzJSON.isConformICAO) {
			$('.iCAOconfirmed, .viCAOconfirmed').val("Confirmed");
			document.getElementById(passPortDocument +'.worldCheckMRZCodeList2').value = "Confirmed";
		} else {
			$('.iCAOconfirmed, .viCAOconfirmed').val("To be Confirmed");
			document.getElementById(passPortDocument +'.worldCheckMRZCodeList2').value = "To be Confirmed";
		}
		$('.iCAOconfirmed, .viCAOconfirmed').attr("disabled", true);
		if(!checkIsPassportExpired($('#pExpiryDate').val()))
			$("#iCAOconfirmedDiv, #viCAOconfirmedDiv").show();
		var mrzMatches = compareMRZcodes(passportFldsData.lines, mrzJSON.lines);
		if(mrzMatches) {
			$("#confirmationChkBox, #vconfirmationChkBox").prop('checked', true);
			document.getElementById(passPortDocument +'.isMRZMatches').value = true;
		} else {
			$("#confirmationChkBox, #vconfirmationChkBox").prop('checked', false);
			document.getElementById(passPortDocument +'.isMRZMatches').value = false;
		}
		$.uniform.restore("input:checkbox");
		if(!checkIsPassportExpired($('#pExpiryDate').val()))
			$("#confirmationDiv, #vconfirmationDiv").show();
			
		if(!checkIsPassportExpired($('#pExpiryDate').val()))
			$('.footerBtns').show();
	}
	else if(mrzJSON != null && mrzJSON.hasOwnProperty("Message")) {
		$('#mrzLine0, #vmrzLine0').val(mrzJSON.Message);
		$("#worldChkMRZDiv, #vworldChkMRZDiv").show();
	}
}
function setPopupFldToDocFields(passPortDocument) { // proofList0.documentList0
	$('.psPortFld').attr("disabled", false);
	var i = passPortDocument.charAt(9);
	var j = passPortDocument.charAt(23);
	var formData = getKYCData("frm");
	formData = unflatten(formData);
	var fldsLength = formData.proofList[i].documentList[j].passportDocumentAttributeList.length;
	for(var k=0; k<fldsLength; k++) {
		var fieldEle = document.getElementById(passPortDocument +'.passportDocumentAttributeList' +k+'.documentAttributeValue');
		var fldName = fieldEle.getAttribute('data-attribute-name');
		if(fldName == 'Type')
			fieldEle.value = $('#pDocType').val();
		else if(fldName == 'Country Code')
			fieldEle.value = $("#pNationality option:selected").text();
		else if(fldName == 'Gender')
			fieldEle.value = $("#pGender option:selected").text().toUpperCase();
		else if(fldName == 'Issuing State')
			fieldEle.value = $('#pIssueState').val();
		else if(fldName == 'Passport/ID Number')
			fieldEle.value = $('#pPassportNum').val();
		else if(fldName == 'Date of Expiry')
			fieldEle.value = $('#pExpiryDate').val();
		else if(fldName == 'Date of Birth')
			fieldEle.value = $('#pDateOfBirth').val();
		else if(fldName == 'Last Name(s)')
			fieldEle.value = $('#pSurname').val();
		else if(fldName == 'Given Name(s)')
			fieldEle.value = $('#pGivenName').val();
			
		if(formData.proofList[i].documentList[j].passportDocumentAttributeList[k].isOCRValue == 'true')
			$("#ocrTextSpan_"+i+"_"+j+"_"+k).css({"display":"block"});
		else
			$("#ocrTextSpan_"+i+"_"+j+"_"+k).css({"display":"none"});	
	}
	$('.psPortFld').attr("disabled", true);
}

function setIsOCRValueTrueOrFalseForAll(i, j, proofList, flag) {
    var fldsLength = proofList[i].documentList[j].passportDocumentAttributeList.length;
    for(var k=0; k<fldsLength; k++)
    	document.getElementsByName("proofList["+i+"].documentList["+j+"].passportDocumentAttributeList["+k+"].isOCRValue")[0].value = flag;
}

$('#isDocumentConfigCheckBox1').click(function() {
    if ($(this).is(':checked')) {
		var userName = $('#userName').val();
		var currentDate = getSimplifiedDate(new Date());
		
		$('.documentsDisable').attr('disabled', 'disabled');
		$('#btnAddDocument').attr('disabled', 'disabled');
		$('#requestDocumentDiv').attr('disabled', 'disabled');
		
		$('#documentConfigCheckBoxCheckedBy').val(userName);
		$('#documentConfigCheckBoxCheckedDate').val(currentDate);
		$('#clickedName').text(userName);
		$('#clickedTimestamp').text(currentDate);
		
		$('.uploadDocument').attr('disabled', 'disabled');
		$('.deletdDocument').attr('disabled', 'disabled');
		$(".attributeDisable").attr("data-parsley-required", false);
		
		$(".attributeDisabled").attr('disabled', 'disabled');
		
    }else{
		$('.documentsDisable').removeAttr('disabled', 'disabled');
		$('#btnAddDocument').removeAttr('disabled', 'disabled');
		$('#requestDocumentDiv').removeAttr('disabled', 'disabled');
		
		$('#documentConfigCheckBoxCheckedBy').val("");
		$('#documentConfigCheckBoxCheckedDate').val("");
		$('#clickedName').empty();
		$('#clickedTimestamp').empty();
		
		$('.uploadDocument').removeAttr('disabled', 'disabled');
		$('.deletdDocument').removeAttr('disabled', 'disabled');
		$(".attributeDisable").attr("data-parsley-required", true);
		
		$(".attributeDisabled").removeAttr('disabled', 'disabled');
	}
});

function EnableDocumentForDocumentConfig(){
	$('.documentsDisable').removeAttr('disabled', 'disabled');
	$('#btnAddDocument').removeAttr('disabled', 'disabled');
	$('#requestDocumentDiv').removeAttr('disabled', 'disabled');		
	$('.uploadDocument').removeAttr('disabled', 'disabled');
	$('.deletdDocument').removeAttr('disabled', 'disabled');
	$(".attributeDisabled").removeAttr('disabled', 'disabled');
}