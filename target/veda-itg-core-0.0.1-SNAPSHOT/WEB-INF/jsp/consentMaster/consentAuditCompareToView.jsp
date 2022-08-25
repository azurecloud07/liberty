<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<spring:message code="close.label" var="closeLabel" />
<spring:message code="cancel.label" var="cancelLabel" />
<spring:message code="consentMaster.consentDetails.label" var="consentDetailsLabel" />
<spring:message code="consentMaster.consentName.label" var="consentNameLabel" />
<spring:message code="consentMaster.consentCode.label" var="consentCodeLabel" />
<spring:message code="consentMaster.consentType.label" var="consentTypeLabel" />
<spring:message code="consentMaster.typeOfCounterParty.label" var="typeOfCounterPartyLabel" />
<spring:message code="consentMaster.isMandatory.label" var="isMandatoryLabel" />
<spring:message code="consentMaster.effectiveDate.label" var="effectiveDateLabel" />
<spring:message code="consentMaster.effectiveEndDate.label" var="effectiveEndDateLabel" />
<spring:message code="consentMaster.consentDescription.label" var="consentDescriptionLabel" />
<spring:message code="createdBy.label" var="createdByLabel" />
<spring:message code="createdDate.label" var="createdDateLabel" />
<spring:message code="modifiedBy.label" var="modifiedByLabel" />
<spring:message code="modifiedDate.label" var="modifiedDateLabel" />

<spring:message code="app.kycMasterMenuName" var="kycMasterMenuName" />

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="page-content-wrapper">
    <div class="page-content">
        <div class="page-bar search-page-bar">
            <ul class="page-breadcrumb pull-right">
                <li><i class="fa fa-home"></i> <!-- <a href="#"> --> Home <!-- </a> --> <i class="fa fa-angle-right"></i></li>
				<li><!-- <a href="#"> -->${kycMasterMenuName}<!-- </a> --> <i class="fa fa-angle-right"></i></li>
                <li>Consent Master<i class="fa fa-angle-right"></i></li>
                <li>Audit<i class="fa fa-angle-right"></i></li>
                <li>View</li>
            </ul>
			<!-- <h4>&nbsp;Consent Master</h4> -->
			<span class="header-scope">&nbsp;Consent Master</span>
        </div>

		<div class="row">
            <div class="col-md-12">
                <div class="portlet-body form">
                    <div class="pull-right">
                    	
                        <button type="button" id="closeButton" class="btn-itg btn btn-sm grey-gallery"><img src="/digiKYC/assets/global/img/clear.png" /> ${closeLabel} </button>
                    </div>
                    <div class="clearfix margin-bottom-5"></div>
                </div>
            </div>
        </div>
		
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

	$(window).bind("load", function() {
		
		if($("#consentAuditJson").val() != null && $("#consentAuditJson").val() != undefined && $("#consentAuditJson").val() != "") {
			var consentAuditJson = JSON.parse($("#consentAuditJson").val());
			console.log("consentAuditJson:::" + JSON.stringify(consentAuditJson));
			
			var obj = consentAuditJson;
            var datafields = new Array();
            var columns = new Array();
            for (var i in obj[0]) {
                datafields.push({ name: i });
                columns.push({ text: i, datafield: i, cellclassname: "cellRendererWithBackgroundColor" });
            }
			
			var consentDataSource =
			{
				datatype: "json",
				localdata: consentAuditJson,
				/* datafields: [
								{ name: 'key', 		type: 'string'},
								{ name: 'value1', 	type: 'string'},
								{ name: 'value2', 	type: 'string'}
							], */
				datafields: datafields,
				sortcolumn: 'key',
			    sortdirection: 'asc'
			};
			var consentDataAdapter = new $.jqx.dataAdapter(consentDataSource);
			//--var cellRendererWithBackgroundColor = "";
			var cellRendererWithBackgroundColor = function (row, column, value) {
                console.log("documentAuditJson.row :: " + JSON.stringify(consentAuditJson[row]));
                /* var updatedFieldsArray = consentAuditJson[row].updatedFields;
                //console.log("updatedFieldsArray.length :: " + updatedFieldsArray.length);
                for(var i = 0; i < updatedFieldsArray.length; i++) {
                	if(updatedFieldsArray[i] === column && column != "modifiedDate" && column != "modifiedBy" && column != "version" && column != "action") {
						console.log("Inside if");
						return 'set-grid-cell-yellow';
                    }
                } */
                //return defaultHtml;
                return 'set-grid-cell-yellow';
          	}
			/* var cellRendererWithBackgroundColor = function (row, column, value) {
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
          	}  */
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
				selectionmode: 'multiplecellsextended',
				showfilterrow: true,
				filterable: true, 
				enabletooltips: true,
		        columnsresize: true,
		        columnsreorder: true,
		        rowsheight: 50,
				/* columns: [
				  { text: 'Key', 		datafield: 'key', 		filtertype: 'input', width: '40%', align: 'left', cellclassname: cellRendererWithBackgroundColor  },
				  { text: 'Version 2', 	datafield: 'value1', 	filtertype: 'input', width: '30%', align: 'left', cellclassname: cellRendererWithBackgroundColor  },
				  { text: 'Version 1', 	datafield: 'value2', 	filtertype: 'input', width: '30%', align: 'left', cellclassname: cellRendererWithBackgroundColor  }
				], */
				columns: columns,
				pageSize:consentAuditJson.length,
				pageSizeOptions:["5","10","20",consentAuditJson.length]
			
				
			});
		}
	});
	
	$('#clearButton').click(function() {
		location.href = "${contextPath}/kyc/consent/search";
		buffer();
	});
	
</script>