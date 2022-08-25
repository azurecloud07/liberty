<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar search-page-bar">
			<ul class="page-breadcrumb pull-right">
				<li><i class="fa fa-home"></i> <a href="#"> Home </a> <i
					class="fa fa-angle-right"></i></li>
				<li>KYC Subject<i class="fa fa-angle-right"></i></li>
				<li>Search</li>
			</ul>
			<h4>&nbsp;KYC Subject</h4>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="portlet-body form">
					<div class="pull-right">

						<button type="button" id="searchButton" class="btn btn-sm grey-gallery">
							<em class="fa fa-check-circle"></em> Search
						</button>

						<button type="button" id="clearButton" class="btn btn-sm grey-gallery">
							<em class="fa fa-times-circle"></em> Clear
						</button>
						
						<button type="button" id="addNewButton" class="btn btn-sm grey-gallery">
							<em class="fa fa-plus"></em> Add New
						</button>
					</div>
					<div class="clearfix margin-bottom-5"></div>
				</div>
			</div>
		</div>

		<form action="#" method="POST" id="frm" role="form" class="horizontal-form uk-form bt-flabels js-flabels" data-parsley-validate="true" data-parsley-errors-messages-disabled="true">
			<div class="row">
				<div class="col-md-12">
					<div class="portlet light search light bg-inverse">
						<div class="portlet-title search-title">
							<div class="caption">
								<i class="fa fa-search"></i><span class="pull-left font-12 bolder">Search panel</span>
							</div>
							<div class="tools">
								<a href="javascript:;" class="collapse" data-original-title="" title="">
								</a>
							</div>
						</div>
						
						<!-- BEGIN SAMPLE FORM PORTLET-->
						<div class="portlet-body form">
						
							<div class=row>
								<div class="col-md-3">
									<div class="bt-form__wrapper">
										<div class="form-group uk-width-1-1">
											<div class="bt-flabels__wrapper">
												<label class="parsley_hide">First Name</label>
												<select name="firstName" class="form-control select2me" data-parsley-required="false" placeholder="First Name">
													<option value=""></option>
													<c:forEach begin="0" end="${dropdownData.getJSONArray('firstName').length() -1}" var="index">
														<option value="${dropdownData.getJSONArray('firstName').get(index)}">${dropdownData.getJSONArray('firstName').get(index)}</option>
													</c:forEach>
												</select>
												<span class="bt-flabels__error-desc_select">Required</span>
											</div>
										</div>
									</div>
								</div>
								
								<div class="col-md-3">
									<div class="bt-form__wrapper">
										<div class="form-group uk-width-1-1">
											<div class="bt-flabels__wrapper">
												<label class="parsley_hide">Middle Name</label>
												<select name="middleName" class="form-control select2me" data-parsley-required="false" placeholder="Middle Name">
													<option value=""></option>
													<c:forEach begin="0" end="${dropdownData.getJSONArray('middleName').length() -1}" var="index">
														<option value="${dropdownData.getJSONArray('middleName').get(index)}">${dropdownData.getJSONArray('middleName').get(index)}</option>
													</c:forEach>
												</select>
												<span class="bt-flabels__error-desc_select">Required</span>
											</div>
										</div>
									</div>
								</div>
								
								<div class="col-md-3">
									<div class="bt-form__wrapper">
										<div class="form-group uk-width-1-1">
											<div class="bt-flabels__wrapper">
												<label class="parsley_hide">Last Name</label>
												<select name="middleName" class="form-control select2me" data-parsley-required="false" placeholder="Last Name">
													<option value=""></option>
													<c:forEach begin="0" end="${dropdownData.getJSONArray('lastName').length() -1}" var="index">
														<option value="${dropdownData.getJSONArray('lastName').get(index)}">${dropdownData.getJSONArray('lastName').get(index)}</option>
													</c:forEach>
												</select>
												<span class="bt-flabels__error-desc_select">Required</span>
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
		<textarea id="subjectSearchJson" style="display: none;">${subjectSearchData}</textarea>
		<c:if test="${!empty(subjectSearchData)}">
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

	jQuery(document).ready(function() {
		jQuery("#subject").addClass("active");
		jQuery("#master").removeClass("active");
		jQuery("#dashboard").removeClass("active");
	});
	
	$(window).bind("load", function() {
		
		if($("#subjectSearchJson").val() != null && $("#subjectSearchJson").val() != undefined && $("#subjectSearchJson").val() != "") {
			var subjectSearchJson = JSON.parse($("#subjectSearchJson").val());
			console.log("subjectSearchJson:::" + subjectSearchJson);
			var subjectDataSource =
			{
				datatype: "json",
				localdata: subjectSearchJson,
				datafields: [
							{ name: 'firstName', type: 'string'},
							{ name: 'middleName', type: 'string'},
							{ name: 'lastName', type: 'string'},
							{ name: 'countryOfResidency', type: 'date'},
							{ name: 'action', type: 'string'}
							],
			};
			var subjectDataAdapter = new $.jqx.dataAdapter(subjectDataSource);
			// Create jqxGrid
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
				height: 520,
				selectionmode: 'multiplecellsextended',
				showfilterrow: true,
				filterable: true,
				columns: [
				  { text: 'First Name', datafield: 'firstName', filtertype: 'input', width: '20%', align: 'left'},
				  { text: 'Middle Name', datafield: 'middleName', filtertype: 'input', width: '20%', align: 'left'},
				  { text: 'Last Name', datafield: 'lastName', filtertype: 'input', width: '20%', align: 'left'},
				  { text: 'Country of Residency', datafield: 'countryOfResidency', filtertype: 'input', width: '20%', align: 'left'},
				  { text: 'Action', datafield: 'action', filtertype: 'input', width: '20%', align: 'left'}
				],
				pageSize:subjectSearchJson.length,
				pageSizeOptions:["5","10","20",subjectSearchJson.length]				
			});
		}
	});
	
	$('#searchButton').click(function() {
		$('#frm').attr("action", "${contextPath}/kyc/subject/searchfilter");
		$('#frm').attr("method", "post");
		$('#frm').submit();
	});
	
	$('#addNewButton').click(function() {
		location.href = "${contextPath}/kyc/subject/add";
	});
	
	$('#clearButton').click(function() {
		location.href = "${contextPath}/kyc/subject/search";
	});
	
	function getViewPage(id) {
		window.open("${contextPath}/kyc/subject/view/" + id, "vedaNewWindow", "toolbar=no, scrollbars=yes, resizable=no, top=0, left=0, width=1200, height=800");
	}
</script>