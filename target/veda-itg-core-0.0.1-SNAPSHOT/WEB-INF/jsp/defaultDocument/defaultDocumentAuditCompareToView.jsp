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

<spring:message code="app.kycMasterMenuName" var="kycMasterMenuName" />

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar search-page-bar">
			<ul class="page-breadcrumb pull-right">
				<li><i class="fa fa-home"></i> <!-- <a href="#"> --> Home <!-- </a> --> <i
					class="fa fa-angle-right"></i></li>
				<li><!-- <a href="#"> -->${kycMasterMenuName}<!-- </a> --> <i class="fa fa-angle-right"></i></li>
                <li>Default Document<i class="fa fa-angle-right"></i></li>
				<li>Audit<i class="fa fa-angle-right"></i></li>
				<li>View</li>
			</ul>
			<!-- <h4>&nbsp;Default Document</h4> -->
			<span class="header-scope">&nbsp;Default Document</span>
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
	$(window).bind("load", function() {
		
		if($("#templateAuditJson").val() != null && $("#templateAuditJson").val() != undefined && $("#templateAuditJson").val() != "") {
			var templateAuditJson = JSON.parse($("#templateAuditJson").val());
			console.log("templateAuditJson:::" + JSON.stringify(templateAuditJson));
			
			var obj = templateAuditJson;
            var datafields = new Array();
            var columns = new Array();
            for (var i in obj[0]) {
                datafields.push({ name: i });
                columns.push({ text: i, datafield: i });
            }
			
			var subjectDataSource =
			{
				datatype: "json",
				localdata: templateAuditJson,
				datafields: datafields,
				sortcolumn: 'key',
			    sortdirection: 'asc'
			};	
			var subjectDataAdapter = new $.jqx.dataAdapter(subjectDataSource);
			var cellRendererWithBackgroundColor = "";
			/* var cellRendererWithBackgroundColor = function (row, column, value) {
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
          	} */

			// Create jqxGrid
			var windowHeight = $(window).height();
			$("#templateJqxgrid").jqxGrid(
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
				pageSize:templateAuditJson.length,
				pageSizeOptions:["5","10","20",templateAuditJson.length]				
			});
		}
	});
	
	
	$('#cancelButton').click(function() {
		location.href = "${contextPath}/kyc/subject/search";
		buffer();
	});


</script>