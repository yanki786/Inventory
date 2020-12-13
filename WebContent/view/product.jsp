<%@page import="java.util.function.Predicate"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.stream.Collector"%>
<%@page import="com.web.bo.UserBO"%>
<%@page import="com.web.entity.Product"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test='<%=session.getAttribute("subx") == null%>'>
	<jsp:forward page="login.jsp" />
</c:if>


<jsp:useBean id="product" scope="request" class="com.web.entity.Product" />
<jsp:useBean id="temp" scope="request"
	class="com.web.entity.ProductBean" />
<%
	int ix = -1;
if (request.getQueryString() != null && request.getQueryString().contains("i=")) {
	try {
		ix = Integer.parseInt(request.getQueryString().replace("i=", ""));
	} catch (Exception e) {
		ix = -1;
	}
}
long id = Long.parseLong(session.getAttribute("subx").toString());
session.setAttribute("subx", id);
UserBO ubx = UserBO.getSession(id);
%>
<c:if test='<%=ubx == null%>'>
	<jsp:forward page="login.jsp" />
</c:if>
<%
	List<Product> products = ubx.getProducts();
%>
<c:if test='<%=request.getMethod().equals("GET")%>'>

</c:if>


<c:if test='<%=request.getMethod().equals("POST")%>'>
	<jsp:setProperty property="*" name="temp" />
	<c:choose>
		<c:when test='<%=request.getParameter("btn").equals("Submit")%>'>
			<%
				long c = products.stream().map(Product::getProductName).filter(Predicate.isEqual(temp.getProductName())).count();
			if (c == 0) {
				Product p = ubx.parseProductBean(temp);
				ubx.addProduct(p);
			}
			%>
		</c:when>
		<c:when test='<%=request.getParameter("btn").equals("Cancel")%>'>
		<%ix=-1;%>
		</c:when>
		<c:when test='<%=request.getParameter("btn").equals("Update")%>'>
			<%
			Product p = ubx.parseProductBean(temp);
			p.setProductId(Integer.parseInt(request.getParameter("productId").toString()));
			ubx.updateProduct(p);
			%>
		</c:when>
		<c:when test='<%=request.getParameter("btn").equals("Delete")%>'>
			<%ubx.removeProduct(Integer.parseInt(request.getParameter("productId").toString())); %>
		</c:when>

	</c:choose>

</c:if>




<!DOCTYPE html>
<html style="font-size: 16px;" lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="page_type" content="np-template-header-footer-from-plugin">
<title>Product</title>





<link rel="stylesheet" href="../style/root.css" media="screen">
<link rel="stylesheet" href="../style/product.css" media="screen">

<link rel="stylesheet" href="../style/modal.css" media="screen">
<script class="u-script" type="text/javascript"
	src="../script/jquery.js"></script>
<script class="u-script" type="text/javascript" src="../script/root.js"></script>

<script>
function open(i){
	var baseUrl = window.location.href.split('#')[0];
	window.location.replace( baseUrl + '#' + i);
}
</script>
<link id="u-theme-google-font" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">


<script type="application/ld+json">{
        "@context": "http://schema.org",
        "@type": "Organization",
        "name": "Inventory Management",
        "url": "index.html"
    }</script>
<meta property="og:title" content="product">
<meta property="og:type" content="website">
<meta name="theme-color" content="#16b6a1">
<link rel="canonical" href="index.html">
<meta property="og:url" content="index.html">

</head>

