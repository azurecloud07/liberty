$(document).ready(function() {
	
	// hide messages after 5 seconds
	setTimeout(function() {
        $(".alertHide").hide()
    }, 5000);
	
	$(document).on('keyup','#remarkContent',function(){
	   //get the value of the input text
	   var data= $('#remarkContent').val();
	   console.log("data :: " + data);
	   //replace the special characters to '' 
	   var dataFull = data.replace(/[^\w\s]/gi, '');
	   //set the new value of the input text without special characters
	   console.log("dataFull :: " + dataFull);
	   dataFull = data.replace(/[\[\]{}()'"]/g, '');
	   //set the new value of the input text without special characters
	   console.log("dataFull :: " + dataFull);

	   $( '#remarkContent' ).val(dataFull);
	
	});
	

	if($("#remarkHistoryViewJson").length != 0 && $("#remarkHistoryViewJson").val() != null && $("#remarkHistoryViewJson").val() != "") {
		var remarkHistorydata = $("#remarkHistoryViewJson").val();
		console.log("remarkHistorydata : " + JSON.stringify(remarkHistorydata));
		
		// prepare the remarkHistorydata
		var remarkHistorySource = {
			datatype : "json",
			localdata : remarkHistorydata,
			datafields : [ 
						   {name : 'remark',type : 'string'},
						   {name : 'createdDate',type : 'date'},
						   {name : 'createdBy',type : 'string'} 
						 ],
		};
		
		var remarkDataAdapter = new $.jqx.dataAdapter(remarkHistorySource);

		// Create jqxGrid
		$("#remarkHistoryJqxgrid").jqxGrid({
			autorowheight: true,
			autoheight: true,
			altrows: true,
			width: 500,
			source : remarkDataAdapter,
			columnsresize : true,
			rowsheight: 50,
			theme: 'ITGtheme',
			columns : [
						{ text: 'Remark', 		datafield: 'remark', 		filtertype: 'input', width: '50%', align: 'left'},
						{ text: 'Remark Date', 	datafield: 'createdDate', 	filtertype: 'input', width: '25%', align: 'left', cellsformat: 'dd-MMM-yyyy'},
						{ text: 'Remark By', 	datafield: 'createdBy', 	filtertype: 'input', width: '25%', align: 'left'}
					  ]
		});			
	}
});

function setUpdateWorkflowDetails(workflowId, state) {
	
	$('#workflowId').val(workflowId);
	$('#stateId').val(state);
	
	if(state == "CRDoneEstimated" || state == "CAPDone" || state == "TriggerKYC" || state == "GenerateFiling"){
		$('#remarkContent').attr('data-parsley-required', 'false');
	}else{
		$('#remarkContent').attr('data-parsley-required', 'true');
	}
	
	if(state == "CRDoneEstimated"){
		_paq.push(['trackEvent', 'Dashboard', 'Approve','Approve from dashboard']);
	} else if(state == "CRReturn") {
		_paq.push(['trackEvent', 'Dashboard', 'Return','Return from dashboard']);
	} else if(state == "CRReject") {
		_paq.push(['trackEvent', 'Dashboard', 'Reject','Reject from dashboard']);
	}
}

function updateWorkflow(contextPath) {
	
	var detailsObj = {};
	detailsObj.workflowId = $('#workflowId').val();
	detailsObj.state = $('#stateId').val();
	detailsObj.masterId = $('#masterId').val();
	detailsObj.remark = $('#remarkContent').val();
	
	console.log(JSON.stringify(detailsObj));
	//console.log(detailsObj);
		
	$('#frm').parsley().validate();
	var response = $('#frm').parsley().isValid();
	if (response){
		$('#remarkModalId').modal('toggle');
		$('#frm').append("<input type='hidden' name='detailsObj' value='" + JSON.stringify(detailsObj) + "' />");
		$('#frm').prop("action", contextPath + "/dashboard/workflow/update");
		$('#frm').prop("method", "post");
		$('#frm').submit();
		buffer();
	}
		
}

$("#remarkContent").keyup(function(){
	var $th = $(this);
	var str = $th.val();
	specialCharCount = checkOnlyOneSpecialChar($th.val());
	if(specialCharCount>0){
		$th.val(str.slice(0, -1));
	}
});

function checkOnlyOneSpecialChar(string){
	var specialChars = "'\""
	var count = 0;
	for(i = 0 ; i < string.length; i++){
		if(specialChars.indexOf(string[i]) > -1 ){
			count++;
		}
	}
    return count;
}

function buffer() {
	var dht = $(document).height();
	var dwt = $(document).width();
	$("#activity_pane").height(dht);
	$("#activity_pane").width(dwt);
	jQuery('#activity_pane').showLoading({
		'addClass':'loading-indicator',
		'indicatorZIndex' : 15000,
		'overlayZIndex': 15000,
	});
}

function unbuffer() {
	$("#activity_pane").height(0);
	$("#activity_pane").width(0);
	jQuery('#activity_pane').hideLoading();
}

var unflatten = function(data) {
    "use strict";
    if (Object(data) !== data || Array.isArray(data)) return data;
    var regex = /\.?([^.\[\]]+)|\[(\d+)\]/g,
        resultholder = {};
    for (var p in data) {
        var cur = resultholder,
            prop = "",
            m;
        while (m = regex.exec(p)) {
            cur = cur[prop] || (cur[prop] = (m[2] ? [] : {}));
            prop = m[2] || m[1];
        }
        cur[prop] = data[p];
    }
    return resultholder[""] || resultholder;
};

var flatten = function(data) {
    var result = {};
    function recurse (cur, prop) {
        if (Object(cur) !== cur) {
            result[prop] = cur;
        } else if (Array.isArray(cur)) {
            var element = document.getElementsByName(prop)[0];
            if(element!=undefined && element.type == "select-multiple"){
        		var arr = [];
        		for(var i=0, l=cur.length; i<l; i++)
                    arr.push(cur[i]);
        		result[prop] = arr;
        	}
        	else{for(var i=0, l=cur.length; i<l; i++)
                 recurse(cur[i], prop + "[" + i + "]");
        	}if (l == 0)
                result[prop] = [];
        } else {
            var isEmpty = true;
            for (var p in cur) {
                isEmpty = false;
                recurse(cur[p], prop ? prop+"."+p : p);
            }
            if (isEmpty && prop)
                result[prop] = {};
        }
    }
    recurse(data, "");
    return result;
}

var setFormData = function(formClass,formObject){
	var $form = $("."+formClass);
	$form.deserialize(formObject,function(){});
}

var getFormData = function(formId) {
    
	$("select[multiple='multiple']").each(function () {
       var val = $("[name='"+this.name+"']").val()
       if(val == null || val == "" || val == undefined)
    	   $("[name='"+this.name+"']").prepend("<option value='' selected='selected'></option>");
    });
	
	$("input[type=checkbox]").each(function () {
		if(this.name.split(".")[1] == sameTargetContactCode)
			$('[name="'+this.name+'"]').attr('disabled',false);
		var val = $("[name='"+this.name+"']").val();
		console.log("type=checkbox:val :: " + val);
		if(!$("[name='"+this.name+"']").is(":checked")){
			$("[name='"+this.name+"']").val(0);
			$('[name="'+this.name+'"]').attr('checked',true);
		}
	});
	
	var fieldSet = {};
    var x = $('#' + formId).serializeArray();
    $.each(x, function(i, field) {
    	var element = document.getElementsByName(field.name);
    	if(fieldSet[field.name] && element[0].type == "select-multiple"){
    		var modifiedArray = [];
    		if(Array.isArray(fieldSet[field.name])){
    			$.each(fieldSet[field.name], function(n, val) {
    				modifiedArray.push(val);
    			});
    			modifiedArray.push(field.value);
    		}else{
    			modifiedArray.push(fieldSet[field.name]);
    			modifiedArray.push(field.value);
    		}
    		fieldSet[field.name] = modifiedArray;
    	}else{
    		fieldSet[field.name] = field.value;
    	}
    });
    return fieldSet;
}

var getKYCData = function(formId) {
	var fieldSet = {};
    var x = $('#' + formId).serializeArray();
    $.each(x, function(i, field) {
    	var element = document.getElementsByName(field.name);
    	if(fieldSet[field.name] && element[0].type == "select-multiple"){
    		var modifiedArray = [];
    		if(Array.isArray(fieldSet[field.name])){
    			$.each(fieldSet[field.name], function(n, val) {
    				modifiedArray.push(val);
    			});
    			modifiedArray.push(field.value);
    		}else{
    			modifiedArray.push(fieldSet[field.name]);
    			modifiedArray.push(field.value);
    		}
    		fieldSet[field.name] = modifiedArray;
    	}else{
    		fieldSet[field.name] = field.value;
    	}
    });
    return fieldSet;
}

var ajaxCallBack = function(method, url, JSONObject, dataType, callBack) {
    buffer();
    if (JSONObject != "")
        JSONObject = JSON.stringify(JSONObject);

    jQuery.ajax({
        type: method,
        url: url,
        contentType: "application/json; charset=utf-8",
        dataType: dataType,
        data: JSONObject,
        success: function(response) {
            console.log("## ajax success response : " + response);
            unbuffer();
            callBack(response);
        },
        failure: function(response) {
            console.log("## ajax failure response : " + response);
            unbuffer();
        },
        error: function(response) {
            console.log("## ajax error response : " + response);
            unbuffer();
        }
    });
};

var ajaxFormData = function(method, url, formData, callBack) {
	buffer();
    jQuery.ajax({
        type: method,
        url: url,
        contentType: false,
        processData: false,
        encType: 'multipart/form-data',
        data: formData,
        success: function(response) {
            console.log("## ajax success response : " + response);
            unbuffer();
            callBack(response);
        },
        failure: function(response) {
            console.log("## ajax failure response : " + response);
            unbuffer();
        },
        error: function(response) {
            console.log("## ajax error response : " + response);
            unbuffer();
        }
    });
};

// used on menu's
$('.loading-buffer').click(function() {
	buffer();
});

/*
var data = getFormData("form1");
ajaxCallBack("POST","url",data,"json",function(response){
	
});

var data = getFormData("form1");

var formData = new FormData();
if(document.getElementById('fileId').files.length!=0)
	formData.append('name',$('input[type=file]')[0].files[0]);
	
formData.append('name',new Blob([JSON.stringify(data)], {
	type : 'application/json'
}));

ajaxFormData("POST","url",formData,function(response){
	
});
*/

function getFile(fileId, fileName, contextPath){
	scroolTop();
	buffer();
	var fileObject = {};
	fileObject.fileId = fileId;
	fileObject.fileName = fileName;
	console.log("fileObject :: " + JSON.stringify(fileObject));
	var success = false;
	$.ajax({
        url : contextPath + '/getDocument',
        type : 'POST',
        data : 'fileData='+JSON.stringify(fileObject),
        responseType: 'arraybuffer',
        success : function(response, textStatus, jQxhr) {
        	console.log("response::" + response);
        	var fileObject = JSON.parse(response);
        	showDoc(fileObject,contextPath);
        	unbuffer();
        },
        error : function(jqXhr, textStatus, errorThrown) {
            console.log(errorThrown);
            unbuffer();
        }
    });
	
}

function getFileInByteArray(fileId, fileName, contextPath){
	var fileObject = {};
	fileObject.fileId = fileId;
	fileObject.fileName = fileName;
	var fileByteArray = null;
	console.log("fileObject :: " + JSON.stringify(fileObject));
	$.ajax({
        url : contextPath + '/getDocument',
        type : 'POST',
        async: false,
        data : 'fileData='+JSON.stringify(fileObject),
        responseType: 'arraybuffer',
        success : function(response, textStatus, jQxhr) {
        	var fileObject = JSON.parse(response);
        	fileByteArray = fileObject.fileByteArray;
        },
        error : function(jqXhr, textStatus, errorThrown) {
            console.log(errorThrown);
            unbuffer();
        }
    });
    return fileByteArray;
}
function showDoc(fileObject, contextPath){
	buffer();
	console.log("Inside showDoc");
	try{
		var fileName = encodeURIComponent(fileObject.fileName);
		var filePath = contextPath + "/pdfViewer/"+fileName;
		// var filePath = contextPath + "/pdfViewer/"+fileObject.fileName;
		var extension = fileObject.fileName.substr((fileObject.fileName.lastIndexOf('.')+1));
		if(extension == 'docx' || extension == 'doc' || extension == 'msg')
			window.location.href = filePath;
		else
			window.open(filePath, "itgPdfViewerWindow", "toolbar=no, scrollbars=yes, resizable=no, top=0, left=0, width=1200, height=800");
	}catch(err){
		console.log(err.message);
	}
	unbuffer();
}

var mimeTypes = {"a":"application/octet-stream","ai":"application/postscript","aif":"audio/x-aiff","aifc":"audio/x-aiff","aiff":"audio/x-aiff","au":"audio/basic","avi":"video/x-msvideo","bat":"text/plain","bin":"application/octet-stream","bmp":"image/x-ms-bmp","c":"text/plain","cdf":"application/x-cdf","csh":"application/x-csh","css":"text/css","dll":"application/octet-stream","doc":"application/msword","dot":"application/msword","dvi":"application/x-dvi","eml":"message/rfc822","eps":"application/postscript","etx":"text/x-setext","exe":"application/octet-stream","gif":"image/gif","gtar":"application/x-gtar","h":"text/plain","hdf":"application/x-hdf","htm":"text/html","html":"text/html","jpe":"image/jpeg","jpeg":"image/jpeg","jpg":"image/jpeg","js":"application/x-javascript","ksh":"text/plain","latex":"application/x-latex","m1v":"video/mpeg","man":"application/x-troff-man","me":"application/x-troff-me","mht":"message/rfc822","mhtml":"message/rfc822","mif":"application/x-mif","mov":"video/quicktime","movie":"video/x-sgi-movie","mp2":"audio/mpeg","mp3":"audio/mpeg","mp4":"video/mp4","mpa":"video/mpeg","mpe":"video/mpeg","mpeg":"video/mpeg","mpg":"video/mpeg","ms":"application/x-troff-ms","nc":"application/x-netcdf","nws":"message/rfc822","o":"application/octet-stream","obj":"application/octet-stream","oda":"application/oda","pbm":"image/x-portable-bitmap","pdf":"application/pdf","pfx":"application/x-pkcs12","pgm":"image/x-portable-graymap","png":"image/png","pnm":"image/x-portable-anymap","pot":"application/vnd.ms-powerpoint","ppa":"application/vnd.ms-powerpoint","ppm":"image/x-portable-pixmap","pps":"application/vnd.ms-powerpoint","ppt":"application/vnd.ms-powerpoint","pptx":"application/vnd.ms-powerpoint","ps":"application/postscript","pwz":"application/vnd.ms-powerpoint","py":"text/x-python","pyc":"application/x-python-code","pyo":"application/x-python-code","qt":"video/quicktime","ra":"audio/x-pn-realaudio","ram":"application/x-pn-realaudio","ras":"image/x-cmu-raster","rdf":"application/xml","rgb":"image/x-rgb","roff":"application/x-troff","rtx":"text/richtext","sgm":"text/x-sgml","sgml":"text/x-sgml","sh":"application/x-sh","shar":"application/x-shar","snd":"audio/basic","so":"application/octet-stream","src":"application/x-wais-source","swf":"application/x-shockwave-flash","t":"application/x-troff","tar":"application/x-tar","tcl":"application/x-tcl","tex":"application/x-tex","texi":"application/x-texinfo","texinfo":"application/x-texinfo","tif":"image/tiff","tiff":"image/tiff","tr":"application/x-troff","tsv":"text/tab-separated-values","txt":"text/plain","ustar":"application/x-ustar","vcf":"text/x-vcard","wav":"audio/x-wav","wiz":"application/msword","wsdl":"application/xml","xbm":"image/x-xbitmap","xlb":"application/vnd.ms-excel","xls":"application/vnd.ms-excel","xlsx":"application/vnd.ms-excel","xml":"text/xml","xpdl":"application/xml","xpm":"image/x-xpixmap","xsl":"application/xml","xwd":"image/x-xwindowdump","zip":"application/zip"}

$(document).on('keydown','.datePicker',function(e){
	if (e.keyCode != 9)
		return false;
});

var scroolTop = function(){
	document.body.scrollTop = 0;
	document.documentElement.scrollTop = 0;
}

function compareArrayString(ar1, ar2) { 
    ar1.sort(); 
    ar2.sort(); 
    if(ar1.length != ar2.length) 
        return false; 
      
    for(var i = 0; i < ar1.length; i++) { 
        if (ar1[i] != ar2[i]) 
            return false; 
    } 
    return true; 
}

var compareSimpleJson = function(obj1,obj2){
	var flag=true;
	if(Object.keys(obj1).length==Object.keys(obj2).length){
	    for(key in obj1) { 
	        if(obj1[key] == obj2[key]) {
	            continue;
	        }
	        else {
	            flag=false;
	            break;
	        }
	    }
	}else
	    flag=false;
	return flag;
}

var dateRangePicker = function(startDate,endDate){
	var dateFormat = "mm/dd/yy",
	from = $("#"+startDate)
		.datepicker({
			defaultDate: "+1w",
			changeMonth: true,
			changeYear: true,
			yearRange: '1800:+100',
			numberOfMonths: 1
		})
		.on( "change", function() {
			to.datepicker( "option", "minDate", getDate( this ) );
		}),
	to = $("#"+endDate).datepicker({
		defaultDate: "+1w",
		changeMonth: true,
		changeYear: true,
		yearRange: '1800:+100',
		numberOfMonths: 1
	})
	.on( "change", function() {
		from.datepicker( "option", "maxDate", getDate( this ) );
	});
	
	function getDate( element ) {
		var date;
		try {
			date = $.datepicker.parseDate( dateFormat, element.value );
		} catch( error ) {
			date = null;
		}
		return date;
	}
}

var getGridData = function(gridId){
 	var griddata = $('#'+gridId).jqxGrid('getdatainformation');
 	var rows = [];
 	for (var i = 0; i < griddata.rowscount; i++)
 		rows.push($('#'+gridId).jqxGrid('getrenderedrowdata', i));
 	return rows;
}

var getObjectValue = function(objectKey,object){
	try{
		if(objectKey != null && object != null && object.hasOwnProperty(objectKey) && object[objectKey] != null && object[objectKey] != "" && object[objectKey] != undefined)
			return object[objectKey];
	}catch(err){
		console.log(err.message)
	}
	return null;
}

var getSimplifiedDate = function(date) {
	if(date != '') {
		var monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
		var date = new Date(date);
		date.setDate(date.getDate() - 0);
		date = date.getDate()+"-"+monthNames[date.getMonth()]+"-"+date.getFullYear();
	}
	return date;
}
//Disabling future dates in datepicker
/*$(document).ready(function () {
    var today = new Date();
    $('.date-picker').datepicker({
        format: 'mm/dd/yyyy',
        autoclose:true,
        endDate: "today",
        maxDate: today
    }).on('changeDate', function (ev) {
            $(this).datepicker('hide');
        });

    $('.date-picker').keyup(function () {
        if (this.value.match(/[^0-9]/g)) {
            this.value = this.value.replace(/[^0-9^-]/g, '');
        }
    });
});*/

shortcut.add("F2", function () {
    var contextPath = $("#contextPath").val();
    var pageURL = $(location).attr("href");

    $.ajax({
        url: contextPath + "/helpDoc",
        type: "POST",
        data: "pageURL=" + pageURL,
        success: function (result) {
            console.log(result);
            if(result != "" && result != null)
            	window.open(contextPath + result, "vedapeNewWindow", "toolbar=no, scrollbars=yes, resizable=no, top=0, left=0, width=1200, height=800");
        },
        error: function (jqXml, textStatus, errorThrown) {
            alert("Error: " + jqXml.responseText);
        },
    });
});

$('.cancel').on('click', function () {
	var classList = $(this).attr("class").split(/\s+/);
	var redirectTo = classList[1].split("-")[1];
	var contextPath = $("#contextPath").val();
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
        	if(result)
        		location.href = contextPath + "/" + redirectTo;
        }
	});
});
