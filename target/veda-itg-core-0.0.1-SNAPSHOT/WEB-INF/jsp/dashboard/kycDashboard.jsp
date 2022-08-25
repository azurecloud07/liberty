<%@page import="com.viteos.itg.constant.ITGConstant"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!-- Master Types -->
<input type="hidden" value="<%= ITGConstant.DOCUMENT_LIBRARY_TYPE%>" id="documentLibraryTypeId" />
<input type="hidden" value="<%= ITGConstant.PROOF_TYPE%>" id="proofTypeId" />
<input type="hidden" value="<%= ITGConstant.DEFAULT_DOCUMENT_TYPE%>" id="documentDocumentTypeId" />
<input type="hidden" value="<%= ITGConstant.KYC_TEMPLATE_TYPE%>" id="kycTemplateTypeId" />
<input type="hidden" value="<%= ITGConstant.CONSENT_TYPE%>" id="consentTypeId" />
<input type="hidden" value="<%= ITGConstant.KYC_SUBJECT_TYPE%>" id="kycSubjectTypeId" />

<style>
	.blinkingOrange{
		/* animation:blinkingTextOrange 1s infinite; */
		text-decoration: blink !important;
		color: orange !important;
		font-weight: bold;
	}
	@keyframes blinkingTextOrange{
		0%{		color: transparent;	}
		49%{	color: orange;	}
		50%{	color: orange;	}
		99%{	color: orange;	}
		100%{	color: transparent;	}
		
	}
	.blinking{
		/* animation:blinkingText 1s infinite; */
		text-decoration: blink !important;
		color: red !important;
		font-weight: bold;
	}
	@keyframes blinkingText{
		0%{		color: transparent;	}
		49%{	color: red;	}
		50%{	color: red;	}
		99%{	color: red;	}
		100%{	color: transparent;	}
</style>

<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar search-page-bar">
			<ul class="page-breadcrumb pull-right">
				<li><i class="fa fa-home"></i> <a
					href="#"> Home </a> <i class="fa fa-angle-right"></i></li>
				<li>KYC Expiry Dashboard</li>
			</ul>
			<h4>&nbsp;KYC Expiry Dashboard</h4>
		</div>
		<div class="row">
			<div class="col-md-12 ">
				<div class="portlet-body form">
					<c:if test="${successFlag != null}">
						<c:choose>
							<c:when
								test="${successFlag == true  && fn:length(successMessage)>0}">
								<div class="alert alert-success" style="padding: 9px;">
									<i class="fa fa-check"></i>&nbsp;${successMessage}
									<button type="button" class="close" data-dismiss="alert"
										aria-hidden="true"></button>
								</div>
							</c:when>
							<c:when
								test="${successFlag == false && fn:length(successMessage)>0}">
								<div class="alert alert-danger" style="padding: 9px;">
									<i class="fa fa-warning"></i>&nbsp;${successMessage}
									<button type="button" class="close" data-dismiss="alert"
										aria-hidden="true"></button>
								</div>
							</c:when>
							<c:otherwise>
								<div class="alert alert-danger" style="padding: 9px;">
									<i class="fa fa-warning"></i>&nbsp;
									<spring:message code="label.exceptionMessage"></spring:message>
									.
									<spring:message code="label.sysAdmin"></spring:message>
									<button type="button" class="close" data-dismiss="alert"
										aria-hidden="true"></button>
								</div>
							</c:otherwise>
						</c:choose>
					</c:if>
					<form:form id="frm" action="${contextPath}" method="POST" role="form">
						<div class="clearfix margin-bottom-20"></div>
							<div class="page-bar">
								<div class="pull-right">
									<button type="button" id="excelExportId" onclick="exportToExcel('jqxgridExpiredRequest', 'expiryDocumentDetail')" class="btn btn-sm grey-gallery">
										<i class="fa fa-file-excel-o"></i> &nbsp;Export
									</button>
								</div>
							</div>
							<div id='jqxWidget'>
								<div id="jqxgridExpiredRequest"></div>
							</div>
							
						<div class="clearfix margin-bottom-20"></div>
						<div class="clearfix margin-bottom-20"></div>
							
						<br></br>	
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="${contextPath}/master/dashboard/dashboard.js" type="text/javascript"></script>
<script>
	$(document).ready(function() {
		
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
		              { text: 'Subject Id', datafield: 'kycSubjectId', align: 'center' },
		              { text: 'Counterparty(CP) Type', datafield: 'counterPartyType' ,filtertype: 'input', align: 'center',width: '12%'},
		              { text: 'Proof Name', datafield: 'proofName' ,filtertype: 'input', align: 'center'},
		              { text: 'Document Name', datafield: 'documentName', align: 'center' },
		              { text: 'Expiry Date', filtertype: 'date', datafield: 'expiryDate', align: 'center', cellsformat: 'dd-MMM-yyyy'},
		              { text: 'Status', datafield: 'status', filtertype: 'input', align: 'center', cellclassname: cellclass, width: '12%'},
					  { text: 'Expiry days', datafield: 'noOfDays', filtertype: 'input', align: 'center', width: '8%', align: 'center'},
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
	
	function exportToExcel(gridId, excelName){
		$("#"+gridId).jqxGrid('exportdata', 'xls', excelName);
	}
</script>