<body class="u-body">
	<section class="u-align-center u-clearfix u-image u-section-1"
		id="sec-90ab" data-image-width="2520" data-image-height="1416">
		<div class="u-clearfix u-sheet u-sheet-1">
			<div class="u-clearfix u-layout-wrap u-layout-wrap-1">
				<div class="u-gutter-0 u-layout">
					<div class="u-layout-row">
						<div class="u-size-17">
							<div class="u-layout-col">
								<div
									class="u-container-style u-hidden-sm u-hidden-xs u-image u-layout-cell u-left-cell u-size-60 u-image-1"
									data-image-width="1600" data-image-height="1067">
									<div class="u-container-layout u-container-layout-1"></div>
								</div>
							</div>
						</div>
						<div class="u-size-43">
							<div class="u-layout-col">
								<div
									class="u-align-left u-border-no-bottom u-border-no-left u-border-no-right u-border-no-top u-container-style u-layout-cell u-right-cell u-size-60 u-white u-layout-cell-2">
									<div class="u-container-layout u-container-layout-2">
										<a href="#sec-03df"
											class="u-btn u-button-style u-dialog-link u-gradient u-none u-text-body-alt-color u-btn-1"><span
											class="u-icon"><svg xmlns="http://www.w3.org/2000/svg"
													xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1"
													xml:space="preserve" class="u-svg-content"
													viewBox="0 0 512 512" style="width: 1em; height: 1em;">
													<path
														d="m256 0c-141.164062 0-256 114.835938-256 256s114.835938 256 256 256 256-114.835938 256-256-114.835938-256-256-256zm112 277.332031h-90.667969v90.667969c0 11.777344-9.554687 21.332031-21.332031 21.332031s-21.332031-9.554687-21.332031-21.332031v-90.667969h-90.667969c-11.777344 0-21.332031-9.554687-21.332031-21.332031s9.554687-21.332031 21.332031-21.332031h90.667969v-90.667969c0-11.777344 9.554687-21.332031 21.332031-21.332031s21.332031 9.554687 21.332031 21.332031v90.667969h90.667969c11.777344 0 21.332031 9.554687 21.332031 21.332031s-9.554687 21.332031-21.332031 21.332031zm0 0"></path></svg><img></span>&nbsp;add
											product </a>
										<h2 class="u-text u-text-1">
											The <b>Product</b>
										</h2>
										<div
											class="u-expanded-width u-table u-table-responsive u-table-1">
											<table class="u-table-entity u-table-entity-1">
												<colgroup>
													<col width="33%">
													<col width="33%">
													<col width="33%">
												</colgroup>
												<thead
													class="u-table-header u-text-palette-1-dark-2 u-table-header-1">
													<tr style="height: 46px;">
														<th
															class="u-border-2 u-border-grey-75 u-border-no-left u-border-no-right u-table-cell">
															id</th>
														<th
															class="u-border-2 u-border-grey-75 u-border-no-left u-border-no-right u-table-cell">
															Name</th>
														<th
															class="u-border-2 u-border-grey-75 u-border-no-left u-border-no-right u-table-cell">
															quantity</th>
													</tr>
												</thead>
												<tbody class="u-table-body">
													<%
														for (int i = 0; i < products.size(); i++) {
													%>
													<tr class="u-table-row-hover clickable-row"
														style="height: 46px;"
														onclick="window.location.href ='?i=<%=i%>'">
														<td class="u-table-cell">Item <%=i + 1%></td>
														<td class="u-table-cell"><%=products.get(i).getProductName()%></td>
														<td class="u-table-cell"><%=products.get(i).getQuantity()%></td>
														<%
															}
														%>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section
		class="u-align-center u-clearfix u-container-style u-dialog-block u-opacity u-opacity-10 u-palette-1-dark-1 u-valign-top u-section-4"
		id="sec-03df">
		<div
			class="u-container-style u-dialog u-shape-rectangle u-white u-dialog-1">
			<div class="u-container-layout u-container-layout-1">
				<div class="u-shape u-shape-svg u-text-palette-1-base u-shape-1">
					<svg class="u-svg-link" preserveAspectRatio="none"
						viewBox="0 0 160 140" style="">
                    <use xmlns:xlink="http://www.w3.org/1999/xlink"
							xlink:href="#svg-8b4e"></use>
                </svg>
					<svg xmlns="http://www.w3.org/2000/svg"
						xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1"
						xml:space="preserve" class="u-svg-content" viewBox="0 0 160 140"
						x="0px" y="0px" id="svg-8b4e">
						<g>
						<g>
						<path
							d="M138.9,102.2c-9.5,10.1-24.4,20.2-41.2,27.4C63.2,144.5,21,147.1,3.1,112.4c-9.9-19.1,6.5-28.8,11.8-45.7
			c5.3-16.9-11.4-32.3-5.1-49.9c1.8-4.9,4.9-9,8.9-11.9C24,1,30.8-0.8,37.8,0.3C43.6,1.2,49,3.5,54.3,5.7c8.8,3.7,17.4,7.1,26.3,9.8
			c15.7,4.7,31.3,3.7,47.1,7.2c8.5,1.9,16.7,5.6,22.6,11.8C170.3,55.7,155.8,84.1,138.9,102.2z"></path>
