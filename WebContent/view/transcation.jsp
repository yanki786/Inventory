<%@page import="java.util.function.Predicate"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.stream.Collector"%>
<%@page import="com.web.bo.UserBO"%>
<%@page import="com.web.entity.Transaction"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test='<%=session.getAttribute("subx") == null%>'>
	<jsp:forward page="login.jsp" />
</c:if>
<%
	long id = Long.parseLong(session.getAttribute("subx").toString());
session.setAttribute("subx", id);
UserBO ubx = UserBO.getSession(id);
%>
<c:if test='<%=ubx == null%>'>
	<jsp:forward page="login.jsp" />
</c:if>
<%
	List<Transaction> trc = ubx.getTransactions();
%>
<c:if test='<%=request.getMethod().equals("POST")%>'>

	<c:choose>
		<c:when test='<%=request.getParameter("btn").equals("Submit")%>'>
		</c:when>
		<c:when test='<%=request.getParameter("btn").equals("Cancel")%>'>
		</c:when>
		<c:when test='<%=request.getParameter("btn").equals("Update")%>'>
		</c:when>
		<c:when test='<%=request.getParameter("btn").equals("Delete")%>'>
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
<title>Transaction</title>



<link rel="stylesheet" href="../style/root.css" media="screen">
<link rel="stylesheet" href="../style/product.css" media="screen">
<link rel="stylesheet" href="../style/modal.css" media="screen">

<script class="u-script" type="text/javascript"
	src="../script/jquery.js"></script>
<script class="u-script" type="text/javascript" src="../script/root.js"></script>

<link id="u-theme-google-font" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">


<script type="application/ld+json">{
        "@context": "http://schema.org",
        "@type": "Organization",
        "name": "Inventory Management",
        "url": "index.html"
    }</script>
<meta property="og:title" content="Transaction">
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
									<br><br>
										<h2 class="u-text u-text-1">
											The <b>Transactions</b>
										</h2>
										<div
											class="u-expanded-width u-table u-table-responsive u-table-1">
											<table class="u-table-entity u-table-entity-1">
												<colgroup>
													<col width="20%">
													<col width="20%">
													<col width="20%">
													<col width="20%">
													<col width="20%">
												</colgroup>
												<thead
													class="u-table-header u-text-palette-1-dark-2 u-table-header-1">
													<tr style="height: 46px;">
														<th
															class="u-border-2 u-border-grey-75 u-border-no-left u-border-no-right u-table-cell">
															Date</th>
														<th
															class="u-border-2 u-border-grey-75 u-border-no-left u-border-no-right u-table-cell">
															Product id</th>
														<th
															class="u-border-2 u-border-grey-75 u-border-no-left u-border-no-right u-table-cell">
															Quantity</th>
														<th
															class="u-border-2 u-border-grey-75 u-border-no-left u-border-no-right u-table-cell">
															Price</th>
														<th
															class="u-border-2 u-border-grey-75 u-border-no-left u-border-no-right u-table-cell">
															Balance</th>

													</tr>
												</thead>
												<tbody class="u-table-body">
													<%
														for (int i = 0; i < trc.size(); i++) {
													%>
													<tr class="u-table-row-hover clickable-row"
														style="height: 46px;"
														onclick="window.location.href ='?i=<%=i%>'">
														<td class="u-table-cell"><%=trc.get(i).getTransactionDate()%></td>
														<td class="u-table-cell">pid <%=trc.get(i).getProductId() + 1%></td>
														<td class="u-table-cell"><%=trc.get(i).getQuantity()%></td>
														<td class="u-table-cell"><%=trc.get(i).getPrice()%></td>
														<td class="u-table-cell"><%=trc.get(i).getBalance()%></td>
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


</body>
</html>