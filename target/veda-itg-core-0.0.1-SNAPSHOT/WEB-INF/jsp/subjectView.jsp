<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="page-content-wrapper">
    <div class="page-content">
        <div class="page-bar search-page-bar">
            <ul class="page-breadcrumb pull-right">
                <li><i class="fa fa-home"></i> <a href="#"> Home </a> <i class="fa fa-angle-right"></i></li>
				<li>KYC Subject<i class="fa fa-angle-right"></i></li>
                <li>View</li>
            </ul>
			<h4>&nbsp;KYC Subject</h4>
        </div>
        
         <div class="row">
            <div class="col-md-12">
                <div class="portlet-body form">
                    <div class="pull-right">
                    	
                        <button type="button" id="closeButton" class="btn btn-sm grey-gallery">
                            <em class="fa fa-times-circle"></em> Close
                        </button>
                    </div>
                    <div class="clearfix margin-bottom-5"></div>
                </div>
            </div>
        </div>

		<form action="#" method="POST" id="frm" role="form" class="horizontal-form uk-form bt-flabels js-flabels" data-parsley-validate="true" data-parsley-errors-messages-disabled="true">
		
			<div class="row">
				<div class="col-md-12">
					<div class="portlet-body">
						<div class="page-bar">
							<ul class="page-breadcrumb">
								<li><em><strong>KYC Subject Details</strong></em></li>
							</ul>
						</div>
						<div class="form-group" style="margin-left: -1px;">
							<div class="col-md-3 bold h5">
								Counter Party Type
							</div>
							<div class="col-md-3 h5">
								<c:if test="${subjectJson != null && subjectJson.getString('counterparty') != null}">
									${subjectJson.getString('counterparty')} 
								</c:if>
							</div>
							<div class="col-md-3 bold h5">
								First Name
							</div>
							<div class="col-md-3 h5">
								<c:if test="${subjectJson != null && subjectJson.getString('firstName') != null}">
									${subjectJson.getString('firstName')} 
								</c:if>
							</div>
							
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12">
					<div class="portlet-body">
						<div class="form-group" style="margin-left: -1px;">
							<div class="col-md-3 bold h5">
								Middle Name
							</div>
							<div class="col-md-3 h5">
								<c:if test="${subjectJson != null && subjectJson.getString('middleName') != null}">
									${subjectJson.getString('middleName')} 
								</c:if>
							</div>
							<div class="col-md-3 bold h5">
								Last Name
							</div>
							<div class="col-md-3 h5">
								<c:if test="${subjectJson != null && subjectJson.getString('lastName') != null}">
									${subjectJson.getString('lastName')} 
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<div class="portlet-body">
						<div class="form-group" style="margin-left: -1px;">
							<div class="col-md-3 bold h5">
								Residential Address
							</div>
							<div class="col-md-3 h5">
								<c:if test="${subjectJson != null && subjectJson.getString('residentialAddress') != null}">
									${subjectJson.getString('residentialAddress')} 
								</c:if>
							</div>
							<div class="col-md-3 bold h5">
								Zip code
							</div>
							<div class="col-md-3 h5">
								<c:if test="${subjectJson != null && subjectJson.getString('zipCode') != null}">
									${subjectJson.getString('zipCode')} 
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<div class="portlet-body">
						<div class="form-group" style="margin-left: -1px;">
							<div class="col-md-3 bold h5">
								City/State
							</div>
							<div class="col-md-3 h5">
								<c:if test="${subjectJson != null && subjectJson.getString('cityState') != null}">
									${subjectJson.getString('cityState')} 
								</c:if>
							</div>
							<div class="col-md-3 bold h5">
								Country of Residency
							</div>
							<div class="col-md-3 h5">
								<c:if test="${subjectJson != null && subjectJson.getString('countryOfResidency') != null}">
									${subjectJson.getString('countryOfResidency')} 
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<div class="portlet-body">
						<div class="form-group" style="margin-left: -1px;">
							<div class="col-md-3 bold h5">
								Country of Birth
							</div>
							<div class="col-md-3 h5">
								<c:if test="${subjectJson != null && subjectJson.getString('countryOfBirth') != null}">
									${subjectJson.getString('countryOfBirth')} 
								</c:if>
							</div>
							<div class="col-md-3 bold h5">
								Country of Nationality
							</div>
							<div class="col-md-3 h5">
								<c:if test="${subjectJson != null && subjectJson.getString('countryOfNationality') != null}">
									${subjectJson.getString('countryOfNationality')} 
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<div class="portlet-body">
						<div class="form-group" style="margin-left: -1px;">
							<div class="col-md-3 bold h5">
								Date of Birth
							</div>
							<div class="col-md-3 h5">
								<c:if test="${subjectJson != null && subjectJson.getString('dateOfBirth') != null}">
									${subjectJson.getString('dateOfBirth')} 
								</c:if>
							</div>
							<div class="col-md-3 bold h5">
								Other Nationality
							</div>
							<div class="col-md-3 h5">
								<c:if test="${subjectJson != null && subjectJson.getString('otherNationality') != null}">
									${subjectJson.getString('otherNationality')} 
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<div class="portlet-body">
						<div class="form-group" style="margin-left: -1px;">
							<div class="col-md-3 bold h5">
								Any other former First Name
							</div>
							<div class="col-md-3 h5">
								<c:if test="${subjectJson != null && subjectJson.getString('formerFirstName') != null}">
									${subjectJson.getString('formerFirstName')} 
								</c:if>
							</div>
							<div class="col-md-3 bold h5">
								Any other former Middle Name
							</div>
							<div class="col-md-3 h5">
								<c:if test="${subjectJson != null && subjectJson.getString('formerMiddleName') != null}">
									${subjectJson.getString('formerMiddleName')} 
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<div class="portlet-body">
						<div class="form-group" style="margin-left: -1px;">
							<div class="col-md-3 bold h5">
								Any other former Last Name
							</div>
							<div class="col-md-3 h5">
								<c:if test="${subjectJson != null && subjectJson.getString('formerLastName') != null}">
									${subjectJson.getString('formerLastName')} 
								</c:if>
							</div>
							<div class="col-md-3 bold h5">
								Occupation
							</div>
							<div class="col-md-3 h5">
								<c:if test="${subjectJson != null && subjectJson.getString('occupation') != null}">
									${subjectJson.getString('occupation')} 
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="clearfix margin-bottom-10"></div>
            
            <%-- <div class="row">
            	<c:forEach begin="0" end="${proofData.length() -1}" var="proofIndex">
            	<div class="col-md-4">
		            <div class="page-bar">
						<ul class="page-breadcrumb">
							<li><em><strong>${proofData.get(proofIndex).getString('proofName')}</strong></em></li>
						</ul>
					</div>
					<div class="clearfix margin-bottom-10"></div>
					<div class="row">
					<c:forEach begin="0" end="${proofData.get(proofIndex).getJSONArray('documents').length() -1}" var="index">
						<div class="col-md-12">
							<div class="form-group">
                            	<a href="#" data-backdrop="static" data-keyboard="false">
                                	<button type="button" class="btn btn-link"><i class="fa fa-paperclip"></i>&nbsp;${proofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentName')}</button>
								</a>
							</div>
						</div>
					</c:forEach>
					</div>
				</div>
				</c:forEach>
			</div> --%>
			
			<div class="row">
				<c:forEach begin="0" end="${proofDataTab1.length() -1}" var="proofIndex">
				    <div class="col-md-4">
				        <!-- BEGIN ACCORDION PORTLET-->
				        <div class="portlet">
				            <div class="portlet-title">
				                <div class="caption">
				                    <i class=""></i>${proofDataTab1.get(proofIndex).getString('proofName')}
				                </div>
				                <div class="tools">
				                    <a href="javascript:;" class="collapse"></a>
				                </div>
				            </div>
				            <div class="portlet-body">
				                <div class="panel-group accordion" id="accordion_${proofIndex}">
				
				                    <c:forEach begin="0" end="${proofDataTab1.get(proofIndex).getJSONArray('documents').length() -1}" var="index">
				                        <div class="panel panel-default">
				                            <div class="panel-heading">
				                                <h4 class="panel-title">
				                                  <a class="accordion-toggle accordion-toggle-styled collapsed" data-toggle="collapse" data-parent="#accordion_${proofIndex}" href="#collapse_${proofIndex}_${index}">
				                                    ${proofDataTab1.get(proofIndex).getJSONArray('documents').get(index).getString('documentName')}
				
				                                    <c:if test="${proofDataTab1.get(proofIndex).getJSONArray('documents').get(index).getString('documentReceived') == 'Yes'}">
				                                      <span style="float:right">[Received: YES]</span>
				                                    </c:if>
				
				                                    <c:if test="${proofDataTab1.get(proofIndex).getJSONArray('documents').get(index).getString('documentReceived') == 'No'}">
				                                      <span style="float:right">[Received: NO]</span>
				                                    </c:if>
				
				                                    <c:if test="${proofDataTab1.get(proofIndex).getJSONArray('documents').get(index).getString('documentReceived') == 'Waiver'}">
				                                      <span style="float:right">[Received: WAIVER]</span>
				                                    </c:if> 
				
				                                  </a>
				                              </h4>
				                            </div>
				                            <div id="collapse_${proofIndex}_${index}" class="panel-collapse collapse">
				                                <div class="panel-body">
				
				                                    <c:if test="${proofDataTab1.get(proofIndex).getJSONArray('documents').get(index).getString('documentReceived') == 'Yes'}">
				                                        <div class="form-group">
				                                            <label class="control-label col-md-6 bold">Received Date:</label>
				                                            <div class="col-md-6">
				                                                <p class="form-control-static">
				                                                    ${proofDataTab1.get(proofIndex).getJSONArray('documents').get(index).getString('receviedDate')}
				                                                </p>
				                                            </div>
				
				                                            <label class="control-label col-md-6 bold">Document Date:</label>
				                                            <div class="col-md-6">
				                                                <p class="form-control-static">
				                                                    ${proofDataTab1.get(proofIndex).getJSONArray('documents').get(index).getString('documentDate')}
				                                                </p>
				                                            </div>
				
				                                            <label class="control-label col-md-6 bold">Expiry Date:</label>
				                                            <div class="col-md-6">
				                                                <p class="form-control-static">
				                                                    ${proofDataTab1.get(proofIndex).getJSONArray('documents').get(index).getString('expiryDate')}
				                                                </p>
				                                            </div>
				
				                                            <label class="control-label col-md-6 bold">Document:</label>
				                                            <div class="col-md-6">
				                                                <button type="button" class="btn btn-link"><i class="fa fa-paperclip"></i>&nbsp;${proofDataTab1.get(proofIndex).getJSONArray('documents').get(index).getString('documentName')}</button>
				                                            </div>
				
				                                            <label class="control-label col-md-6 bold">Reference Number:</label>
				                                            <div class="col-md-6">
				                                                <p class="form-control-static">
				                                                    ${proofDataTab1.get(proofIndex).getJSONArray('documents').get(index).getString('referenceNumber')}
				                                                </p>
				                                            </div>
				
				                                            <label class="control-label col-md-6 bold">Comment:</label>
				                                            <div class="col-md-6">
				                                                <p class="form-control-static">
				                                                    ${proofDataTab1.get(proofIndex).getJSONArray('documents').get(index).getString('comment')}
				                                                </p>
				                                            </div>
				
				                                        </div>
				                                    </c:if>
				
				                                    <c:if test="${proofDataTab1.get(proofIndex).getJSONArray('documents').get(index).getString('documentReceived') == 'No'}">
				                                        <label class="control-label col-md-6 bold">Due Date:</label>
				                                        <div class="col-md-6">
				                                            <p class="form-control-static">
				                                                ${proofDataTab1.get(proofIndex).getJSONArray('documents').get(index).getString('dueDate')}
				                                            </p>
				                                        </div>
				                                    </c:if>
				
				                                    <c:if test="${proofDataTab1.get(proofIndex).getJSONArray('documents').get(index).getString('documentReceived') == 'Waiver'}">
				                                        <label class="control-label col-md-6 bold">Waiver Reason:</label>
				                                        <div class="col-md-6">
				                                            <p class="form-control-static">
				                                                ${proofDataTab1.get(proofIndex).getJSONArray('documents').get(index).getString('waiverReason')}
				                                            </p>
				                                        </div>
				                                    </c:if>
				                                </div>
				                            </div>
				                        </div>
				                    </c:forEach>
				                </div>
				            </div>
				        </div>
				    </div>
				</c:forEach>
			</div>
			
            <div class="clearfix margin-bottom-10"></div>
            
            <div class="page-bar">
				<ul class="page-breadcrumb">
					<li><em><strong>User Consent</strong></em></li>
				</ul>
			</div>
			<div class="clearfix margin-bottom-10"></div>
			
            <c:forEach begin="0" end="${consentData.length() -1}" var="index">
            <div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<div class="col-md-12">
							<input id="userConsent_${index}" name="userConsent_${index}" disabled type="checkbox" checked value="true" autocomplete="off" />
						    <label class="control-label">${consentData.get(index).getString('consentDescription')}</label>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
			
			<div class="clearfix margin-bottom-10"></div>
			<div class="clearfix margin-bottom-10"></div>
			<div class="clearfix margin-bottom-10"></div>
		</form>
		
	</div>
	
	<div class="clearfix margin-bottom-10"></div>
	<div class="clearfix margin-bottom-10"></div>
	<div class="clearfix margin-bottom-10"></div>
</div>

<script>
	
	jQuery(document).ready(function() {
		jQuery("#subject").addClass("active");
		jQuery("#master").remove("active");
		jQuery("#dashboard").remove("active");
	});

	$('#closeButton').click(function() {
	    console.log("Closing current window...");
	    window.close();
	});
</script>