</g>
</g></svg>
				</div>
				<div class="u-clearfix u-layout-wrap u-layout-wrap-1">
					<div class="u-gutter-0 u-layout">
						<div class="u-layout-row">
							<div
								class="u-align-left u-container-style u-layout-cell u-left-cell u-size-30 u-white u-layout-cell-1">
								<div
									class="u-container-layout u-valign-top u-container-layout-2">
									<h2 class="u-text u-text-palette-1-base u-text-1">Add
										Product</h2>
									<p class="u-text u-text-2">This task won't effect your
										balance, proceed if you did not buy product. In short only if
										you already had this product in your stock</p>
								</div>
							</div>
							<div
								class="u-align-left u-container-style u-layout-cell u-right-cell u-size-30 u-white u-layout-cell-2">
								<div
									class="u-container-layout u-valign-middle u-container-layout-3">
									<div class="u-expanded-width u-form u-form-1">
										<form action="#" method="POST"
											class="u-clearfix u-form-spacing-10 u-form-vertical u-inner-form"
											style="padding: 17px;" source="mailchimp" name="form">

											<div class="u-form-group u-form-name u-form-group-1">
												<label for="name-3b9a" class="u-form-control-hidden u-label"></label>
												<input type="text" placeholder="Enter product name"
													id="name-3b9a" name="productName"
													class="u-border-2 u-border-black u-border-no-left u-border-no-right u-border-no-top u-input u-input-rectangle u-input-1"
													required="required">
											</div>
											<div class="u-form-group u-form-group-3">
												<label for="text-5553" class="u-form-control-hidden u-label"></label>
												<input type="number" placeholder="Enter product quantity"
													id="text-5553" name="quantity"
													class="u-border-2 u-border-black u-border-no-left u-border-no-right u-border-no-top u-input u-input-rectangle u-input-3"
													required="required" min="1" step="1">
											</div>
											<div
												class="u-align-center u-form-group u-form-submit u-form-group-4">
												<input type="submit" value="Submit" name="btn"
													class="u-btn u-btn-submit u-button-style u-hover-palette-1-dark-1 u-palette-1-base u-btn-1">
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<button
				class="u-dialog-close-button u-icon u-icon-circle u-text-palette-1-base u-icon-1">
				<svg class="u-svg-link" preserveAspectRatio="xMidYMin slice"
					viewBox="0 0 16 16" style="">
                <use xmlns:xlink="http://www.w3.org/1999/xlink"
						xlink:href="#svg-d674"></use>
            </svg>
				<svg xmlns="http://www.w3.org/2000/svg"
					xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1"
					xml:space="preserve" class="u-svg-content" viewBox="0 0 16 16"
					x="0px" y="0px" id="svg-d674">
					<rect x="7" y="0"
						transform="matrix(0.7071 -0.7071 0.7071 0.7071 -3.3138 8.0002)"
						width="2" height="16"></rect>
                <rect x="0" y="7"
						transform="matrix(0.7071 -0.7071 0.7071 0.7071 -3.3138 8.0002)"
						width="16" height="2"></rect></svg>
			</button>
		</div>
	</section>

	<c:if test="<%=ix != -1 && ix < products.size()%>">

		<section
			class="u-align-center u-container-style u-palette-1-dark-1 u-valign-top "
			style="position: absolute;">
			<div
				class="u-container-style u-dialog u-shape-rectangle u-white u-dialog-1">
				<div class="u-container-layout u-container-layout-1">
					<div class="u-shape u-shape-svg u-text-palette-1-base u-shape-1">
						<svg class="u-svg-link" preserveAspectRatio="none"
							viewBox="0 0 160 140" style="">
                    <use xmlns:xlink="http://www.w3.org/1999/xlink"
								xlink:href="#svg-8b4e"></use>
                </svg>
						<svg xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1"
							xml:space="preserve" class="u-svg-content" viewBox="0 0 160 140"
							x="0px" y="0px" id="svg-8b4e">
						<g>
						<g>
						<path
								d="M138.9,102.2c-9.5,10.1-24.4,20.2-41.2,27.4C63.2,144.5,21,147.1,3.1,112.4c-9.9-19.1,6.5-28.8,11.8-45.7
			c5.3-16.9-11.4-32.3-5.1-49.9c1.8-4.9,4.9-9,8.9-11.9C24,1,30.8-0.8,37.8,0.3C43.6,1.2,49,3.5,54.3,5.7c8.8,3.7,17.4,7.1,26.3,9.8
			c15.7,4.7,31.3,3.7,47.1,7.2c8.5,1.9,16.7,5.6,22.6,11.8C170.3,55.7,155.8,84.1,138.9,102.2z"></path>
