<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<spring:message code="close.label" var="closeLabel" />
<spring:message code="cancel.label" var="cancelLabel" />

<spring:message code="createdBy.label" var="createdByLabel" />
<spring:message code="createdDate.label" var="createdDateLabel" />
<spring:message code="modifiedBy.label" var="modifiedByLabel" />
<spring:message code="modifiedDate.label" var="modifiedDateLabel" />

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar search-page-bar">
			<ul class="page-breadcrumb pull-right">
				<li><i class="fa fa-home"></i> <!-- <a href="#"> --> Home <!-- </a> --> <i
					class="fa fa-angle-right"></i></li>
				<li>KYC Subject<i class="fa fa-angle-right"></i></li>
				<li>Audit<i class="fa fa-angle-right"></i></li>
				<li>View</li>
			</ul>
			<!-- <h4>&nbsp;KYC Audit</h4> -->
			<span class="header-scope">&nbsp;KYC Audit</span>
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
	$(window).bind("load", function() {
		
		if($("#subjectAuditJson").val() != null && $("#subjectAuditJson").val() != undefined && $("#subjectAuditJson").val() != "") {
			var subjectAuditJson = JSON.parse($("#subjectAuditJson").val());
			console.log("subjectAuditJson:::" + JSON.stringify(subjectAuditJson));
			
			var obj = subjectAuditJson;
            var datafields = new Array();
            var columns = new Array();
            for (var i in obj[0]) {
                datafields.push({ name: i });
                columns.push({ text: i, datafield: i });
            }
			
			var subjectDataSource =
			{
				datatype: "json",
				localdata: subjectAuditJson,
				datafields: datafields,
				sortcolumn: 'key',
			    sortdirection: 'asc'
			};	
			var subjectDataAdapter = new $.jqx.dataAdapter(subjectDataSource);
			var cellRendererWithBackgroundColor = "";
			/* var cellRendererWithBackgroundColor = function (row, column, value) {
                //console.log("documentAuditJson.row :: " + JSON.stringify(necTemplateAuditJson[row]));
                var updatedFieldsArray = subjectAuditJson[row].updatedFields;
                //console.log("updatedFieldsArray.length :: " + updatedFieldsArray.length);
                for(var i = 0; i < updatedFieldsArray.length; i++) {
                	if(updatedFieldsArray[i] === column && column != "modifiedDate" && column != "modifiedBy" && column != "version" && column != "action") {
						console.log("Inside if");
						return 'set-grid-cell-yellow';
                    }
                }
                //return defaultHtml;
                return '';
          	} */

			// Create jqxGrid
			var windowHeight = $(window).height();
			$("#subjectJqxgrid").jqxGrid(
			{
				width: '100%',
				source: subjectDataAdapter,
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
		        columns: columns,
		        rowsheight: 50,
				pageSize:subjectAuditJson.length,
				pageSizeOptions:["5","10","20",subjectAuditJson.length]				
			});
		}
	});
	
	
	$('#cancelButton').click(function() {
		location.href = "${contextPath}/kyc/subject/search";
		buffer();
	});


</script>