<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="cssVersion" value="${1.4}" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<input type="hidden" id="contextPath" value="${contextPath}"/>

<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="${contextPath}/assets/fonts/font.css?family=Open+Sans:400,300,600,700&amp;subset=all" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/assets/global/plugins/font-awesome/css/font-awesome.min.css?${cssVersion}" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/assets/global/plugins/simple-line-icons/simple-line-icons.min.css?${cssVersion}" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/assets/global/plugins/bootstrap/css/bootstrap.min.css?${cssVersion}" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/assets/global/plugins/uniform/css/uniform.default.css?${cssVersion}" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css?${cssVersion}" rel="stylesheet" type="text/css"/>
<!-- END GLOBAL MANDATORY STYLES -->
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/global/plugins/clockface/css/clockface.css?${cssVersion}"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css?${cssVersion}"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css?${cssVersion}"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/global/plugins/bootstrap-colorpicker/css/colorpicker.css?${cssVersion}"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/global/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css?${cssVersion}"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css?${cssVersion}"/>
<!-- BEGIN PAGE LEVEL PLUGIN STYLES -->
<link href="${contextPath}/assets/global/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css?${cssVersion}" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/assets/global/plugins/fullcalendar/fullcalendar.min.css?${cssVersion}" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/assets/global/plugins/jqvmap/jqvmap/jqvmap.css?${cssVersion}" rel="stylesheet" type="text/css"/>
<!-- END PAGE LEVEL PLUGIN STYLES -->
<!-- BEGIN PAGE STYLES -->
<link href="${contextPath}/assets/admin/pages/css/tasks.css?${cssVersion}" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/global/plugins/bootstrap-select/bootstrap-select.min.css?${cssVersion}"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/global/plugins/select2/select2.css?${cssVersion}"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/global/plugins/jquery-multi-select/css/multi-select.css?${cssVersion}"/>
<!-- END PAGE STYLES -->

<link rel="stylesheet" type="text/css" href="${contextPath}/assets/global/plugins/jquery-nestable/jquery.nestable.css"/>

<!-- BEGIN THEME STYLES -->
<link href="${contextPath}/assets/global/css/components.css?${cssVersion}" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/assets/global/css/plugins.css?${cssVersion}" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/assets/admin/layout/css/layout.css?${cssVersion}" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/assets/admin/layout/css/themes/default.css?${cssVersion}" rel="stylesheet" type="text/css" id="style_color"/>
<link href="${contextPath}/assets/admin/layout/css/custom.css?${cssVersion}" rel="stylesheet" type="text/css"/>
<%-- <link href="${contextPath}/assets/admin/layout/css/custom-style.css?${cssVersion}" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/assets/admin/layout/css/dashboard-styles.css?${cssVersion}" rel="stylesheet" type="text/css"/> --%>
<link rel="stylesheet" href="${contextPath}/assets/parsleycss/normalize.css?${cssVersion}">
<link rel='stylesheet prefetch' href='${contextPath}/assets/parsleycss/uikit.almost-flat.min.css'>
<link rel="stylesheet" href="${contextPath}/assets/parsleycss/style.css?${cssVersion}">
<link href="${contextPath}/assets/admin/layout/css/jqx.ITGtheme.css?${cssVersion}" rel="stylesheet" type="text/css"/>

<!-- Editor -->
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/global/plugins/bootstrap-summernote/summernote.css?${cssVersion}">

<link rel="stylesheet" type="text/css" href="${contextPath}/assets/global/plugins/jstree/dist/themes/default/style.min.css?${cssVersion}"/>
<style>
.loading-indicator {
	height: 100px;
	width: 100px;
	background: url( '${contextPath}/images/loading.gif' );
	background-repeat: no-repeat;
	background-position: center;
	left: 45% !important;
	top: 45% !important;
	position: fixed;
}

.loading-indicator-overlay {
	background-color: #F5F5F5;
	border:;
	opacity: 0.6;
	filter: alpha(opacity = 60);
	position: fixed;
}

div#activity_pane {
	height: 100px;
	width: 200px;
	position: fixed;
	border:;
	background-color:;
	padding-bottom: 0px;
	text-align: center;
	display: none;
}
.error{
	color: red;
}

#container{
	background-color: white !important;
}

.doc-name-align{
	white-space: normal;
	text-align: left;
	word-break: break-all;
} 

span#editFilingForm, span#deleteFilingForm {
    color: white;
}

span#editFilingForm > input, span#deleteFilingForm > input {
    background: none;
    color: white;
    padding: 0;
    border: 0;
}

.ui-datepicker{
	z-index: 1000 !important;
}
</style>


<!-- END THEME STYLES -->
<!-- <link rel="shortcut icon" href="favicon.ico"/> -->
<script src="${contextPath}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>

<link rel="stylesheet" href="${contextPath}/jqx/jqwidgets/styles/jqx.base.css?${cssVersion}" type="text/css" />
<link rel="stylesheet" href="${contextPath}/jqx/jqwidgets/styles/jqx.office.css?${cssVersion}" type="text/css" />
<link rel="stylesheet" href="${contextPath}/jqx/jqwidgets/styles/jqx.ui-redmond.css?${cssVersion}" type="text/css" />
<link rel="stylesheet" href="${contextPath}/jqx/jqwidgets/styles/jqx.ui-metrodark.css?${cssVersion}" type="text/css" />
<link rel="stylesheet" href="${contextPath}/jqx/jqwidgets/styles/jqx.summer.css?${cssVersion}" type="text/css" />

<link rel="stylesheet" href="${contextPath}/jqx/jqwidgets/styles/jqx.ITGtheme.css?${cssVersion}" type="text/css" />

<link rel="stylesheet" href="${contextPath}/jqx/jqwidgets/styles/jqx.ui-smoothness.css?${cssVersion}" type="text/css" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<%-- <script type="text/javascript" src='${contextPath}/assets/jsoneditor/jsoneditor.js'></script> --%>
<%-- <script src="${contextPath}/common/jsonRenderer.js" type="text/javascript"></script> --%>