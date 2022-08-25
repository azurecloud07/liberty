var isParsleyValidation;
var isMitigationWorkflow;
var isEMSKYC;
jQuery(document).ready(function () {
	var typeOfCounterpartyCode = $("#typeOfCounterpartyCode").val();
	var project = $("#instanceName").val();
	isParsleyValidation = $("#isParsleyValidation").val();
	isMitigationWorkflow = $("#isMitigationWorkflow").val();
	if(typeOfCounterpartyCode === "Individual" && isMitigationWorkflow === 'true'){
		$('#nav_li_4').hide(); 
	}else{
		$('#nav_li_4').show(); 
	}
	loadSectionTabs(typeOfCounterpartyCode,project,false,null,null);
	$('#saveButton').attr("disabled", true);
	isEMSKYC = $("#emsRefId").val();
	console.log("isEMSKYC:::"+isEMSKYC);
});

var oldFileObject = {};
var validateObject = {};
var mainSchema = {};
function loadSectionTabs(typeOfCounterpartyCode,project,flag,dataObj,kycSubjectObject){
	if($('.modalArray').length>0)
		$('.modalArray').remove();
	isSameTargetContact = false;
	$("#saveAsDraftButton").attr("disabled",false);
	$("#saveButton").attr("disabled",false);
	validateObject = {};
	buffer();
	console.log("Inside main if flag :: " + flag + " dataObj :: " + dataObj);
	console.log(JSON.stringify(dataObj));
	tableCounter = 0;
	$(".btnAddElement").unbind().click(function() {});
	if(typeOfCounterpartyCode !== "") {
		
		var requestObject = {};
	    var url = "";
	    if(kycSubjectObject == null  || jQuery.isEmptyObject(kycSubjectObject)){
			url = $("#commonContextPathId").val() + "/kyc/schema/kycSectionSchema";
			var templateObject = {};
			templateObject["typeOfCounterpartyCode"] = typeOfCounterpartyCode;
		    //--templateObject["project"] = project;
		    templateObject["action"] = "Edit";
		    templateObject["subjectId"] = $("#subjectId").val();
		    requestObject = templateObject;
		}else{
			url = $("#commonContextPathId").val() + "/kyc/subject/preview";
			var sectionDetail = kycSubjectObject.sectionDetail;
			requestObject["sectionArray"] = sectionDetail;
		}

	    ajaxCallBack("POST", url,requestObject,"json",function(response){
	    	$("#editor").html("");
	    	if(!jQuery.isEmptyObject(response)){
	    		
	    		if(typeOfCounterpartyCode === "Individual"){
		    		$("#individualSchema").text(JSON.stringify(response));
		    	}else{
		    		$("#entitySchema").text(JSON.stringify(response));
		    	}
		    	var schema = response;
		    	mainSchema = response;
				var $editor = document.getElementById('editor');
				//var myNewClass = new myClass($editor, schema);
				//console.log("## response : " + JSON.stringify(response));
				formView($editor, schema);
				getDisplayName(schema);
				/*
				$("input:radio").each(function () {
					$("[name='"+this.name+"']:first").attr('checked', true);
				});
				*/
				if(flag && dataObj!=null){
					var flatternObject = flatten(dataObj);
					$.each(flatternObject, function(key, value) {
						if(!Array.isArray(value)){
							var val = value.split(".");
							$.each(mimeTypes, function(k, v) {
								if (val[val.length - 1] === k)
									flatternObject[key] = value.split(/_(.+)/)[1];
							});
						}
			        });
					
					loadJQXData(unflatten(flatternObject));
			    	setFormData("necRequestForm",flatten(dataObj));
			        
			    	$.uniform.restore("input:checkbox");
			        $.each(flatten(dataObj), function(key, value) {
			        	var x = document.getElementsByName(key);
			        	if(x.length>0 && x[0].type == "checkbox" && value == "1"){
			        		$("[name='"+x[0].name+"']").val(1);
			        		$("[name='"+x[0].name+"']").attr('checked',true);
			        	}
			        	if(x.length>1){
				        	for(var i=0;i<x.length;i++){
						        var element = x[i];
						        if(element.type == "text"){
						        	var fileId = value.split(/_(.+)/)[0];
						        	var fileName = value.split(/_(.+)/)[1];
						        	document.getElementById(element.id).value = fileName;
						        	document.getElementById(element.id).setAttribute("data-file-id", fileId);
						        	
						        	oldFileObject[element.name] = fileId; 
						        }
					        }
			        	}
			        });
				}
				
				Index.init();
                Index.initDashboardDaterange();
                Index.initCalendar();
                ComponentsPickers.init();
                initParsely(jQuery);
                $('select').select2({'allowClear':true});
                
                $("#countryName").attr('disabled','disabled');
                $("#stateOrCountry").attr('disabled','disabled');
                $("#kycPartyType").attr('disabled','disabled');
                
                // Show Hide Dive
                $(".entity_class").show();
                $(".addRelationClass").show();
            	$(".consentClass").show();
            	$(".screeningClass").show();
            	
            	if(isParsleyValidation == 'true'){
            		if(typeOfCounterpartyCode == 'Individual'){
            			
            			$('#sourceOfWealth').attr('data-parsley-group', 'singleForm');
            			$( "#sourceOfWealth" ).next().addClass( "bt-flabels__error-desc" );
                    	$( "#sourceOfWealth" ).next().text( "Missing" );
                    	
                    	$('#residentialAddress').attr('data-parsley-group', 'singleForm');
                    	$( "#residentialAddress" ).next().addClass( "bt-flabels__error-desc" );
                    	$( "#residentialAddress" ).next().text( "Missing" );
                    	
                    	$('#stateCity').attr('data-parsley-group', 'singleForm');
                    	$( "#stateCity" ).next().addClass( "bt-flabels__error-desc" );
                    	$( "#stateCity" ).next().text( "Missing" );
                    	
                    	$('#zipCode').attr('data-parsley-group', 'singleForm');
                    	$( "#zipCode" ).next().addClass( "bt-flabels__error-desc" );
                    	$( "#zipCode" ).next().text( "Missing" );
                    	
                    	$('#countryOfResidencyCode').attr('data-parsley-group', 'singleForm');
                    	$( "#countryOfResidencyCode" ).next().addClass( "bt-flabels__error-desc" );
                    	$( "#countryOfResidencyCode" ).next().text( "Missing" );
                    	
                    	$('#emailAddress').attr('data-parsley-group', 'singleForm');
                    	$( "#emailAddress" ).next().addClass( "bt-flabels__error-desc" );
                    	$( "#emailAddress" ).next().text( "Missing" );
                    	
                    	$('#telephoneNumber').attr('data-parsley-group', 'singleForm');
                    	$( "#telephoneNumber" ).next().addClass( "bt-flabels__error-desc" );
                    	$( "#telephoneNumber" ).next().text( "Missing" );
                    	
        				$("#sourceOfWealth").attr("data-parsley-required", true);
        			    $("#residentialAddress").attr("data-parsley-required", true);
        			    $("#stateCity").attr("data-parsley-required", true);
        			    $("#zipCode").attr("data-parsley-required", true);
        			    $("#countryOfResidencyCode").attr("data-parsley-required", true);
        			    $("#emailAddress").attr("data-parsley-required", true);
        			    $("#telephoneNumber").attr("data-parsley-required", true);
        			}else{
        				
        				$('#registrationNumber').addClass('field-background');
        				
        				$('#registrationNumber').attr('data-parsley-group', 'singleForm');
        				$( "#registrationNumber" ).next().addClass( "bt-flabels__error-desc" );
                    	$( "#registrationNumber" ).next().text( "Missing" );
                    	
                    	$('#dateOfIncorporation').attr('data-parsley-group', 'singleForm');
                    	var missingSpan = "<span class='bt-flabels__error-desc_date'> Missing </span>";
                        $("#span_dateOfIncorporation").append(missingSpan);
                    	//$( "#dateOfIncorporation" ).next().addClass( "bt-flabels__error-desc" );
                    	//$( "#dateOfIncorporation" ).next().text( "Missing" );
                    	
                    	$('#residentialAddress').attr('data-parsley-group', 'singleForm');
                    	$( "#residentialAddress" ).next().addClass( "bt-flabels__error-desc" );
                    	$( "#residentialAddress" ).next().text( "Missing" );
                    	
                    	$('#stateCity').attr('data-parsley-group', 'singleForm');
                    	$( "#stateCity" ).next().addClass( "bt-flabels__error-desc" );
                    	$( "#stateCity" ).next().text( "Missing" );
                    	
                    	$('#zipCode').attr('data-parsley-group', 'singleForm');
                    	$( "#zipCode" ).next().addClass( "bt-flabels__error-desc" );
                    	$( "#zipCode" ).next().text( "Missing" );
                    	
        				$("#registrationNumber").attr("data-parsley-required", true);
        			    $("#dateOfIncorporation").attr("data-parsley-required", true);
        			    $("#residentialAddress").attr("data-parsley-required", true);
        			    $("#stateCity").attr("data-parsley-required", true);
        			    $("#zipCode").attr("data-parsley-required", true);
        			}
        		    
        			$('#frm').parsley().validate("singleForm")
            	}
            	
                
                // Avoid to select future date
                $('#dateOfBirth').removeClass('hasDatepicker');
                $("#dateOfBirth" ).datepicker({
                    changeMonth: true,
                     changeYear: true,
                     yearRange: '1800:+0',
                     maxDate: '0'
               });
		    } else {
		    	$("#editor").html("<h3>Template definition not found</h3>");
		    	$("#saveAsDraftButton").attr("disabled",true);
		    	$("#saveButton").attr("disabled",true);
		    }
		    if(isEMSKYC != null)
				$('.ems-field').attr('disabled', 'disabled');
		    	
	    	var isOGSCategoryChanged = $("#isOGSCategoryChanged").val();
			if(isOGSCategoryChanged == "true")
				$('.ogs-field').attr('disabled',true);
			unbuffer();
		});
	} else {
		$("#editor").html("");
		unbuffer();
	}
}

