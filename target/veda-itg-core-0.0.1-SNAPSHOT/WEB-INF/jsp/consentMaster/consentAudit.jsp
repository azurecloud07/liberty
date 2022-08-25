<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<spring:message code="search.label" var="searchLabel" />
<spring:message code="cancel.label" var="cancelLabel" />
<spring:message code="searchPanel.label" var="searchPanelLabel" />
<spring:message code="startDate.label" var="startDateLabel" />
<spring:message code="endDate.label" var="endDateLabel" />
<spring:message code="compareTo.label" var="compareToLabel" />

<spring:message code="app.kycMasterMenuName" var="kycMasterMenuName" />

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:choose>
	<c:when test="${! empty(auditData)}">
		<c:set var="panelBlock" value="display:none;"></c:set>
		<c:set var="panelAction" value="expand"></c:set>
		<c:set var="searchResult" value="true"></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="panelBlock" value="display:block;"></c:set>
		<c:set var="panelAction" value="collapse"></c:set>
		<c:set var="searchResult" value="false"></c:set>
	</c:otherwise>
</c:choose>

<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar search-page-bar">
			<ul class="page-breadcrumb pull-right">
				<li><a href="/digiKYC/dashboard/"><i class="fa fa-home"></i> Home <i class="fa fa-angle-right"></i></a></li>
				<li> ${kycMasterMenuName} <i class="fa fa-angle-right"></i></li>
                <li><a href="/digiKYC/kyc/consent/search/"> Consent Master<i class="fa fa-angle-right"></i></a></li>
				<li>Audit</li>
			</ul>
			<!-- <h4>&nbsp;Consent Master</h4> -->
			<span class="header-scope">&nbsp;Consent Master</span>
		</div>
		<c:if test="${successFlag != null}">
			<c:choose>
				<c:when test="${successFlag == true  && fn:length(successMessage)>0}">
					<div class="alert alert-success alertHide" style="padding: 9px;">
						<i class="fa fa-check"></i>&nbsp;${successMessage}
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
					</div>
				</c:when>
				<c:when test="${successFlag == false && fn:length(successMessage)>0}">
					<div class="alert alert-danger alertHide" style="padding: 9px;">
						<i class="fa fa-warning"></i>&nbsp;${successMessage}
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
					</div>
				</c:when>
				<c:otherwise>
					<div class="alert alert-danger alertHide" style="padding: 9px;">
						<i class="fa fa-warning"></i>&nbsp;<spring:message code="label.exceptionMessage"></spring:message>. <spring:message code="label.sysAdmin"></spring:message>
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
					</div>
				</c:otherwise>
			</c:choose>
		</c:if>
		<div class="row">
			<div class="col-md-12">
				<div class="portlet-body form">
					<div class="pull-right">

						<button type="button" id="searchButton" class="btn-itg btn btn-sm grey-gallery"><img src="/digiKYC/assets/global/img/search.png" /> ${searchLabel} </button>
						
						<%-- <button type="button" id="compareToButton" class="btn btn-sm grey-gallery">
							<em class="fa fa-check-circle"></em> ${compareToLabel}
						</button> --%>

						<button type="button" id="cancelButton" class="btn-itg btn btn-sm grey-gallery"><img src="/digiKYC/assets/global/img/clear.png" /></em> ${cancelLabel}
						</button>
						
					</div>
					<div class="clearfix margin-bottom-5"></div>
				</div>
			</div>
		</div>

		<form action="${contextPath}/kyc/consent/auditfilter" method="POST" id="frm" role="form" class="horizontal-form uk-form bt-flabels js-flabels" data-parsley-validate="true" data-parsley-errors-messages-disabled="true">
			<input type="hidden" id="auditConsentId" name="auditConsentId" value="${masterId}" />
			<div class="row">
				<div class="col-md-12">
					<div class="portlet search bg-inverse">
						<%-- <div class="portlet-title search-title">
							<div class="caption">
								<i class="fa fa-search"></i><span class="pull-left font-12 bolder">${searchPanelLabel}</span>
							</div>
							<div class="tools">
								<a href="javascript:;" class="${panelAction}"> </a>
							</div>
						</div> --%>
						<div class="portlet-body form">
							<div class="row">
								<div class="col-md-12">
									<div class="col-md-3">
										<div class="bt-form__wrapper">	
											<div class="form-group uk-width-1-1">
												<div class="bt-flabels__wrapper">
													<div id="dateRangeDiv" class="">
														<div class="input-group input-daterange" data-date-start-date="" data-date-format="mm/dd/yyyy">
															<div class="bt-flabels__wrapper generalPartnerErrorDiv">
																<label class="parsley_hide">${startDateLabel}</label>
																<input name="startDate" size="16" class="datePicker form-control input-sm" id="startDate" placeholder="Start Date" type="text" />
															</div>
															<span class="input-group-addon">to </span>
															<div class="bt-flabels__wrapper">
																<label class="parsley_hide">${endDateLabel}</label>
																<input name="endDate" class="datePicker form-control input-sm" id="endDate" placeholder="End Date" type="text" />
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		<form:form id="compare_frm" role="form" class="horizontal-form uk-form bt-flabels js-flabels">
		
		</form:form>

		<textarea id="consentAuditJson" style="display: none;">${auditData}</textarea>

		<c:if test="${!empty(auditData)}">
			<div class="row">
				<div class="col-md-12">
					<div id='jqxWidget'>
						<div id="consentJqxgrid"></div>
					</div>
				</div>
			</div>
		</c:if>
		<div class="clearfix margin-bottom-10"></div>
		<div class="clearfix margin-bottom-10"></div>
		<div class="clearfix margin-bottom-10"></div>
	</div>
