<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="jsVersion" value="${1.4}" />
<spring:message code="matomoURL" var="matomoURL" />
<input type="hidden" id="commonContextPathId" value="${pageContext.request.contextPath}" />
<%
	String userName = "";
	if(session.getAttribute("userName") != null) {
		userName = (String)session.getAttribute("userName");
	}
%>

<script src="${contextPath}/assets/global/plugins/jquery-migrate.min.js?${jsVersion}" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="${contextPath}/assets/global/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js?${jsVersion}" type="text/javascript"></script>
<script src="${contextPath}/assets/global/plugins/bootstrap/js/bootstrap.min.js?${jsVersion}" type="text/javascript"></script>
<script src="${contextPath}/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js?${jsVersion}" type="text/javascript"></script>
<script src="${contextPath}/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js?${jsVersion}" type="text/javascript"></script>
<script src="${contextPath}/assets/global/plugins/jquery.blockui.min.js?${jsVersion}" type="text/javascript"></script>
<script src="${contextPath}/assets/global/plugins/jquery.cokie.min.js?${jsVersion}" type="text/javascript"></script>
<script src="${contextPath}/assets/global/plugins/jquery-deserialize/jquery.deserialize.js?${jsVersion}" type="text/javascript"></script>
<script src="${contextPath}/assets/global/plugins/uniform/jquery.uniform.min.js?${jsVersion}" type="text/javascript"></script>
<script src="${contextPath}/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js?${jsVersion}" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<script type="text/javascript" src="${contextPath}/assets/global/plugins/bootstrap-select/bootstrap-select.min.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/assets/global/plugins/select2/select2.min.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/assets/global/plugins/jquery-multi-select/js/jquery.multi-select.js?${jsVersion}"></script>
<script src="${contextPath}/assets/global/plugins/bootbox/bootbox.min.js?${jsVersion}"></script>

<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${contextPath}/assets/global/plugins/flot/jquery.flot.min.js?${jsVersion}" type="text/javascript"></script>
<script src="${contextPath}/assets/global/plugins/flot/jquery.flot.resize.min.js?${jsVersion}" type="text/javascript"></script>
<script src="${contextPath}/assets/global/plugins/flot/jquery.flot.categories.min.js?${jsVersion}" type="text/javascript"></script>
<script src="${contextPath}/assets/global/plugins/jquery.pulsate.min.js?${jsVersion}" type="text/javascript"></script>
<!-- IMPORTANT! fullcalendar depends on jquery-ui-1.10.3.custom.min.js for drag & drop support -->
<script type="text/javascript" src="${contextPath}/assets/global/plugins/bootstrap-daterangepicker/moment.min.js?${jsVersion}"></script>
<script src="${contextPath}/assets/global/plugins/fullcalendar/fullcalendar.min.js?${jsVersion}" type="text/javascript"></script>
<script src="${contextPath}/assets/global/plugins/jquery-easypiechart/jquery.easypiechart.min.js?${jsVersion}" type="text/javascript"></script>
<script src="${contextPath}/assets/global/plugins/jquery.sparkline.min.js?${jsVersion}" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="${contextPath}/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/assets/global/plugins/clockface/js/clockface.js?${jsVersion}"></script>

<script type="text/javascript" src="${contextPath}/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/assets/global/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js?${jsVersion}"></script>
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${contextPath}/assets/global/scripts/pcframework.js?${jsVersion}" type="text/javascript"></script>
<script src="${contextPath}/assets/admin/layout/scripts/layout.js?${jsVersion}" type="text/javascript"></script>
<script src="${contextPath}/assets/admin/layout/scripts/quick-sidebar.js?${jsVersion}" type="text/javascript"></script>
<script src="${contextPath}/assets/admin/layout/scripts/demo.js?${jsVersion}" type="text/javascript"></script>
<script src="${contextPath}/assets/admin/pages/scripts/index.js?${jsVersion}" type="text/javascript"></script>
<script src="${contextPath}/assets/admin/pages/scripts/tasks.js?${jsVersion}" type="text/javascript"></script>
<script src="${contextPath}/assets/admin/pages/scripts/components-pickers.js?${jsVersion}"></script>
<script src="${contextPath}/assets/admin/pages/scripts/components-editors.js?${jsVersion}"></script>
<script src="${contextPath}/assets/admin/pages/scripts/components-dropdowns.js?${jsVersion}"></script>
<script src="${contextPath}/assets/parsleyjs/parsley.min.js?${jsVersion}"></script>
<script src="${contextPath}/assets/parsleyjs/parsley_index.js?${jsVersion}"></script>
<%-- <script src="${contextPath}/js/common/jquery.showLoading.js?${jsVersion}"></script> --%>
<script src="${contextPath}/assets/admin/pages/scripts/jquery.showLoading.js?${jsVersion}"></script>

<!-- END PAGE LEVEL SCRIPTS -->
<!-- Added by Sachinam for jqwidget tree -->
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxcore.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxbuttons.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxscrollbar.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxdatatable.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxtreegrid.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxdata.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxcheckbox.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxlistbox.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxgrid.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxgrid.edit.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxlistbox.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxdropdownlist.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxgrid.filter.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxgrid.storage.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxgrid.columnsresize.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxgrid.columnsreorder.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxpanel.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxmenu.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxgrid.grouping.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxgrid.selection.js?${jsVersion}"></script> 
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxgrid.pager.js?${jsVersion}"></script> 
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxgrid.sort.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxdropdownlist.js?${jsVersion}"></script> 
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxcalendar.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxdatetimeinput.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxpopover.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxcombobox.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxgrid.aggregates.js?${jsVersion}"></script>


 <!-- Added By Dhaval for JQX ToolTip -->
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxtooltip.js?${jsVersion}"></script>