/*function setDropdownOption(){
	var instanceName = $("#instanceName").val();
	var typeOfCounterpartyCode = $("#typeOfCounterpartyCode").val();
	var jurisdictionData = JSON.parse($("#jurisdictionData").val());
	for (var i = 0; i < jurisdictionData.length; i++) {
		var optionText = jurisdictionData[i].jurisdiction_display_name_English; 
	    var optionValue = jurisdictionData[i].Jurisdiction_shortcode; 

	    $('#itgJurisdictionCode').append(new Option(optionText, optionValue)); 
	}
	
	if(typeOfCounterpartyCode === "Entity"){
		var countryData = JSON.parse($("#countryData").val());
		for (var j = 0; j < countryData.length; j++) {
			var optionText = countryData[j].CLDR_display_name_en; 
		    var optionValue = countryData[j].Country_shortcode; 

		    $('#countryOfIncorporationCode').append(new Option(optionText, optionValue)); 
		}
	}else{
		var countryData = JSON.parse($("#countryData").val());
		for (var k = 0; k < countryData.length; k++) {
			var optionText = countryData[k].CLDR_display_name_en; 
		    var optionValue = countryData[k].Country_shortcode; 

		    $('#countryOfResidencyCode').append(new Option(optionText, optionValue));
		    $('#countryOfBirthCode').append(new Option(optionText, optionValue));
		    if(instanceName === "VEDA"){
		    	$('#countryOfNationalityCode').append(new Option(optionText, optionValue));
		    }else{
		    	$('#countryOfCitizenshipCode').append(new Option(optionText, optionValue));
		    }
		}
		
		var nationalityData = JSON.parse($("#nationalityData").val());
		for (var l = 0; l < nationalityData.length; l++) {
			var optionText = nationalityData[l].Nationality_Fullname_English; 
		    var optionValue = nationalityData[l].Nationality_shortcode; 

		    $('#otherNationality').append(new Option(optionText, optionValue)); 
		}
	}
	
	if(instanceName === "VEDA"){
		var investorSubTypeData = JSON.parse($("#investorSubTypeData").val());
		for (var m = 0; m < investorSubTypeData.length; m++) {
			if(typeOfCounterpartyCode === investorSubTypeData[m].reference){
				var optionText = investorSubTypeData[m].SubTypeName; 
			    var optionValue = investorSubTypeData[m].SubType_shortcode; 

			    $('#subTypeOfCounterpartyCode').append(new Option(optionText, optionValue)); 
			}
		}
	}
}*/

var displayNameObject = [];
var getDisplayName = function(schema){
	$.each(schema.properties, function(key, value) {
		if (value.hasOwnProperty('properties')) {
			$.each(value.properties, function(fieldCode, fieldDetails) {
				displayNameObject.push(fieldCode);
			});
		}
		if (value.hasOwnProperty('items')) {
			$.each(value.items.properties, function(fieldCode, fieldDetails) {
				displayNameObject.push(fieldCode);
			});
		}
	});
};