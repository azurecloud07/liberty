jQuery(document).ready(function() {
	//$(".metigation").hide();	
	
	$('input').each(function(){
		  //$(this).trigger('change');
	})
});

	var activityRowCount = existingActivityCount;
	
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
										'<input type="text" id="mitigation.mitigationActivityList'+activityRowCount+'.activityPerformed" name="mitigation.mitigationActivityList['+activityRowCount+'].activityPerformed" class="form-control field-background" placeholder="Activity Performed" data-parsley-required="true" data-parsley-group="kycSubjectMitigationGroup" maxlength="255" />'+
										'<span class="bt-flabels__error-desc">Required</span>'+
									'</div>'+
								'</div>'+
							'</div>'+
						'</div>'+
							
						'<div class="col-md-3">'+
							'<div class="bt-form__wrapper">'+
								'<div class="form-group uk-width-1-1">'+
									'<div class="bt-flabels__wrapper">'+
										'<div class="field-background">'+
											'<label class="parsley_hide">Activity Description</label>'+
											'<textarea id="mitigation.mitigationActivityList'+activityRowCount+'.activityDescription" name="mitigation.mitigationActivityList['+activityRowCount+'].activityDescription" class="field-background" data-parsley-required="true" data-parsley-group="kycSubjectMitigationGroup" placeholder="Activity Description" rows="5" style="min-width:100%;"></textarea>'+
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
											'<input type="file" class="hidden" name="mitigation.mitigationActivityList['+activityRowCount+'].mitigationProofList[0].documentFile" id="file_'+activityRowCount+'_0" onchange="javascript:onChangeFile(\''+activityRowCount+'_0\');" accept="'+acceptedFileExtn+'">'+
											'<input type="text" readonly="true" class="form-control file'+activityRowCount+'_0" placeholder="Proof/Evidence" name="mitigation.mitigationActivityList['+activityRowCount+'].mitigationProofList[0].documentName" id="file'+activityRowCount+'_0">'+
											'<span class="bt-flabels__error-desc_date" style="right: 10px;">Required</span>'+
										'</div>'+
									'</div>'+
								'</div> '+
								'<div class="col-md-4">'+
									'<button type="button" class="btn btn-sm grey-gallery" id="uploadFile_'+activityRowCount+'_0" value="Change" onclick="$(\'#file_'+activityRowCount+'_0\').click()">'+
										'<i class="fa fa-folder-open-o"></i>&nbsp;Browse'+
									'</button>&nbsp;'+
										
									'<button type="button" class="btn btn-sm grey-gallery hidden" id="removeFile_'+activityRowCount+'_0" value="Remove" onclick="javascript:removeOnClick(\''+activityRowCount+'_0\');">'+
										'<i class="fa fa-trash"></i>'+
									'</button>'+
								'</div>'+
								'<div class="col-md-2">'+
									'<button type="button" class="btn btn-sm grey-gallery" onclick="javascript:addMoreProof('+activityRowCount+')" value="Add More">'+
										'<i class="fa fa-plus"></i> Add Proof'+
									'</button>'+
								'</div>'+
							'</div>'+
						'</div>'+
						
						'<div class="col-md-2">'+
							'<button type="button" class="btn btn-sm grey-gallery pull-right" onclick="javascript:jQuery(\'#activityRow_'+activityRowCount+'\').remove();" value="Remove">'+
								'<i class="fa fa-close"></i>'+
							'</button>'+
						'</div>'+
					'</div>';
		
		jQuery('#activitySection').append(activityRow);
	});
	
	var proofCount = existingProofCount;
	
	function addMoreProof(activityId) {
		var acceptedFileExtn = $("#mitigationFileExtensionsId").val();
		proofCount++;
		var proofRow = '<div class="row" id="proofRow_'+activityId+'_'+proofCount+'">'+
							'<div class="col-md-6">'+
								'<div class="form-group">'+
									'<div class="bt-flabels__wrapper">'+
										'<label class="parsley_hide">Proof/Evidence</label>'+
										'<input type="hidden" name="mitigation.mitigationActivityList['+activityId+'].mitigationProofList['+proofCount+'].fileId" value= "'+proofCount+'"/>'+
										'<input type="file" class="hidden" name="mitigation.mitigationActivityList['+activityId+'].mitigationProofList['+proofCount+'].documentFile" id="file_'+activityId+'_'+proofCount+'" onchange="javascript:onChangeFile(\''+activityId+'_'+proofCount+'\');" accept="'+acceptedFileExtn+'">'+
										'<input type="text" readonly="true" class="form-control file'+activityId+'_'+proofCount+'" placeholder="Proof/Evidence" name="mitigation.mitigationActivityList['+activityId+'].mitigationProofList['+proofCount+'].documentName" id="file'+activityId+'_'+proofCount+'">'+
										'<span class="bt-flabels__error-desc_date" style="right: 10px;">Required</span>'+
									'</div>'+
								'</div>'+
							'</div> '+
							'<div class="col-md-4">'+
								'<button type="button" class="btn btn-sm grey-gallery" id="uploadFile_'+activityId+'_'+proofCount+'" value="Change" onclick="$(\'#file_'+activityId+'_'+proofCount+'\').click()">'+
									'<i class="fa fa-folder-open-o"></i>&nbsp;Browse'+
								'</button>&nbsp;'+
									
								'<button type="button" class="btn btn-sm grey-gallery hidden" id="removeFile_'+activityId+'_'+proofCount+'" value="Remove" onclick="javascript:removeOnClick(\''+activityId+'_'+proofCount+'\');">'+
									'<i class="fa fa-trash"></i>'+
								'</button>'+
							'</div>'+
							'<div class="col-md-2">'+
								'<button type="button" class="btn btn-sm grey-gallery" onclick="javascript:jQuery(\'#proofRow_'+activityId+'_'+proofCount+'\').remove();" value="">'+
									'<i class="fa fa-close"></i>'+
								'</button>'+
							'</div>'+
						'</div>';
		
		jQuery('#multiRowProof_'+activityId).append(proofRow);
	}
	
	function onChangeFile(i){
		//--console.log("i:::"+i+"file name:::"+$('#file_'+i).val());
		var uploadFile = $('#file_'+i).val().split('\\').slice(-1)[0].toString();
		if (uploadFile != "") {
			var acceptedFileExtn = document.getElementById("file_"+i).getAttribute("accept");
			//console.log("acceptedFileExtn : "+acceptedFileExtn);
			if(acceptedFileExtn != undefined && acceptedFileExtn != ""){
				var acceptedFileExtnArray = acceptedFileExtn.split(",");
				console.log("acceptedFileExtnArray : "+acceptedFileExtnArray);
				var fileExtn = uploadFile.split('.');
				console.log("fileExtn : "+fileExtn);
				if(acceptedFileExtnArray.includes("."+fileExtn[fileExtn.length-1].toLowerCase())){
					$('#file'+i).val(uploadFile);
					$('#removeFile_'+i).removeClass('hidden');
					$("#removeFile_"+i).attr('value', 'Change');
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
							$('#file_'+i).val('');
							$('#file'+i).val('');
							$('#removeFile_'+i).addClass('hidden');
							$("#file"+i).change();
						}
					});
				}
			}
		}
	}

	function removeOnClick(i){
		$('#file_'+i).val('');
		$('#file'+i).val('');
		$('#removeFile_'+i).addClass('hidden');
		$("#file"+i).change();
	}

	function showHideDivs(value) {
		if(value == 0) {
			$("#tab1").hide(300);
			$("#tab2").show(500);
			$("#tab3").hide(300);
			$("#tab4").hide(300);
			$("#screeningTypeId").val("Manual Screening");
			var isAutoScreening = $("#isAutoScreening").val();
			if(isAutoScreening=="true")
				$("#screeningTypeId").val("Auto Screening");
			$('.ms').addClass('active');
			$('.rfc').addClass('done');
			$('.rfc').removeClass('active');
		} else if(value == 1) {
			$("#tab1").hide(300);
			$("#tab2").hide(300);
			$("#tab3").show(500);
			$("#tab4").hide(300);
			$('.tm').addClass('active');
			$('.ms').addClass('done');
			$('.ms').removeClass('active');
		} else if(value == 2) {
			$("#tab1").hide(300);
			$("#tab2").hide(300);
			$("#tab3").hide(300);
			$("#tab4").show(500);
			$('.mt').addClass('active');
			$('.tm').addClass('done');
			$('.tm').removeClass('active');
			$('#saveButton').attr("disabled", false);
		} else if(value == 3) {
			$(".enableField").removeAttr('disabled');
			$("#tab1").hide(300);
			$("#tab2").show(500);
			$("#tab3").hide(300);
			$("#tab4").hide(300);
			$("#screeningTypeId").val("Manual Screening");
			/*var isAutoScreening = $("#isAutoScreening").val();
			if(isAutoScreening=="true")
				$("#screeningTypeId").val("Auto Screening");*/
			$('.rfc').removeClass('active');
			$('.rfc').addClass('done');
			$('.ms').addClass('active');
			$('.tm').removeClass('active');
			$('.mt').removeClass('active');
		} else if(value == 4) {
			buffer();
			setTimeout("unbuffer()", 3000);
			setTimeout("showScreeningdiv()", 3000);
			$("#screeningTypeId").val("Send For Screening");
			sendForScreening();
		}else if(value == 5) {
			$("#tab1").show(500);
			$("#tab2").hide(300);
			$("#tab3").hide(300);
			$("#tab4").hide(300);
			$('.rfc').addClass('active');
			$('.ms').addClass('done');
			$('.ms').removeClass('active');
			$('.tm').removeClass('active');
			$('.mt').removeClass('active');
		}else if(value == 6) {
			$("#unusedDocumentList").hide();
			$("#usedDocumentList").hide();
			
			if($("#screeningTypeId").val() == "Manual Screening"){
				$("#tab1").hide(300);
				$("#tab2").show(500);
				$("#tab3").hide(300);
				$("#tab4").hide(300);
				$('.rfc').removeClass('active');
				$('.ms').addClass('active');
				$('.tm').addClass('done');
				$('.tm').removeClass('active');
				$('.mt').removeClass('active');
			}else{
				$("#tab1").show(500);
				$("#tab2").hide(300);
				$("#tab3").hide(300);
				$("#tab4").hide(300);
				$('.rfc').addClass('active');
				$('.ms').removeClass('active');
				$('.tm').removeClass('active');
				$('.mt').removeClass('active');
			}
		} else if(value == 7) {
			$("#tab1").hide(300);
			$("#tab2").hide(300);
			$("#tab3").show(500);
			$("#tab4").hide(300);
			$('.rfc').addClass('active');
			$('.ms').removeClass('active');
			$('.tm').removeClass('active');
			$('.mt').removeClass('active');
			$('#saveButton').attr("disabled", true);
		}
	}
	
	function showScreeningdiv(){
		
	}
	
	
	
	function setRiskLevel() {
		var response = $('#mainFrm').parsley().validate("kycSubjectReviewGroup");
	    //--console.log("Validation Response : " + response);
		if(response){
			showHideDivs("1");
			console.log("counterPartyName:::"+$("#typeOfCounterTypeParty").val());
			var isPepRisk 			=	"";
			var isSanctionRisk 		= 	"";
			var isActivitiesRisk 	= 	"";
			var high 				= 	"High";
			var medium 				= 	"Medium";
			var ele = document.getElementsByName('manualScreening.isPepRisk'); 
		    for(i = 0; i < ele.length; i++) { 
		        if(ele[i].checked) 
		        	isPepRisk = ele[i].value; 
		    }
		    
		    var ele2 = document.getElementsByName('manualScreening.isSanctionRisk'); 
		    for(i = 0; i < ele2.length; i++) { 
		        if(ele2[i].checked) 
		        	isSanctionRisk = ele2[i].value; 
		    }
		    
		    var ele3 = document.getElementsByName('manualScreening.isActivitiesRisk'); 
		    for(i = 0; i < ele3.length; i++) { 
		        if(ele3[i].checked) 
		        	isActivitiesRisk = ele3[i].value; 
		    }
		    if(isPepRisk == "true"){
		    	$('#tm_isPepRisk').text('Yes');
		    	$('#mt_isPepRisk').text('Yes');
		    }else{
		    	$('#tm_isPepRisk').text('No');
		    	$('#mt_isPepRisk').text('No');
		    }
			if(isSanctionRisk == "true"){
				$('#tm_isSanctionsRisk').text('Yes');
				$('#mt_isSanctionsRisk').text('Yes');
		    }else{
		    	$('#tm_isSanctionsRisk').text('No');
		    	$('#mt_isSanctionsRisk').text('No');
		    }
			if(isActivitiesRisk == "true"){
				$('#tm_isActivitiesRisk').text('Yes');
				$('#mt_isActivitiesRisk').text('Yes');
			}else{
				$('#tm_isActivitiesRisk').text('No');
				$('#mt_isActivitiesRisk').text('No');
			}
			$('#tm_PepRiskLevel').text("["+$("#pepRiskLevel").val()+"]");
			$('#tm_SanctionsRiskLevel').text("["+$("#sanctionsRiskLevel").val()+"]");
			$('#tm_ActivitiesRiskLevel').text("["+$("#activitiesRiskLevel").val()+"]");
			$('#tm_CountryRiskLevel').text("["+$("#countryRiskLevel").val()+"]");
			$('#tm_TotalRiskLevel').text("["+$("#totalRiskLevel").val()+"]");
			$('#mt_PepRiskLevel').text("["+$("#pepRiskLevel").val()+"]");
			$('#mt_SanctionsRiskLevel').text("["+$("#sanctionsRiskLevel").val()+"]");
			$('#mt_ActivitiesRiskLevel').text("["+$("#activitiesRiskLevel").val()+"]");
			$('#mt_CountryRiskLevel').text("["+$("#countryRiskLevel").val()+"]");
			$('#mt_TotalRiskLevel').text("["+$("#totalRiskLevel").val()+"]");
			
			/*if(high == $("#totalRiskLevel").val() || medium == $("#totalRiskLevel").val()){
				$(".metigation").show(500);
				$(".bt-submit").hide(500);
				$("#btn_continue").show(500);
				$("#mitigation\\.mitigationActivityList0\\.activityPerformed").attr('data-parsley-required', 'true');
				$("#mitigation\\.mitigationActivityList0\\.activityDescription").attr('data-parsley-required', 'true');
				//$("#file0_0").attr('data-parsley-required', 'true');
				$('#saveButton').attr("disabled", true);
			}else{*/
				$(".metigation").hide(300);
				$(".bt-submit").show(500);
				$("#btn_continue").hide(300);
				
				$("#mitigation\\.mitigationActivityList0\\.activityPerformed").attr('data-parsley-required', 'false');
				$("#mitigation\\.mitigationActivityList0\\.activityDescription").attr('data-parsley-required', 'false');
				$("#file0_0").attr('data-parsley-required', 'false');
				$('#saveButton').attr("disabled", false);
			//}
			
			console.log($("#typeOfCounterTypeParty").val());
			var templateDetails = {};
			templateDetails["typeOfCounterPartyCode"] = $("#typeOfCounterTypeParty").val();
			templateDetails["jurisdictionCode"] =$("#itgJurisdictionCodeId").val();
			templateDetails["riskCategory"] = $("#totalRiskLevel").val();
			templateDetails["subjectId"] = $("#subjectId").val();
			templateDetails["isExemptCategory"] = $("#isExemptCategory1").prop('checked');
			
			//--console.log("templateDetails:::"+templateDetails);
		    $.ajax({
				url : $("#commonContextPathId").val() +"/kyc/subject/getTemplateMappingDetail",
				type : 'POST',
				dataType : 'text',
				contentType: "application/json; charset=utf-8",
				data: JSON.stringify(templateDetails),
				success : function(result) {
					//--console.log(result);
					var obj = JSON.parse(result);
					var templateName = obj.templateName;
					var usedDocument =  JSON.parse(obj.usedDocument);
					var unUsedDocument = JSON.parse(obj.unUsedDocument);
					var usedDiv = "";
					var unUsedDiv = "";
					var usedDocumentCount = 0;
					var unUsedDocumentCount = 0;
					//--console.log("templateName:::"+templateName+"; usedDocument:::"+usedDocument+"; unUsedDocument:::"+unUsedDocument);
					//--console.log("usedDocument 1::::::::::::::::"+usedDocument);						
					if(usedDocument.length > 0){
						for (var i = 0; i < usedDocument.length; i++) {
							usedDiv = usedDiv+"<div class='col-md-4'>"
											+"<div class='portlet'>"
												+"<div class='portlet-title'>"
													+"<div class='caption'>"
														+"<i class=''></i>"+usedDocument[i].proofName
													+"</div>"
													+"<div class='tools'>"
														+"<a href='javascript:;' class='collapse' data-original-title='' title=''></a>"
													+"</div>"
												+"</div>"
												+"<div class='portlet-body'>"
													+"<div class='panel-group accordion' id='tab3_template"+i+"'>";
							var documentList =usedDocument[i].documentList;
							//--console.log("documentList:::"+documentList);
							for(var j = 0; j < documentList.length; j++){
								
								if(documentList[j].documentReceived == "1"){
									usedDocumentCount++;
										usedDiv = usedDiv +"<div class='panel panel-default'>"
														  		+"<div class='panel-heading'>"
																	+"<h4 class='panel-title'>"
																		+"<a class='accordion-toggle accordion-toggle-styled collapsed' data-toggle='collapse' data-parent='#accordion_"+j+"' href='#tab3_template1_collapse_"+i+"_"+j+"'>"+documentList[j].documentName
																			+"<span style='float:right'>[Received: YES]</span>"
																		+"</a>"
																	+"</h4>"
																+"</div>"
																+"<div id='tab3_template1_collapse_"+i+"_"+j+"' class='panel-collapse collapse' style='height: 0px;'>"
																	+"<div class='panel-body'>"
																		+"<div class='form-group'>";
																		var attributList = documentList[j].documentAttributeList;
																		console.log("attributList:::"+attributList);
																		for (var k = 0; k < attributList.length; k++) {
																			console.log("attributList[k].documentAttributeName:::"+attributList[k].documentAttributeName)
															 usedDiv =usedDiv +"<label class='control-label col-md-6 bold'>"+attributList[k].documentAttributeName+"</label>"
																			  +"<div class='col-md-6'>"
																			  		+"<p class='form-control-static'>"
																						+"<span>"+attributList[k].documentAttributeValue+"</span>"
																					+"</p>"
																			  +"</div>";
																		}
															usedDiv = usedDiv +"<label class='control-label col-md-6 bold'>Document:</label>"
																			  +"<div class='col-md-6'>"
																			  		+"<i class='fa fa-paperclip'></i>"
																					+"<button type='button' class='btn btn-link docName doc-name-align' onclick='getFile(\""+documentList[j].fileId+"\", \""+documentList[j].fileName+"\", \""+$('#contextPathId').val()+"\")'>"+documentList[j].fileName+"</button>"
																			  +"</div>"
																			  +"<label class='control-label col-md-6 bold'>Reference Number:</label>"
																			  +"<div class='col-md-6'>"
																					+"<p class='form-control-static doc-name-align'>"
																						+"<span>"+documentList[j].referenceNumber+"</span>"
																					+"</p>"
																			  +"</div>"
																			  +"<label class='control-label col-md-6 bold'>Comment:</label>"
																			  +"<div class='col-md-6'>"
																					+"<p class='form-control-static doc-name-align'>"
																						+"<span>"+documentList[j].comment+"</span>"
																					+"</p>"
																			  +"</div>"
																			+"</div>"
																		+"</div>"
																	+"</div>"
																+"</div>";
															}
												
							}
									usedDiv = usedDiv+"</div>"
												+"</div>"
											+"</div>"
										+"</div>";							
						}
						if(usedDocumentCount == 0){
							usedDiv = "";
						}
					}
					console.log("unUsedDocument length:::"+unUsedDocument.length);
					if(unUsedDocument.length > 0){
						for (var i = 0; i < unUsedDocument.length; i++) {
							unUsedDiv = unUsedDiv+"<div class='col-md-4'>"
											+"<div class='portlet'>"
												+"<div class='portlet-title'>"
													+"<div class='caption'>"
														+"<i class=''></i>"+unUsedDocument[i].proofName
													+"</div>"
													+"<div class='tools'>"
														+"<a href='javascript:;' class='collapse' data-original-title='' title=''></a>"
													+"</div>"
												+"</div>"
												+"<div class='portlet-body'>"
													+"<div class='panel-group accordion' id='tab3_template"+i+"'>";
							var documentList =unUsedDocument[i].documentList;
							console.log("documentList:::"+documentList);
							for(var j = 0; j < documentList.length; j++){
								
								if(documentList[j].documentReceived == "1"){
									unUsedDocumentCount++;
										unUsedDiv = unUsedDiv +"<div class='panel panel-default'>"
														  		+"<div class='panel-heading'>"
																	+"<h4 class='panel-title'>"
																		+"<a class='accordion-toggle accordion-toggle-styled collapsed' data-toggle='collapse' data-parent='#accordion_"+j+"' href='#tab3_template1_unused_collapse_"+i+"_"+j+"'>"+documentList[j].documentName
																			+"<span style='float:right'>[Received: YES]</span>"
																		+"</a>"
																	+"</h4>"
																+"</div>"
																+"<div id='tab3_template1_unused_collapse_"+i+"_"+j+"' class='panel-collapse collapse' style='height: 0px;'>"
																	+"<div class='panel-body'>"
																		+"<div class='form-group'>";
																		var attributList = documentList[j].documentAttributeList;
																		console.log("attributList:::"+attributList);
																		for (var k = 0; k < attributList.length; k++) {
																			console.log("attributList[k].documentAttributeName:::"+attributList[k].documentAttributeName)
															 unUsedDiv =unUsedDiv +"<label class='control-label col-md-6 bold'>"+attributList[k].documentAttributeName+"</label>"
																			  +"<div class='col-md-6'>"
																			  		+"<p class='form-control-static'>"
																						+"<span>"+attributList[k].documentAttributeValue+"</span>"
																					+"</p>"
																			  +"</div>";
																		}
																		unUsedDiv = unUsedDiv +"<label class='control-label col-md-6 bold'>Document:</label>"
																			  +"<div class='col-md-6'>"
																			  		+"<i class='fa fa-paperclip'></i>"
																			  		+"<button type='button' class='btn btn-link docName doc-name-align' onclick='getFile(\""+documentList[j].fileId+"\", \""+documentList[j].fileName+"\", \""+$('#contextPathId').val()+"\")'>"+documentList[j].fileName+"</button>"
																			  +"</div>"
																			  +"<label class='control-label col-md-6 bold'>Reference Number:</label>"
																			  +"<div class='col-md-6'>"
																					+"<p class='form-control-static doc-name-align'>"
																						+"<span>"+documentList[j].referenceNumber+"</span>"
																					+"</p>"
																			  +"</div>"
																			  +"<label class='control-label col-md-6 bold'>Comment:</label>"
																			  +"<div class='col-md-6'>"
																					+"<p class='form-control-static doc-name-align'>"
																						+"<span>"+documentList[j].comment+"</span>"
																					+"</p>"
																			  +"</div>"
																			+"</div>"
																		+"</div>"
																	+"</div>"
																+"</div>";
															}
							}
							unUsedDiv = unUsedDiv+"</div>"
												+"</div>"
											+"</div>"
										+"</div>";							
						}
						if(unUsedDocumentCount == 0){
							unUsedDiv = "";
						}
					}
					if(unUsedDiv == ""){
						$("#unusedDocumentList").show();

					}
					if(usedDiv == ""){
						$("#usedDocumentList").show();
					}
					$("#kycTemplateName").text("["+templateName+"]");
					$("#usedProofDiv").html(usedDiv);
					$("#unUsedProofDiv").html(unUsedDiv);
				},
				error : function(jqXml, textStatus, errorThrown) {
					//console.log('Error: ' + jqXml.responseText);
					console.log(jqXml);
					console.log(textStatus);
					console.log(errorThrown);
				}
			});
		}
	}
	
	$('#cancelBtn').click(function() {
		location.href = $('#contextPathId').val()+"/dashboard";
	});

	$('#saveButton').click(function() {
		var response = $('#mainFrm').parsley().validate("kycSubjectMitigationGroup");
	    //--console.log("Validation Response : " + response);
    	if(response){
    		//--$("#reviewerRemark").attr('data-parsley-required', 'true');
    		$('#remarkModalApproveId').modal('toggle');
    	}
	});
	
	
	function reviewerApproved(workflowId, state) {
		$('#workflowId').val(workflowId);
		$('#stateId').val(state);
		
		var submitMessage = "";
		if($("#finalResult").val() == "FAIL" && $("#totalRiskLevel").val() != "Low"){
			submitMessage = "KYC final result is " + $("#finalResult").val() + ". Are you sure you want to approve?";
		} else {
			submitMessage = "Are you sure you want to approve?";
		}
		
		bootbox.confirm({
            message: submitMessage,
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
	        	console.log("Form submitting.....");
	        	if(result){
	        		$('#mainFrm').parsley().destroy();
	        		$('#totalRiskLevel').prop('disabled', false);
	        		$('#mainFrm').submit();
	        		buffer();
	        	}
	        }
		});
	}
	
	function remarkSubmit(contextPath) {
		//--var response = $('#mainFrm').parsley().validate("kycSubjectRemarkGroup");
	    //--console.log("Validation Response : " + response);
    	//--if(response){
    		var submitMessage = "";
			if($("#finalResult").val() == "FAIL" && $("#totalRiskLevel").val() != "Low"){
				submitMessage = "KYC final result is " + $("#finalResult").val() + ". Are you sure you want to approve?";
			} else {
				submitMessage = "Are you sure you want to approve?";
			}
			
			bootbox.confirm({
	            message: submitMessage,
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
		        	console.log("Form submitting.....");
		        	if(result){
		        		$('#totalRiskLevel').prop('disabled', false);
		        		$('#mainFrm').submit();
		        		$('#remarkModalApproveId').modal('toggle');
		        		buffer();
		        	}
		        }
			});
    	//--}
	}
	
	$('#sendForScreening').click(function() {
		$("#screeningTypeId").val("Auto Screening");
		$('#mainFrm').parsley().destroy();
		bootbox.confirm({
            message: "Are you sure you want to send for screening?",
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
	        		$('#mainFrm').attr("method", "post");
	        		$('#mainFrm').attr("action", $("#commonContextPathId").val() + "/kyc/subject/sendForScreening");
	        		$('#mainFrm').submit();
	        		buffer();
	        	}
	        }
		});
		});