</g>
</g></svg>
					</div>
					<div class="u-clearfix u-layout-wrap u-layout-wrap-1">
						<div class="u-gutter-0 u-layout">
							<div class="u-layout-row">
								<div
									class="u-align-left u-container-style u-layout-cell u-left-cell u-size-30 u-white u-layout-cell-1">
									<div
										class="u-container-layout u-valign-top u-container-layout-2">
										<h2 class="u-text u-text-palette-1-base u-text-1">Update
											Product</h2>
										<p class="u-text u-text-2">This task won't effect your
											balance, proceed if you did not buy or sold any product. In
											short only if you already had this product in your stock or
											you put wrong information while adding product.</p>
									</div>
								</div>
								<div
									class="u-align-left u-container-style u-layout-cell u-right-cell u-size-30 u-white u-layout-cell-2">
									<div
										class="u-container-layout u-valign-middle u-container-layout-3">
										<div class="u-expanded-width u-form u-form-1">

											<%
												product = products.get(ix);
											%>
											<form action="#" method="POST"
												class="u-clearfix u-form-spacing-10 u-form-vertical u-inner-form"
												style="padding: 17px;" source="mailchimp" name="form">
												<input type="hidden" name="productId"
													value="<%=product.getProductId()%>">
												<div class="u-form-group u-form-name u-form-group-1">
													<label for="name-3b9a"
														class="u-form-control-hidden u-label"></label> <input
														type="text" placeholder="Enter product name"
														id="name-3b9a" name="productName"
														value="<%=product.getProductName()%>"
														class="u-border-2 u-border-black u-border-no-left u-border-no-right u-border-no-top u-input u-input-rectangle u-input-1"
														required="required">
												</div>
												<div class="u-form-group u-form-group-3">
													<label for="text-5553"
														class="u-form-control-hidden u-label"></label> <input
														type="number" placeholder="Enter product quantity"
														id="text-5553" name="quantity"
														value="<%=product.getQuantity()%>"
														class="u-border-2 u-border-black u-border-no-left u-border-no-right u-border-no-top u-input u-input-rectangle u-input-3"
														required="required" min="1" step="1">
												</div>
												<div
													class="u-align-center u-form-group u-form-submit u-form-group-8">
													<input type="submit" value="Cancel" name="btn"
														class="u-btn u-btn-submit u-button-style u-hover-palette-1-dark-1 u-palette-1-base u-btn-1">
													<input type="submit" value="Delete" name="btn"
														class="u-btn u-btn-submit u-button-style u-hover-palette-1-dark-1 u-palette-1-base u-btn-1">
													<input type="submit" value="Update" name="btn"
														class="u-btn u-btn-submit u-button-style u-hover-palette-1-dark-1 u-palette-1-base u-btn-1">
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</c:if>


</body>
</html>