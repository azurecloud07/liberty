var layout = "horizontal";//horizontal//vertical
var parentSchema = {};
var formView = function(editor,schema){
	parentSchema = schema;
	//--console.log("schema:::",schema);
	var formFormat = 'Single';
    if (schema.hasOwnProperty('formFormat') && schema.formFormat === 'Tabs')
        formFormat = schema.formFormat;

    if (formFormat === 'Tabs') {
        var tabHeaders = createFormTabs(schema,layout);
        editor.appendChild(tabHeaders);
 	
        var formContent = createFormContent(schema,layout,formFormat);
        editor.appendChild(formContent);
    }else{
    	var formContent = createFormContent(schema,layout,formFormat);
        editor.appendChild(formContent);
    }
    addJQXGrid(schema);
    /*$("input:radio").each(function () {
		$("[name='"+this.name+"']:first").not("[name=radioClone]").attr('checked', true);
	});*/
    pcframework.initUniform();
    ComponentsPickers.init();
    //$.uniform.restore("input:checkbox");
    
    $(".datePicker" ).datepicker({
		   changeMonth: true,
   	   changeYear: true,
   	   yearRange: '1800:+100'
    });
}

var updateSectionOrder = function(schema){
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

var updateFieldsOrder = function(properties){
	var fieldArray = [];
	$.each(properties, function(fieldKey, fieldDetails) {
		fieldDetails.fieldKey = fieldKey;
		fieldArray.push(fieldDetails);
    });
    
	fieldArray.sort(function(a, b) {
    	if(a.hasOwnProperty('propertyOrder'))
    		return a.propertyOrder - b.propertyOrder;
    });
	return fieldArray;
}

var gridArray = new Array();
var addJQXGrid = function(schema){
	var propertyArray = updateSectionOrder(schema);
	$.each(propertyArray, function(index, val) {
    	var key = val.sectionKey;
    	if(val.type == "array"){
    		properties = val.items.properties;
    		var fieldArray = updateFieldsOrder(properties);
    		var gridId = "grid_" + key;
    		var dataArray = new Array();
    		var jqxGrid = createJQXGrid(fieldArray,dataArray,gridId);
    		gridArray.push({"gridId":gridId,"fieldArray":fieldArray,"dataArray":[]})
    	}
	});	
}

var createFormContent = function(schema,layout,formFormat) {
	var propertyArray = updateSectionOrder(schema);
    var counter = 1;
    var columnIncremenalValue = 12;
    if(layout=="horizontal")
    	columnIncremenalValue = 3;
    
    var pageContent = document.createElement('div');
    var tabContent = document.createElement('div');
    tabContent.className = "tab-content";
    var required = [];
	var properties = {};
	
    $.each(propertyArray, function(index, val) {
        
    	var key = val.sectionKey;
    	if(val.type == "array"){
    		required = val.items.required;
    		properties = val.items.properties;
    	}else{
    		required = val.required;
    		properties = val.properties;
    	}
    	var isMultiRow = false;
    	var layout_new = layout;
    	var incremenalValue = columnIncremenalValue;
    	if(val.type=="array"){
    		isMultiRow = true;
    		layout_new = "vertical";
    		incremenalValue = 12;
    	}
    	
    	var fieldArray = updateFieldsOrder(properties);
    	var formBody = document.createElement('div');
    	var rowElement = createRow();
    	var col_size = 0;
    	$.each(fieldArray, function(index, fieldDetails) {
        	if(col_size >= 12){
        		formBody.appendChild(rowElement);
        		var div = document.createElement('div');
                div.classList.add('clearfix');
                div.classList.add('margin-bottom-10');
                formBody.appendChild(div);
                
        		col_size = 0;
        		rowElement = createRow();
        	}
        	if (fieldDetails.hasOwnProperty('format') && fieldDetails.format === 'file') {
				col_size = col_size + 6;
				fieldDetails.grid_columns = 6;
			}else{
				col_size = col_size + incremenalValue;
				fieldDetails.grid_columns = incremenalValue;
			}
        	
        	var isMandatory = false;
        	var arrayCount = $.inArray(fieldDetails.fieldKey, required)
        	if(arrayCount>=0)
        		isMandatory = true;
        	
        	//var updatedKey = key + "." + fieldDetails.fieldKey;
        	var updatedKey = fieldDetails.fieldKey;
        	getFormElement(updatedKey,fieldDetails,isMandatory,layout_new,rowElement,isMultiRow,true);
        });
        if (col_size <= 12 || col_size==18){
        	formBody.appendChild(rowElement);
        }
        
        var singlePage = document.createElement('div');
        var tabPane = document.createElement('div');
        tabPane.className = "tab-pane fade in";
        if (counter === 1)
        	tabPane.classList.add("active");
        tabPane.setAttribute("id", "tab_" + counter);
        
        if(val.type == "array"){
        	
        	var addmore = document.createElement('button');
        	addmore.className = "btn btn-sm grey-gallery pull-right btn_add_more";
        	addmore.setAttribute('id', "btn_add_"+key);
        	addmore.setAttribute('value', "btn_add_"+key);
        	
        	var em = document.createElement('em');
        	em.className = "fa fa-plus";
        	addmore.appendChild(em);
        	addmore.appendChild(document.createTextNode(" Add More"));
        	addmore.setAttribute("style", "margin-bottom:15px;");
        	
        	rowElement = createRow();
        	rowElement.appendChild(addmore);
        	
        	if(formFormat=="Single")
        		singlePage.appendChild(rowElement);
        	else
        		tabPane.appendChild(rowElement);
        	
        	var gridId = "grid_" + key;
        	var jqxGridDiv = document.createElement('div');
        	jqxGridDiv.setAttribute('id', gridId);
        	
        	rowElement = createRow();
        	rowElement.appendChild(jqxGridDiv);
        
        	var multiRowSectionDiv = document.createElement('div');
        	multiRowSectionDiv.setAttribute('id', "div_" + key);
        	multiRowSectionDiv.setAttribute("style", "display:none;");
        	var multiRowDivLength = $('#multiRowDiv').length;
        	if(multiRowDivLength>0)
        		$("#multiRowDiv").append(multiRowSectionDiv);
        	
        	if(formFormat=="Single")
        		singlePage.appendChild(rowElement);
        	else
        		tabPane.appendChild(rowElement);
        	
        	var modalBox = createModal(formBody,key,val.title);
        	
        	$("#frm").append(modalBox);
        }else{
        	if(formFormat=="Single"){
        		
        		var nameDiv = document.createElement('h3');
        		nameDiv.className = "doc-name-align";
        		nameDiv.appendChild(document.createTextNode(val.title));
        		var hrElement = document.createElement('hr');
                hrElement.setAttribute("style", "border: 1px solid #ddd;");
                
                singlePage.appendChild(nameDiv);
                singlePage.appendChild(hrElement);
            	singlePage.appendChild(formBody);
        	}
        	else
        		tabPane.appendChild(formBody);
        }
        if(formFormat=="Single")
        	pageContent.appendChild(singlePage);
    	else
    		tabContent.appendChild(tabPane);
        counter++;
    });
    
    if(formFormat=="Single")
    	return pageContent;
	else
		return tabContent;
};

var createModal = function(formBody,id,header){
	var modalId = "modal_" + id;
	var length = $('#'+modalId).length;
	if(length>0)
		$("#"+modalId).remove();
	
	var modalBody = document.createElement('div');
	modalBody.className = "modal-body";
	modalBody.setAttribute("style", "height:400px;overflow-y: auto;overflow-x: hidden;");
	modalBody.appendChild(formBody);
	
	var btnClose = document.createElement('button');
	btnClose.className = "close close_modal";
	btnClose.setAttribute("data-dismiss", "modal");
	btnClose.setAttribute("type", "button");
	btnClose.setAttribute("id", "btn_close_"+id);
	btnClose.setAttribute("aria-hidden", "true");
	var h4 = document.createElement('h4');
	h4.className = "modal-title";
	h4.appendChild(document.createTextNode(header));
	var modalHeader = document.createElement('div');
	modalHeader.className = "modal-header";
	modalHeader.appendChild(btnClose);
	modalHeader.appendChild(h4);
	
	var btnAdd = document.createElement('button');
	btnAdd.className = "btn grey-gallery btn-save";
	btnAdd.setAttribute("id", "btn_save_"+id);
	btnAdd.setAttribute("type", "button");
	var em = document.createElement('em');
	em.className = "fa fa-check-circle";
	btnAdd.appendChild(em);
	btnAdd.appendChild(document.createTextNode(" Save"));
	
	var btnClose = document.createElement('button');
	btnClose.className = "btn default close_modal";
	btnClose.setAttribute("type", "button");
	btnClose.setAttribute("id", "btn_close_"+id);
	var em = document.createElement('em');
	em.className = "fa fa-times-circle";
	btnClose.appendChild(em);
	btnClose.appendChild(document.createTextNode(" Close"));
	
	var modalFooter = document.createElement('div');
	modalFooter.className = "modal-footer";
	modalFooter.appendChild(btnAdd);
	modalFooter.appendChild(btnClose);
	
	var modalContent = document.createElement('div');
	modalContent.className = "modal-content";
	modalContent.appendChild(modalHeader);
	modalContent.appendChild(modalBody);
	modalContent.appendChild(modalFooter);
	
	var modal = document.createElement('div');
	modal.className = "modal-dialog modal-lg";
	modal.appendChild(modalContent);
	
	var modalDiv = document.createElement('div');
	modalDiv.className = "modal fade bs-modal-lg in modalArray";
	modalDiv.setAttribute("role", "dialog");
	modalDiv.setAttribute("aria-hidden", "false");
	modalDiv.setAttribute("style", "display:none;z-index: 1000;position: absolute;");
	modalDiv.setAttribute("data-backdrop", "false");
	modalDiv.setAttribute("id", modalId);
	
	modalDiv.appendChild(modal);
	return modalDiv;
}

var createJQXGrid = function(fieldArray,data,gridId){
	jQuery("#"+gridId).jqxGrid("refresh");
	var datafields = new Array();
	var columns = new Array();
	$.each(fieldArray, function(index, fieldDetails) {
		datafields.push({ name: fieldDetails.fieldKey, type: "string"});
		columns.push({ text: fieldDetails.title, datafield: fieldDetails.fieldKey,width: 150});
    });
	datafields.push({ name: "action", type: "string"});
	columns.push({text: "Action", datafield: "action",width: 100,pinned:true});
	
	var dataSource = {
		datatype: "json",
		localdata: data,
		datafields: datafields,
	};
	
	var dataAdapter = new $.jqx.dataAdapter(dataSource);
	
	$("#"+gridId).jqxGrid({
		width: '100%',
		source: dataAdapter,
		autoloadstate: false,
		autosavestate: false,
		pageable: true,
        autoheight: true,
        sortable: true,
        altrows: true,
		theme: 'ITGtheme',
		height: 200,
		enabletooltips: true,
        columnsresize: true,
        columnsreorder: true,
        columns: columns,
		pageSize:data.length,
		//selectionmode: 'multiplecellsextended',
		//showfilterrow: true,
		//filterable: true,
		pageSizeOptions:["5","10","20",data.length]
	});
}

var updateRowId = 0;
var updateGridRow = function(gridId,uid){
	updateRowId = uid;
	var modalId = "modal_" + gridId.split("_")[1];
	clearFormField(modalId);
	$.uniform.restore("input:checkbox");
	$.each(gridArray, function(index, val) {
		if(val.gridId == gridId){
			var fieldArray = val.fieldArray;
			var dataArray = val.dataArray;
			$.each(dataArray, function(i, data) {
				if(data.uid == updateRowId){
					$.each(data, function(fieldKey, fieldValue) {
						var updatedKey = gridId.split("_")[1]+"."+fieldKey;
						var element = document.getElementsByName(updatedKey);
						if(element.length>0){
							if(element[0].type != "file" && element[0].type != "radio" && element[0].type != "checkbox"){
								$("[name='"+updatedKey+"']").val(fieldValue);
							}
							if(element[0].type == "select-one"){
								if(fieldValue!=null&&fieldValue!=""&&fieldValue!=undefined){
									$('select[name="'+updatedKey+'"]').find('option:contains("'+fieldValue+'")').attr("selected",true);
									$('[name="'+updatedKey+'"]').trigger('change');
								}
							}
							if(element[0].type == "select-multiple"){
								if(fieldValue!=null&&fieldValue!=""&&fieldValue!=undefined){
									$.each(fieldValue, function(index, value) {
										$('select[name="'+updatedKey+'"]').find('option:contains("'+value+'")').prop("selected",true);
									});
									$('[name="'+updatedKey+'"]').trigger('change');
								}
							}
							if(element[0].type == "radio"){
								$.uniform.restore("input:radio");
								$("input[name='"+updatedKey+"'][value='"+fieldValue+"']").prop('checked', true);
							}
							if(element[0].type == "checkbox" && fieldValue == "1"){
								$("[name='"+updatedKey+"']").val(1);
								$('[name="'+updatedKey+'"]').attr('checked',true);
							}
							if((fieldKey==sameTargetContactCode && fieldValue=="1") || !isSameTargetContact || getGridRowCount(gridId)==1){
								$('[name="'+gridId.split("_")[1]+"."+sameTargetContactCode+'"]').attr('disabled',false);
								for(var i=0;i<sameTargetFields.length;i++){
									var fieldName = gridId.split("_")[1] + "." + sameTargetFields[i];
									$("[name='"+fieldName+"']").attr("readonly",false);
								}
							}else if(fieldKey==sameTargetContactCode){
								$('[name="'+gridId.split("_")[1]+"."+sameTargetContactCode+'"]').attr('disabled',true);
								for(var i=0;i<sameTargetFields.length;i++){
									var fieldName = gridId.split("_")[1] + "." + sameTargetFields[i];
									$("[name='"+fieldName+"']").attr("readonly",true);
								}
							}
						}
						if(element.length>1){
							if(element[0].type == "file" && fieldValue != ""){
								$("#"+element[1].id).val(fieldValue);
								$(".remove-file-"+fieldKey).removeClass("hidden");
							}
						}
						
						var element = document.getElementById(modalId);
						element.style.display="block";
					});
				}
			});
		}
    });
	pcframework.initUniform();
	ComponentsPickers.init();
}

var deleteGridRow = function(gridId,uid){
	$.each(gridArray, function(index, val) {
		if(val.gridId == gridId){
			var fieldArray = val.fieldArray;
			var dataArray = val.dataArray;
			var newDataArray = new Array();
			var flag = false;
			$.each(dataArray, function(i, data) {
				if(data.uid != uid)
					newDataArray.push(data);
			});
			var jqxGrid = createJQXGrid(fieldArray,addActionColumn(newDataArray,gridId),gridId);
			val.dataArray = newDataArray;
			
			$.each(newDataArray, function(i, data) {
				if(data.hasOwnProperty(sameTargetContactCode) && data[sameTargetContactCode] == "1")
					flag = true;
			});
			
			var length = getGridRowCount(gridId);
			if(!flag || length <= 1)
				isSameTargetContact = false;
			
			if($('#'+uid).length>0)
				$('#'+uid).remove();
			
			arrangemultiRowElement(gridId.split("_")[1]);
		}
    });
}

var getGridRowCount = function(gridId){
	var length = 0;
	$.each(gridArray, function(index, val) {
		if(val.gridId == gridId){
			length = val.dataArray.length;
		}
    });
	return length;
}

$(document).on('click','.btn-save',function(){
	$('#frm').parsley().destroy();
	initParsely(jQuery);
	var response = $('#frm').parsley().validate("arrayForm");
	if(response){
		var modalId = "modal_" + this.id.split("_")[2];
		var gridId = "grid_" + this.id.split("_")[2];
		var sectionId = this.id.split("_")[2];
		
		var fieldArray = [];
		var dataArray = [];
		$.each(gridArray, function(index, val) {
			if(val.gridId == gridId){
				fieldArray = val.fieldArray;
				dataArray = val.dataArray;
			}
	    });
		var data = getFieldData(modalId);
		data = unflatten(data);
		var uid = 0;
		$.each(data, function(index, formObject) {
			if(updateRowId==0)
				uid = Math.random().toString().split(".")[1];
			else
				uid = updateRowId;
			
			var action = "<a href=\"javascript:updateGridRow('"+gridId+"','"+uid+"');\" class=\"btn btn-xs default tooltips\" data-toggle=\"tooltip\" title=\"Update\"><em class=\"fa fa-pencil\"></em></a>&nbsp;<a href=\"javascript:deleteGridRow('"+gridId+"','"+uid+"');\" class=\"btn btn-xs default tooltips\" data-toggle=\"tooltip\" title=\"Update\"><em class=\"fa fa-trash-o\"></em></a>";
			formObject.uid = uid
			formObject.action = action;
			
			if(updateRowId==0){
				dataArray.push(formObject);
				//var jqxGrid = createJQXGrid(fieldArray,dataArray,gridId);
			}
			else{
				var newDataArray = new Array();
				$.each(dataArray, function(i, dataObject) {
					if(dataObject.uid != uid){
						newDataArray.push(dataObject);
					}
				});
				newDataArray.push(formObject);
				//var jqxGrid = createJQXGrid(fieldArray,newDataArray,gridId);
				dataArray = newDataArray;
			}
			
			var jqxGrid = createJQXGrid(fieldArray,addActionColumn(dataArray,gridId),gridId);
			
			$.each(gridArray, function(index, val) {
				if(val.gridId == gridId){
					val.dataArray = dataArray;
				}
		    });
			var dataArr = updateTargetContactDetails(fieldArray,addActionColumn(dataArray,gridId),data[sectionId],gridId);
			if(!jQuery.isEmptyObject(dataArr)){
				$.each(gridArray, function(index, val) {
					if(val.gridId == gridId){
						val.dataArray = dataArr;
					}
			    });
			}
			//console.log("final data to be save : " + JSON.stringify(dataArray));
	    });
		var element = document.getElementById(modalId);
		element.style.display="none";
		cloneMultiRowDiv(sectionId,uid);
		updateRowId = 0;
		clearFormField(modalId);
	}
	$('.nav li a').removeClass("tab_error");
});

var cloneMultiRowDiv = function(sectionId,rowId){
	if($('#'+rowId).length>0)
		$('#'+rowId).remove();
	
	var clone = $("#modal_"+sectionId).find(".modal-body").clone();
	clone.attr('id',rowId);
	
	var $orginal = $("#modal_"+sectionId);
	var $originalSelects = $orginal.find('select');
	clone.find('select').each(function(index, item) {
	     $(item).val( $originalSelects.eq(index).val() );
	});
	var $originalTextareas = $orginal.find('textarea');
	clone.find('textarea').each(function(index, item) {
		$(item).val($originalTextareas.eq(index).val());
	});
	
	$("#div_"+ sectionId).append(clone);
	arrangemultiRowElement(sectionId);
};

var arrangemultiRowElement = function(sectionId){
	var counter = 0;
	$("#div_"+sectionId).find(".modal-body").each(function(){
		$(this).find('.extra-fields-div').each(function(){
			$(this).removeAttr('id');
			$(this).removeClass("extra-fields-div");
		});
		$(this).find('input, select, textarea, multiple').each(function(){
			var name = $(this).attr('name');
			if(name!=undefined){
				var fieldCode = name.split(".")[1];
				var fieldName = sectionId + "["+counter+"]."+fieldCode;
				$(this).prop('name', fieldName);
				var newId = Math.random().toString().split(".")[1];
				$(this).prop('id', newId);
				$(this).removeAttr("data-parsley-required");
				$(this).removeAttr("data-parsley-group");
			}
		});
		$(this).find('button').each(function(){
			$(this).remove();
		});
		counter++;
	});
}

var updateTargetContactDetails = function(fieldArray,dataArray,formObject,gridId){
	var newDataArray = new Array();
	
	$.each(dataArray, function(i, dataObject) {
		if(dataObject.hasOwnProperty(sameTargetContactCode) && isSameTargetContact){
			for(var i=0;i<sameTargetFields.length;i++){
				var contactFieldName = sameTargetFields[i];
				if(dataObject.hasOwnProperty(contactFieldName)){
					var contactFieldValue = formObject[contactFieldName];
					dataObject[contactFieldName] = contactFieldValue;
					sameTargetContactObject[contactFieldName] = contactFieldValue;
				}
			}
		}
		newDataArray.push(dataObject);
	});
	if(!jQuery.isEmptyObject(newDataArray))
		var jqxGrid = createJQXGrid(fieldArray,newDataArray,gridId);
	return newDataArray;
}

var addActionColumn = function(dataArray,gridId){
	$.each(dataArray, function(i, dataObject) {
		var action = "<a href=\"javascript:updateGridRow('"+gridId+"','"+dataObject.uid+"');\" class=\"btn btn-xs default tooltips\" data-toggle=\"tooltip\" title=\"Update\"><em class=\"fa fa-pencil\"></em></a>&nbsp;<a href=\"javascript:deleteGridRow('"+gridId+"','"+dataObject.uid+"');\" class=\"btn btn-xs default tooltips\" data-toggle=\"tooltip\" title=\"Update\"><em class=\"fa fa-trash-o\"></em></a>";
		dataObject.action = action;
	});
	return dataArray;
}

var clearFormField = function(divId){
	$("#"+divId).find('input, select, textarea').each(function(){
		var name = $(this).attr('name');
		if(name!= undefined && isSameTargetContact && jQuery.inArray(name.split(".")[1], sameTargetFields) !== -1){
			//console.log("## Field Not Empty : " + name);
			//createJQXGrid(fieldArray,newDataArray,gridId);
		}else{
			var elementType = $(this).attr('type');
			if(elementType != "radio" && elementType != "checkbox")
				$(this).val("");
			if(elementType == "radio" || elementType == "checkbox")
				$(this).removeAttr('checked');
			
			if(elementType == "checkbox")
				$(this).val(0);
			
			if ($(this).is("select")){
				$(this).val("");
				$(this).closest('.select2-container').remove();
				$(this).select2("destroy");
				$(this).select2();
			}
			if(elementType == "file" && name != undefined){
				$(".remove-file-"+name.split(".")[1]).addClass("hidden");
				$("[name='"+name+"']").val("");
			}
			
			if(name != undefined){
				var length = $('#extra_fields_'+name.split(".")[1]).length;
				if(length>0)
					$("#extra_fields_"+name.split(".")[1]).html("");
			}
		}
    });
	$('.modalArray .bt-flabels__error').removeClass('bt-flabels__error');
	$("input:radio").each(function () {
		$("[name='"+this.name+"']:first").not("[name=radioClone]").attr('checked', true);
	});
};

$(document).on('click','.btn_add_more',function(){
	event.preventDefault();
	updateRowId = 0;
	$.uniform.restore("input:checkbox");
	$.uniform.restore("input:radio");
	var modalId = "modal_" + this.id.split("_")[2];
	var sectionId = this.id.split("_")[2];
	var gridId = "grid_" + sectionId;
	clearFormField(modalId);
	var element = document.getElementById(modalId);
	$.each(gridArray, function(index, val) {
		if(val.gridId == gridId){
			$.each(val.fieldArray, function(ind, fieldDetails) {
				var fieldName = sectionId + "." + fieldDetails.fieldKey;
				if(sameTargetContactObject.hasOwnProperty(fieldDetails.fieldKey) && isSameTargetContact==true){
					var fieldValue = sameTargetContactObject[fieldDetails.fieldKey];
					$("[name='"+fieldName+"']").val(fieldValue);
					$("[name='"+fieldName+"']").attr("readonly",true);
					$('[name="'+sectionId+"."+sameTargetContactCode+'"]').attr('disabled',true);
					
					var element = document.getElementsByName(fieldName);
					if(element[0].type == "select-one" || element[0].type == "select-multiple")
						$('[name="'+fieldName+'"]').trigger('change');
					
				}else if(sameTargetContactObject.hasOwnProperty(fieldDetails.fieldKey)){
					$("[name='"+fieldName+"']").attr("readonly",false);
					$('[name="'+sectionId+"."+sameTargetContactCode+'"]').attr('disabled',false);
				}
			});
		}
    });
	$(".others-field").html("");
	$(".extra-fields-div").html("");
	pcframework.initUniform();
	element.style.display="block";
	event.preventDefault();
});

var sameTargetContactObject = {}
var isSameTargetContact = false;
$(document).on('change','.chk-element',function(){
	var name = this.name;
	try{
		var section = name.split(".")[0];
		if(name.split(".")[1] == sameTargetContactCode){
			if ($(this).is(':checked')) {
				var sectionId = name.split(".")[0];
				for(var i=0;i<sameTargetFields.length;i++){
					var fieldName = sectionId + "." + sameTargetFields[i];
					var fieldValue = $("[name='"+fieldName+"']").val();
					sameTargetContactObject[fieldName] = fieldValue;
				}
				isSameTargetContact = true;
			}else{
				sameTargetContactObject = {};
				isSameTargetContact = false;
			}
		}
		$(this).val(0);
		if ($(this).is(':checked'))
			$(this).val(1);
	}catch(err){
		console.log("error: " + err.message);
	}
});

$(document).on('change','.opt-extra-fields',function(){
	var currentSection = this.name.split(".")[0];
	var isMultiRow = false;
	$.each(parentSchema.properties, function(sectionKey, sectionDetails) {
		if(currentSection==sectionKey && sectionDetails.type == "array")
			isMultiRow = true;
	});
	if(parentSchema.formFormat=="Single")
		isMultiRow = true;
	
	var fieldKey = this.name.split(".")[1];
	if($(this).hasClass(this.value)) {
		showExtraFields(currentSection,fieldKey,this.value,isMultiRow);
	}else{
		$("#extra_fields_"+this.name.split(".")[1]).html("");
	}
    $('.extra-fields-div').find('select').select2({'allowClear':true});
});

$(document).on('change','.chk-extra-fields',function(){
	var currentSection = this.name.split(".")[0];
	var isMultiRow = false;
	$.each(parentSchema.properties, function(sectionKey, sectionDetails) {
		if(currentSection==sectionKey && sectionDetails.type == "array")
			isMultiRow = true;
	});
	var fieldKey = this.name.split(".")[1];
	if ($(this).is(':checked')) {
		showExtraFields(currentSection,fieldKey,this.value,isMultiRow);
	}else{
		$("#extra_fields_"+this.name.split(".")[1]).html("");
	}
});

$(document).on('change','.date-field',function(){
	$(this).closest(".bt-flabels__error").removeClass("bt-flabels__error");
});

var showExtraFields = function(sectionKey,fieldKey,value,isMultiRow){
	var formLayout = layout;
	if(isMultiRow)
		formLayout = "vertical";
	
	var url = $("#commonContextPathId").val() + "/nec/template/get/linkedFields/"+fieldKey+"/"+value;
	ajaxCallBack("GET", url,"","json",function(response){
		//console.log(JSON.stringify(response));
		var columnIncremenalValue = 3;
	    if(formLayout=="vertical")
	    	columnIncremenalValue = 12;
		var propertyArray = updateSectionOrder(response);
		$.each(propertyArray, function(index, val) {
	        
	    	var key = val.sectionKey;
	    	required = val.required;
    		properties = val.properties;
    		
	    	var incremenalValue = columnIncremenalValue;
	    	
	    	var fieldArray = updateFieldsOrder(properties);
	    	
	    	var columnIncremenalValue = 3;
		    if(formLayout=="vertical")
		    	columnIncremenalValue = 12;
			    
			var rowElement = createRow();
			var element = document.getElementById('extra_fields_'+fieldKey);
			var col_size = 0;
			
	    	$.each(fieldArray, function(index, fieldDetails) {
				if(col_size >= 12){
					element.appendChild(rowElement);
		    		var div = document.createElement('div');
		            div.classList.add('clearfix');
		            div.classList.add('margin-bottom-10');
		            element.appendChild(div);
		            
		    		col_size = 0;
		    		rowElement = createRow();
		    	}
		    	if (fieldDetails.hasOwnProperty('format') && fieldDetails.format === 'file') {
					col_size = col_size + 6;
					fieldDetails.grid_columns = 6;
				}else{
					col_size = col_size + columnIncremenalValue;
					fieldDetails.grid_columns = columnIncremenalValue;
				}
		    	var isMandatory = true;
		    	var updatedKey = sectionKey + "." + fieldDetails.fieldKey;
		    	getFormElement(updatedKey,fieldDetails,isMandatory,formLayout,rowElement,isMultiRow,false);
		    });
	    	if (col_size <= 12 || col_size==18){
		    	element.appendChild(rowElement);
		    }
		    
		    Index.initCalendar();
		    ComponentsPickers.init();
		    pcframework.initUniform();
		});
	});
};

$(document).on('click','.close_modal',function(){
	var modalId = "modal_" + this.id.split("_")[2];
	var element = document.getElementById(modalId);
	element.style.display="none";
});

var createRow = function() {
    var el = document.createElement('div');
    el.classList.add("row");
    return el;
};

var getFieldData = function(formId) {
	$("select[multiple='multiple']").each(function () {
       var val = $("[name='"+this.name+"']").val()
       if(val == null || val == "" || val == undefined)
    	   $("[name='"+this.name+"']").prepend("<option value='' selected='selected'></option>");
    });
	
	$("input[type=checkbox]").each(function () {
		if(this.name.split(".")[1] == sameTargetContactCode)
			$('[name="'+this.name+'"]').attr('disabled',false);
		var val = $("[name='"+this.name+"']").val();
		if(!$("[name='"+this.name+"']").is(":checked")){
			$("[name='"+this.name+"']").val(0);
			$('[name="'+this.name+'"]').attr('checked',true);
		}
	});
	
	var fieldSet = {};
    var x = $('#'+formId).find('select, textarea, input').serializeArray();
	$.each(x, function(i, field) {
		var element = document.getElementsByName(field.name);
		
		if(element[0].type == "select-multiple"){
			var data = $(element[0]).select2('data');
			var array = [];
			$.each(data, function(index, value) {
		        if(value.text!="")
		        	array.push(value.text);
		    });
			field.value = array;
		}
		
		if(element[0].type == "select-one"){
			var data = $(element[0]).select2('data');
			if(data!=null)
				field.value = data.text;
		}
		
    	if(!fieldSet[field.name]){
    		fieldSet[field.name] = field.value;
    	}else if(element[0].type != "select-multiple"){
    		fieldSet[field.name] = field.value;
    	}
    });
    return fieldSet;
}

var createFormTabs = function(schema) {

    var el = document.createElement('ul');
    el.className = "nav nav-tabs";

    var counter = 1;

    var arr = [];

    $.each(schema.properties, function(key, val) {
        if(val.hasOwnProperty("propertyOrder")){
        	//console.log(JSON.stringify(val));
        	//console.log("Property Order [" + val.propertyOrder + "], Value : " + val.title);
        	arr[val.propertyOrder - 1] = val;
        }
    });

    var arrayLength = arr.length;

    for (var i = 0; i < arrayLength; i++) {
        var val = arr[i];
        var a = document.createElement('a');
        a.href = "#tab_" + counter;
        a.setAttribute('data-toggle', "tab");
        a.setAttribute('id', "tab" + counter);
        a.innerHTML = val.title;

        var li = document.createElement('li');
        li.className = "inv-tabs";

        if (counter === 1)
            li.classList.add("active");

        li.appendChild(a);

        el.appendChild(li);
        counter++;
    }
    return el;
};

var emsRefId = "";
var getFormElement = function(key, property, isMandatory,layout,rowElement,isMultiRow,chkExtraField){
	emsRefId = $("#emsRefId").val();
	var elementFormat = "";
    if (property.format !== "" && property.format !== undefined)
        elementFormat = property.format;

    if (elementFormat === 'dropdown' || (elementFormat === '' && property.type === 'string' && property.hasOwnProperty('enum'))) {
        var el = getDropdownFields(key, property, isMandatory,layout,isMultiRow,chkExtraField);
        var isRequestFromNec = $("#isRequestFromNec").val();
		if(property.hasOwnProperty('kycNecRequest')){
			if(isRequestFromNec === true || isRequestFromNec === "true"){
				rowElement.appendChild(el);
			}
		}else{
			rowElement.appendChild(el);
		}
        
    } else if (elementFormat === 'text' || (elementFormat === '' && property.type === 'string')) {
        var el = getFormInputField(key, property, isMandatory,layout,isMultiRow);
        var isRequestFromNec = $("#isRequestFromNec").val();
        if(property.hasOwnProperty('kycNecRequest')){
			if(isRequestFromNec === true || isRequestFromNec === "true"){
				rowElement.appendChild(el);
			}
		}else{
			rowElement.appendChild(el);
		}
    } else if (elementFormat === 'textarea' || (elementFormat === '' && property.hasOwnProperty('widgetType') && property.widgetType === 'textarea')) {
        var el = getFormTextAreaField(key, property, isMandatory,layout,isMultiRow);
        rowElement.appendChild(el);
    } else if (elementFormat === 'file') {
    	var newId = Math.random().toString().split(".")[1];
        rowElement.appendChild(getFileUploadInputField(key, property, isMandatory,layout,isMultiRow,newId));
        var el = getFileUploadButton(key, property, isMandatory,layout,isMultiRow,newId);
        rowElement.appendChild(el);
    } else if (elementFormat === 'radio') {
        var el = getFormRadioButtonField(key, property, isMandatory,layout,isMultiRow);
        rowElement.appendChild(el);
    } else if (elementFormat === 'checkbox') {
        var colmd = property.grid_columns;
        var el = getFormCheckboxField(key, property, isMandatory,layout,isMultiRow,chkExtraField);
        rowElement.appendChild(el);
    } else if (elementFormat === 'multiSelect') {
        var el = getMultiDropdownField(key, property, isMandatory,layout,isMultiRow);
        rowElement.appendChild(el);
    } else if (elementFormat === 'date') {
        var el = getDateInputField(key, property, isMandatory,layout,isMultiRow);
        rowElement.appendChild(el);
    } else if (elementFormat === 'dateRange') {
        var el = getDateRangeInputField(key, property, isMandatory,layout,isMultiRow);
        rowElement.appendChild(el);
    } else if (elementFormat === 'email') {
        var el = getFormEmailField(key, property, isMandatory,layout,isMultiRow);
        rowElement.appendChild(el);
    } else if (elementFormat === 'password') {
        var el = getFormPasswordField(key, property, isMandatory,layout,isMultiRow);
        rowElement.appendChild(el);
    }
}

//Drop Down
var getDropdownFields = function (key, property, isMandatory,layout,isMultiRow,chkExtraField) {

	var selectDiv = document.createElement('select');

	var defaultOptionEl = document.createElement('option');
    defaultOptionEl.innerHTML = "";
    defaultOptionEl.innerHTML = "";
    selectDiv.appendChild(defaultOptionEl);

	for (var i = 0; i < property.enum.length; i++) {
		var optionEl = document.createElement('option');
		optionEl.setAttribute('value', property.enum[i]);
		if(property.hasOwnProperty('value') && property.enum[i] == property.value){
			optionEl.setAttribute('selected', 'selected');
			//--selectDiv.classList.add("ems-field");
		}
		if(property.hasOwnProperty('enumNames'))
			optionEl.innerHTML = property.enumNames[i];
		else
			optionEl.innerHTML = property.enum[i];

		selectDiv.appendChild(optionEl);
	}

	if(chkExtraField && property.hasOwnProperty("linkedFields")){
		$.each(property["linkedFields"], function(index, value) {
			var linkedFields = value.toggleNext;
			if(linkedFields != null && linkedFields.length>0){
				selectDiv.classList.add("opt-extra-fields");
				selectDiv.classList.add(value.toggleOnValue);
			}
	    });
	}
	
	selectDiv.setAttribute('id', key);
	if(property.hasOwnProperty('kycNecRequest')){
		
	}else{
		selectDiv.setAttribute('name', key);
	}
	selectDiv.setAttribute('placeholder', property.title);
	
	if (isMandatory){
		selectDiv.setAttribute('data-parsley-required', 'true');
		selectDiv.setAttribute("data-parsley-group","singleForm");
		if(isMultiRow)
			selectDiv.setAttribute("data-parsley-group","arrayForm");
	}
		
	selectDiv.classList.add("form-control");
	if(emsRefId !="" && emsRefId != null)
		selectDiv.classList.add("ems-field");
	selectDiv.classList.add("select2me");
	selectDiv.classList.add("ogs-field");

	var reqDiv = document.createElement('div');
	reqDiv.appendChild(selectDiv);

	var reqSpan = document.createElement("span");
	if (isMandatory) {
		reqDiv.classList.add("field-background");

		reqSpan = document.createElement("span");
		reqSpan.classList.add("bt-flabels__error-desc");
		reqSpan.innerHTML = "Required";
	}
	
	var label = document.createElement("label");
	label.classList.add("parsley_hide");
	label.appendChild(document.createTextNode(property.title));

	var btFlabelsDiv = document.createElement('div');
	btFlabelsDiv.classList.add("bt-flabels__wrapper");
	
	
	btFlabelsDiv.appendChild(reqDiv);
	
	if (isMandatory && !isMultiRow){
    	setTimeout(function(){
			$(reqDiv).find('.select2-container').append(reqSpan);
		},1);
    }else if (isMandatory)
    	btFlabelsDiv.appendChild(reqSpan);
	
	btFlabelsDiv.appendChild(label);
	var extraFieldsDiv = document.createElement('div');
	extraFieldsDiv.classList.add("extra-fields-div");
	extraFieldsDiv.setAttribute("style", "margin-top:10px;");
	extraFieldsDiv.setAttribute('id', "extra_fields_"+key.split(".")[1]);
	
	if(layout=="vertical"){
		var btFormWrapperDiv = document.createElement('div');
		//btFormWrapperDiv.classList.add("bt-form__wrapper");
		
		var colDiv = document.createElement('div');
		colDiv.classList.add("col-md-5");
		//--colDiv.appendChild(label);
		btFormWrapperDiv.appendChild(colDiv);
		
		colDiv = document.createElement('div');
		colDiv.classList.add("col-md-5");
		colDiv.appendChild(btFlabelsDiv);
		btFormWrapperDiv.appendChild(colDiv);
		
		if(chkExtraField){
			setTimeout(function(){
				$(btFormWrapperDiv).closest('.row').after(extraFieldsDiv);
			},10);
		}
		return btFormWrapperDiv;
	}else{
		var formGroupDiv = document.createElement('div');
		formGroupDiv.classList.add("form-group");
		formGroupDiv.classList.add("uk-width-1-1");
		formGroupDiv.appendChild(btFlabelsDiv);

		var btFormWrapperDiv = document.createElement('div');
		btFormWrapperDiv.classList.add("bt-form__wrapper");
		btFormWrapperDiv.appendChild(formGroupDiv);

		var fieldColDiv = document.createElement('div');
		if (property.grid_columns !== undefined)
			fieldColDiv.classList.add("col-md-" + property.grid_columns);
		else
			fieldColDiv.classList.add("col-md-3");

		fieldColDiv.appendChild(btFormWrapperDiv)

		if(chkExtraField){
			setTimeout(function(){
				$(fieldColDiv).closest('.row').after(extraFieldsDiv);
			},10);
		}
		
		return fieldColDiv;
	}
}

//Radio Button
var getFormRadioButtonField = function(key, property, isMandatory,layout,isMultiRow) {
    var radioListDiv = document.createElement('div');

    var bEl = document.createElement('div');
    bEl.appendChild(document.createTextNode(property.title + "\u00A0"));

    var labelEl = document.createElement('label');
    if(layout!="vertical")
    	labelEl.classList.add("radio-inline");
    labelEl.appendChild(bEl);
    radioListDiv.appendChild(labelEl);
    
    var clearFixDiv = document.createElement('div');
    clearFixDiv.classList.add("clearfix");
    clearFixDiv.classList.add("margin-bottom-15");
    radioListDiv.appendChild(clearFixDiv);

    var rowColDiv = document.createElement('div');
    if(layout!="vertical"){
    	rowColDiv.classList.add("col-md-12");
    	rowColDiv.classList.add("row");
    }
    
    rowColDiv.setAttribute("style", "word-break: break-word;");
    
    radioListDiv.appendChild(rowColDiv);
    
    for (var i = 0; i < property.enum.length; i++) {
        var labelRadio = document.createElement('label');

        var InputEl = document.createElement('input');
        InputEl.setAttribute("type", "radio");
        InputEl.setAttribute("name", key);
        InputEl.setAttribute("id", key);
        if(i==0)
        	InputEl.setAttribute('checked', 'checked');
        
        if(property.hasOwnProperty('value') && property.enum[i] == property.value){
        	InputEl.setAttribute('checked', 'checked');	
		}
        
        InputEl.setAttribute("value", property.enum[i]);
        labelRadio.appendChild(InputEl);
        labelRadio.appendChild(document.createTextNode("\u00A0" + property.enumNames[i]));
        rowColDiv.appendChild(labelRadio);
        rowColDiv.appendChild(document.createTextNode("\u00A0\u00A0\u00A0"));
    }

    if(layout=="vertical"){
    	var fieldColDiv = document.createElement('div');
		var colDiv = document.createElement('div');
		colDiv.classList.add("col-md-5");
		colDiv.appendChild(labelEl);
		fieldColDiv.appendChild(colDiv);
		
		colDiv = document.createElement('div');
		colDiv.classList.add("col-md-5");
		colDiv.appendChild(rowColDiv);
		fieldColDiv.appendChild(colDiv);
		
		return fieldColDiv;
    }
    
    radioListDiv.classList.add("radio-list");

    var fieldColDiv = document.createElement('div');
    if (property.grid_columns !== undefined)
        fieldColDiv.classList.add("col-md-" + property.grid_columns);
    else
        fieldColDiv.classList.add("col-md-3");

    fieldColDiv.appendChild(radioListDiv);

    return fieldColDiv;
}

//Text box
var getFormInputField = function (key, property, isMandatory,layout,isMultiRow) {
	var inputEl = document.createElement('input');
	inputEl.setAttribute('type', 'text');
	
	if(property.hasOwnProperty('kycNecRequest')){
		
	}else{
		inputEl.setAttribute('name', key);
	}
	
	inputEl.setAttribute('id', key);
	inputEl.setAttribute('placeholder', property.title);
	inputEl.setAttribute('maxlength', 255);
	inputEl.classList.add("form-control");
	if(emsRefId !="" && emsRefId != null)
		inputEl.classList.add("ems-field");
	inputEl.classList.add("ogs-field");
	if(property.hasOwnProperty('value')){
		inputEl.setAttribute('value', property.value);
		/*if(property.value !=null && property.value !="" && property.value !=undefined)
			inputEl.classList.add("ems-field");*/
	}
	var reqSpan = document.createElement("span");
	if (isMandatory) {
		inputEl.classList.add("field-background");
		inputEl.setAttribute('data-parsley-required', 'true');
		
		inputEl.setAttribute("data-parsley-group","singleForm");
		if(isMultiRow)
			inputEl.setAttribute("data-parsley-group","arrayForm");
		
		reqSpan = document.createElement("span");
		reqSpan.classList.add("bt-flabels__error-desc");
		reqSpan.innerHTML = "Required";
	}

	var label = document.createElement("label");
	label.classList.add("parsley_hide");
	label.appendChild(document.createTextNode(property.title));

	var btFlabelsDiv = document.createElement('div');
	btFlabelsDiv.classList.add("bt-flabels__wrapper");
	
	btFlabelsDiv.appendChild(label);
	btFlabelsDiv.appendChild(inputEl);
	btFlabelsDiv.appendChild(reqSpan);
	
	if(layout=="vertical"){
		var fieldColDiv = document.createElement('div');
		var colDiv = document.createElement('div');
		colDiv.classList.add("col-md-5");
		//--colDiv.appendChild(label);
		fieldColDiv.appendChild(colDiv);
		
		colDiv = document.createElement('div');
		colDiv.classList.add("col-md-5");
		colDiv.appendChild(btFlabelsDiv);
		fieldColDiv.appendChild(colDiv);
		//--console.log("inside if fieldColDiv:::",fieldColDiv);
		return fieldColDiv;
	}else{
		var formGroupDiv = document.createElement('div');
		formGroupDiv.classList.add("form-group");
		formGroupDiv.classList.add("uk-width-1-1");

		//--formGroupDiv.appendChild(label);
		formGroupDiv.appendChild(btFlabelsDiv);
		
		var btFormWrapperDiv = document.createElement('div');
		btFormWrapperDiv.classList.add("bt-form__wrapper");
		btFormWrapperDiv.appendChild(formGroupDiv);
		
		var fieldColDiv = document.createElement('div');
		fieldColDiv.classList.add("col-md-" + property.grid_columns);	
		fieldColDiv.appendChild(btFormWrapperDiv)
		//--console.log("inside else fieldColDiv:::",fieldColDiv);
		return fieldColDiv;
	}
}

//Email Field
var getFormEmailField = function (key, property, isMandatory,layout,isMultiRow) {

	var inputEl = document.createElement('input');
	inputEl.setAttribute('type', 'email');
	inputEl.setAttribute('name', key);
	inputEl.setAttribute('id', key);
	inputEl.setAttribute('data-parsley-type', 'email');
	inputEl.setAttribute('placeholder', property.title);
	
	inputEl.setAttribute('maxlength', 255);
	inputEl.classList.add("form-control");
	if(emsRefId !="" && emsRefId != null)
		inputEl.classList.add("ems-field");
	inputEl.classList.add("ogs-field");

	if(property.hasOwnProperty('value')){
		inputEl.setAttribute('value', property.value);
		/*if(property.value !=null && property.value !="" && property.value !=undefined)
			inputEl.classList.add("ems-field");*/
	}
	
	var reqSpan = document.createElement("span");
	if (isMandatory) {
		inputEl.classList.add("field-background");
		inputEl.setAttribute('data-parsley-required', 'true');
		
		inputEl.setAttribute("data-parsley-group","singleForm");
		if(isMultiRow)
			inputEl.setAttribute("data-parsley-group","arrayForm");
		
		reqSpan = document.createElement("span");
		reqSpan.classList.add("bt-flabels__error-desc");
		reqSpan.innerHTML = "Required / Invalid";
	}else{
		inputEl.classList.add("parsley-error");
		inputEl.setAttribute('data-parsley-required', 'false');		
		inputEl.setAttribute("data-parsley-group","singleForm");
		
		reqSpan.classList.add("bt-flabels__error-desc");
		reqSpan.innerHTML = "Valid email required";
	}
	
	var label = document.createElement("label");
	label.classList.add("parsley_hide");
	label.appendChild(document.createTextNode(property.title));

	var btFlabelsDiv = document.createElement('div');
	btFlabelsDiv.classList.add("bt-flabels__wrapper");
	btFlabelsDiv.appendChild(label);
	
	btFlabelsDiv.appendChild(inputEl);
	if (isMandatory)
		btFlabelsDiv.appendChild(reqSpan);
	else
		btFlabelsDiv.appendChild(reqSpan);

	if(layout=="vertical"){
		var btFormWrapperDiv = document.createElement('div');
		//btFormWrapperDiv.classList.add("bt-form__wrapper");
		
		var colDiv = document.createElement('div');
		colDiv.classList.add("col-md-5");
		colDiv.appendChild(label);
		btFormWrapperDiv.appendChild(colDiv);
		
		colDiv = document.createElement('div');
		colDiv.classList.add("col-md-5");
		colDiv.appendChild(btFlabelsDiv);
		btFormWrapperDiv.appendChild(colDiv);
		console.log("inside if btFormWrapperDiv:::",btFormWrapperDiv);
		return btFormWrapperDiv;
	}else{
		var formGroupDiv = document.createElement('div');
		formGroupDiv.classList.add("form-group");
		formGroupDiv.classList.add("uk-width-1-1");
		formGroupDiv.appendChild(btFlabelsDiv);

		var btFormWrapperDiv = document.createElement('div');
		btFormWrapperDiv.classList.add("bt-form__wrapper");
		btFormWrapperDiv.appendChild(formGroupDiv);

		var fieldColDiv = document.createElement('div');
		
		fieldColDiv.classList.add("col-md-" + property.grid_columns);	
		fieldColDiv.appendChild(btFormWrapperDiv)
		console.log("inside else fieldColDiv:::",fieldColDiv);
		return fieldColDiv;
	}
}

// Password Field
var getFormPasswordField = function (key, property, isMandatory,layout,isMultiRow) {

	var inputEl = document.createElement('input');
	inputEl.setAttribute('type', 'password');
	inputEl.setAttribute('name', key);
	inputEl.setAttribute('placeholder', property.title);
	
	inputEl.setAttribute('maxlength', 255);
	inputEl.classList.add("form-control");
	if(emsRefId !="" && emsRefId != null)
		inputEl.classList.add("ems-field");
	inputEl.classList.add("ogs-field");

	if(property.hasOwnProperty('value')){
		inputEl.setAttribute('value', property.value);
		/*if(property.value !=null && property.value !="" && property.value !=undefined)
			inputEl.classList.add("ems-field");*/
	}
	var reqSpan = document.createElement("span");
	if (isMandatory) {
		inputEl.classList.add("field-background");
		inputEl.setAttribute('data-parsley-required', 'true');
		inputEl.setAttribute("data-parsley-group","singleForm");
		if(isMultiRow)
			inputEl.setAttribute("data-parsley-group","arrayForm");
		reqSpan = document.createElement("span");
		reqSpan.classList.add("bt-flabels__error-desc");
		reqSpan.innerHTML = "Required / Invalid";
	}

	var label = document.createElement("label");
	label.classList.add("parsley_hide");
	label.appendChild(document.createTextNode(property.title));

	var btFlabelsDiv = document.createElement('div');
	btFlabelsDiv.classList.add("bt-flabels__wrapper");
	btFlabelsDiv.appendChild(label);
	
	btFlabelsDiv.appendChild(inputEl);
	if (isMandatory)
		btFlabelsDiv.appendChild(reqSpan);

	if(layout=="vertical"){
		var btFormWrapperDiv = document.createElement('div');
		//btFormWrapperDiv.classList.add("bt-form__wrapper");
		
		var colDiv = document.createElement('div');
		colDiv.classList.add("col-md-5");
		colDiv.appendChild(label);
		btFormWrapperDiv.appendChild(colDiv);
		
		colDiv = document.createElement('div');
		colDiv.classList.add("col-md-5");
		colDiv.appendChild(btFlabelsDiv);
		btFormWrapperDiv.appendChild(colDiv);
		
		return btFormWrapperDiv;
	}
	
	var formGroupDiv = document.createElement('div');
	formGroupDiv.classList.add("form-group");
	formGroupDiv.classList.add("uk-width-1-1");
	formGroupDiv.appendChild(btFlabelsDiv);

	var btFormWrapperDiv = document.createElement('div');
	btFormWrapperDiv.classList.add("bt-form__wrapper");
	btFormWrapperDiv.appendChild(formGroupDiv);

	var fieldColDiv = document.createElement('div');
	
	//console.log("\nproperty.title : "+property.title);
	//console.log("property.grid_columns: "+property.grid_columns);
	
	fieldColDiv.classList.add("col-md-" + property.grid_columns);	
	fieldColDiv.appendChild(btFormWrapperDiv)

	return fieldColDiv;
}

// Text Area
var getFormTextAreaField = function(key, property, isMandatory,layout,isMultiRow) {

    var textAreaEl = document.createElement('textarea');
    textAreaEl.setAttribute('name', key);
    textAreaEl.setAttribute('id', key);
    textAreaEl.setAttribute('placeholder', property.title);
    
    textAreaEl.setAttribute('rows', 5);
    textAreaEl.setAttribute('cols', 43);

    if(property.hasOwnProperty('value')){
		textAreaEl.setAttribute('value', property.value);	
	}
    
    textAreaEl.classList.add("ogs-field");
    var reqSpan = document.createElement("span");
    if (isMandatory) {
        textAreaEl.classList.add("field-background");
        textAreaEl.setAttribute('data-parsley-required', 'true');
        textAreaEl.setAttribute("data-parsley-group","singleForm");
        if(isMultiRow)
        	textAreaEl.setAttribute("data-parsley-group","arrayForm");
        reqSpan = document.createElement("span");
        reqSpan.classList.add("bt-flabels__error-desc");
        reqSpan.innerHTML = "Required";
    }

    var label = document.createElement("label");
	label.classList.add("parsley_hide");
    label.appendChild(document.createTextNode(property.title));

    var btFlabelsDiv = document.createElement('div');
    btFlabelsDiv.classList.add("bt-flabels__wrapper");
    btFlabelsDiv.appendChild(label);
    
    btFlabelsDiv.appendChild(textAreaEl);
    if (isMandatory)
        btFlabelsDiv.appendChild(reqSpan);

    if(layout=="vertical"){
		var btFormWrapperDiv = document.createElement('div');
		//btFormWrapperDiv.classList.add("bt-form__wrapper");
		
		var colDiv = document.createElement('div');
		colDiv.classList.add("col-md-5");
		colDiv.appendChild(label);
		btFormWrapperDiv.appendChild(colDiv);
		
		colDiv = document.createElement('div');
		colDiv.classList.add("col-md-5");
		colDiv.appendChild(btFlabelsDiv);
		btFormWrapperDiv.appendChild(colDiv);
		
		return btFormWrapperDiv;
	}else{
		var formGroupDiv = document.createElement('div');
		formGroupDiv.classList.add("form-group");
		formGroupDiv.classList.add("uk-width-1-1");
		formGroupDiv.appendChild(btFlabelsDiv);

		var btFormWrapperDiv = document.createElement('div');
		btFormWrapperDiv.classList.add("bt-form__wrapper");
		btFormWrapperDiv.appendChild(formGroupDiv);

		var fieldColDiv = document.createElement('div');
	    fieldColDiv.classList.add("col-md-" + property.grid_columns);
	    fieldColDiv.appendChild(btFormWrapperDiv);

		return fieldColDiv;
	}
}


//Check Box
var getFormCheckboxField = function(key, property, isMandatory,layout,isMultiRow,chkExtraField) {
	
	var inputEl = document.createElement('input');
	inputEl.setAttribute('type', 'checkbox');
	inputEl.setAttribute('value', 0);
	inputEl.setAttribute('id', key);
	inputEl.setAttribute('name', key);
	inputEl.classList.add("chk-element");
	inputEl.classList.add("ogs-field");
	
	if(property.hasOwnProperty('value')){
		inputEl.setAttribute('value', property.value);
	}else{
		inputEl.setAttribute('value', 0);	
	}
	
	if(property.isChecked)
		inputEl.setAttribute('checked',true);
	
	if(chkExtraField && property.hasOwnProperty("linkedFields")){
		$.each(property["linkedFields"], function(index, value) {
			var linkedFields = value.toggleNext;
			if(linkedFields != null && linkedFields.length>0)
				inputEl.classList.add("chk-extra-fields");
	    });
	}
	
	var divEl = document.createElement('div');
	divEl.classList.add("bt-form__wrapper");
	
	var labelEl = document.createElement('label');
	labelEl.classList.add("control-label");
	labelEl.innerHTML = property.title;
	
	divEl.appendChild(inputEl);
	divEl.appendChild(labelEl);
	
	var formGroupEl = document.createElement('div');
	formGroupEl.classList.add("form-group");
	formGroupEl.classList.add("uk-width-1-1");
	formGroupEl.appendChild(divEl);
	
	var fieldColDiv = document.createElement('div');
	fieldColDiv.classList.add("col-md-" + property.grid_columns);
	fieldColDiv.appendChild(formGroupEl);

	var extraFieldsDiv = document.createElement('div');
	extraFieldsDiv.classList.add("extra-fields-div");
	extraFieldsDiv.setAttribute("style", "margin-top:10px;");
	extraFieldsDiv.setAttribute('id', "extra_fields_"+key.split(".")[1]);
	
	if(layout=="vertical"){
		var btFormWrapperDiv = document.createElement('div');
		//btFormWrapperDiv.classList.add("bt-form__wrapper");
		
		var colDiv = document.createElement('div');
		colDiv.classList.add("col-md-5");
		colDiv.appendChild(labelEl);
		btFormWrapperDiv.appendChild(colDiv);
		
		colDiv = document.createElement('div');
		colDiv.classList.add("col-md-5");
		colDiv.appendChild(inputEl);
		btFormWrapperDiv.appendChild(colDiv);
		
		if(chkExtraField){
			setTimeout(function(){
				$(btFormWrapperDiv).closest('.row').after(extraFieldsDiv);
			},10);
		}
		return btFormWrapperDiv;
	}
	if(chkExtraField){
		setTimeout(function(){
			$(fieldColDiv).closest('.row').after(extraFieldsDiv);
		},10);
	}
	return fieldColDiv;
}

// Multi Select Drop Down.
var getMultiDropdownField = function(key, property, isMandatory,layout,isMultiRow) {

    var selectDiv = document.createElement('select');
	
    /////////////////////////////////////////////////////////
    // Added below code to set first option as blank to successfully submit MultiSelectDropdown
    var defaultOptionEl = document.createElement('option');
    defaultOptionEl.setAttribute('value', '');
    selectDiv.appendChild(defaultOptionEl);
    /////////////////////////////////////////////////////////
    
    if(property.hasOwnProperty('enum')) {
		for (var i = 0; i < property.enum.length; i++) {
			var optionEl = document.createElement('option');
			optionEl.setAttribute('value', property.enum[i]);
			optionEl.appendChild(document.createTextNode(property.enumNames[i]))
			selectDiv.appendChild(optionEl);
		}
	}

    selectDiv.setAttribute('name', key);
    selectDiv.setAttribute('id', key);
    selectDiv.setAttribute('placeholder', property.title);
    selectDiv.setAttribute('multiple', 'multiple');
    
    if(isMandatory){
    	selectDiv.setAttribute('data-parsley-required', 'true');
    	selectDiv.setAttribute("data-parsley-group","singleForm");
    	if(isMultiRow)
        	selectDiv.setAttribute("data-parsley-group","arrayForm");
    }
    
    selectDiv.classList.add("form-control");
    if(emsRefId !="" && emsRefId != null)
		selectDiv.classList.add("ems-field");
    selectDiv.classList.add("select2me");
    selectDiv.classList.add("ogs-field");

    var reqDiv = document.createElement('div');
    reqDiv.appendChild(selectDiv);

    var reqSpan = document.createElement("span");
    if (isMandatory) {
        reqDiv.classList.add("field-background");

        reqSpan = document.createElement("span");
        reqSpan.classList.add("bt-flabels__error-desc");
        reqSpan.innerHTML = "Required";
    }

    var label = document.createElement("label");
	label.classList.add("parsley_hide");
    label.appendChild(document.createTextNode(property.title));

    var btFlabelsDiv = document.createElement('div');
    btFlabelsDiv.classList.add("bt-flabels__wrapper");
    
    btFlabelsDiv.appendChild(label);
    
    btFlabelsDiv.appendChild(reqDiv);
    if (isMandatory && !isMultiRow){
    	setTimeout(function(){
			$(reqDiv).find('.select2-container').append(reqSpan);
		},1);
    }else if (isMandatory)
    	btFlabelsDiv.appendChild(reqSpan);

    if(layout=="vertical"){
		var btFormWrapperDiv = document.createElement('div');
		//btFormWrapperDiv.classList.add("bt-form__wrapper");
		
		var colDiv = document.createElement('div');
		colDiv.classList.add("col-md-5");
		colDiv.appendChild(label);
		btFormWrapperDiv.appendChild(colDiv);
		
		colDiv = document.createElement('div');
		colDiv.classList.add("col-md-5");
		colDiv.appendChild(btFlabelsDiv);
		btFormWrapperDiv.appendChild(colDiv);
		
		return btFormWrapperDiv;
	}else{
		var formGroupDiv = document.createElement('div');
		formGroupDiv.classList.add("form-group");
		formGroupDiv.classList.add("uk-width-1-1");
		formGroupDiv.appendChild(btFlabelsDiv);

		var btFormWrapperDiv = document.createElement('div');
		btFormWrapperDiv.classList.add("bt-form__wrapper");
		btFormWrapperDiv.appendChild(formGroupDiv);

		var fieldColDiv = document.createElement('div');
		if (property.grid_columns !== undefined)
	        fieldColDiv.classList.add("col-md-" + property.grid_columns);
	    else
	        fieldColDiv.classList.add("col-md-4");
		fieldColDiv.appendChild(btFormWrapperDiv)

		return fieldColDiv;
	}
}

//File Upload Text box
var getFileUploadInputField = function(key, property, isMandatory,layout,isMultiRow, newId) {
	var inputEl = document.createElement('input');
    inputEl.setAttribute('type', 'text');
    if(property.hasOwnProperty('value')){
    	InputEl.setAttribute('value', property.value);
    	/*if(property.value !=null && property.value !="" && property.value !=undefined)
    		inputEl.classList.add("ems-field");*/
	}
    if (isMandatory){
    	inputEl.setAttribute('data-parsley-required', 'true');
    	inputEl.setAttribute("data-parsley-group","singleForm");
    	if(isMultiRow)
    		inputEl.setAttribute("data-parsley-group","arrayForm");
    }

    inputEl.setAttribute('readonly', 'true');
    inputEl.setAttribute('id', 'file' + newId);
    inputEl.classList.add("form-control");
    if(emsRefId !="" && emsRefId != null)
		inputEl.classList.add("ems-field");
    inputEl.setAttribute('name', key);

    var inputFileEl = document.createElement('input');
    inputFileEl.setAttribute('type', 'file');
    inputFileEl.setAttribute('name', key);
    inputFileEl.setAttribute('id', 'file_' + newId);
    
    if(property.hasOwnProperty('fileFormat')){
    	if(property.fileFormat != null){
    		var fileExtnList = "";
    		var fileExtn = property.fileFormat.split("|")
    		for(var i=0;i<fileExtn.length;i++){
        		if(i==fileExtn[fileExtn.length-1])
        			fileExtnList += fileExtn[i];
        		else
        			fileExtnList += fileExtn[i] + ",";
        	}
    		inputFileEl.setAttribute('accept', ".pdf");
    	}
    }
    
    if(property.hasOwnProperty('multiFile'))
    	inputFileEl.setAttribute('multiple', 'true');
    
    inputFileEl.setAttribute("onchange", "javascript:onChangeFile('" + newId + "');");
    inputFileEl.onchange = function() {
        javascript: onChangeFile(newId);
    };

    inputFileEl.classList.add("hidden");

    var reqSpan = document.createElement("span");
    if (isMandatory) {
        inputEl.classList.add("field-background");
        	
        reqSpan = document.createElement("span");
        reqSpan.classList.add("bt-flabels__error-desc");
        reqSpan.innerHTML = "Required";
    }

    var label = document.createElement("label");
    label.appendChild(document.createTextNode(property.title));

    var btFlabelsDiv = document.createElement('div');
    btFlabelsDiv.classList.add("bt-flabels__wrapper");
    btFlabelsDiv.appendChild(label);
    
    btFlabelsDiv.appendChild(inputFileEl);
    btFlabelsDiv.appendChild(inputEl);
    if (isMandatory)
        btFlabelsDiv.appendChild(reqSpan);

    if(layout=="vertical"){
		var btFormWrapperDiv = document.createElement('div');
		//btFormWrapperDiv.classList.add("bt-form__wrapper");
		
		var colDiv = document.createElement('div');
		colDiv.classList.add("col-md-5");
		colDiv.appendChild(label);
		btFormWrapperDiv.appendChild(colDiv);
		
		colDiv = document.createElement('div');
		colDiv.classList.add("col-md-5");
		colDiv.appendChild(btFlabelsDiv);
		btFormWrapperDiv.appendChild(colDiv);
		
		return btFormWrapperDiv;
	}else{
		var formGroupDiv = document.createElement('div');
	    formGroupDiv.classList.add("form-group");
	    formGroupDiv.classList.add("uk-width-1-1");
	    formGroupDiv.appendChild(btFlabelsDiv);

	    var btFormWrapperDiv = document.createElement('div');
	    btFormWrapperDiv.classList.add("bt-form__wrapper");
	    btFormWrapperDiv.appendChild(formGroupDiv);
	    
	    var fieldColDiv = document.createElement('div');
	    
	    if(property.hasOwnProperty('grid_columns'))
	    	fieldColDiv.classList.add("col-md-" + (property.grid_columns - 2));
	    else
	    	fieldColDiv.classList.add("col-md-7");
	    
	    fieldColDiv.appendChild(btFormWrapperDiv);

	    return fieldColDiv;
	}
}

//File Upload button
var getFileUploadButton = function(key, property, isMandatory,layout,isMultiRow, newId) {
	var iDiv = document.createElement('i');
    iDiv.classList.add("fa")
    iDiv.classList.add("fa-folder-open-o")

    var browseButton = document.createElement('button');
    browseButton.setAttribute("type", "button")
    browseButton.setAttribute('id', 'browseFile_' + newId);
    browseButton.setAttribute('value', 'Change');
    browseButton.classList.add("btn")
    browseButton.classList.add("btn-sm")
    browseButton.classList.add("grey-gallery")
    browseButton.setAttribute("style", "margin-top:38px;");
    if(layout=="vertical")
    	browseButton.setAttribute("style", "margin-top:15px;");

    browseButton.setAttribute("onclick", "$('#file_" + newId + "').click();");
    browseButton.onclick = function() {
        $('#file_' + newId).click();
    };

    browseButton.appendChild(iDiv);
    browseButton.appendChild(document.createTextNode(' Browse'));

    var irDiv = document.createElement('i');
    irDiv.classList.add("fa")
    irDiv.classList.add("fa-close")

    var removeButton = document.createElement('button');
    removeButton.setAttribute("type", "button")
    removeButton.setAttribute('id', 'removeFile_' + newId);
    removeButton.setAttribute('value', 'Remove');
    removeButton.classList.add("btn");
    removeButton.classList.add("btn-sm");
    removeButton.classList.add("grey-gallery");
    removeButton.classList.add("hidden");
    removeButton.setAttribute("style", "margin-top:38px;");
    if(layout=="vertical")
    	removeButton.setAttribute("style", "margin-top:15px;");
    if(isMultiRow)
    	removeButton.classList.add("remove-file-"+key.split(".")[1]);
    
    removeButton.onclick = function() {
        removeOnClick(newId);
    };

    removeButton.appendChild(irDiv);

    var formGroupDiv = document.createElement('div');
    formGroupDiv.classList.add("form-group");
    formGroupDiv.appendChild(browseButton);
    formGroupDiv.appendChild(document.createTextNode('\u00A0\u00A0\u00A0'));
    
    formGroupDiv.appendChild(removeButton);

    var fieldColDiv = document.createElement('div');
    
    fieldColDiv.classList.add("col-md-2");
    
    fieldColDiv.appendChild(formGroupDiv)

    return fieldColDiv;
}


//Date Field
var getDateInputField = function(key, property, isMandatory,layout,isMultiRow) {
    
    var inputEl = document.createElement('input');
    inputEl.setAttribute('type', 'text');
    inputEl.setAttribute('name', key);
    inputEl.setAttribute('id', key);
    //inputEl.setAttribute('onkeydown', 'return false');
    //inputEl.classList.add("date-field");
    inputEl.classList.add("ogs-field");
    inputEl.classList.add("datePicker");
    inputEl.setAttribute('placeholder', property.title);
    
    if(property.hasOwnProperty('value')){
		inputEl.setAttribute('value', property.value);
		/*if(property.value !=null && property.value !="" && property.value !=undefined)
			inputEl.classList.add("ems-field");*/
	}
    
    inputEl.classList.add("form-control");
    if(emsRefId !="" && emsRefId != null)
		inputEl.classList.add("ems-field");
    inputEl.classList.add("form-control-inline");

    var iEl = document.createElement("i");
    iEl.classList.add("fa");
    iEl.classList.add("fa-calendar");

    var dateButtonSpan = document.createElement("span");
    dateButtonSpan.classList.add("input-group-btn");
    dateButtonSpan.classList.add("btn");
    dateButtonSpan.classList.add("default");
    dateButtonSpan.appendChild(iEl);

    var reqSpan = document.createElement("span");
    if (isMandatory) {
        inputEl.classList.add("field-background");
        inputEl.setAttribute('data-parsley-required', 'true');
        inputEl.setAttribute("data-parsley-group","singleForm");
        if(isMultiRow)
    		inputEl.setAttribute("data-parsley-group","arrayForm");
        reqSpan = document.createElement("span");
        reqSpan.classList.add("bt-flabels__error-desc_date");
        reqSpan.innerHTML = "Required";
    }

    var label = document.createElement("label");
	label.classList.add("parsley_hide");
    label.appendChild(document.createTextNode(property.title));

    var datePickerDiv = document.createElement('div');
    datePickerDiv.classList.add("input-group");
    datePickerDiv.setAttribute('id', "span_"+key);
    //datePickerDiv.classList.add("date");
    //datePickerDiv.classList.add("date-picker");
    if(property.hasOwnProperty('dateFormat') && property.dateFormat != null && property.dateFormat != "null")
    	datePickerDiv.setAttribute("data-date-format", property.dateFormat);
    else
    	datePickerDiv.setAttribute("data-date-format", "mm/dd/yyyy");
    
    datePickerDiv.appendChild(inputEl);
    datePickerDiv.appendChild(dateButtonSpan);

    var btFlabelsDiv = document.createElement('div');
    btFlabelsDiv.classList.add("bt-flabels__wrapper");
    btFlabelsDiv.appendChild(label);
    
    btFlabelsDiv.appendChild(datePickerDiv);
    if (isMandatory)
    	datePickerDiv.appendChild(reqSpan);

    if(layout=="vertical"){
		var fieldColDiv = document.createElement('div');
		
		var colDiv = document.createElement('div');
		colDiv.classList.add("col-md-5");
		colDiv.appendChild(label);
		fieldColDiv.appendChild(colDiv);
		
		colDiv = document.createElement('div');
		colDiv.classList.add("col-md-5");
		colDiv.appendChild(btFlabelsDiv);
		fieldColDiv.appendChild(colDiv);
		
		return fieldColDiv;
	}else{
		var formGroupDiv = document.createElement('div');
	    formGroupDiv.classList.add("form-group");
	    formGroupDiv.classList.add("uk-width-1-1");
	    formGroupDiv.appendChild(btFlabelsDiv);

	    var fieldColDiv = document.createElement('div');
	    fieldColDiv.classList.add("col-md-" + property.grid_columns);
	    fieldColDiv.appendChild(formGroupDiv);

	    return fieldColDiv;
	}
}

// Date Range Field
var getDateRangeInputField = function(key, property, isMandatory,layout,isMultiRow) {

    // End div starts.		
    var endInputEl = document.createElement("input");
    endInputEl.setAttribute('name', key);
    endInputEl.setAttribute('size', '16');
    endInputEl.setAttribute('id', key);
    //endInputEl.setAttribute('onkeydown', 'return false');
    endInputEl.setAttribute('placeholder', property.title);
    endInputEl.classList.add("datePicker");
    
    endInputEl.setAttribute('type', 'text');
    endInputEl.classList.add("form-control");
    if(emsRefId !="" && emsRefId != null)
		endInputEl.classList.add("ems-field");
    endInputEl.classList.add("input-sm");
    endInputEl.classList.add("date-picker");
    endInputEl.classList.add("date-field");

    var endReqSpan = document.createElement("span");
    if (isMandatory) {
        endInputEl.classList.add("field-background");
        endInputEl.setAttribute('data-parsley-required', 'true');

        endReqSpan = document.createElement("span");
        endReqSpan.classList.add("bt-flabels__error-desc");
        endReqSpan.innerHTML = "Required";
    }

    var endLabel = document.createElement("label");
    endLabel.classList.add("parsley_hide");
    endLabel.appendChild(document.createTextNode(property.title));

    var endBtFlabelsDiv = document.createElement("div");
    endBtFlabelsDiv.classList.add("bt-flabels__wrapper");
    
    endBtFlabelsDiv.appendChild(endLabel);
    
    endBtFlabelsDiv.appendChild(endInputEl);
    if (isMandatory)
        endBtFlabelsDiv.appendChild(endReqSpan);

    // End div ends.


    // Start div start.
    var startInputEl = document.createElement("input");
    startInputEl.setAttribute('name', key);
    startInputEl.setAttribute('size', '16');
    startInputEl.setAttribute('id', key);
    startInputEl.setAttribute('placeholder', property.title);
    startInputEl.setAttribute('type', 'text');
    //startInputEl.setAttribute('onkeydown', 'return false');
    startInputEl.classList.add("datePicker");
    startInputEl.classList.add("form-control");
    if(emsRefId !="" && emsRefId != null)
		startInputEl.classList.add("ems-field");
    startInputEl.classList.add("input-sm");
    startInputEl.classList.add("date-picker");
    startInputEl.classList.add("date-field");

    var startReqSpan = document.createElement("span");
    if (isMandatory) {
        startInputEl.classList.add("field-background");
        startInputEl.setAttribute('data-parsley-required', 'true');

        startReqSpan = document.createElement("span");
        startReqSpan.classList.add("bt-flabels__error-desc");
        startReqSpan.innerHTML = "Required";
    }

    var startLabel = document.createElement("label");
    startLabel.classList.add("parsley_hide");
    startLabel.appendChild(document.createTextNode(property.title));

    var startBtFlabelsDiv = document.createElement("div");
    startBtFlabelsDiv.classList.add("bt-flabels__wrapper");
    
    startBtFlabelsDiv.appendChild(startLabel);
    
    startBtFlabelsDiv.appendChild(startInputEl);
    if (isMandatory)
        startBtFlabelsDiv.appendChild(startReqSpan);
    // Start div ends.

    var span = document.createElement('span');
    span.classList.add('input-group-addon');
    span.appendChild(document.createTextNode('To'));

    var datePickerDiv = document.createElement('div');
    datePickerDiv.classList.add("input-group");
    datePickerDiv.classList.add("date-picker");
    datePickerDiv.classList.add("input-daterange");
    datePickerDiv.appendChild(startBtFlabelsDiv);
    datePickerDiv.appendChild(span);
    datePickerDiv.appendChild(endBtFlabelsDiv);

    datePickerDiv.setAttribute("data-date-start-date", "");
    datePickerDiv.setAttribute("data-date-format", "mm/dd/yyyy");

    var formGroupDiv = document.createElement('div');
    formGroupDiv.classList.add("form-group");
    formGroupDiv.classList.add("uk-width-1-1");
    formGroupDiv.appendChild(datePickerDiv);

    var btFormWrapperDiv = document.createElement('div');
    btFormWrapperDiv.classList.add("bt-form__wrapper");
    btFormWrapperDiv.appendChild(formGroupDiv);

    var fieldColDiv = document.createElement('div');
    if (property.grid_columns !== undefined)
        fieldColDiv.classList.add("col-md-" + property.grid_columns);
    else
        fieldColDiv.classList.add("col-md-4");

    fieldColDiv.appendChild(formGroupDiv);

    return fieldColDiv;
}