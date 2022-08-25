<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="page-header-fixed page-quick-sidebar-over-content page-sidebar-closed">
	<div class="page-content-wrapper">
		<div class="page-content" style="min-height: 730px;">
			<div class="row">
				<div class="col-md-12 page-500">
					<div class="number font-grey-gallery">
						<h2>
							<strong>401</strong>
						</h2>
					</div>
					<div class="details">
						<h3>Oops! looks like something went wrong!</h3>
						<p>You are not authorized to view this page</p>
					</div>
					<a href="${contextPath}${homeUrl}" class="btn btn-sm grey-gallery"><i class="fa fa-home"></i>
						Home
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
