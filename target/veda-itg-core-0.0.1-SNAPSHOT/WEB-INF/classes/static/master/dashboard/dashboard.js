var newKYCSubjectRequestData = JSON.parse($("#newKYCSubjectRequestData").val());
var newKYCReqDataCount = newKYCSubjectRequestData.length;
var inProgressKYCSubjectRequestData = JSON.parse($("#inProgressKYCSubjectRequestData").val());
var inProgressKYCReqDataCount = inProgressKYCSubjectRequestData.length;
var rejectedKYCSubjectRequestData = JSON.parse($("#rejectedKYCSubjectRequestData").val());
var inProgressReqDataCount = rejectedKYCSubjectRequestData.length;
var allKYCSubjectRequestData = newKYCSubjectRequestData.concat(inProgressKYCSubjectRequestData).concat(rejectedKYCSubjectRequestData);	
	
var newKYCRequestData = JSON.parse($("#newKYCRequestData").val());
var newKYCReqDataCount = newKYCRequestData.length;

	$(window).bind("load", function() {	
		console.log("-------in window load------ ");
		setTimeout(function() {
	        $(".alertHide").hide()
	    }, 5000);
		
		$("#kyc_subject_request_new_count").html(newKYCSubjectRequestData.length);
		$("#kyc_subject_request_progress_count").html(inProgressKYCSubjectRequestData.length);
		$("#kyc_subject_request_reject_count").html(rejectedKYCSubjectRequestData.length);
		$("#new_kyc_request_count").html(newKYCRequestData.length);
		
		newKYCSubjectRequestData.sort(sortByLatestRequestedDate);
		inProgressKYCSubjectRequestData.sort(sortByLatestRequestedDate);
		rejectedKYCSubjectRequestData.sort(sortByLatestRequestedDate);
		allKYCSubjectRequestData.sort(sortByLatestRequestedDate)
		
		/*======================= New Grid Starts =========================*/
		if($("#newMasterData").val() != ''){
			var newMasterData = JSON.parse($("#newMasterData").val());	
		}else{
			var newMasterData = $("#newMasterData").val();
		}
		newMasterData.sort(sortByLatestRequestedDate);
		var newMasterDataSource = 
		{
	        datatype: "json",
			localdata: newMasterData,
	        datafields: [
				{ name: 'requestId',		type: 'string'},
				{ name: 'masterTypeName', 	type: 'string'},
				{ name: 'name', 			type: 'string'},
				{ name: 'modifiedBy',		type: 'string'},
				{ name: 'requestDate',		type: 'date'},
				{ name: 'status', 			type: 'string'},
				{ name: 'action', 			type: 'string'}
			 ],
	    };
	    var newMasterDataAdapter = new $.jqx.dataAdapter(newMasterDataSource);

	    // Create jqxGrid
	    $("#jqxgridNewMaster").jqxGrid(
	    {
			width: '100%',
	        source: newMasterDataAdapter,
			autoloadstate: false,
	        autosavestate: false,
	        groupable: true,
			theme: 'ITGtheme',
			groupsexpandedbydefault: true,
			sortable: true,
	        pageable: true,
	        height: 500,
			selectionmode: 'multiplecellsextended',
			showfilterrow: true,
	        filterable: true,
	        enabletooltips: true,
	        columnsresize: true,
	        columnsreorder: true,
			rowsheight: 50,
	        columns: [
	          { text: 'Request Id', 	datafield: 'requestId', 	filtertype: 'input', 		width: '15%', align: 'center'},
			  { text: 'Master Type', 	datafield: 'masterTypeName',filtertype: 'input', 		width: '20%', align: 'center'},
			  { text: 'Name', 			datafield: 'name', 			filtertype: 'input', 		width: '25%', align: 'center'},
			  { text: 'Updated By', 	datafield: 'modifiedBy', 	filtertype: 'input', 		width: '10%', align: 'center'},
			  { text: 'Updated At', 	datafield: 'requestDate', 	filtertype: 'range', 		width: '10%', align: 'center', cellsformat: 'dd-MMM-yyyy HH:mm:ss'},
			  { text: 'Status', 		datafield: 'status', 		filtertype: 'checkedlist',	width: '10%', align: 'center', enabletooltips:false},
			  { text: 'Action', 		datafield: 'action', 		filtertype: 'input', 		width: '10%', align: 'center', enabletooltips:false}
	        ],
			pageSize:newMasterData.length,
			pageSizeOptions:["5","10","20",newMasterData.length]
	    });
	    $("#masters_new_count").html(newMasterData.length);
	    /*======================= New Grid Ends =========================*/
	    
	    /*======================= InProgress Grid Starts =========================*/
	    if($("#inProgressMasterData").val() != null && $("#inProgressMasterData").val() != ''){
	    	var inProgressMasterData = JSON.parse($("#inProgressMasterData").val());	
	    }else{
	    	var inProgressMasterData = $("#inProgressMasterData").val();
	    }
		inProgressMasterData.sort(sortByLatestRequestedDate);
	    //console.log("-------inProgressMasterData------ "+JSON.stringify(inProgressMasterData));
		 
	    var inProgressMasterDataSource =
	    {
				 datatype: "json",
				 localdata: inProgressMasterData,
				 datafields: [
		              { name: 'requestId',		type: 'string'},
		              { name: 'masterTypeName',	type: 'string'},
		              { name: 'name', 			type: 'string'},
		              { name: 'modifiedBy',		type: 'string'},
		              { name: 'requestDate',	type: 'date'},
		              { name: 'status', 		type: 'string'},
		              { name: 'action', 		type: 'string'}
		          ],
	    };
	    var inProgressMasterDataAdapter = new $.jqx.dataAdapter(inProgressMasterDataSource);

	    // Create jqxGrid
	    $("#jqxgridInProgressMaster").jqxGrid(
   		{
   			width: '100%',
	        source: inProgressMasterDataAdapter,
			autoloadstate: false,
	        autosavestate: false,
	        groupable: true,
			theme: 'ITGtheme',
			groupsexpandedbydefault: true,
			sortable: true,
	        pageable: true,
	        height: 500,
			selectionmode: 'multiplecellsextended',
			showfilterrow: true,
	        filterable: true,
	        enabletooltips: true,
	        columnsresize: true,
	        columnsreorder: true,
			rowsheight: 50,
	        columns: [
	          { text: 'Request Id', 	datafield: 'requestId', 	filtertype: 'input', 		width: '15%', align: 'center'},
			  { text: 'Master Type', 	datafield: 'masterTypeName',filtertype: 'input', 		width: '20%', align: 'center'},
			  { text: 'Name', 			datafield: 'name', 			filtertype: 'input', 		width: '25%', align: 'center'},
			  { text: 'Updated By', 	datafield: 'modifiedBy', 	filtertype: 'input', 		width: '10%', align: 'center'},
			  { text: 'Updated At', 	datafield: 'requestDate', 	filtertype: 'range', 		width: '10%', align: 'center', cellsformat: 'dd-MMM-yyyy HH:mm:ss'},
			  { text: 'Status', 		datafield: 'status', 		filtertype: 'checkedlist',	width: '10%', align: 'center', enabletooltips:false},
			  { text: 'Action', 		datafield: 'action', 		filtertype: 'input', 		width: '10%', align: 'center', enabletooltips:false}
	        ],
			pageSize:inProgressMasterData.length,
			pageSizeOptions:["5","10","20",inProgressMasterData.length]
   
   		});
	    $("#masters_progress_count").html(inProgressMasterData.length);
	    /*======================= InProgress Grid Ends =========================*/
	    

	    /*======================= Rejected Grid Starts =========================*/
	    if($("#rejectedMasterData").val() != null && $("#rejectedMasterData").val() != ''){
	    	var rejectedMasterData = JSON.parse($("#rejectedMasterData").val());	
	    }else{
	    	var rejectedMasterData = $("#rejectedMasterData").val();
	    }
		rejectedMasterData.sort(sortByLatestRequestedDate);
	    //console.log("-------rejectedMasterData------ "+JSON.stringify(rejectedMasterData));
		 
	    var rejectedMasterDataSource =
	    {
				 datatype: "json",
				 localdata: rejectedMasterData,
				 datafields: [
		              { name: 'requestId',		type: 'string'},
		              { name: 'masterTypeName',	type: 'string'},
		              { name: 'name', 			type: 'string'},
		              { name: 'modifiedBy',		type: 'string'},
		              { name: 'requestDate',	type: 'date'},
		              { name: 'status', 		type: 'string'},
		              { name: 'action', 		type: 'string'}
		          ],
	    };
	    var rejectedMasterDataAdapter = new $.jqx.dataAdapter(rejectedMasterDataSource);

	    // Create jqxGrid
	    $("#jqxgridRejectedMaster").jqxGrid(
   		{
   			width: '100%',
	        source: rejectedMasterDataAdapter,
			autoloadstate: false,
	        autosavestate: false,
	        groupable: true,
			theme: 'ITGtheme',
			groupsexpandedbydefault: true,
			sortable: true,
	        pageable: true,
	        height: 500,
			selectionmode: 'multiplecellsextended',
			showfilterrow: true,
	        filterable: true,
	        enabletooltips: true,
	        columnsresize: true,
	        columnsreorder: true,
			rowsheight: 50,
	        columns: [
	          { text: 'Request Id', 	datafield: 'requestId', 	filtertype: 'input', 		width: '15%', align: 'center'},
			  { text: 'Master Type', 	datafield: 'masterTypeName',filtertype: 'input', 		width: '20%', align: 'center'},
			  { text: 'Name', 			datafield: 'name', 			filtertype: 'input', 		width: '25%', align: 'center'},
			  { text: 'Updated By', 	datafield: 'modifiedBy', 	filtertype: 'input', 		width: '10%', align: 'center'},
			  { text: 'Updated At', 	datafield: 'requestDate', 	filtertype: 'range', 		width: '10%', align: 'center', cellsformat: 'dd-MMM-yyyy HH:mm:ss'},
			  { text: 'Status', 		datafield: 'status', 		filtertype: 'checkedlist',	width: '10%', align: 'center', enabletooltips:false},
			  { text: 'Action', 		datafield: 'action', 		filtertype: 'input', 		width: '10%', align: 'center', enabletooltips:false}
	        ],
			pageSize:rejectedMasterData.length,
			pageSizeOptions:["5","10","20",rejectedMasterData.length]
   
   		});
	    $("#masters_reject_count").html(rejectedMasterData.length);
	    /*======================= Rejected Grid Ends =========================*/
	    
	    
/* ======================== KYC Subject Request Start====================== */
	    
	    /*======================= New Grid Starts =========================*/
		/*
		if($("#newKYCSubjectRequestData").val() != null && $("#newKYCSubjectRequestData").val() != ''){
			var newKYCSubjectRequestData = JSON.parse($("#newKYCSubjectRequestData").val());	
		}else{
			var newKYCSubjectRequestData = $("#newKYCSubjectRequestData").val();
		}
		
		var newKYCSubjectRequestDataSource = 
		{
	        datatype: "json",
			localdata: newKYCSubjectRequestData,
	        datafields: [
				{ name: 'requestId',			type: 'string'},
				{ name: 'masterTypeName', 		type: 'string'},
				{ name: 'counterPartyType',		type: 'string'},
				{ name: 'name', 				type: 'string'},
				// { name: 'countryOfNationality', type: 'string'},
				{ name: 'modifiedBy',			type: 'string'},
				{ name: 'requestDate',			type: 'date'},
				{ name: 'status', 				type: 'string'},
				{ name: 'action', 				type: 'string'}
			 ],
	    };
	    var newKYCSubjectRequestDataAdapter = new $.jqx.dataAdapter(newKYCSubjectRequestDataSource);

	    // Create jqxGrid
	    $("#jqxgridNewKYCSubjectRequest").jqxGrid(
	    {
			width: '100%',
	        source: newKYCSubjectRequestDataAdapter,
			autoloadstate: false,
	        autosavestate: false,
	        groupable: true,
			theme: 'ITGtheme',
			groupsexpandedbydefault: true,
			sortable: true,
	        pageable: true,
	        height: 500,
			selectionmode: 'multiplecellsextended',
			showfilterrow: true,
	        filterable: true,
	        enabletooltips: true,
	        columnsresize: true,
	        columnsreorder: true,
			rowsheight: 50,
	        columns: [
	          { text: 'Request Id', 			datafield: 'requestId', 			filtertype: 'input', 		width: '10%', align: 'center'},
			  { text: 'Master Type', 			datafield: 'masterTypeName',		filtertype: 'input', 		width: '15%', align: 'center'},
			  { text: 'Counterparty(CP) Type', 	datafield: 'counterPartyType',		filtertype: 'input', 		width: '15%', align: 'center'},
			  { text: 'Name', 					datafield: 'name', 					filtertype: 'input', 		width: '20%', align: 'center'},
			 // { text: 'Country of Nationality',	datafield: 'countryOfNationality',	filtertype: 'input', 		width: '10%', align: 'center'},
			  { text: 'Requested By', 			datafield: 'modifiedBy', 			filtertype: 'input', 		width: '10%', align: 'center'},
			  { text: 'Request Date', 			datafield: 'requestDate', 			filtertype: 'range', 		width: '10%', align: 'center', cellsformat: 'dd-MMM-yyyy HH:mm:ss'},
			  { text: 'Status', 				datafield: 'status', 				filtertype: 'checkedlist',	width: '10%', align: 'center', enabletooltips:false},
			  { text: 'Action', 				datafield: 'action', 				filtertype: 'input', 		width: '10%', align: 'center', enabletooltips:false}
	        ],
			pageSize:newKYCSubjectRequestData.length,
			pageSizeOptions:["5","10","20",newKYCSubjectRequestData.length]
	    });
	    $("#kyc_subject_request_new_count").html(newKYCSubjectRequestData.length);
		*/
	    /*======================= New Grid Ends =========================*/
	    
	    /*======================= InProgress Grid Starts =========================*/
		/*
	   if($("#inProgressKYCSubjectRequestData").val() != null && $("#inProgressKYCSubjectRequestData").val() != ''){
	    	var inProgressKYCSubjectRequestData = JSON.parse($("#inProgressKYCSubjectRequestData").val());	
	    }else{
	    	var inProgressKYCSubjectRequestData = $("#inProgressKYCSubjectRequestData").val();
	    }
		
	    //console.log("-------inProgressKYCSubjectRequestData------ "+JSON.stringify(inProgressKYCSubjectRequestData));
		 
	    var inProgressKYCSubjectRequestDataSource =
	    {
				 datatype: "json",
				 localdata: inProgressKYCSubjectRequestData,
				 datafields: [
		              { name: 'requestId',			type: 'string'},
		              { name: 'masterTypeName',		type: 'string'},
		              { name: 'counterPartyType',	type: 'string'},
		              { name: 'name', 				type: 'string'},
		              { name: 'modifiedBy',			type: 'string'},
		              { name: 'requestDate',		type: 'date'},
		              { name: 'status', 			type: 'string'},
		              { name: 'action', 			type: 'string'}
		          ],
	    };
	    var inProgressKYCSubjectRequestDataAdapter = new $.jqx.dataAdapter(inProgressKYCSubjectRequestDataSource);

	    // Create jqxGrid
	    $("#jqxgridInProgressKYCSubjectRequest").jqxGrid(
   		{
   			width: '100%',
	        source: inProgressKYCSubjectRequestDataAdapter,
			autoloadstate: false,
	        autosavestate: false,
	        groupable: true,
			theme: 'ITGtheme',
			groupsexpandedbydefault: true,
			sortable: true,
	        pageable: true,
	        height: 500,
			selectionmode: 'multiplecellsextended',
			showfilterrow: true,
	        filterable: true,
	        enabletooltips: true,
	        columnsresize: true,
	        columnsreorder: true,
			rowsheight: 50,
	        columns: [
	          { text: 'Request Id', 	datafield: 'requestId', 	filtertype: 'input', 		width: '15%', align: 'center'},
			  { text: 'Master Type', 	datafield: 'masterTypeName',filtertype: 'input', 		width: '20%', align: 'center'},
			  { text: 'Counterparty(CP) Type', 	datafield: 'counterPartyType',		filtertype: 'input', 		width: '10%', align: 'center'},
			  { text: 'Name', 			datafield: 'name', 			filtertype: 'input', 		width: '25%', align: 'center'},
			  { text: 'Requested By', 	datafield: 'modifiedBy', 	filtertype: 'input', 		width: '10%', align: 'center'},
			  { text: 'Request Date', 	datafield: 'requestDate', 	filtertype: 'range', 		width: '10%', align: 'center', cellsformat: 'dd-MMM-yyyy HH:mm:ss'},
			  { text: 'Status', 		datafield: 'status', 		filtertype: 'checkedlist',	width: '10%', align: 'center', enabletooltips:false},
			  { text: 'Action', 		datafield: 'action', 		filtertype: 'input', 		width: '10%', align: 'center', enabletooltips:false}
	        ],
			pageSize:inProgressKYCSubjectRequestData.length,
			pageSizeOptions:["5","10","20",inProgressKYCSubjectRequestData.length]
   
   		});
	    $("#kyc_subject_request_progress_count").html(inProgressKYCSubjectRequestData.length);
		*/
	    /*======================= InProgress Grid Ends =========================*/
	    

	    /*======================= Rejected Grid Starts =========================*/
		/*
	    if($("#rejectedKYCSubjectRequestData").val() != null && $("#rejectedKYCSubjectRequestData").val() != ''){
	    	var rejectedKYCSubjectRequestData = JSON.parse($("#rejectedKYCSubjectRequestData").val());	
	    }else{
	    	var rejectedKYCSubjectRequestData = $("#rejectedKYCSubjectRequestData").val();
	    }
		
	    //console.log("-------rejectedKYCSubjectRequestData------ "+JSON.stringify(rejectedKYCSubjectRequestData));
		 
	    var rejectedKYCSubjectRequestDataSource =
	    {
				 datatype: "json",
				 localdata: rejectedKYCSubjectRequestData,
				 datafields: [
		              { name: 'requestId',		type: 'string'},
		              { name: 'masterTypeName',	type: 'string'},
		              { name: 'counterPartyType',		type: 'string'},
		              { name: 'name', 			type: 'string'},
		              { name: 'modifiedBy',		type: 'string'},
		              { name: 'requestDate',	type: 'date'},
		              { name: 'status', 		type: 'string'},
		              { name: 'action', 		type: 'string'}
		          ],
	    };
	    var rejectedKYCSubjectRequestDataAdapter = new $.jqx.dataAdapter(rejectedKYCSubjectRequestDataSource);

	    // Create jqxGrid
	    $("#jqxgridRejectedKYCSubjectRequest").jqxGrid(
   		{
   			width: '100%',
	        source: rejectedKYCSubjectRequestDataAdapter,
			autoloadstate: false,
	        autosavestate: false,
	        groupable: true,
			theme: 'ITGtheme',
			groupsexpandedbydefault: true,
			sortable: true,
	        pageable: true,
	        height: 500,
			selectionmode: 'multiplecellsextended',
			showfilterrow: true,
	        filterable: true,
	        enabletooltips: true,
	        columnsresize: true,
	        columnsreorder: true,
			rowsheight: 50,
	        columns: [
	          { text: 'Request Id', 	datafield: 'requestId', 	filtertype: 'input', 		width: '15%', align: 'center'},
			  { text: 'Master Type', 	datafield: 'masterTypeName',filtertype: 'input', 		width: '20%', align: 'center'},
			  { text: 'Counterparty(CP) Type', 	datafield: 'counterPartyType',		filtertype: 'input', 		width: '10%', align: 'center'},
			  { text: 'Name', 			datafield: 'name', 			filtertype: 'input', 		width: '25%', align: 'center'},
			  { text: 'Requested By', 	datafield: 'modifiedBy', 	filtertype: 'input', 		width: '10%', align: 'center'},
			  { text: 'Request Date', 	datafield: 'requestDate', 	filtertype: 'range', 		width: '10%', align: 'center', cellsformat: 'dd-MMM-yyyy HH:mm:ss'},
			  { text: 'Status', 		datafield: 'status', 		filtertype: 'checkedlist',	width: '10%', align: 'center', enabletooltips:false},
			  { text: 'Action', 		datafield: 'action', 		filtertype: 'input', 		width: '10%', align: 'center', enabletooltips:false}
	        ],
			pageSize:rejectedKYCSubjectRequestData.length,
			pageSizeOptions:["5","10","20",rejectedKYCSubjectRequestData.length]
   
   		});
	    $("#kyc_subject_request_reject_count").html(rejectedKYCSubjectRequestData.length);
		*/
	    /*======================= Rejected Grid Ends =========================*/
	    
	    /*======================= Incomplete KYC Counts =========================*/
		// $("#kyc_subject_request_incomplete_count").html($("#incompleteKYCRequestCount").val());
	    
		/*======================= Expiry Dashboard Count ===================*/
        // $("#new_kyc_request_count").html($("#expKYCSubjectCount").val());
        
	    /* ======================== KYC Subject Request End ======================= */
   
		if(sessionStorage.getItem("parentMenuId") != null && sessionStorage.getItem("menuChildId") != null) {
			$('#tabDetails li').removeClass("active");
			$('.tab-content div').removeClass("active in");
		
			var parentMenuId = sessionStorage.getItem("parentMenuId");
			var menuChildId = sessionStorage.getItem("menuChildId");
			$("#btnViewOgs").hide();
			if(menuChildId === '#kyc_subject_request_1') {
				// $('#kyc_subject_request').trigger("click");
				$("#btnViewOgs").show();
				var selectedOption;
				var filterKYCRequestData = [];
				$('#tabDetails a[href=#kyc_subject_request_1]').parent().addClass('active');
				$('#kyc_subject_request').addClass('active');
				$("#kyc_subject_request_1").addClass('active in');
				if(sessionStorage.getItem("kycCheckboxChildId") != null) {
					var kycCheckboxChildId = sessionStorage.getItem("kycCheckboxChildId");
					$('#'+kycCheckboxChildId).prop("checked", true);
					if(kycCheckboxChildId === 'newKYC') {
						selectedOption = $('<option class="newKYC"></option>').text("New "+newKYCSubjectRequestData.length);
						$(".selectStatus").css({"color": "#45b6af"});
						filterKYCRequestData = filterKYCRequestData.concat(newKYCSubjectRequestData);
					}
					else if(kycCheckboxChildId === 'inProgressKYC') {
						selectedOption = $('<option class="inProgressKYC"></option>').text("In Progress "+inProgressKYCSubjectRequestData.length);
						$(".selectStatus").css({"color": "#89c4f4"});
						filterKYCRequestData = filterKYCRequestData.concat(inProgressKYCSubjectRequestData);
					}
					else if(kycCheckboxChildId === 'rejectedKYC') {
						selectedOption = $('<option class="rejectedKYC"></option>').text("Rejected "+ rejectedKYCSubjectRequestData.length);
						$(".selectStatus").css({"color": "#89c4f4"});
						filterKYCRequestData = filterKYCRequestData.concat(rejectedKYCSubjectRequestData);
					}
					else if(kycCheckboxChildId === 'newKYCRequest') {
						selectedOption = $('<option class="newKYCRequest"></option>').text("New KYC Request "+ newKYCRequestData.length);
						$(".selectStatus").css({"color": "#89c4f4"});
						filterKYCRequestData = filterKYCRequestData.concat(newKYCRequestData);
					}
					$(".selectStatus").empty().append(selectedOption);
				}else {
					filterKYCRequestData = allKYCSubjectRequestData;
				}
				createJqxGrid(filterKYCRequestData);
				
			} else if(menuChildId === '#kyc_expiry_dashboard_1') {
				$('#kyc_expiry_dashboard').trigger("click");
			} else if(menuChildId === '#kyc_incomplete_records_1') {
				$('#kyc_incomplete_records').trigger("click");
			} else {
				$('#tabDetails .dropdown-menu a[href="'+menuChildId+'"]').parent().addClass('active');
				$('#'+parentMenuId).addClass('active');
				$(menuChildId).addClass('active in');
			}
		}else {
			if($('#masters').length){
				console.log("showing default");
			}else{
				$('#tabDetails li').removeClass("active");
				$('.tab-content div').removeClass("active in");
				
				$('#tabDetails .dropdown-menu a[href=#kyc_subject_request_1]').parent().addClass('active');
				$('#kyc_subject_request').addClass('active');
				$("#kyc_subject_request_1").addClass('active in');
			}
		}
	
		$('a[href="/digiKYC/logout"]').click(function (e) {
	    	sessionStorage.removeItem('parentMenuId');
	    	sessionStorage.removeItem('menuChildId');
			sessionStorage.removeItem('kycCheckboxChildId');
		});
	});
	
	$(document).ready(function() {
		
		jQuery("#dashboard").addClass("active");
		jQuery("#subject").remove("active");
		jQuery("#master").remove("active");
		
		$("#masters").addClass("active");
		
		/*shortcut.add("F2", function() {
		    $.ajax({
				url : $("#commonContextPathId").val() + '/helpDoc',
				type : 'POST',
				data : 'moduleCode=DASHBOARD',
				success : function(result) {
					console.log(result);
				},
				error : function(jqXml, textStatus, errorThrown) {
					alert('Error: ' + jqXml.responseText);
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
	});
	
	$('#tabDetails .dropdown-menu li a').click(function (e) {
		var parentMenuId = "";
		var menuChildId = "";
		 parentMenuId = $(this).parent().parent().parent().attr("id");
		 menuChildId = $(this).attr('href');
		 

		 sessionStorage.setItem("parentMenuId",parentMenuId);
		 sessionStorage.setItem("menuChildId",menuChildId);

	});
	
	$('#tabDetails a').click(function (e) {
		var parentMenuId = "";
		var menuChildId = "";
		 parentMenuId = $(this).parent().parent().attr("id");
		 menuChildId = $(this).attr('href');
		 
		 $("#btnViewOgs").hide();
		 if(menuChildId=="#kyc_subject_request_1"){
			 $("#btnViewOgs").show();
		 }
		 sessionStorage.setItem("parentMenuId",parentMenuId);
		 sessionStorage.setItem("menuChildId",menuChildId);
	});
	
	function getViewPage(contextPath, id, masterType, viewType) {
		
		if(viewType == "newView"){
			if(masterType == $("#documentLibraryTypeId").val()){
				_paq.push(['trackEvent', 'Dashboard', 'Document', 'Editing document from dashboard for Approval or Update.']);
				location.href = contextPath + "/dashboard/document/view/" + id;
			}else if(masterType == $("#proofTypeId").val()){
				_paq.push(['trackEvent', 'Dashboard', 'Proof', 'Editing proof from dashboard for Approval or Update.']);
				location.href = contextPath + "/dashboard/proof/view/" + id;	
			}else if(masterType == $("#documentDocumentTypeId").val()){
				_paq.push(['trackEvent', 'Dashboard', 'DefaultDocument', 'Editing default document from dashboard for Approval or Update.']);
				location.href = contextPath + "/dashboard/defaultDocument/view/" + id;
			}else if(masterType == $("#kycTemplateTypeId").val()){
				_paq.push(['trackEvent', 'Dashboard', 'KYCTemplate', 'Editing documents template from dashboard for Approval or Update.']);
				location.href = contextPath + "/dashboard/template/view/" + id;
			}else if(masterType == $("#kycDataTemplateTypeId").val()){
				_paq.push(['trackEvent', 'Dashboard', 'KYCDataTemplate', 'Editing data template from dashboard for Approval or Update.']);
				location.href = contextPath + "/dashboard/dataTemplate/view/" + id;
			}else if(masterType == $("#consentTypeId").val()){
				_paq.push(['trackEvent', 'Dashboard', 'Consent', 'Editing consent from dashboard for Approval or Update.']);
				location.href = contextPath + "/dashboard/consent/view/" + id;
			}else if(masterType == $("#kycSubjectTypeId").val()){
				_paq.push(['trackEvent', 'Dashboard', 'KYCSubject', 'Editing KYC subject from dashboard for Approval or Update.']);
				$('#frm').attr("action", contextPath + "/kyc/subject/review");
				$('#frm').append('<input type="hidden" name="subjectId" value="' +id+ '" />');
				$('#frm').attr("method", "post");
				$('#frm').submit();
			}
			
			buffer();
			
		}else if(viewType == "inProgressView" || viewType == "rejectedView"){
			if(masterType == $("#documentLibraryTypeId").val()){
				_paq.push(['trackEvent', 'Dashboard', 'Document', 'Viewing document from dashboard.']);
				window.open(contextPath + "/kyc/document/view/" + id, "vedaNewWindow", "toolbar=no, scrollbars=yes, resizable=no, top=0, left=0, width=1200, height=800");
			}else if(masterType == $("#proofTypeId").val()){
				_paq.push(['trackEvent', 'Dashboard', 'Proof', 'Viewing proof from dashboard.']);
				window.open(contextPath + "/kyc/proof/view/" + id, "vedaNewWindow", "toolbar=no, scrollbars=yes, resizable=no, top=0, left=0, width=1200, height=800");
			}else if(masterType == $("#documentDocumentTypeId").val()){
				_paq.push(['trackEvent', 'Dashboard', 'DefaultDocument', 'Viewing default document from dashboard.']);
				window.open(contextPath + "/kyc/defaultDocument/view/" + id, "vedaNewWindow", "toolbar=no, scrollbars=yes, resizable=no, top=0, left=0, width=1200, height=800");
			}else if(masterType == $("#kycTemplateTypeId").val()){
				_paq.push(['trackEvent', 'Dashboard', 'KYCTemplate', 'Viewing Documents template from dashboard.']);
				window.open(contextPath + "/kyc/template/view/" + id, "vedaNewWindow", "toolbar=no, scrollbars=yes, resizable=no, top=0, left=0, width=1200, height=800");
			}else if(masterType == $("#kycDataTemplateTypeId").val()){
				_paq.push(['trackEvent', 'Dashboard', 'KYCDataTemplate', 'Viewing Data template from dashboard.']);
				window.open(contextPath + "/kyc/dataTemplate/view/" + id, "vedaNewWindow", "toolbar=no, scrollbars=yes, resizable=no, top=0, left=0, width=1200, height=800");
			}else if(masterType == $("#consentTypeId").val()){
				_paq.push(['trackEvent', 'Dashboard', 'Consent', 'Viewing consent from dashboard.']);
				window.open(contextPath + "/kyc/consent/view/" + id, "vedaNewWindow", "toolbar=no, scrollbars=yes, resizable=no, top=0, left=0, width=1200, height=800");
			}else if(masterType == $("#kycSubjectTypeId").val()){
				_paq.push(['trackEvent', 'Dashboard', 'KYCSubject', 'Viewing KYC subject from dashboard.']);
				window.open(contextPath + "/kyc/subject/view/" + id, "vedaNewWindow", "toolbar=no, scrollbars=yes, resizable=no, top=0, left=0, width=1200, height=800");
			}
		}
		
	}
	
	function getKycRequestPage(contextPath, id, workFlowStatus, status) {
		if(workFlowStatus == "newView"){
			_paq.push(['trackEvent', 'Dashboard', 'KYCSubject', 'Editing KYC subject from dashboard for Approval or Update.']);
			$('#frm').attr("action", contextPath + "/dashboard/redirectToRequestPage");
			$('#frm').append('<input type="hidden" name="requestId" value="' +id+ '" />');
			$('#frm').append('<input type="hidden" name="isDashboardRequest" value="true" />');
			$('#frm').attr("method", "post");
			$('#frm').submit();
			buffer();
		}else if(workFlowStatus == "inProgressView" || workFlowStatus == "rejectedView"){
			_paq.push(['trackEvent', 'Dashboard', 'KYCSubject', 'Viewing KYC subject from dashboard.']);
			window.open(contextPath + "/kyc/subject/view/" + id, "vedaNewWindow", "toolbar=no, scrollbars=yes, resizable=no, top=0, left=0, width=1200, height=800");
		}
	}
	
	function getEditPage(contextPath, id, masterType) {
		
		if(masterType == $("#documentLibraryTypeId").val()){
			$('#frm').attr("action", contextPath + "/kyc/document/editPage");
			$('#frm').append('<input type="hidden" name="editDocumentId" value="' +id+ '" />');
		}else if(masterType == $("#proofTypeId").val()){
			$('#frm').attr("action", contextPath + "/kyc/proof/editPage");
			$('#frm').append('<input type="hidden" name="editProofId" value="' +id+ '" />');
		}else if(masterType == $("#documentDocumentTypeId").val()){
			$('#frm').attr("action", contextPath + "/kyc/defaultDocument/editPage");
			$('#frm').append('<input type="hidden" name="templateEditId" value="' +id+ '" />');
		}else if(masterType == $("#kycTemplateTypeId").val()){
			$('#frm').attr("action", contextPath + "/kyc/template/editPage");
			$('#frm').append('<input type="hidden" name="templateEditId" value="' +id+ '" />');
		}else if(masterType == $("#kycDataTemplateTypeId").val()){
			$('#frm').attr("action", contextPath + "/kyc/dataTemplate/editPage");
			$('#frm').append('<input type="hidden" name="templateEditId" value="' +id+ '" />');
		}else if(masterType == $("#consentTypeId").val()){
			$('#frm').attr("action", contextPath + "/kyc/consent/editPage");
			$('#frm').append('<input type="hidden" name="consentEditId" value="' +id+ '" />');
		}else if(masterType == $("#kycSubjectTypeId").val()){
			$('#frm').attr("action", contextPath + "/kyc/subject/editPage");
			$('#frm').append('<input type="hidden" name="subjectId" value="' +id+ '" />');
		}
		
		$('#frm').append('<input type="hidden" name="isDashboardRequest" value="true" />');
		$('#frm').attr("method", "post");
		$('#frm').submit();
		buffer();
	}
	
	function getNewKYCRequestProcessPage(contextPath, id) {
		_paq.push(['trackEvent', 'Dashboard', 'KYCSubject', 'Editing FCH KYC subject from dashboard.']);
		$('#frm').attr("method", "post");
		$('#frm').attr("action", contextPath + "/kyc/subject/kycProcess");
		$('#frm').append('<input type="hidden" name="requestNo" value="' +id+ '" />');
		$('#frm').append('<input type="hidden" name="isDashboardRequest" value="true" />');
		$('#frm').submit();
		buffer();
			
	}

/*======================= Expiry Dashboard start ===================*/
$('#kyc_expiry_dashboard').click(function() {
	
	_paq.push(['trackEvent', 'Dashboard', 'Expiry Dashboard']);
	
	$.ajax({
			url : $("#commonContextPathId").val() +"/dashboard/expiryDashboard",
			type : 'GET',
			dataType : 'text',
			contentType: "application/json; charset=utf-8",
			success : function(result) {
				
				var expKYCSubjectData = JSON.parse(result);
				var expKYCSubjectDataSource =
			    {
			        datatype: "array",
					localdata: expKYCSubjectData,
			      	datafields: [{name:"name",type: 'string'},{name:"counterPartyType",type: 'string'},{name:"proofName",type: 'string'},{ name: 'kycSubjectId', type: 'string'},{ name: 'documentName', type: 'string'},{ name: 'expiryDate', 	type: 'date'},{ name: 'status', type: 'string'},{ name: 'noOfDays', type: 'number'},{ name: 'action', type: 'string'}]
			    };
				
				var expKYCRequestDataAdapter = new $.jqx.dataAdapter(expKYCSubjectDataSource);
				
				var cellclass = function (row, datafield, value, rowdata) {
			    	if(datafield === 'status' && value === 'Expired') {
			    		return "blinking";
			    	} else if(datafield === 'status' && value === 'Expiring In') {
			    		return "blinkingOrange";
			    	}
			    }
			    
			    var groupsrenderer = function (text, group, expanded, data) {

					var text = ' <b>' + group + '</b>';
					if(group === 'Expired') {
						return '<div style="position: absolute; margin: 5px" class="blinking"><span>' + text + ' </span></div>';
			    	} else if(group === 'Expiring In') {
			    		return '<div style="position: absolute; margin: 5px" class="blinkingOrange"><span>' + text + ' </span></div>';
			    	}	
					
				};
				
		        $("#jqxgridExpiredRequest").jqxGrid({
		        	theme: 'ITGtheme',
					pageable: true,
			        showfilterrow: true,
			        filterable: true,
			        columnsresize: true,
			        columnsreorder: true,
					width: '100%',
					height: 500,
		            source: expKYCRequestDataAdapter,
		            groupable: true,
		            groupsrenderer: groupsrenderer,
					groupsexpandedbydefault: true,
					rowsheight: 50,
					sortable: true,
					ready: function () {
						$("#jqxgridExpiredRequest").jqxGrid('sortby', 'expiryDate', 'asc');
					},
		            columns: [
		              { text: 'Name', datafield: 'name' ,filtertype: 'input', align: 'center',width: '15%'},
		              { text: 'Subject Id', datafield: 'kycSubjectId' },
		              { text: 'Counterparty(CP) Type', datafield: 'counterPartyType' ,filtertype: 'input', align: 'center',width: '12%'},
		              { text: 'Proof Name', datafield: 'proofName' ,filtertype: 'input', align: 'center'},
		              { text: 'Document Name', datafield: 'documentName' },
		              { text: 'Expiry Date', filtertype: 'date', datafield: 'expiryDate' ,cellsformat: 'dd-MMM-yyyy'},
		              { text: 'Status', datafield: 'status', filtertype: 'input', align: 'center',cellclassname: cellclass, width: '12%'},
					  { text: 'Expiry days', datafield: 'noOfDays', filtertype: 'input', width: '8%', align: 'center'},
			          { text: 'Action', datafield: 'action', filtertype: 'action', align: 'center', exportable: false}
		            ],
		            groups: ['kycSubjectId'],
		            pageSize:expKYCSubjectData.length
					//pageSizeOptions:["5","10","20",expKYCSubjectData.length]
		        });
		        $("#jqxgridExpiredRequest").jqxGrid('sortby', 'expiryDate', 'asc');
			}
	});
});

var incompleteKYCRequestData = [];
var incompleteIndividualKYCData = [];
var incompleteEntityKYCData = [];
/*======================= Incomplete KYC Request Grid Starts =========================*/
$('#kyc_incomplete_records').click(function() {
	
	_paq.push(['trackEvent', 'Dashboard', 'Incomplete Records']);
	
	$('#checkboxesCounterparty input[type=checkbox]').attr('checked',false);
	$('#checkboxesCounterparty').css("display", "none");
	var reset = $('<option></option>').text("Counterparty Type");
	$(".selectStatusCounterparty").empty().append(reset);
	$(".selectStatusCounterparty").css({"color": "#B2B2B2"});
	
	$.ajax({
			url : $("#commonContextPathId").val() +"/dashboard/fetchIncompleteRecords",
			type : 'GET',
			dataType : 'text',
			contentType: "application/json; charset=utf-8",
			success : function(result) {
				incompleteKYCRequestData = JSON.parse(result);
				incompleteKYCRequestData.sort(sortByLatestRequestedDate);
				createIncompleteRecordsJqxGrid(incompleteKYCRequestData);
				
				incompleteIndividualKYCData = incompleteKYCRequestData.filter(function (el) {
						return el.counterPartyType == 'Individual'; 
					});
				incompleteIndividualKYCData.sort(sortByLatestRequestedDate);
				incompleteEntityKYCData = incompleteKYCRequestData.filter(function (el) {
						return el.counterPartyType == 'Non-individuals'; 
					});
				incompleteEntityKYCData.sort(sortByLatestRequestedDate);
				
				$("#incomplete_individual_kyc_progress_count").html(incompleteIndividualKYCData.length);
				$("#incomplete_entity_kyc_progress_count").html(incompleteEntityKYCData.length);
			}
	});
});


// All kyc records new, inprogress, rejected.
$('#kyc_subject_request').click(function() {
	
	_paq.push(['trackEvent', 'Dashboard', 'KYC Request']);
	
	$('#checkboxes input[type=checkbox]').attr('checked',false);
	$('#checkboxes').css("display", "none");
	var reset = $('<option></option>').text("Status");
	$(".selectStatus").empty().append(reset);
	$(".selectStatus").css({"color": "#B2B2B2"});
	createJqxGrid(allKYCSubjectRequestData);
});

var createJqxGrid = function(requestKYCData) {
	
	var requestDataSource =
	    {
				 datatype: "json",
				 localdata: requestKYCData,
				 datafields: [
		              { name: 'requestId',			type: 'string'},
		              { name: 'requestType',		type: 'string'},
		              { name: 'counterPartyType',	type: 'string'},
		              { name: 'name', 				type: 'string'},
		              { name: 'modifiedBy',			type: 'string'},
		              { name: 'requestDate',		type: 'date'},
		              { name: 'status', 			type: 'string'},
		              { name: 'action', 			type: 'string'}
		          ],
	    };
	    var requestDataAdapter = new $.jqx.dataAdapter(requestDataSource);

	    // Create jqxGrid
	    $("#jqxgridAllKYCSubjectRequest").jqxGrid(
   		{
   			width: '100%',
	        source: requestDataAdapter,
			autoloadstate: false,
	        autosavestate: false,
	        groupable: true,
			theme: 'ITGtheme',
			groupsexpandedbydefault: true,
			sortable: true,
	        pageable: true,
	        height: 500,
			selectionmode: 'multiplecellsextended',
			showfilterrow: true,
	        filterable: true,
	        enabletooltips: true,
	        columnsresize: true,
	        columnsreorder: true,
			rowsheight: 50,
	        columns: [
	          { text: 'Request Id', 	datafield: 'requestId', 	filtertype: 'input', 		width: '10%', align: 'center'},
			  { text: 'Request Type', 	datafield: 'requestType',filtertype: 'input', 		width: '12%', align: 'center'},
			  { text: 'Counterparty(CP) Type', 	datafield: 'counterPartyType',		filtertype: 'input', 		width: '13%', align: 'center'},
			  { text: 'Name', 			datafield: 'name', 			filtertype: 'input', 		width: '25%', align: 'center'},
			  { text: 'Updated By', 	datafield: 'modifiedBy', 	filtertype: 'input', 		width: '10%', align: 'center'},
			  { text: 'Updated At', 	datafield: 'requestDate', 	filtertype: 'range', 		width: '10%', align: 'center', cellsformat: 'dd-MMM-yyyy HH:mm:ss'},
			  { text: 'Status', 		datafield: 'status', 		filtertype: 'checkedlist',	width: '10%', align: 'center', enabletooltips:false},
			  { text: 'Action', 		datafield: 'action', 		filtertype: 'input', 		width: '10%', align: 'center', enabletooltips:false}
	        ],
			pageSize: requestKYCData.length,
			// pageSizeOptions:["5","10","20", requestKYCData.length]
   		});
}

$('#checkboxes input[type="checkbox"]').on('change', function() {
	
	$('input[type="checkbox"]').not(this).prop('checked', false);
	
	var checkboxes = document.getElementById("checkboxes");
	checkboxes.style.display = "none";
	
	var kycCheckboxChildId = $(this).attr('id');
	sessionStorage.setItem("kycCheckboxChildId", kycCheckboxChildId);
	
    var newChecked = $('#newKYC').is(':checked');
	var inProgressChecked = $('#inProgressKYC').is(':checked');
	var rejectedChecked = $('#rejectedKYC').is(':checked');
	var newKYCRequestChecked = $('#newKYCRequest').is(':checked');
	
	var selectedOption;
	if(newChecked) {
		selectedOption = $('<option class="newKYC"></option>').text("New "+newKYCSubjectRequestData.length);
		$(".selectStatus").css({"color": "#45b6af"});
		_paq.push(['trackEvent', 'Dashboard', 'KYC Request', 'New']);
	}
	else if(inProgressChecked) {
		selectedOption = $('<option class="inProgressKYC"></option>').text("In Progress "+inProgressKYCSubjectRequestData.length);
		$(".selectStatus").css({"color": "#89c4f4"});
		_paq.push(['trackEvent', 'Dashboard', 'KYC Request', 'In Progress']);
	}
	else if(rejectedChecked) {
		selectedOption = $('<option class="rejectedKYC"></option>').text("Rejected "+ rejectedKYCSubjectRequestData.length);
		$(".selectStatus").css({"color": "#89c4f4"});
		_paq.push(['trackEvent', 'Dashboard', 'KYC Request', 'Rejected']);
	}
	else if(newKYCRequestChecked) {
		selectedOption = $('<option class="newKYCRequest"></option>').text("New KYC Request "+ newKYCRequestData.length);
		$(".selectStatus").css({"color": "#89c4f4"});
	}
	else if(!newChecked && !inProgressChecked && !rejectedChecked && !newKYCRequestChecked) {
		selectedOption = $('<option></option>').text("Status");
		$(".selectStatus").css({"color": "#B2B2B2"});
		sessionStorage.removeItem("kycCheckboxChildId");
	}
	$(".selectStatus").empty().append(selectedOption);
	expanded = false;
	
	var filterKYCRequestData = [];
	
	if(newChecked) {
		filterKYCRequestData = filterKYCRequestData.concat(newKYCSubjectRequestData);
	}
	if(inProgressChecked) {
		filterKYCRequestData = filterKYCRequestData.concat(inProgressKYCSubjectRequestData);
	}
	if(rejectedChecked) {
		filterKYCRequestData = filterKYCRequestData.concat(rejectedKYCSubjectRequestData);
	}
	if(newKYCRequestChecked) {
		filterKYCRequestData = filterKYCRequestData.concat(newKYCRequestData);
	}
	if(!newChecked && !inProgressChecked && !rejectedChecked && !newKYCRequestChecked && !newKYCRequestChecked) {
		filterKYCRequestData = allKYCSubjectRequestData;
	}

	createJqxGrid(filterKYCRequestData);
});


var createIncompleteRecordsJqxGrid = function(incompleteKYCRequestData) {
	
	var incompleteKYCRequestDataSource = {
        datatype: "json",
		localdata: incompleteKYCRequestData,
        datafields: [
			{ name: 'requestId',			type: 'string'},
			{ name: 'requestType', 			type: 'string'},
			{ name: 'counterPartyType',		type: 'string'},
			{ name: 'name', 				type: 'string'},
			{ name: 'modifiedBy',			type: 'string'},
			{ name: 'requestDate',			type: 'date'},
			{ name: 'status', 				type: 'string'},
			{ name: 'dueDate',			    type: 'date'},
			{ name: 'action', 				type: 'string'}
		]
	};
	
	var incompleteKYCRequestDataAdapter = new $.jqx.dataAdapter(incompleteKYCRequestDataSource);
	
	// Create jqxGrid
	$("#jqxgridIncompleteKYCRequest").jqxGrid({
		width: '100%',
        source: incompleteKYCRequestDataAdapter,
		autoloadstate: false,
        autosavestate: false,
        groupable: true,
		theme: 'ITGtheme',
		groupsexpandedbydefault: true,
		sortable: true,
        pageable: true,
        height: 500,
		selectionmode: 'multiplecellsextended',
		showfilterrow: true,
        filterable: true,
        enabletooltips: true,
        columnsresize: true,
        columnsreorder: true,
		rowsheight: 50,
        columns: [
          { text: 'Request Id', 			datafield: 'requestId', 			filtertype: 'input', 		width: '10%', align: 'center'},
		  { text: 'Request Type', 			datafield: 'requestType',			filtertype: 'input', 		width: '10%', align: 'center'},
		  { text: 'Counterparty(CP) Type', 	datafield: 'counterPartyType',		filtertype: 'input', 		width: '10%', align: 'center'},
		  { text: 'Name',					datafield: 'name', 					filtertype: 'input', 		width: '20%', align: 'center'},
		  { text: 'Updated By', 			datafield: 'modifiedBy', 			filtertype: 'input', 		width: '10%', align: 'center'},
		  { text: 'Updated At', 			datafield: 'requestDate', 			filtertype: 'range', 		width: '10%', align: 'center', cellsformat: 'dd-MMM-yyyy HH:mm:ss'},
		  { text: 'Status', 				datafield: 'status', 				filtertype: 'checkedlist',	width: '10%', align: 'center', enabletooltips:false},
		  { text: 'Due Date', 			    datafield: 'dueDate', 			    filtertype: 'range', 		width: '10%', align: 'center', cellsformat: 'dd-MMM-yyyy HH:mm:ss'},
		  { text: 'Action', 				datafield: 'action', 				filtertype: 'input', 		width: '10%', align: 'center', enabletooltips:false}
        ],
		pageSize:incompleteKYCRequestData.length
		// pageSizeOptions : ["5","10","20",incompleteKYCRequestData.length]
	});
}

$('#checkboxesCounterparty input[type="checkbox"]').on('change', function() {
	
	$('input[type="checkbox"]').not(this).prop('checked', false);
	
	var checkboxes = document.getElementById("checkboxesCounterparty");
	checkboxes.style.display = "none";
	
    var individualCounterpartyChecked = $('#individualCounterparty').is(':checked');
	var entityCounterpartyChecked = $('#entityCounterparty').is(':checked');
	
	var selectedOption;
	if(individualCounterpartyChecked) {
		selectedOption = $('<option class="individualCounterparty"></option>').text("Individual "+incompleteIndividualKYCData.length);
		$(".selectStatusCounterparty").css({"color": "#89c4f4"});
		_paq.push(['trackEvent', 'Dashboard', 'Incomplete Records', 'Individual']);
	}
	else if(entityCounterpartyChecked) {
		selectedOption = $('<option class="entityCounterparty"></option>').text("Non-individuals "+incompleteEntityKYCData.length);
		$(".selectStatusCounterparty").css({"color": "#89c4f4"});
		_paq.push(['trackEvent', 'Dashboard', 'Incomplete Records', 'Non-Individual']);
	}
	else if(!individualCounterpartyChecked && !entityCounterpartyChecked) {
		selectedOption = $('<option></option>').text("Counterparty Type");
		$(".selectStatusCounterparty").css({"color": "#B2B2B2"});
	}
	$(".selectStatusCounterparty").empty().append(selectedOption);
	expandedCounterParty = false;
	
	var filterKYCRequestData = [];
	
	if(individualCounterpartyChecked) {
		filterKYCRequestData = incompleteIndividualKYCData;
	}
	if(entityCounterpartyChecked) {
		filterKYCRequestData = incompleteEntityKYCData;
	}
	if(!individualCounterpartyChecked && !entityCounterpartyChecked) {
		filterKYCRequestData = incompleteKYCRequestData;
	}

	createIncompleteRecordsJqxGrid(filterKYCRequestData);
});

function sortByLatestRequestedDate(a, b) {
    return new Date(b.requestDate).getTime() - new Date(a.requestDate).getTime();
}