<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/globalization/globalize.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxcore.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxtabs.js?${jsVersion}"></script>
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxdata.export.js?${jsVersion}"></script> 
<script type="text/javascript" src="${contextPath}/jqx/jqwidgets/jqxgrid.export.js?${jsVersion}"></script> 
<script type="text/javascript" src="${contextPath}/jqx/scripts/demos.js?${jsVersion}"></script>

<script src="${contextPath}/js/common/jquery.quicksearch.js?${jsVersion}"></script>

<script src="${contextPath}/assets/global/plugins/jstree/dist/jstree.min.js?${jsVersion}"></script>
<script src="${contextPath}/assets/admin/pages/scripts/ui-tree.js?${jsVersion}"></script>

<script src="${contextPath}/assets/global/plugins/bootstrap-summernote/summernote.min.js?${jsVersion}"></script>

<script type="text/javascript" src="${contextPath}/assets/jsonform/deps/underscore.js"></script>
<script type="text/javascript" src="${contextPath}/assets/jsonform/deps/opt/jsv.js"></script>
<script type="text/javascript" src="${contextPath}/assets/jsonform/lib/jsonform.js"></script>
<script type="text/javascript" src='${contextPath}/assets/admin/layout/scripts/shortcut.js'></script>
<script src="${contextPath}/common/itg-common.js?${jsVersion}"></script>

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${contextPath}/assets/global/plugins/jquery-nestable/jquery.nestable.js"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script src="${contextPath}/assets/admin/pages/scripts/ui-nestable.js"></script>

<!-- <script type="text/javascript" src='https://vitdevvuweb01:4061/assets/admin/layout/scripts/shortcut.js'></script> -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${contextPath}/common/jqxdragdrop.js" type="text/javascript"></script>
<script src="${contextPath}/common/jqxinput.js" type="text/javascript"></script>
<script src="${contextPath}/common/jquery.validate.min.js" type="text/javascript"></script>
<script>
   
   jQuery(document).ready(function() {
		
	  $(".datePicker" ).datepicker({
		   changeMonth: true,
      	   changeYear: true,
      	   yearRange: '1800:+100'
       });
	   
	  $(".birthDatePicker" ).datepicker({
		   changeMonth: true,
     	   changeYear: true,
     	   yearRange: '1800:+0',
     	   maxDate: '0'
      });
	  
   	   pcframework.init(); // init pcframework core componets
       Layout.init(); // init layout
       QuickSidebar.init(); // init quick sidebar
       Demo.init(); // init demo features
       UINestable.init();
       Index.init();
       Index.initDashboardDaterange();
       Index.initCalendar(); // init index page's custom scripts
       ComponentsPickers.init();
       initParsely(jQuery);
       
       /*shortcut.add("F2", function() {
			var module = window.location.href; 
			console.log("module :: " + module);
		    $.ajax({
				url : '${contextPath}/helpDoc',
				type : 'POST',
				data : 'module='+module,
				success : function(result) {
					console.log(result);
					window.open('${contextPath}'+result, "vedaNewWindow", "toolbar=no, scrollbars=yes, resizable=no, top=0, left=0, width=1200, height=800");
				},
				error : function(jqXml, textStatus, errorThrown) {
					alert('Error: ' + jqXml.responseText);
				}
			});
		});*/
       
       $('[data-toggle=tooltip]').tooltip();
       $('#unusedTab').remove();
   });
   
   function validateInput(inputStr){
	    var ranges = [
	      '[\uE000-\uF8FF]',
	      '\uD83C[\uDC00-\uDFFF]',
	      '\uD83D[\uDC00-\uDFFF]',
	      '[\u2011-\u26FF]',
	      '\uD83E[\uDD10-\uDDFF]' 
	    ];
	    var specialChars = "<>@!#$%^&*()_+[]{}?:;|'\"\\,./~`-=";
	    var flag = false;
	    for(i = 0; i < inputStr.length;i++){
	    	if(specialChars.indexOf(inputStr[i]) > -1 && i==0){                       
	        	flag = true;
	        }else if(inputStr.match(ranges.join('|'))){
	        	flag = true;
	        }
	    }
	    return flag;
	  }
	$(document).ready(function(){
	  $('input').on('input',function(){
	      var $th = $(this);  
	      var response = validateInput($th.val());
	      if (response == true) {
	          $th.val("");
	      }     
	  });    
	}); 
	
 	$('#startDate').on('changeDate', function(selected) {
        if(typeof selected.date != "undefined"){
               startDate = new Date(selected.date.valueOf());
               $('#endDate').val('');
               $('#endDate').datepicker('setStartDate', startDate);
               $(this).datepicker('hide');
               if($('#startDate').val() != "")
                     document.getElementById('endDate').focus();
        }
        else{
               $(this).datepicker('hide');
               $('#endDate').val('');
               $('#endDate').datepicker('hide');
        }

	});

 	<!-- Matomo -->
 	var userName = encodeURIComponent("${userName}");
 	var _paq = window._paq = window._paq || [];
	/* tracker methods like "setCustomDimension" should be called before "trackPageView" */
	_paq.push(['trackPageView']);
	_paq.push(['enableLinkTracking']);
	(function() {
	var u="${matomoURL}";
	_paq.push(['setTrackerUrl', u+'matomo.php']);
	_paq.push(['setSiteId', '2']);
	_paq.push(['setUserId', userName]);
	var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
	g.type='text/javascript'; g.async=true; g.src=u+'matomo.js'; s.parentNode.insertBefore(g,s);
	})();
	<!-- End Matomo Code -->
 	
</script>