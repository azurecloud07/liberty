var isFieldBackground;
var isMitigationWorkflow;
jQuery(document).ready(function () {
	
	var typeOfCounterpartyCode = $("#typeOfCounterpartyCode").val();
	var project = $("#instanceName").val();
	isFieldBackground = $("#isFieldBackground").val();
	isMitigationWorkflow = $("#isMitigationWorkflow").val();
	if(typeOfCounterpartyCode === "Individual" && isMitigationWorkflow === 'true'){
		$('#nav_li_4').hide(); 
	}else{
		$('#nav_li_4').show(); 
	}
	loadSectionTabs(typeOfCounterpartyCode,project,false,null,null);
	$('#saveButton').attr("disabled", true);
});

var oldFileObject = {};
var validateObject = {};
var mainSchema = {};
function loadSectionTabs(typeOfCounterpartyCode,project,flag,dataObj,kycSubjectObject){
	
	buffer();
	if($('.modalArray').length>0)
		$('.modalArray').remove();
	isSameTargetContact = false;
	$("#saveAsDraftButton").attr("disabled",false);
	//$("#saveButton").attr("disabled",false);
	validateObject = {};
	
	console.log("Inside main if flag :: " + flag + " dataObj :: " + dataObj);
	console.log(JSON.stringify(dataObj));
	tableCounter = 0;
	$(".btnAddElement").unbind().click(function() {});
	if(typeOfCounterpartyCode !== "") {
	    
		var isRequestFromNec = $("#isRequestFromNec").val();
	    if(isRequestFromNec === true || isRequestFromNec === "true"){
	    	
	    	var requestObject = {};	
		    var url = $("#commonContextPathId").val() + "/kyc/schema/kycSectionSchema";
			var templateObject = {};
			templateObject["typeOfCounterpartyCode"] = typeOfCounterpartyCode;
			//--templateObject["project"] = project;
			templateObject["action"] = "Add"
			templateObject["requestNo"] = $("#subjectRequestNo").val();
			requestObject = templateObject;
			
	    	ajaxCallBack("POST", url,requestObject,"json",function(response){
	    		$("#editor").html("");
	    		if(!jQuery.isEmptyObject(response)){
		    		//console.log("response:::",JSON.stringify(response));
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
	            	
	                $('#dateOfBirth').removeClass('hasDatepicker');
	                $("#dateOfBirth" ).datepicker({
	                    changeMonth: true,
	                     changeYear: true,
	                     yearRange: '1800:+0',
	                     maxDate: '0'
	               });
			    }else {
			    	$("#editor").html("<h3>Template definition not found</h3>");
			    	$("#saveAsDraftButton").attr("disabled",true);
			    	$("#saveButton").attr("disabled",true);
			    	
			    	$(".addRelationClass").show();
	            	$(".consentClass").show();
	            	$(".screeningClass").show();
			    }
				
				unbuffer();
	    	});
	    }else{
	    	var response = "";
	    	if(typeOfCounterpartyCode === "Individual"){
	    		response = JSON.parse($("#individualSchema").val());
	    	}else{
	    		response = JSON.parse($("#entitySchema").val());
	    	}
	    	//ajaxCallBack("POST", url,requestObject,"json",function(response){
	    	$("#editor").html("");
	    	
	    	if(!jQuery.isEmptyObject(response)){
	    		//console.log("response:::",JSON.stringify(response));
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
                
                // Show Hide Dive
                $(".addRelationClass").show();
            	$(".consentClass").show();
            	$(".screeningClass").show();
				
				if(isFieldBackground == 'true' && typeOfCounterpartyCode === 'Entity')
					$('#registrationNumber').addClass('field-background');

            	//Set Dropdown option
                setDropdownOption();
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
		    	
		    	$(".addRelationClass").show();
            	$(".consentClass").show();
            	$(".screeningClass").show();
		    }
			
			unbuffer();
		//});
	    }
	} else {
		$("#editor").html("");
		unbuffer();
	}
}

function setDropdownOption(){
	var instanceName = $("#instanceName").val();
	var isSubTypeOfCounterparty = $("#isSubTypeOfCounterparty").val();
	var isCountryOfNationality = $("#isCountryOfNationality").val();
	//--console.log("isSubTypeOfCounterparty:::"+isSubTypeOfCounterparty+"; isCountryOfNationality:::"+isCountryOfNationality);
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
		    if(isCountryOfNationality == 'true'){
		    	$('#countryOfNationalityCode').append(new Option(optionText, optionValue));
		    }else{
		    	$('#countryOfCitizenshipCode').append(new Option(optionText, optionValue));
		    }
		}
		
		var genderData = JSON.parse($("#genderData").val());
		for (var k in genderData) {
			var optionText = genderData[k].Gender_Description_en; 
		    var optionValue = genderData[k].Gender_shortcode; 

		    $('#genderCode').append(new Option(optionText, optionValue)); 
		}
		
		var nationalityData = JSON.parse($("#nationalityData").val());
		for (var l = 0; l < nationalityData.length; l++) {
			var optionText = nationalityData[l].Nationality_Fullname_English; 
		    var optionValue = nationalityData[l].Nationality_shortcode; 

		    $('#otherNationality').append(new Option(optionText, optionValue)); 
		}
	}
	
	if(isSubTypeOfCounterparty == 'true'){
		var investorSubTypeData = JSON.parse($("#investorSubTypeData").val());
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
}

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