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
<spring:message code="typeOfCounterParty.label" var="typeOfCounterPartyLabel" />
<spring:message code="itgJurisdiction.label" var="itgJurisdictionLabel" />
<spring:message code="kycDataTemplate.legalEntityType.label" var="legalEntityTypeLabel" />

<spring:message code="app.kycMasterMenuName" var="kycMasterMenuName" />

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="counterPartyName" value="<%= ITGConstant.COUNTER_PARTY_NAME%>" />
<c:set var="jurisdictionName" value="<%= ITGConstant.JURISDICTION_NAME%>" />
<c:set var="legalEntityTypeName" value="<%= ITGConstant.LEGAL_ENTITY_TYPE_NAME%>" />
<c:set var="counterPartyShortCode" value="<%= ITGConstant.COUNTER_PARTY_SHORT_CODE%>" />
<c:set var="jurisdictionShortCode" value="<%= ITGConstant.JURISDICTION_SHORT_CODE%>" />
<c:set var="legalEntityTypeShortCode" value="<%= ITGConstant.LEGAL_ENTITY_SHORT_CODE%>" />

<c:set var="maxLength255" value="<%= ITGConstant.MAX_LENGTH_255%>" />

<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar search-page-bar">
			<ul class="page-breadcrumb pull-right">
				<li><a class="cancel redirect-dashboard"><i class="fa fa-home"></i> Home <i class="fa fa-angle-right"></i></a></li>
				<li> ${kycMasterMenuName} <i class="fa fa-angle-right"></i></li>
				<li><a class="cancel redirect-kyc/template/search"> KYC Data Template <i class="fa fa-angle-right"></i></a></li>
				<li>Add</li>
			</ul>
			<span class="header-scope">&nbsp;KYC Data Template</span>
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
		<form:form action="${contextPath}/kyc/dataTemplate/add" method="POST" id="frm" role="form"
			class="horizontal-form uk-form bt-flabels js-flabels"
			data-parsley-validate="true" modelAttribute="kycDataTemplateBO"
			data-parsley-errors-messages-disabled="true">
			
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
				<div class="col-md-3">
					<div class="bt-form__wrapper">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">${itgJurisdictionLabel}</label>
								<div class="field-background">
									<form:select id="itgJurisdictionCode" path="itgJurisdictionCode" class="form-control select2me" data-parsley-required="false" placeholder="${itgJurisdictionLabel}">
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
	               <input type="button" class="btn-itg btn btn-sm grey-gallery"  id="addFieldbutton" value="Add new field" />
	               <input type="button" class="btn-itg btn btn-sm grey-gallery" style="display:none;"  id="deleteFieldbutton" value="Delete selected field"/>
	            </div>
			</div>
			<!-- End Row -->
			<div class="row">
				<hr style="border: 1px solid #ddd;">
				<div id='content'>
			        <div class="col-lg-3 col-md-3 col-sm-3">
		            	<div id='jqxWidget1'>
		            		<label>Available Roles</label>
		            		<input type="checkbox" id="showHideRoles" />
							<div style="display:none;" id="listBoxA"></div>
						</div>	
					</div>
					<div style="margin-left:30px;" class="col-lg-1 col-md-1 col-sm-1">
						<input type='button' class="btnListBox" style="display:none;margin-top:150px;" id='btnRight' value ='  >  '/><br><br>
						<input type='button'class="btnListBox" style="display:none;" id='btnLeft' value ='  <  '/>
					</div>
			        <div class="col-lg-3 col-md-3 col-sm-3">
						<div id='jqxWidget2' style="display:none;">
							<label style="">Selected Roles</label>
							<form:hidden path="roleCode" />
							<form:hidden path="roleName" />
							<div style="" id="listBoxB"></div>
						</div>
			        </div>
			        <div class="col-md-3" style="width:11%;">
			        	<label>Legal Entity Type</label>
		            	<input type="checkbox" id="showHideEntityTypes" />
		            </div>
		            <div class="col-md-3" id="legalEntityTypeDropDown">
	                   <div class="bt-form__wrapper">
	                      <div class="form-group uk-width-1-1">
	                         <div class="bt-flabels__wrapper">
	                            <label class="parsley_hide">${legalEntityTypeLabel}</label>
	                            <form:select path="legalEntityTypeShortCodeList" class="form-control select2me select" multiple="multiple" placeholder="${legalEntityTypeLabel}">
	                               <c:if test="${legalEntityTypeData != null && legalEntityTypeData.length() > 0}">
	                                  <c:forEach begin="0" end="${legalEntityTypeData.length() -1}" var="index">
	                                     <form:option  value="${legalEntityTypeData.get(index).get(legalEntityTypeShortCode)}">${legalEntityTypeData.get(index).get(legalEntityTypeName)}</form:option>
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
			<div class="page-bar mandFldBar" style="display:none;">
                <ul class="page-breadcrumb">
                   <li><em><strong>Mandatory Fields</strong></em></li>
                </ul>
                <hr style="border-top: 1px dashed; margin-top: 40px;">
            </div>
			<div id="mandatoryFieldGrid"></div>
            <div id="viewFieldGrid"></div>
            
           	<div id="addFieldsJqxgridModalId" class="modal fade modal-xl" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" data-backdrop="static" data-keyboard="false" aria-hidden="true">
			    <div class="modal-dialog modal-lg" style="width: 90%;">
			        <div class="modal-content">
			            <div class="modal-header">
			            	<div class="">
								<span class="duplicateHeader">Select relevant data fields.</span>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>
			            </div>
			            <div class="modal-body">
		            	    <div class="row">
			               		<div class="col-md-12">
									<div class="row">
										<div class="col-md-12">
											<div id='jqxWidget'>
												<div id="addFieldsJqxgrid"></div>
											</div>
										</div>
									</div>
								</div>
			               </div>
			            </div>
			            <div class="modal-footer">
			                <button type="button" class="btn-itg btn btn-sm grey-gallery" id="saveFields"><img src="/digiKYC/assets/global/img/save.png" /> Save </button>
			                <button type="button" class="btn-popup btn btn-sm" data-dismiss="modal"><img src="/digiKYC/assets/global/img/clear.png" /> Close </button>
			            </div>
			        </div>
			    </div>
			</div>
           	<input type="hidden" id="fieldListString" name="fieldListString"/>
			
		</form:form>

		<div class="clearfix margin-bottom-10"></div>
		<div class="clearfix margin-bottom-10"></div>
		<div class="clearfix margin-bottom-10"></div>
	</div>