</div>

<script>

	jQuery(document).ready(function() {
		jQuery("#master").addClass("active");
		jQuery("#subject").remove("active");
		jQuery("#dashboard").remove("active");
		
		dateRangePicker('startDate','endDate');
		/* if('${startDate}' != '') {
			$('#startDate').datepicker("setDate", '${startDate}');
		}
		
		if('${endDate}' != '') {
			$('#endDate').datepicker("setDate", '${endDate}');
		} */
	});

	$(window).bind("load", function() {
		
		if($("#consentAuditJson").val() != null && $("#consentAuditJson").val() != undefined && $("#consentAuditJson").val() != "") {
			var consentAuditJson = JSON.parse($("#consentAuditJson").val());
			console.log("consentAuditJson:::" + JSON.stringify(consentAuditJson));
			var consentDataSource =
			{
				datatype: "json",
				localdata: consentAuditJson,
				datafields: [
								{ name: 'modifiedDate', type: 'date'},
								{ name: 'version', type: 'string'},
								{ name: 'modifiedBy', type: 'string'},
								{ name: 'ipAddress', type: 'string'},
								{ name: 'consentName', 		type: 'string'},
								{ name: 'consentCode', 		type: 'string'},
								{ name: 'consentDescription', 		type: 'string'},							
								{ name: 'effectiveDate', 	type: 'date'},
								{ name: 'effectiveEndDate', type: 'date'},
								{ name: 'typeOfCounterpartyName', 	type: 'string'},
								{ name: 'auditDate', 	type: 'date'},
								{ name: 'endDate', type: 'date'},
								{ name: 'transactionActivity', 	type: 'string'},
								{ name: 'workFlowStatus', type: 'string'},
								{ name: 'active', type: 'string'},
								{ name: 'action', type: 'string'},
								{ name:	'auditId', type: 'string'}
							],
			};
			var consentDataAdapter = new $.jqx.dataAdapter(consentDataSource);
			var cellRendererWithBackgroundColor = function (row, column, value) {
                //console.log("documentAuditJson.row :: " + JSON.stringify(necTemplateAuditJson[row]));
                var updatedFieldsArray = consentAuditJson[row].updatedFields;
                //console.log("updatedFieldsArray.length :: " + updatedFieldsArray.length);
                for(var i = 0; i < updatedFieldsArray.length; i++) {
                	if(updatedFieldsArray[i] === column && column != "modifiedDate" && column != "modifiedBy" && column != "version" && column != "action") {
						console.log("Inside if");
						return 'set-grid-cell-yellow';
                    }
                }
                //return defaultHtml;
                return '';
          	} 
			// Create jqxGrid
			var windowHeight = $(window).height();
			$("#consentJqxgrid").jqxGrid(
			{
				width: '100%',
				source: consentDataAdapter,
				autoloadstate: false,
				autosavestate: false,
				groupable: true,
				groupsexpandedbydefault: true,
				sortable: true,
				pageable: true,
				theme: 'ITGtheme',
				height: windowHeight - 250,
				//--selectionmode: 'checkbox',
				selectionmode: 'multiplecellsextended',
				showfilterrow: true,
				filterable: true, 
				enabletooltips: true,
		        columnsresize: true,
		        columnsreorder: true,
		        rowsheight: 50,
				columns: [
				  { text: 'Updated At', 		datafield: 'modifiedDate', 	filtertype: 'input', width: '08%', align: 'left', cellsformat: 'dd-MMM-yyyy', cellclassname: cellRendererWithBackgroundColor  },
				  { text: 'Version', 			datafield: 'version', 		filtertype: 'input', width: '08%', align: 'left', cellclassname: cellRendererWithBackgroundColor  },
				  { text: 'Updated By', 		datafield: 'modifiedBy', 		filtertype: 'input', width: '08%', align: 'left' , cellclassname: cellRendererWithBackgroundColor },
				  { text: 'Ip/Mac address', 	datafield: 'ipAddress', 		filtertype: 'input', width: '08%', align: 'left' , cellclassname: cellRendererWithBackgroundColor },
				  { text: 'Consent Name', 		datafield: 'consentName', 		filtertype: 'input', width: '08%', align: 'left' , cellclassname: cellRendererWithBackgroundColor },
				  { text: 'Consent Code', 		datafield: 'consentCode', 		filtertype: 'input', width: '08%', align: 'left' , cellclassname: cellRendererWithBackgroundColor },
				  { text: 'Consent Description',datafield: 'consentDescription',filtertype: 'input', width: '12%', align: 'left' , cellclassname: cellRendererWithBackgroundColor },		
				  { text: 'Effective Date', 	datafield: 'effectiveDate', 	filtertype: 'input', width: '08%', align: 'left', cellsformat: 'dd-MMM-yyyy' , cellclassname: cellRendererWithBackgroundColor },
				  { text: 'Effective End Date', datafield: 'effectiveEndDate', 	filtertype: 'range', width: '08%', align: 'left', cellsformat: 'dd-MMM-yyyy' , cellclassname: cellRendererWithBackgroundColor },
				  { text: 'Counter Party', 		datafield: 'typeOfCounterpartyName', 		filtertype: 'input', width: '08%', align: 'left' , cellclassname: cellRendererWithBackgroundColor },
				  { text: 'Audit Date', 	    datafield: 'auditDate', 	filtertype: 'input', width: '08%', align: 'left', cellsformat: 'dd-MMM-yyyy' , cellclassname: cellRendererWithBackgroundColor },
				  { text: 'End Date',           datafield: 'endDate', 	filtertype: 'range', width: '08%', align: 'left', cellsformat: 'dd-MMM-yyyy' , cellclassname: cellRendererWithBackgroundColor },
				  { text: 'Transaction Activity',datafield: 'transactionActivity', 		filtertype: 'input', width: '10%', align: 'left' , cellclassname: cellRendererWithBackgroundColor },
				  { text: 'Workflow Status', 	datafield: 'workFlowStatus', 			filtertype: 'input', width: '08%', align: 'left' , cellclassname: cellRendererWithBackgroundColor },
				  { text: 'Status', 			datafield: 'active', 			filtertype: 'input', width: '08%', align: 'left' , cellclassname: cellRendererWithBackgroundColor , enabletooltips:false},
				  { text: 'Action', 			datafield: 'action', 			filtertype: 'input', width: '08%', align: 'left' , cellclassname: cellRendererWithBackgroundColor , enabletooltips:false},
				  { text: 'Hidden', 			datafield: 'auditId', 		filtertype: 'input', 	width: '10%', align: 'left', editable: false,width: 0, hidden:true}
				],
				pageSize:consentAuditJson.length,
				pageSizeOptions:["5","10","20",consentAuditJson.length]				
			});
		}
	});
	
	$('#searchButton').click(function() {
		var id = $("#auditConsentId").val();
		_paq.push(['trackEvent', 'ConsentMaster', 'SearchFilter','Filtering audit consent']);
		$('#frm').append('<input type="hidden" name="auditConsentId" value="' +id+ '" />');
		$('#frm').submit();
		buffer();
	});
	
	$('#clearButton').click(function() {
		_paq.push(['trackEvent', 'ConsentMaster', 'Clear','Clearing audit filter']);
		location.href = "${contextPath}/kyc/consent/search";
		buffer();
	});
	
	function getAuditViewPage(id) {
		_paq.push(['trackEvent', 'ConsentMaster', 'AuditView','Viewing audit view consent']);
		window.open("${contextPath}/kyc/consent/audit/view/" + id, "vedaNewWindow", "toolbar=no, scrollbars=yes, resizable=no, top=0, left=0, width=1200, height=800");
	}
	
	$('#cancelButton').click(function() {
		_paq.push(['trackEvent', 'ConsentMaster', 'Clear','Clearing audit filter']);
		location.href = "${contextPath}/kyc/consent/search";
		buffer();
	});
	
	$('#compareToButton').click(function() {
		
		var consentIdArray = [];
		
		var selectedrowindexs = $("#consentJqxgrid").jqxGrid('getselectedrowindexes');
		
		if(selectedrowindexs.length > 0){
			for (var i = 0; i < selectedrowindexs.length; i++) {									
			
				if (typeof selectedrowindexs[i] === 'undefined' || selectedrowindexs[i] === null) {
					console.log("i: " + i);
					console.log("skipping element: " + selectedrowindexs[i]);							
				}else{					
					var data = $('#consentJqxgrid').jqxGrid('getrowdata', selectedrowindexs[i]);
					
					consentIdArray.push(data.auditId);
					console.log("auditId:::" + data.auditId);
				}
			}			
		}
		console.log("consentIdArray:::: " + consentIdArray);
		console.log("consentIdArray length:::"+consentIdArray.length);
		if(consentIdArray.length > 1){
			$('#compare_frm').attr("action", "${contextPath}/kyc/consent/compareTo");
			$('#compare_frm').attr("method", "post");
			$('#compare_frm').append('<input type="hidden" name="consentIds" value="' +consentIdArray+ '" />');
			$('#compare_frm').submit();
		}else{
			bootbox.confirm({
	            message: "Please select at least two records!",
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
		        		
		        	}
		        }
			});
		}
		
		//--buffer();
		//--window.open("${contextPath}/kyc/consent/compareTo/"+consentIdArray, "vedaNewWindow", "toolbar=no, scrollbars=yes, resizable=no, top=0, left=0, width=1200, height=800");
		
	});
	
</script>