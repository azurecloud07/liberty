<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
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
				<li><i class="fa fa-home"></i> <!-- <a href="#"> --> Home <!-- </a> --> <i
					class="fa fa-angle-right"></i></li>
				<li><!-- <a href="#"> -->${kycMasterMenuName}<!-- </a> --> <i class="fa fa-angle-right"></i></li>
                <li>Default Document<i class="fa fa-angle-right"></i></li>
				<li>Audit</li>
			</ul>
			<!-- <h4>&nbsp;Default Document</h4> -->
			<span class="header-scope">&nbsp;Default Document</span>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="portlet-body form">
					<div class="pull-right">

						<button type="button" id="searchButton" class="btn-itg btn btn-sm grey-gallery"><img src="/digiKYC/assets/global/img/search.png" /> ${searchLabel} </button>
						
						<%-- <button type="button" id="compareToButton" class="btn btn-sm grey-gallery">
							<em class="fa fa-check-circle"></em> ${compareToLabel}
						</button> --%>

						<button type="button" id="cancelButton" class="btn-itg btn btn-sm grey-gallery"><img src="/digiKYC/assets/global/img/clear.png" /> ${cancelLabel} </button>
						
					</div>
					<div class="clearfix margin-bottom-5"></div>
				</div>
			</div>
		</div>

		<form:form action="${contextPath}/kyc/defaultDocument/auditfilter" method="POST" id="frm" role="form" class="horizontal-form uk-form bt-flabels js-flabels" data-parsley-validate="true" data-parsley-errors-messages-disabled="true">
			<input type="hidden" id="auditTemplateId" name="auditTemplateId" value="${masterId}" />
			<div class="row">
				<div class="col-md-12">
					<div class="portlet search bg-inverse">
						<%-- <div class="portlet-title search-title">
							<div class="caption">
								<i class="fa fa-search"></i><span class="pull-left font-12 bolder">${searchPanelLabel}</span>
							</div>
							<div class="tools">
								<a href="javascript:;" class="${panelAction}"> </a>
								</a>
							</div>
						</div> --%>
						
						<%-- <div class="portlet-body form" style="${panelBlock}">
							<div class="row">
								<div class="col-md-12">
									<div class="col-md-4">
										<div class="bt-form__wrapper">	
											<div class="form-group uk-width-1-1">
												<div class="bt-flabels__wrapper">
													<div class="input-group date date-picker input-daterange" data-date-start-date="1d" data-date-format="mm/dd/yyyy">
														<label class="parsley_hide">${startDateLabel}</label>
														<input class="form-control form-control-inline date-picker" id="startDate" name="startDate" type="text" placeholder="Start Date" value="" size="20">
														<span class="input-group-addon">to </span>
														<label class="parsley_hide">${endDateLabel}</label>
														<input class="form-control form-control-inline date-picker" id="endDate" name="endDate" type="text" placeholder="End Date" value="" size="20">
														<span class="input-group-btn btn default"><i class="fa fa-calendar"></i> </span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
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
		</form:form>
		<form:form id="compare_frm" role="form" class="horizontal-form uk-form bt-flabels js-flabels">
		
		</form:form>
		<textarea id="templateAuditJson" style="display: none;">${auditData}</textarea>
		<c:if test="${!empty(auditData)}">
			<div class="row">
				<div class="col-md-12">
					<div id='jqxWidget'>
						<div id="templateJqxgrid"></div>
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
		
		if($("#templateAuditJson").val() != null && $("#templateAuditJson").val() != undefined && $("#templateAuditJson").val() != "") {
			var templateAuditJson = JSON.parse($("#templateAuditJson").val());
			console.log("templateAuditJson:::" + templateAuditJson);
			var templateDataSource =
			{
				datatype: "json",
				localdata: templateAuditJson,
				datafields: [
							{ name: 'modifiedDate', type: 'date'},
							{ name: 'version', type: 'integer'},
							{ name: 'modifiedBy', type: 'string'},
							{ name: 'ipAddress', type: 'string'},
							{ name: 'templateName', type: 'string'},
							{ name: 'templateCode', type: 'string'},
							{ name: 'countryOfResidenceCode', type: 'string'},
							{ name: 'typeOfCounterPartyName', type: 'string'},
							{ name: 'riskCategoryCode', type: 'string'},
							{ name: 'auditDate', 	type: 'date'},
							{ name: 'endDate', type: 'date'},
							{ name: 'transactionActivity', 	type: 'string'},
							{ name: 'workFlowStatus', type: 'string'},
							{ name: 'active', type: 'string'},
							{ name: 'action', type: 'string'},
							{ name:	'auditId', type: 'string'}
							],
			};
			var templateDataAdapter = new $.jqx.dataAdapter(templateDataSource);
			var cellRendererWithBackgroundColor = function (row, column, value) {
                //console.log("documentAuditJson.row :: " + JSON.stringify(necTemplateAuditJson[row]));
                var updatedFieldsArray = templateAuditJson[row].updatedFields;
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
			$("#templateJqxgrid").jqxGrid(
			{
				width: '100%',
				source: templateDataAdapter,
				autoloadstate: false,
				autosavestate: false,
				groupable: true,
				groupsexpandedbydefault: true,
				sortable: true,
				pageable: true,
				theme: 'ITGtheme',
				//--height: 350,
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
				  { text: 'Updated At', datafield: 'modifiedDate', filtertype: 'input', width: '11%', align: 'left', cellsformat: 'MM/dd/yyyy', cellclassname: cellRendererWithBackgroundColor },
				  { text: 'Version', datafield: 'version', filtertype: 'input', width: '11%', align: 'left', cellclassname: cellRendererWithBackgroundColor },
				  { text: 'Updated By', datafield: 'modifiedBy', filtertype: 'input', width: '11%', align: 'left', cellclassname: cellRendererWithBackgroundColor },
				  { text: 'IP/Mac Address', datafield: 'ipAddress', filtertype: 'input', width: '11%', align: 'left', cellsformat: 'MM/dd/yyyy',cellclassname: cellRendererWithBackgroundColor },
				  { text: 'Template Name', datafield: 'templateName', filtertype: 'input', width: '11%', align: 'left',cellclassname: cellRendererWithBackgroundColor },
				  { text: 'Template Code', datafield: 'templateCode', filtertype: 'input', width: '11%', align: 'left',cellclassname: cellRendererWithBackgroundColor },
				  { text: 'Counter Party', datafield: 'typeOfCounterPartyName', filtertype: 'input', width: '11%', align: 'left',cellclassname: cellRendererWithBackgroundColor },
				  { text: 'Audit Date', datafield: 'auditDate', 	filtertype: 'input', width: '08%', align: 'left', cellsformat: 'MM/dd/yyyy' ,cellclassname: cellRendererWithBackgroundColor},
				  { text: 'End Date',   datafield: 'endDate', 	filtertype: 'range', width: '08%', align: 'left', cellsformat: 'MM/dd/yyyy' ,cellclassname: cellRendererWithBackgroundColor},  
				  { text: 'Transaction Activity',datafield: 'transactionActivity', 		filtertype: 'input', width: '10%', align: 'left' ,cellclassname: cellRendererWithBackgroundColor },
				  { text: 'Workflow Status', datafield: 'workFlowStatus', 			filtertype: 'input', width: '08%', align: 'left' ,cellclassname: cellRendererWithBackgroundColor},
				  { text: 'Status', datafield: 'active', filtertype: 'input', width: '11%', align: 'left' ,cellclassname: cellRendererWithBackgroundColor , enabletooltips:false},
				  { text: 'Action', datafield: 'action', filtertype: 'input', width: '12%', align: 'left' ,cellclassname: cellRendererWithBackgroundColor , enabletooltips:false},
				  { text: 'Hidden', 			datafield: 'auditId', 		filtertype: 'input', 	width: '10%', align: 'left', editable: false,width: 0, hidden:true}
				],
				pageSize:templateAuditJson.length,
				pageSizeOptions:["5","10","20",templateAuditJson.length]				
			});
		}
	});
	
	$('#searchButton').click(function() {
		var id = $("#auditTemplateId").val();

		$('#frm').attr("action", "${contextPath}/kyc/defaultDocument/auditfilter");
		$('#frm').attr("method", "post");
		$('#frm').append('<input type="hidden" name="auditTemplateId" value="' +id+ '" />');
		$('#frm').submit();
		buffer();
	});
	
	$('#cancelButton').click(function() {
		location.href = "${contextPath}/kyc/defaultDocument/search";
		buffer();
	});
	
	function getAuditViewPage(id) {
		window.open("${contextPath}/kyc/defaultDocument/audit/view/" + id, "vedaNewWindow", "toolbar=no, scrollbars=yes, resizable=no, top=0, left=0, width=1200, height=800");
	}

	$('#compareToButton').click(function() {
		
		var templateIdArray = [];
		
		var selectedrowindexs = $("#templateJqxgrid").jqxGrid('getselectedrowindexes');
		
		if(selectedrowindexs.length > 0){
			for (var i = 0; i < selectedrowindexs.length; i++) {									
			
				if?(typeof?selectedrowindexs[i]?===?'undefined'?||?selectedrowindexs[i]?===?null)?{
					console.log("i: " + i);
					console.log("skipping element: " + selectedrowindexs[i]);							
				}else{					
					var data = $('#templateJqxgrid').jqxGrid('getrowdata', selectedrowindexs[i]);
					
					templateIdArray.push(data.auditId);
					console.log("auditId:::" + data.auditId);
				}
			}			
		}
		console.log("templateIdArray:::: " + templateIdArray);
		console.log("templateIdArray length:::"+templateIdArray.length);
		if(templateIdArray.length > 1){
			$('#compare_frm').attr("action", "${contextPath}/kyc/defaultDocument/compareTo");
			$('#compare_frm').attr("method", "post");
			$('#compare_frm').append('<input type="hidden" name="defaultDocumentIds" value="' +templateIdArray+ '" />');
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
		//--window.open("${contextPath}/kyc/consent/compareTo/"+templateIdArray, "vedaNewWindow", "toolbar=no, scrollbars=yes, resizable=no, top=0, left=0, width=1200, height=800");
		
	});
</script>