</div>
<script>
	var entityFlds = [];
	var individualFlds = [];
	var fieldsData = [];
	jQuery(document).ready(function() {
		jQuery("#master").addClass("active");
		jQuery("#subject").remove("active");
		jQuery("#dashboard").remove("active");
		
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
        $(".btnListBox").hide();
        $("#legalEntityTypeDropDown").hide();
        
        fieldsData = ${fieldMasterData};
        var individualFldsCodes = ${individualFldsCodes};
        $(individualFldsCodes).each(function(){
        	individualFlds.push(fieldsData.filter(each => each.FieldMaster_shortcode == this)[0]);
        });
        var entityFldsCodes = ${entityFldsCodes};
        $(entityFldsCodes).each(function(){
        	entityFlds.push(fieldsData.filter(each => each.FieldMaster_shortcode == this)[0]);
        });
	});

	$('#showHideRoles').on('change', function() { 
		if($('#showHideRoles').is(":checked")) {
			$('#listBoxA').show();
			$('#jqxWidget2').show();
			$(".btnListBox").show();
			var items = $("#listBoxB").jqxListBox('getItems');
			if(items.length == 0)
				$('#saveButton').attr("disabled", true);
		}
		else {
			$('#listBoxA').hide();
			$('#jqxWidget2').hide();
			$(".btnListBox").hide();
			checkTemplateExist();
		}
	});
	
	$('#showHideEntityTypes').on('change', function() { 
		if($('#showHideEntityTypes').is(":checked")) {
			$('#legalEntityTypeDropDown').show();
			if($('#legalEntityTypeShortCodeList').val() == null)
				$('#saveButton').attr("disabled", true);
		}
		else {
			$('#legalEntityTypeDropDown').hide();
			checkTemplateExist();
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
        	$('#saveButton').attr("disabled", true);
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
	        		_paq.push(['trackEvent', 'KYCDataTemplate', 'Cancel', 'Cancel saving template']);
	        		location.href = "${contextPath}/kyc/dataTemplate/search";
	        		buffer();
	        	}
	        }
		});
	});

	$('#saveButton').click( function() {
		console.log("Initiating Parsley Validation.....");
		$('#frm').parsley().validate();
		var response = $('#frm').parsley().isValid();
		console.log("Validation Response : " + response);

		if(response) {
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
		        		if($('#showHideRoles').is(":checked")) {
		        			var items = $("#listBoxB").jqxListBox('getItems');
			        		for(var i=0;i<items.length;i++){
			        			roleCode.push(items[i].value);
			        			roleName.push(items[i].label);
			        		}
		        		}
		        		$("#roleCode").val(roleCode);
			        	$("#roleName").val(roleName);
			        	
			        	if(!$('#showHideEntityTypes').is(":checked"))
			        		$('#legalEntityTypeShortCodeList').empty().trigger('change');
		        		
		        		var mandatoryDataList = getGridDataList(getGridData('mandatoryFieldGrid'));
		        		var selectedRows = $('#viewFieldGrid').jqxGrid('getrows');
		        		var addedDataList = [];
		        		if(selectedRows != undefined)
		        			addedDataList = getGridDataList(getGridData('viewFieldGrid'));
		        		
		        		var fieldList = mandatoryDataList.concat(addedDataList);
		        		if(fieldList.length>0)
		        			$("#fieldListString").val(JSON.stringify(fieldList));
		        		
		        		_paq.push(['trackEvent', 'KYCDataTemplate', 'Save', 'Saving Data template']);
		        		$('#frm').submit();
		    			buffer();
		        	}
		        }
			});
		}
	});
	
	$("#typeOfCounterParty, #itgJurisdictionCode, #templateName, #legalEntityTypeShortCodeList").on('change', function(){
        console.log(this.value);
        if(this.value != "" || $("#templateName").val() != "") {
        	if(this.id == 'legalEntityTypeShortCodeList' && this.value == "")
        		$('#saveButton').attr("disabled", true);
	        else
	        	checkTemplateExist();
        } 
    });
    
	$('#listBoxA').on('change', function(event) {
		var item = $("#listBoxB").jqxListBox('getItems');
		if(item != null && item.length == 0)
			$('#saveButton').attr("disabled", true);
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
		var itgJurisdictionCode = $("#itgJurisdictionCode").val();
		var legalEntityTypeShortCodeList = $('#legalEntityTypeShortCodeList').val() != null ? $('#legalEntityTypeShortCodeList').val() : [];
		var roleCode = [];
		var roleName = [];
		
		var data1 = [];
		previousRoles = [];
		
		var items = $("#listBoxB").jqxListBox('getItems');
		for(var i=0;i<items.length;i++){
			roleCode.push(items[i].value);
			roleName.push(items[i].label);
			data1.push({"code":items[i].value,"name":items[i].label});
			previousRoles.push(items[i].value);
		}
		
		if(typeOfCounterPartyCode != "" && itgJurisdictionCode != ""){
			var templateObject = {};
			templateObject["templateName"] = templateName;
		    templateObject["typeOfCounterPartyCode"] = typeOfCounterPartyCode;
		    templateObject["itgJurisdictionCode"] = itgJurisdictionCode;
		    if($('#showHideRoles').is(":checked") && roleCode.length > 0)
		    	templateObject["roleCode"] = roleCode;
		    if($('#showHideEntityTypes').is(":checked") && legalEntityTypeShortCodeList.length > 0)	
		    	templateObject["legalEntityTypeShortCodeList"] = legalEntityTypeShortCodeList;

		    ajaxCallBack("POST", $("#commonContextPathId").val() + "/kyc/dataTemplate/checkDuplicate", templateObject,"json", function(response) {
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
					'KYC Data template is already exist with given combinations !<button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button></div>';
					$("#divCheckKYCTemplate").html(checkDiv);
				}else if($('#showHideRoles').is(":checked") || $('#showHideEntityTypes').is(":checked")) {
				
					var items = $("#listBoxB").jqxListBox('getItems');
					if(($('#showHideRoles').is(":checked") && items.length == 0) || ($('#showHideEntityTypes').is(":checked") && $('#legalEntityTypeShortCodeList').val() == null))
						$('#saveButton').attr("disabled", true);
					else
						$('#saveButton').attr("disabled", false);
	        	} else{
					$('#saveButton').attr("disabled", false);
				}
			});
		}
	};
	
	$("#itgJurisdictionCode").change(function () {
		$('#legalEntityTypeShortCodeList').find('option').remove().end().append('<option value=""></option>');
		var legalEntityTypeData = ${legalEntityTypeData};
		var itgJurisdictionCode = $(this).val();
		
		if(itgJurisdictionCode != ""){
			$('#legalEntityTypeShortCodeList').empty().trigger('change');
	        $(legalEntityTypeData).each(function(){
	        	if(itgJurisdictionCode == this.ServicingJurisdictionCode) {
	        		var option = $('<option />');
					 option.attr('value', this.LegalEntityType_shortcode).text(this.EntityType);
					 $('#legalEntityTypeShortCodeList').append(option);
	        	}
			});
	    } else {
	        $(legalEntityTypeData).each(function(){
				 var option = $('<option />');
				 option.attr('value', this.LegalEntityType_shortcode).text(this.EntityType);
				 $('#legalEntityTypeShortCodeList').append(option);
			});
	    }
	});
	var selectedFldsIndex = [];
	var selectedFlds = [];
	var selectedFldsCodes = [];
	$('#saveFields').click( function() {
		selectedFldsIndex = $("#addFieldsJqxgrid").jqxGrid('selectedrowindexes');
		
		if(selectedFldsIndex.length > 0) {
			selectedFlds = [];
			selectedFldsCodes = [];
			var mandRows = $('#viewFieldGrid').jqxGrid('getrows');
		
			for (var m = 0; m < selectedFldsIndex.length; m++) {
				var eachrow = $("#addFieldsJqxgrid").jqxGrid('getrowdata', selectedFldsIndex[m]);
				selectedFlds[m] = eachrow;
				selectedFldsCodes[m] = eachrow.FieldMaster_shortcode;
			}
			createViewFieldsJqxGrid(selectedFlds, 'viewFieldGrid');
			$("#deleteFieldbutton").show();
			$('#addFieldsJqxgridModalId').modal('toggle');
		}
		else {
			selectedFlds = [];
			selectedFldsCodes = [];
			$("#viewFieldGrid").jqxGrid('clear');
			$('#viewFieldGrid').hide();
			$('#addFieldsJqxgridModalId').modal('toggle');
			$("#deleteFieldbutton").hide();
		}
	});
	
	
	$('#addFieldbutton').click( function() {
		createFieldsJqxGrid(fieldsData);
	});
	
	
	$("#typeOfCounterParty").change(function () {
		var typeOfCounterParty = $(this).val();
		if(typeOfCounterParty != '') {
			$(".mandFldBar").show();
			if(typeOfCounterParty == 'Individual')
				createViewFieldsJqxGrid(individualFlds, 'mandatoryFieldGrid');
			else
				createViewFieldsJqxGrid(entityFlds, 'mandatoryFieldGrid');
		}
		else {
			selectedFldsIndex = [];
			selectedFlds = [];
			selectedFldsCodes = [];
			$("#viewFieldGrid").jqxGrid('clear');
        	$("#viewFieldGrid").hide();
        	$("#mandatoryFieldGrid").jqxGrid('clear');
        	$("#mandatoryFieldGrid").hide();
        	$(".mandFldBar").hide();
        	$("#deleteFieldbutton").hide();
		}
	});
	var createFieldsJqxGrid = function(fieldsData) {
		jQuery("#addFieldsJqxgrid").jqxGrid("refresh");
		
		var source = {
			datatype : "json",
			localdata : fieldsData,
			datafields : [ 
			               {name : 'FieldMaster_shortcode',type : 'String'},
			               {name : 'Name',type : 'string'},
			               {name : 'DisplayName',type : 'string'},
			               {name : 'Description',type : 'string'}
			             ],
		};
		var dataAdapter = new $.jqx.dataAdapter(source);

		// Create jqxGrid
		$("#addFieldsJqxgrid").jqxGrid({
			width: '100%',
			source: dataAdapter,
			autoloadstate: false,
			autosavestate: false,
			groupable: false,
			groupsexpandedbydefault: false,
			sortable: true,
			pageable: true,
			theme: 'ITGtheme',
			height: 540,
			showfilterrow: true,
			filterable: true,
			enabletooltips: true,
	        columnsresize: true,
	        columnsreorder: true,
			rowsheight: 50,
			pageSize:fieldsData.length,
			selectionmode: 'checkbox',
			columns : [
						{ text: 'Short Code', datafield: 'FieldMaster_shortcode', filtertype: 'input', width: '10%', align: 'center'},
						{ text: 'Field Name', datafield: 'Name', filtertype: 'input', width: '29%', align: 'center'},
						{ text: 'DisplayName', datafield: 'DisplayName', filtertype: 'input', width: '29%', align: 'center'},
						{ text: 'Description', datafield: 'Description', filtertype: 'input', width: '29%', align: 'center'}
			]
		});
		
		$('#addFieldsJqxgrid').show();
		$('#addFieldsJqxgridModalId').modal('toggle');
		
		try{
			$("#addFieldsJqxgrid").jqxGrid('clearselection');
			if(selectedFldsCodes.length > 0) {
				var rows = $('#addFieldsJqxgrid').jqxGrid('getrows');
	            var rowsCount = rows.length;
	            for (var i = 0; i < rowsCount; i++) {
	                var value = $('#addFieldsJqxgrid').jqxGrid('getcellvalue', i, "FieldMaster_shortcode");
	                if (selectedFldsCodes.includes(value)) {
	                    $('#addFieldsJqxgrid').jqxGrid('selectrow', i);
	                };
	            };
			}
		}catch(err){
			console.log(err.message);
		}
	}
	
	// delete row.
    $("#deleteFieldbutton").on('click', function () {
    	var selectedrowindex = $("#viewFieldGrid").jqxGrid('getselectedrowindex');
    	
    	if(selectedrowindex == -1){
   			bootbox.alert("Please select atleast one Additional Field to delete!", function(){});
			return false;
   		}
    	else {
    		var rowscount = $("#viewFieldGrid").jqxGrid('getdatainformation').rowscount;
	        if (selectedrowindex >= 0 && selectedrowindex < rowscount) {
	        	var row = $("#viewFieldGrid").jqxGrid('getrowdata', selectedrowindex);
	            selectedFldsCodes = selectedFldsCodes.filter(function(item) { return item !== row.FieldMaster_shortcode });
	            selectedFlds = selectedFlds.filter(function(item) { return item.FieldMaster_shortcode !== row.FieldMaster_shortcode });
	        	
	        	var id = $("#viewFieldGrid").jqxGrid('getrowid', selectedrowindex);
	            $("#viewFieldGrid").jqxGrid('deleterow', id);
	            _paq.push(['trackEvent', 'KYCDataTemplate', 'DeleteField','Deleting field from KYC Data template.']);
	        }
	        var totalRows = $('#viewFieldGrid').jqxGrid('getrows');
	        if(totalRows.length == 0) {
	        	$("#deleteFieldbutton").hide();
	        	$("#viewFieldGrid").hide();
	        	selectedFldsIndex = [];
	        }
    	}
	});
	
	var createViewFieldsJqxGrid = function(fieldsData, divId) {
	
		var divIdGrid = '#'+divId;
		jQuery(divIdGrid).jqxGrid("refresh");
		$(divIdGrid).show();
		
		var customColumns = [
						{ text: 'Short Code', datafield: 'FieldMaster_shortcode', filtertype: 'input', width: '10%', align: 'left'},
						{ text: 'Field Name', datafield: 'Name', filtertype: 'input', width: '29%', align: 'left'},
						{ text: 'DisplayName', datafield: 'DisplayName', filtertype: 'input', width: '29%', align: 'left'},
						{ text: 'Description', datafield: 'Description', filtertype: 'input', width: '29%', align: 'left'}
		];
		if(divId === 'viewFieldGrid') {
			customColumns =	[
							{ text: 'Additional Fields', datafield: 'FieldMaster_shortcode', filtertype: 'input', width: '10%', align: 'left'},
							{ text: '', datafield: 'Name', filtertype: 'input', width: '29%', align: 'left'},
							{ text: '', datafield: 'DisplayName', filtertype: 'input', width: '29%', align: 'left'},
							{ text: '', datafield: 'Description', filtertype: 'input', width: '29%', align: 'left'}
			];
		}
		
		var source = {
			datatype : "json",
			localdata : fieldsData,
			datafields : [ 
			               {name : 'FieldMaster_shortcode',type : 'String'},
			               {name : 'Name',type : 'string'},
			               {name : 'DisplayName',type : 'string'},
			               {name : 'Description',type : 'string'}
			             ],
		};
		var dataAdapter = new $.jqx.dataAdapter(source);

		// Create jqxGrid
		$(divIdGrid).jqxGrid({
			autoheight: true,
			width: '100%',
			source: dataAdapter,
			columnsresize : true,
			theme: 'ITGtheme',
			enabletooltips: true,
	        columnsreorder: true,
	        rowsheight: 50,
			columns : customColumns
		});
	}
	
	var getGridDataList = function(gridData){
		var dataList = [];
		for(var i=0;i<gridData.length;i++){
			var gridObject = gridData[i];
			var dataObject = {"fieldMaster_shortcode":"","name":"","displayName":"","description":""};
			if(getObjectValue("FieldMaster_shortcode",gridObject) != null)
				dataObject.fieldMaster_shortcode = getObjectValue("FieldMaster_shortcode",gridObject);
			if(getObjectValue("Name",gridObject) != null)
				dataObject.name = getObjectValue("Name",gridObject);
			if(getObjectValue("DisplayName",gridObject) != null)
				dataObject.displayName = getObjectValue("DisplayName",gridObject);
			if(getObjectValue("Description",gridObject) != null)
				dataObject.description = getObjectValue("Description",gridObject);
			
			dataList.push(dataObject);
		}
		return dataList;
	}
</script>