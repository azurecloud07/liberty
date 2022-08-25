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
<spring:message code="kycSubject.countryOfCitizenship.label" var="countryOfCitizenshipLabel" />

<spring:message code="app.isGivenName" var="isGivenName" />

<input type="hidden" id="instanceName" value="${instanceName}" />
<input type="hidden" id="isGivenName" value="${isGivenName}" />
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
				<li><a href="/digiKYC/dashboard/"><i class="fa fa-home"></i> Home <i
					class="fa fa-angle-right"></i></a></li>
				<li><a href="/digiKYC/kyc/subject/search"> KYC Subjects<i class="fa fa-angle-right"></i></a></li>
				<li>Audit</li>
			</ul>
			<!-- <h4>&nbsp;KYC Audit</h4> -->
			<span class="header-scope">&nbsp;KYC Audit</span>
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

						<button type="button" id="cancelButton" class="btn-itg btn btn-sm grey-gallery"><img src="/digiKYC/assets/global/img/clear.png" /> ${cancelLabel} </button>
					</div>
					<div class="clearfix margin-bottom-5"></div>
				</div>
			</div>
		</div>

		<form action="${contextPath}/kyc/subject/auditfilter" method="POST" id="frm" role="form" class="horizontal-form uk-form bt-flabels js-flabels" 
		 data-parsley-validate="true" data-parsley-errors-messages-disabled="true">
 			<input type="hidden" id="auditKYCSubjectId" name="auditKYCSubjectId" value="${masterId}" />
		 
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
		
		<textarea id="subjectAuditJson" style="display: none;">${auditData}</textarea>
		<c:if test="${!empty(auditData)}">
			<div class="row">
				<div class="col-md-12">
					<div id='jqxWidget'>
						<div id="subjectJqxgrid"></div>
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
	var instanceName;
	var isGivenName;
	jQuery(document).ready(function() {
		jQuery("#subject").addClass("active");
		jQuery("#master").removeClass("active");
		jQuery("#dashboard").removeClass("active");
		
		dateRangePicker('startDate','endDate');
		instanceName = $("#instanceName").val();
		isGivenName = $("#isGivenName").val();
		/* if('${startDate}' != '') {
			$('#startDate').datepicker("setDate", '${startDate}');
		}
		
		if('${endDate}' != '') {
			$('#endDate').datepicker("setDate", '${endDate}');
		} */
	});
	
	$(window).bind("load", function() {
		var individualDataFields = [{"name":"modifiedDate","type":"date"},
									{"name":"version","type":"string"},
									{"name":"modifiedBy","type":"string"},
									{"name":"ipAddress","type":"string"},
									{"name":"kycSubjectRequestNo","type":"string"},
									{"name":"typeOfCounterpartyName","type":"string"},
									(isGivenName == 'true' ? {"name":"givenName","type":"string"} : {"name":"firstName","type":"string"}),
									{"name":"lastName","type":"string"},
									{"name":"dateOfBirth","type":"date"},
									{"name":"sourceOfWealth","type":"string"},
									{"name":"residentialAddress","type":"string"},
									{"name":"stateCity","type":"string"},
									{"name":"zipCode","type":"string"},
									{"name":"countryOfResidencyName","type":"string"},
									{"name":"countryOfBirthName","type":"string"},
									{"name":"countryOfCitizenshipName","type":"string"},
									{"name":"anyOtherFirstName","type":"string"},
									{"name":"anyOtherMiddleName","type":"string"},
									{"name":"anyOtherLastName","type":"string"},
									{"name":"otherNationalityName","type":"string"},
									{"name":"documentConfigCheckBox","type":"string"},
									{"name":"auditDate","type":"date"},
									{"name":"endDate","type":"date"},
									{"name":"requestStatus","type":"string"},
									{"name":"isDelete","type":"string"},
									{"name":"createdBy","type":"string"},
									{"name":"createdDate","type":"date"},
									{"name":"workFlowStatus","type":"string"},
									{"name":"active","type":"string"},
									{"name":"action","type":"string"},
									{"name":"auditId","type":"string"}
								   ];
		  
		var entityDataFields = [{"name":"modifiedDate","type":"date"},
								{"name":"version","type":"string"},
								{"name":"modifiedBy","type":"string"},
								{"name":"ipAddress","type":"string"},
								{"name":"kycSubjectRequestNo","type":"string"},
								{"name":"typeOfCounterpartyName","type":"string"},
								{"name":"registrationName","type":"string"},
								{"name":"dateOfIncorporation","type":"date"},
								{"name":"countryOfIncorporationName","type":"string"},
								{"name":"residentialAddress","type":"string"},
								{"name":"stateCity","type":"string"},
								{"name":"zipCode","type":"string"},
								{"name":"anyOtherFirstName","type":"string"},
								{"name":"documentConfigCheckBox","type":"string"},
								{"name":"auditDate","type":"date"},
								{"name":"endDate","type":"date"},
								{"name":"requestStatus","type":"string"},
								{"name":"isDelete","type":"string"},
								{"name":"createdBy","type":"string"},
								{"name":"createdDate","type":"date"},
								{"name":"workFlowStatus","type":"string"},
								{"name":"active","type":"string"},
								{"name":"action","type":"string"},
								{"name":"auditId","type":"string"}
							   ];
		var individualColumn = [{text:'Updated At',datafield:'modifiedDate',filtertype:'input',width:'08%',align:'left',cellsformat:'dd-MMM-yyyy',cellclassname:cellRendererWithBackgroundColor},
								{text:'Version',datafield:'version',filtertype:'input',width:'04%',align:'left',cellclassname:cellRendererWithBackgroundColor},
								{text:'Updated By',datafield:'modifiedBy',filtertype:'input',width:'08%',align:'left',cellclassname:cellRendererWithBackgroundColor},
								{text:'Ip/Mac address',datafield:'ipAddress',filtertype:'input',width:'9%',align:'left',cellclassname:cellRendererWithBackgroundColor},
								{text:'Request No.',datafield:'kycSubjectRequestNo',filtertype:'input',width:'7%',align:'left',cellclassname:cellRendererWithBackgroundColor},
								{text:'Counterparty Type',datafield:'typeOfCounterpartyName',filtertype:'input',width:'9%',align:'left',cellclassname:cellRendererWithBackgroundColor},
								(isGivenName == 'true' ? {text:'Given Name',datafield:'givenName',filtertype:'input',width:'7%',align:'left',cellclassname:cellRendererWithBackgroundColor} : {text:'First Name',datafield:'firstName',filtertype:'input',width:'7%',align:'left',cellclassname:cellRendererWithBackgroundColor}),
								{text:'Surname',datafield:'lastName',filtertype:'input',width:'7%',align:'left',cellclassname:cellRendererWithBackgroundColor},
								{text:'DOB',datafield:'dateOfBirth',filtertype:'input',width:'7%',align:'left',cellsformat:'dd-MMM-yyyy',cellclassname:cellRendererWithBackgroundColor},
								{text:'Source of Wealth',datafield:'sourceOfWealth',filtertype:'input',width:'12%',align:'left',cellclassname:cellRendererWithBackgroundColor},
								{text:'Residential Address',datafield:'residentialAddress',filtertype:'input',width:'9%',align:'left',cellclassname:cellRendererWithBackgroundColor},
								{text:'State City',datafield:'stateCity',filtertype:'input',width:'7%',align:'left',cellclassname:cellRendererWithBackgroundColor},
								{text:'Zip Code',datafield:'zipCode',filtertype:'input',width:'7%',align:'left',cellclassname:cellRendererWithBackgroundColor},
								{text:'Country of Residence',datafield:'countryOfResidencyName',filtertype:'input',width:'9%',align:'left',cellclassname:cellRendererWithBackgroundColor},
								{text:'Country of Birth Code',datafield:'countryOfBirthName',filtertype:'input',width:'9%',align:'left',cellclassname:cellRendererWithBackgroundColor},
								{text:'Country of Citizneship',datafield:'countryOfCitizenshipName',filtertype:'input',width:'12%',align:'left',cellclassname:cellRendererWithBackgroundColor},
								{text:'Any Other First Name',datafield:'anyOtherFirstName',filtertype:'input',width:'9%',align:'left',cellclassname:cellRendererWithBackgroundColor},
								{text:'Any Other Middle Name',datafield:'anyOtherMiddleName',filtertype:'input',width:'12%',align:'left',cellclassname:cellRendererWithBackgroundColor},
								{text:'Any Other Last Name',datafield:'anyOtherLastName',filtertype:'input',width:'9%',align:'left'},
								{text:'Other Nationality',datafield:'otherNationalityName',filtertype:'input',width:'9%',align:'left',cellclassname:cellRendererWithBackgroundColor},
								{text:'Documents Waived',datafield:'documentConfigCheckBox',filtertype:'input',width:'9%',align:'left',cellclassname:cellRendererWithBackgroundColor},
								{text:'Audit Date',datafield:'auditDate',filtertype:'input',width:'08%',align:'left',cellsformat:'dd-MMM-yyyy',cellclassname:cellRendererWithBackgroundColor},
								{text:'End Date',datafield:'endDate',filtertype:'range',width:'08%',align:'left',cellsformat:'dd-MMM-yyyy',cellclassname:cellRendererWithBackgroundColor},
								{text:'Request Status',datafield:'requestStatus',filtertype:'input',width:'7%',align:'left',cellclassname:cellRendererWithBackgroundColor},
								{text:'Delete',datafield:'isDelete',filtertype:'input',width:'7%',align:'left',cellclassname:cellRendererWithBackgroundColor},
								{text:'Created By',datafield:'createdBy',filtertype:'input',width:'7%',align:'left',cellclassname:cellRendererWithBackgroundColor},
								{text:'Created Date',datafield:'createdDate',filtertype:'input',width:'7%',align:'left',cellsformat:'dd-MMM-yyyy',cellclassname:cellRendererWithBackgroundColor},{text:'Status',datafield:'workFlowStatus',filtertype:'input',width:'08%',align:'left',cellclassname:cellRendererWithBackgroundColor},
								{text:'Active',datafield:'active',filtertype:'input',width:'7%',align:'left',cellclassname:cellRendererWithBackgroundColor,enabletooltips:!1},{text:'Action',datafield:'action',filtertype:'input',width:'7%',align:'left',cellclassname:cellRendererWithBackgroundColor,enabletooltips:!1},
								{text:'Hidden',datafield:'auditId',filtertype:'input',width:'9%',align:'left',editable:!1,width:0,hidden:!0}
								];
		
		var entityColumn = [{text:'Updated At',datafield:'modifiedDate',filtertype:'input',width:'07%',align:'left',cellsformat:'dd-MMM-yyyy',cellclassname:cellRendererWithBackgroundColor},
							{text:'Version',datafield:'version',filtertype:'input',width:'04%',align:'left',cellclassname:cellRendererWithBackgroundColor},
							{text:'Updated By',datafield:'modifiedBy',filtertype:'input',width:'07%',align:'left',cellclassname:cellRendererWithBackgroundColor},
							{text:'Ip/Mac address',datafield:'ipAddress',filtertype:'input',width:'9%',align:'left',cellclassname:cellRendererWithBackgroundColor},
							{text:'Request No.',datafield:'kycSubjectRequestNo',filtertype:'input',width:'7%',align:'left',cellclassname:cellRendererWithBackgroundColor},
							{text:'Counterparty Type',datafield:'typeOfCounterpartyName',filtertype:'input',width:'9%',align:'left',cellclassname:cellRendererWithBackgroundColor},
							{text:'Name',datafield:'registrationName',filtertype:'input',width:'7%',align:'left',cellclassname:cellRendererWithBackgroundColor},
							{text:'Date Of Incorporation',datafield:'dateOfIncorporation',filtertype:'input',width:'7%',align:'left',cellsformat:'dd-MMM-yyyy',cellclassname:cellRendererWithBackgroundColor},
							{text:'Country Of Incorporation',datafield:'countryOfIncorporationName',filtertype:'input',width:'7%',align:'left',cellclassname:cellRendererWithBackgroundColor},
							{text:'Address',datafield:'residentialAddress',filtertype:'input',width:'8%',align:'left',cellclassname:cellRendererWithBackgroundColor},
							{text:'State City',datafield:'stateCity',filtertype:'input',width:'7%',align:'left',cellclassname:cellRendererWithBackgroundColor},
							{text:'Zip Code',datafield:'zipCode',filtertype:'input',width:'7%',align:'left',cellclassname:cellRendererWithBackgroundColor},
							{text:'Documents Waived',datafield:'documentConfigCheckBox',filtertype:'input',width:'8%',align:'left',cellclassname:cellRendererWithBackgroundColor},								
							{text:'Audit Date',datafield:'auditDate',filtertype:'input',width:'07%',align:'left',cellsformat:'dd-MMM-yyyy',cellclassname:cellRendererWithBackgroundColor},
							{text:'End Date',datafield:'endDate',filtertype:'range',width:'08%',align:'left',cellsformat:'dd-MMM-yyyy',cellclassname:cellRendererWithBackgroundColor},
							{text:'Request Status',datafield:'requestStatus',filtertype:'input',width:'7%',align:'left',cellclassname:cellRendererWithBackgroundColor},
							{text:'Delete',datafield:'isDelete',filtertype:'input',width:'7%',align:'left',cellclassname:cellRendererWithBackgroundColor},
							{text:'Created By',datafield:'createdBy',filtertype:'input',width:'7%',align:'left',cellclassname:cellRendererWithBackgroundColor},
							{text:'Created Date',datafield:'createdDate',filtertype:'input',width:'7%',align:'left',cellsformat:'dd-MMM-yyyy',cellclassname:cellRendererWithBackgroundColor},
							{text:'Status',datafield:'workFlowStatus',filtertype:'input',width:'08%',align:'left',cellclassname:cellRendererWithBackgroundColor},
							{text:'Active',datafield:'active',filtertype:'input',width:'7%',align:'left',cellclassname:cellRendererWithBackgroundColor,enabletooltips:false},
							{text:'Action',datafield:'action',filtertype:'input',width:'7%',align:'left',cellclassname:cellRendererWithBackgroundColor,enabletooltips:false},
							{text:'Hidden',datafield:'auditId',filtertype:'input',width:'9%',align:'left',editable:false,width:0,hidden:true}
							];
		
		if($("#subjectAuditJson").val() != null && $("#subjectAuditJson").val() != undefined && $("#subjectAuditJson").val() != "") {
			var subjectAuditJson = JSON.parse($("#subjectAuditJson").val());
			
			var typeOfCounterparty = subjectAuditJson[0].typeOfCounterpartyCode;
			var dataFields = individualDataFields;
			var columns = individualColumn;
			if(typeOfCounterparty == "Entity"){
				dataFields = entityDataFields;
				columns = entityColumn;
			}
			
			var subjectDataSource =
			{
				datatype: "json",
				localdata: subjectAuditJson,
				datafields: dataFields,
			};
			var subjectDataAdapter = new $.jqx.dataAdapter(subjectDataSource);
			var cellRendererWithBackgroundColor = function (row, column, value) {
                var updatedFieldsArray = subjectAuditJson[row].updatedFields;
                for(var i = 0; i < updatedFieldsArray.length; i++) {
                	if(updatedFieldsArray[i] === column && column != "modifiedDate" && column != "modifiedBy" && column != "version" && column != "action") {
						console.log("Inside if");
						return 'set-grid-cell-yellow';
                    }
                }
                return '';
          	} 
			// Create jqxGrid
			var windowHeight = $(window).height();
			$("#subjectJqxgrid").jqxGrid({
				width: '100%',
				source: subjectDataAdapter,
				autoloadstate: false,
				autosavestate: false,
				pageable: true,
				theme: 'ITGtheme',
				height: windowHeight - 250,
				selectionmode: 'multiplecellsextended',
				showfilterrow: true,
				filterable: true,
				enabletooltips: true,
		        columnsresize: true,
		        columnsreorder: true,
		        rowsheight: 50,
				columns: columns,
				pageSize:subjectAuditJson.length,
				pageSizeOptions:["5","10","20",subjectAuditJson.length]				
			});
		}
	});
	
	$('#searchButton').click(function() {

		_paq.push(['trackEvent', 'KYCSubject', 'SearchFilter','Filtering audit subject']);
		var id = $("#auditKYCSubjectId").val();
		
		$('#frm').attr("action", "${contextPath}/kyc/subject/auditfilter");
		$('#frm').attr("method", "post");
		$('#frm').append('<input type="hidden" name="auditKYCSubjectId" value="' +id+ '" />');
		$('#frm').submit();
		buffer();
	});
		
	function getAuditViewPage(id) {
		_paq.push(['trackEvent', 'KYCSubject', 'AuditView','Viewing audit view subject']);
		window.open("${contextPath}/kyc/subject/audit/view/" + id, "vedaNewWindow", "toolbar=no, scrollbars=yes, resizable=no, top=0, left=0, width=1200, height=800");
	}
	
	function getAuditLogPage(contextPath, id) {
		$('#frm').attr("action", contextPath + "/kyc/subject/audit");
		$('#frm').attr("method", "get");
		$('#frm').submit();
		buffer();
	} 
	
	$('#cancelButton').click(function() {
		_paq.push(['trackEvent', 'KYCSubject', 'Clear','Clearing audit filter']);
		location.href = "${contextPath}/kyc/subject/search";
		buffer();
	});

	$('#compareToButton').click(function() {
		
		var subjectIdArray = [];
		
		var selectedrowindexs = $("#subjectJqxgrid").jqxGrid('getselectedrowindexes');
		
		if(selectedrowindexs.length > 0){
			for (var i = 0; i < selectedrowindexs.length; i++) {									
			
				if(typeof selectedrowindexs[i] === 'undefined' || selectedrowindexs[i] === null){
					console.log("i: " + i);
					console.log("skipping element: " + selectedrowindexs[i]);							
				}else{					
					var data = $('#subjectJqxgrid').jqxGrid('getrowdata', selectedrowindexs[i]);
					
					subjectIdArray.push(data.auditId);
					console.log("auditId:::" + data.auditId);
				}
			}			
		}
		console.log("subjectIdArray:::: " + subjectIdArray);
		console.log("subjectIdArray length:::"+subjectIdArray.length);
		if(subjectIdArray.length > 1){
			$('#compare_frm').attr("action", "${contextPath}/kyc/subject/compareTo");
			$('#compare_frm').attr("method", "post");
			$('#compare_frm').append('<input type="hidden" name="subjectIds" value="' +subjectIdArray+ '" />');
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
		//--window.open("${contextPath}/kyc/consent/compareTo/"+subjectIdArray, "vedaNewWindow", "toolbar=no, scrollbars=yes, resizable=no, top=0, left=0, width=1200, height=800");
		
	});
</script>