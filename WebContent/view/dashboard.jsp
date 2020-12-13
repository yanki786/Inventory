<%@page import="com.web.entity.User"%>
<%@page import="com.web.bo.UserBO"%>
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
<%
	if (request.getQueryString() != null && request.getQueryString().contains("logout=true") && ubx != null) {
	ubx.close();
	ubx = null;
}
%>
<c:if test='<%=ubx == null%>'>
	<jsp:forward page="login.jsp" />
</c:if>
<%
	User user = ubx.getUser();
%>

<!DOCTYPE html>


<html style="font-size: 16px;" lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="page_type" content="np-template-header-footer-from-plugin">
<title>Dash board</title>
<link rel="stylesheet" href="../style/root.css" media="screen">
<link rel="stylesheet" href="../style/dashboard.css" media="screen">
<script class="u-script" type="text/javascript"
	src="../script/jquery.js" defer=""></script>
<script class="u-script" type="text/javascript" src="../script/root.js"
	defer=""></script>
<link id="u-theme-google-font" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
<link id="u-page-google-font" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i|Oswald:200,300,400,500,600,700">
<script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": "Inventory Management",
		"url": "index.html"
}</script>
<meta property="og:title" content="dashboard">
<meta property="og:type" content="website">
<meta name="theme-color" content="#16b6a1">
<link rel="canonical" href="index.html">
<meta property="og:url" content="index.html">
</head>
<body class="u-body">
	<section class="u-clearfix u-section-1" id="carousel_d74a">
		<div class="u-clearfix u-sheet u-sheet-1">
			<img src="../resource/images/853-min.jpg" alt=""
				class="u-image u-image-default u-image-1" data-image-width="1600"
				data-image-height="1067">
			<div
				class="u-container-style u-expanded-width-sm u-expanded-width-xs u-group u-group-1">
				<div class="u-container-layout u-valign-top u-container-layout-1">
					<h1 class="u-custom-font u-font-playfair-display u-text u-text-1">Hike
						Business</h1>
					<h4 class="u-text u-text-2">Increase your business
						productivity and manage product free of cost.</h4>
				</div>
			</div>
			<div class="u-clearfix u-gutter-30 u-layout-wrap u-layout-wrap-1">
				<div class="u-gutter-0 u-layout">
					<div class="u-layout-col">
						<div class="u-size-30">
							<div class="u-layout-row">
								<div
									class="u-align-center u-container-style u-dialog-link u-layout-cell u-left-cell u-palette-5-light-2 u-size-20 u-layout-cell-1"
									data-href="#sec-eabb">
									<div
										class="u-container-layout u-valign-middle u-container-layout-2">
										<span class="u-icon u-icon-circle u-icon-1"><svg
												class="u-svg-link" preserveAspectRatio="xMidYMin slice"
												viewBox="-42 0 512 512.002" style="">
												<use xmlns:xlink="http://www.w3.org/1999/xlink"
													xlink:href="#svg-17b2"></use></svg> <svg
												xmlns="http://www.w3.org/2000/svg"
												xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1"
												xml:space="preserve" class="u-svg-content"
												viewBox="-42 0 512 512.002" id="svg-17b2">
												<path
													d="m210.351562 246.632812c33.882813 0 63.222657-12.152343 87.195313-36.128906 23.972656-23.972656 36.125-53.304687 36.125-87.191406 0-33.875-12.152344-63.210938-36.128906-87.191406-23.976563-23.96875-53.3125-36.121094-87.191407-36.121094-33.886718 0-63.21875 12.152344-87.191406 36.125s-36.128906 53.308594-36.128906 87.1875c0 33.886719 12.15625 63.222656 36.132812 87.195312 23.976563 23.96875 53.3125 36.125 87.1875 36.125zm0 0"></path>
												<path
													d="m426.128906 393.703125c-.691406-9.976563-2.089844-20.859375-4.148437-32.351563-2.078125-11.578124-4.753907-22.523437-7.957031-32.527343-3.308594-10.339844-7.808594-20.550781-13.371094-30.335938-5.773438-10.15625-12.554688-19-20.164063-26.277343-7.957031-7.613282-17.699219-13.734376-28.964843-18.199219-11.226563-4.441407-23.667969-6.691407-36.976563-6.691407-5.226563 0-10.28125 2.144532-20.042969 8.5-6.007812 3.917969-13.035156 8.449219-20.878906 13.460938-6.707031 4.273438-15.792969 8.277344-27.015625 11.902344-10.949219 3.542968-22.066406 5.339844-33.039063 5.339844-10.972656 0-22.085937-1.796876-33.046874-5.339844-11.210938-3.621094-20.296876-7.625-26.996094-11.898438-7.769532-4.964844-14.800782-9.496094-20.898438-13.46875-9.75-6.355468-14.808594-8.5-20.035156-8.5-13.3125 0-25.75 2.253906-36.972656 6.699219-11.257813 4.457031-21.003906 10.578125-28.96875 18.199219-7.605469 7.28125-14.390625 16.121094-20.15625 26.273437-5.558594 9.785157-10.058594 19.992188-13.371094 30.339844-3.199219 10.003906-5.875 20.945313-7.953125 32.523437-2.058594 11.476563-3.457031 22.363282-4.148437 32.363282-.679688 9.796875-1.023438 19.964844-1.023438 30.234375 0 26.726562 8.496094 48.363281 25.25 64.320312 16.546875 15.746094 38.441406 23.734375 65.066406 23.734375h246.53125c26.625 0 48.511719-7.984375 65.0625-23.734375 16.757813-15.945312 25.253906-37.585937 25.253906-64.324219-.003906-10.316406-.351562-20.492187-1.035156-30.242187zm0 0"></path></svg></span>
										<h5
											class="u-custom-font u-font-playfair-display u-text u-text-3">Profile</h5>
									</div>
								</div>
								<div
									class="u-align-center u-container-style u-layout-cell u-palette-5-light-2 u-size-20 u-layout-cell-2"
									data-href="product.jsp" data-page-id="2388022103">
									<div
										class="u-container-layout u-valign-middle u-container-layout-3">
										<span class="u-icon u-icon-circle u-icon-2"><svg
												class="u-svg-link" preserveAspectRatio="xMidYMin slice"
												viewBox="0 0 512 512" style="">
												<use xmlns:xlink="http://www.w3.org/1999/xlink"
													xlink:href="#svg-fc13"></use></svg> <svg
												xmlns="http://www.w3.org/2000/svg"
												xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1"
												xml:space="preserve" class="u-svg-content"
												viewBox="0 0 512 512" id="svg-fc13">
												<title></title><path
													d="M472.916,224H448.007a24.534,24.534,0,0,0-23.417-18H398V140.976a6.86,6.86,0,0,0-3.346-6.062L207.077,26.572a6.927,6.927,0,0,0-6.962,0L12.48,134.914A6.981,6.981,0,0,0,9,140.976V357.661a7,7,0,0,0,3.5,6.062L200.154,472.065a7,7,0,0,0,3.5.938,7.361,7.361,0,0,0,3.6-.938L306,415.108v41.174A29.642,29.642,0,0,0,335.891,486H472.916A29.807,29.807,0,0,0,503,456.282v-202.1A30.2,30.2,0,0,0,472.916,224Zm-48.077-4A10.161,10.161,0,0,1,435,230.161v.678A10.161,10.161,0,0,1,424.839,241H384.161A10.161,10.161,0,0,1,374,230.839v-.678A10.161,10.161,0,0,1,384.161,220ZM203.654,40.717l77.974,45.018L107.986,185.987,30.013,140.969ZM197,453.878,23,353.619V153.085L197,253.344Zm6.654-212.658-81.668-47.151L295.628,93.818,377.3,140.969ZM306,254.182V398.943l-95,54.935V253.344L384,153.085V206h.217A24.533,24.533,0,0,0,360.8,224H335.891A30.037,30.037,0,0,0,306,254.182Zm183,202.1A15.793,15.793,0,0,1,472.916,472H335.891A15.628,15.628,0,0,1,320,456.282v-202.1A16.022,16.022,0,0,1,335.891,238h25.182a23.944,23.944,0,0,0,23.144,17H424.59a23.942,23.942,0,0,0,23.143-17h25.183A16.186,16.186,0,0,1,489,254.182Z"></path>
												<path
													d="M343.949,325h7.327a7,7,0,1,0,0-14H351V292h19.307a6.739,6.739,0,0,0,6.655,4.727A7.019,7.019,0,0,0,384,289.743v-4.71A7.093,7.093,0,0,0,376.924,278H343.949A6.985,6.985,0,0,0,337,285.033v32.975A6.95,6.95,0,0,0,343.949,325Z"></path>
												<path
													d="M344,389h33a7,7,0,0,0,7-7V349a7,7,0,0,0-7-7H344a7,7,0,0,0-7,7v33A7,7,0,0,0,344,389Zm7-33h19v19H351Z"></path>
												<path
													d="M351.277,439H351V420h18.929a7.037,7.037,0,0,0,14.071.014v-6.745A7.3,7.3,0,0,0,376.924,406H343.949A7.191,7.191,0,0,0,337,413.269v32.975A6.752,6.752,0,0,0,343.949,453h7.328a7,7,0,1,0,0-14Z"></path>
												<path
													d="M393.041,286.592l-20.5,20.5-6.236-6.237a7,7,0,1,0-9.9,9.9l11.187,11.186a7,7,0,0,0,9.9,0l25.452-25.452a7,7,0,0,0-9.9-9.9Z"></path>
												<path
													d="M393.041,415.841l-20.5,20.5-6.236-6.237a7,7,0,1,0-9.9,9.9l11.187,11.186a7,7,0,0,0,9.9,0l25.452-25.452a7,7,0,0,0-9.9-9.9Z"></path>
												<path
													d="M464.857,295H420.891a7,7,0,0,0,0,14h43.966a7,7,0,0,0,0-14Z"></path>
												<path
													d="M464.857,359H420.891a7,7,0,0,0,0,14h43.966a7,7,0,0,0,0-14Z"></path>
												<path
													d="M464.857,423H420.891a7,7,0,0,0,0,14h43.966a7,7,0,0,0,0-14Z"></path></svg></span>
										<h5
											class="u-custom-font u-font-playfair-display u-text u-text-4">Products</h5>
									</div>
								</div>

								<div
									class="u-align-center u-container-style u-layout-cell u-palette-5-light-2 u-size-20 u-layout-cell-3"
									data-href="transcation.jsp" data-page-id="2388022104">
									<div class="u-container-layout u-container-layout-4">
										<span class="u-icon u-icon-circle u-icon-3"><svg
												class="u-svg-link" preserveAspectRatio="xMidYMin slice"
												viewBox="0 0 512.001 512.001" style="">
												<use xmlns:xlink="http://www.w3.org/1999/xlink"
													xlink:href="#svg-a5af"></use></svg> <svg
												xmlns="http://www.w3.org/2000/svg"
												xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1"
												xml:space="preserve" class="u-svg-content"
												viewBox="0 0 512.001 512.001" x="0px" y="0px" id="svg-a5af"
												style="enable-background: new 0 0 512.001 512.001;">
												<g>
												<g>
												<path
													d="M443.077,379.077c-14.594,0-28.244-7.18-36.511-19.206l-21.682-31.538c-25.541,45.795-74.094,75.36-128.883,75.36    c-76.452,0-139.524-58.396-146.96-132.923h14.037c5.484,0,10.518-3.039,13.071-7.894c2.553-4.854,2.206-10.724-0.901-15.243    l-21.53-31.316l-32.624-47.454c-2.754-4.007-7.306-6.402-12.17-6.402c-0.608,0-1.211,0.037-1.807,0.11    c-0.596,0.073-1.183,0.183-1.76,0.326c-1.442,0.359-2.818,0.932-4.081,1.697c-1.768,1.07-3.318,2.515-4.523,4.268L2.599,247.632    c-3.107,4.519-3.454,10.39-0.901,15.243c2.553,4.853,7.587,7.895,13.072,7.895h15.24c3.514,54.931,26.587,106.091,65.859,145.364    c42.773,42.773,99.642,66.329,160.132,66.329s117.359-23.556,160.132-66.329c11.371-11.371,21.44-23.845,30.085-37.178    C445.176,379.029,444.13,379.077,443.077,379.077z"></path>
</g>
</g>
												<g>
												<g>
												<path
													d="M267.255,241.231h-22.505c-4.266,0-7.736-3.47-7.736-7.736v-11.253c0-4.265,3.47-7.735,7.736-7.735h22.505    c4.266,0,7.736,3.47,7.736,7.735c0,8.157,6.613,14.769,14.769,14.769c8.156,0,14.769-6.613,14.769-14.769    c0-19.366-14.848-35.325-33.759-37.103v-7.907c0-8.157-6.613-14.769-14.769-14.769c-8.157,0-14.769,6.613-14.769,14.769v7.907    c-18.91,1.778-33.759,17.737-33.759,37.103v11.253c0,20.554,16.721,37.275,37.275,37.275h22.505c4.266,0,7.736,3.47,7.736,7.736    v11.253c0,4.265-3.471,7.736-7.736,7.736h-22.505c-4.266,0-7.736-3.47-7.736-7.735c0-8.157-6.613-14.769-14.769-14.769    c-8.156,0-14.769,6.613-14.769,14.769c0,19.366,14.848,35.325,33.759,37.103v7.906c0,8.157,6.613,14.769,14.769,14.769    c8.157,0,14.769-6.613,14.769-14.769v-7.907c18.909-1.778,33.759-17.737,33.759-37.103v-11.253    C304.529,257.952,287.809,241.231,267.255,241.231z"></path>
</g>
</g>
												<g>
												<g>
												<path
													d="M510.303,249.125c-2.554-4.854-7.587-7.894-13.072-7.894h-15.24c-3.514-54.931-26.587-106.091-65.859-145.364    C373.36,53.095,316.49,29.539,256.001,29.539S138.641,53.095,95.869,95.868c-11.371,11.371-21.44,23.845-30.085,37.178    c1.041-0.074,2.087-0.122,3.14-0.122c14.595,0,28.244,7.18,36.511,19.206l21.682,31.538    c25.541-45.795,74.094-75.359,128.883-75.359c76.452,0,139.524,58.396,146.96,132.923h-14.037c-5.484,0-10.518,3.039-13.071,7.894    c-2.553,4.854-2.206,10.724,0.901,15.243l21.53,31.316l32.624,47.454c0.689,1.002,1.49,1.903,2.38,2.691    c2.67,2.364,6.143,3.711,9.791,3.711c4.863,0,9.416-2.395,12.171-6.402l19.554-28.443l34.599-50.326    C512.51,259.848,512.856,253.978,510.303,249.125z"></path>
</g>
</g></svg></span>
										<h5
											class="u-custom-font u-font-playfair-display u-text u-text-5">Transaction</h5>
									</div>
								</div>

							</div>
						</div>


						<div class="u-size-30">
							<div class="u-layout-row">
								<div
									class="u-align-center u-container-style u-layout-cell u-palette-5-light-2 u-size-20 u-layout-cell-4"
									data-href="customer.jsp" data-page-id="2388022105">
									<div class="u-container-layout u-container-layout-5">
										<span class="u-icon u-icon-circle u-icon-4"><svg
												class="u-svg-link" preserveAspectRatio="xMidYMin slice"
												viewBox="-20 0 480 480" style="">
												<use xmlns:xlink="http://www.w3.org/1999/xlink"
													xlink:href="#svg-8190"></use></svg> <svg
												xmlns="http://www.w3.org/2000/svg"
												xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1"
												xml:space="preserve" class="u-svg-content"
												viewBox="-20 0 480 480" id="svg-8190">
												<path
													d="m336 328v-80c-.042969-39.746094-32.253906-71.957031-72-72h-128c-39.746094.042969-71.957031 32.253906-72 72v104h16v-104c.035156-30.914062 25.085938-55.964844 56-56h12.6875l45.65625 45.65625c3.125 3.121094 8.1875 3.121094 11.3125 0l45.65625-45.65625h12.6875c30.914062.035156 55.964844 25.085938 56 56v80zm-136-107.3125-28.6875-28.6875h57.375zm0 0"></path>
												<path d="m120 264h16v72h-16zm0 0"></path>
												<path d="m264 264h16v56h-16zm0 0"></path>
												<path
													d="m432 352h-102.023438c-17.632812-9.652344-37.355468-14.84375-57.457031-15.121094-.605469-.054687-1.238281-.078125-1.800781-.078125-20.707031 0-41.085938 5.191407-59.269531 15.101563l-59.449219.097656c-17.671875 0-32 14.328125-32 32-.007812.632812.03125 1.265625.113281 1.894531.117188 2.195313.46875 4.367188 1.039063 6.488281l-45.097656-20.664062-.726563-.359375-26.9375-12.304687c-10.566406-4.863282-22.886719-4.003907-32.679687 2.273437-9.796876 6.28125-15.7187505 17.117187-15.710938 28.75v1.761719c-.0585938 12.949218 7.277344 24.792968 18.894531 30.511718l103.441407 51.800782c7.785156 3.839844 16.34375 5.839844 25.023437 5.847656h284.640625c4.417969 0 8-3.582031 8-8v-112c0-4.417969-3.582031-8-8-8zm-112 112h-172.640625c-6.21875-.011719-12.355469-1.445312-17.933594-4.191406l-103.394531-51.808594c-6.15625-3.027344-10.050781-9.296875-10.03125-16.160156v-1.761719c0-6.179687 3.144531-11.933594 8.351562-15.269531 5.203126-3.335938 11.746094-3.789063 17.359376-1.207032l26.714843 12.199219.71875.351563 63.511719 29.121094c1.050781.480468 2.191406.726562 3.34375.726562h88v-16h-72c-8.546875.011719-15.578125-6.730469-15.925781-15.273438-.011719-.265624-.035157-.535156-.074219-.796874.039062-8.808594 7.191406-15.929688 16-15.929688h61.359375c1.371094 0 2.71875-.351562 3.914063-1.023438l1.917968-1.082031c15.742188-8.550781 33.359375-13.074219 51.273438-13.167969.484375.097657.976562.148438 1.472656.152344 16.730469.160156 33.195312 4.242188 48.0625 11.921875zm104 0h-88v-96h88zm0 0"></path>
												<path d="m352 432h16v16h-16zm0 0"></path>
												<path
													d="m200 160c35.332031-.039062 63.960938-28.671875 64-64v-32c0-35.347656-28.652344-64-64-64s-64 28.652344-64 64v32c.039062 35.328125 28.671875 63.960938 64 64zm-48-96c0-26.507812 21.492188-48 48-48 26.511719 0 48 21.492188 48 48v32c0 26.507812-21.488281 48-48 48-26.507812 0-48-21.492188-48-48zm0 0"></path>
												<path
													d="m184 64c.015625-6.777344 4.285156-12.816406 10.671875-15.089844l-5.34375-15.078125c-12.769531 4.539063-21.308594 16.613281-21.328125 30.167969v8h16zm0 0"></path></svg></span>
										<h5
											class="u-custom-font u-font-playfair-display u-text u-text-6">Customers</h5>
									</div>
								</div>
								<div
									class="u-align-center u-container-style u-layout-cell u-palette-5-light-2 u-size-20 u-layout-cell-5"
									data-href="supplier.jsp" data-page-id="2388022106">
									<div
										class="u-container-layout u-valign-middle u-container-layout-6">
										<span class="u-icon u-icon-circle u-icon-5"><svg
												class="u-svg-link" preserveAspectRatio="xMidYMin slice"
												viewBox="0 0 486.928 486.928" style="">
												<use xmlns:xlink="http://www.w3.org/1999/xlink"
													xlink:href="#svg-6785"></use></svg> <svg
												xmlns="http://www.w3.org/2000/svg"
												xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1"
												xml:space="preserve" class="u-svg-content"
												viewBox="0 0 486.928 486.928" x="0px" y="0px" id="svg-6785"
												style="enable-background: new 0 0 486.928 486.928;">
												<g>
												<path
													d="M175.772,336.649l-57.105-35.255l5.898-16.211l-0.674,0.268c-4.9,1.952-10.073,2.917-15.215,2.917   c-7.358,0-14.686-1.977-21.16-5.856c-10.99-6.596-18.285-17.955-19.715-30.704l-8.178-73.113c-0.138-1.235-0.012-2.428-0.039-3.647   l-34.056,93.615c-4.884,13.423-1.038,26.572,2.579,39.311c0.72,2.536,23.996,67.182,23.996,67.182L5.639,438.017   c-9.448,12.781-6.748,30.809,6.041,40.264c5.142,3.808,11.135,5.639,17.095,5.639c8.821,0,17.53-4.041,23.169-11.681l55.785-75.467   c5.816-7.857,7.23-18.124,3.792-27.266l-2.382-6.318l21.229,13.106l-6.925,76.23c-1.43,15.834,10.234,29.836,26.076,31.274   c0.885,0.08,1.768,0.12,2.636,0.12c14.733,0,27.281-11.239,28.647-26.189l8.531-93.976   C190.313,352.885,185.075,342.385,175.772,336.649z"></path>
												<path
													d="M141.373,169.552l2.185,19.521l18.009-7.175c5.928-24.146-6.916-49.377-30.83-58.073   c-22.824-8.316-47.663,1.317-59.438,21.593c6.393-6.512,14.845-11.078,24.621-12.17   C118.574,130.67,138.851,146.978,141.373,169.552z"></path>
												<path
													d="M141.63,104.809c28.117,0,50.9-22.79,50.9-50.899c0-28.109-22.782-50.901-50.9-50.901   c-28.101,0-50.885,22.792-50.885,50.901C90.745,82.019,113.528,104.809,141.63,104.809z"></path>
												<path
													d="M465.333,301.173H313.146c-11.922,0-21.594,9.665-21.594,21.594v60.669c0,11.93,9.672,21.594,21.594,21.594h152.188   c11.922,0,21.595-9.665,21.595-21.594v-60.669C486.928,310.838,477.255,301.173,465.333,301.173z"></path>
												<path
													d="M295.665,271.353H380.5c11.922,0,21.595-9.664,21.595-21.594v-54.042c0-11.93-9.673-21.594-21.595-21.594h-84.835   c-11.922,0-21.594,9.665-21.594,21.594v54.042C274.071,261.689,283.743,271.353,295.665,271.353z"></path>
												<path
													d="M445.796,427.653H256.59V239.476c0-9.085-7.358-16.452-16.452-16.452h-7.542h-17.201c2.285-5.676,2.522-12.189,0.08-18.325   c-5.045-12.669-19.457-18.782-32.054-13.793l-53.809,21.434l-4.596-40.955c-1.51-13.553-13.737-23.354-27.266-21.787   c-13.545,1.518-23.297,13.721-21.771,27.266l8.179,73.113c0.852,7.656,5.222,14.469,11.825,18.429   c3.889,2.33,8.274,3.511,12.693,3.511c3.084,0,6.186-0.578,9.126-1.751l53.62-21.355c2.98,4.201,7.64,7.12,13.187,7.12h13.41   h25.665v188.177c0,9.086,7.359,16.453,16.453,16.453h20.084c2.518,12.445,13.51,21.819,26.704,21.819   c13.192,0,24.184-9.375,26.701-21.819h61.764c2.519,12.445,13.509,21.819,26.704,21.819c13.191,0,24.184-9.375,26.701-21.819h17   c9.094,0,16.453-7.367,16.453-16.453C462.249,435.02,454.89,427.653,445.796,427.653z"></path>
</g></svg></span>
										<h5
											class="u-custom-font u-font-playfair-display u-text u-text-7">Suppliers</h5>
									</div>
								</div>
								<div
									class="u-align-center u-container-style u-layout-cell u-palette-5-light-2 u-right-cell u-size-20 u-layout-cell-6"
									data-href="dashboard.jsp#carousel_2191" data-page-id="67127218">
									<div
										class="u-align-center u-container-style u-layout-cell u-palette-5-light-2 u-right-cell u-size-20 u-layout-cell-6"
										data-href="?logout=true">
										<div
											class="u-container-layout u-valign-middle u-container-layout-7">

											<span class="u-icon u-icon-circle u-icon-6"><svg
													class="u-svg-link" preserveAspectRatio="xMidYMin slice"
													viewBox="0 0 511.989 511.989" style="">
													<use xmlns:xlink="http://www.w3.org/1999/xlink"
														xlink:href="#svg-8455"></use></svg> <svg
													xmlns="http://www.w3.org/2000/svg"
													xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1"
													xml:space="preserve" class="u-svg-content"
													viewBox="0 0 511.989 511.989" x="0px" y="0px" id="svg-8455"
													style="enable-background: new 0 0 511.989 511.989;">
													<g>
													<g>
													<g>
													<path
														d="M110.933,221.782c-4.71,0-8.533,3.823-8.533,8.533v51.2c0,4.71,3.823,8.533,8.533,8.533s8.533-3.823,8.533-8.533v-51.2     C119.467,225.605,115.644,221.782,110.933,221.782z"></path>
													<path
														d="M111.855,2.304L31.172,34.586C8.448,43,0,54.418,0,76.715v358.477c0,22.298,8.448,33.715,30.959,42.061l81.058,32.427     c4.011,1.519,8.038,2.287,11.981,2.287c17.152,0,29.602-14.336,29.602-34.091V34.049C153.6,9.78,134.246-6.126,111.855,2.304z      M136.533,477.876c0,10.18-5.035,17.024-12.535,17.024c-1.869,0-3.883-0.401-5.803-1.118L37.103,461.33     c-16.102-5.965-20.036-11.102-20.036-26.138V76.715c0-15.036,3.934-20.164,20.241-26.206l80.725-32.29     c2.082-0.785,4.087-1.186,5.956-1.186c7.501,0,12.544,6.835,12.544,17.016V477.876z"></path>
													<path
														d="M178.133,51.115h120.533c14.114,0,25.6,11.486,25.6,25.6v128c0,4.71,3.814,8.533,8.533,8.533     c4.719,0,8.533-3.823,8.533-8.533v-128c0-23.526-19.14-42.667-42.667-42.667H178.133c-4.71,0-8.533,3.823-8.533,8.533     S173.423,51.115,178.133,51.115z"></path>
													<path
														d="M332.8,298.582c-4.719,0-8.533,3.823-8.533,8.533v128c0,14.114-11.486,25.6-25.6,25.6H179.2     c-4.71,0-8.533,3.823-8.533,8.533s3.823,8.533,8.533,8.533h119.467c23.526,0,42.667-19.14,42.667-42.667v-128     C341.333,302.405,337.519,298.582,332.8,298.582z"></path>
													<path
														d="M511.343,252.655c-0.435-1.05-1.058-1.988-1.852-2.782l-85.325-85.333c-3.337-3.336-8.73-3.336-12.066,0     c-3.337,3.337-3.337,8.73,0,12.066l70.767,70.775H196.267c-4.71,0-8.533,3.823-8.533,8.533c0,4.71,3.823,8.533,8.533,8.533     h286.601L412.1,335.215c-3.337,3.337-3.337,8.73,0,12.066c1.664,1.664,3.849,2.5,6.033,2.5c2.185,0,4.369-0.836,6.033-2.5     l85.325-85.325c0.794-0.794,1.417-1.732,1.852-2.782C512.205,257.093,512.205,254.738,511.343,252.655z"></path>
</g>
</g>
</g></svg></span>
											<h5
												class="u-custom-font u-font-playfair-display u-text u-text-8">Log
												out</h5>
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
		class="u-align-center u-black u-clearfix u-container-style u-dialog-block u-opacity u-opacity-70 u-valign-middle u-section-5"
		id="sec-eabb">
		<div
			class="u-container-style u-dialog u-shape-rectangle u-white u-dialog-1">
			<div class="u-container-layout u-container-layout-1">
				<div class="u-shape u-shape-svg u-text-palette-1-base u-shape-1">
					<svg class="u-svg-link" preserveAspectRatio="none"
						viewBox="0 0 160 140" style="">
						<use xmlns:xlink="http://www.w3.org/1999/xlink"
							xlink:href="#svg-8b4e"></use></svg>
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
								class="u-align-left u-container-style u-layout-cell u-size-60 u-white u-layout-cell-1">
								<div
									class="u-container-layout u-valign-middle u-container-layout-2">
									<div class="u-expanded-width u-form u-form-1">
										<form action="../process/upUser.jsp" method="POST"
											class="u-clearfix u-form-spacing-10 u-form-vertical u-inner-form"
											style="padding: 17px;" source="custom" name="form">

											<div class="u-form-group u-form-group-1">
												<label for="text-5553" class="u-form-control-hidden u-label"></label>
												<input type="text" placeholder="Enter name" id="text-5553"
													name="name" value="<%=user.getName()%>"
													class="u-border-2 u-border-black u-border-no-left u-border-no-right u-border-no-top u-input u-input-rectangle u-input-3"
													required="required">
											</div>

											<div class="u-form-group u-form-group-2">
												<label for="text-5553" class="u-form-control-hidden u-label"></label>
												<input type="text" placeholder="Enter phone number"
													id="text-5553" name="phoneNumber"
													value="<%=user.getPhoneNumber()%>"
													class="u-border-2 u-border-black u-border-no-left u-border-no-right u-border-no-top u-input u-input-rectangle u-input-3"
													required="required">
											</div>
											<div class="u-form-group u-form-group-3">
												<label for="text-5553" class="u-form-control-hidden u-label"></label>
												<input type="text" placeholder="Enter email" id="text-5553"
													name="mailId" value="<%=user.getMailId()%>"
													class="u-border-2 u-border-black u-border-no-left u-border-no-right u-border-no-top u-input u-input-rectangle u-input-3"
													required="required">
											</div>
											<div class="u-form-group u-form-group-4">
												<label for="text-5553" class="u-form-control-hidden u-label"></label>
												<input type="number" placeholder="balance" id="text-5553"
													name="balance" value="<%=user.getBalance()%>"
													class="u-border-2 u-border-black u-border-no-left u-border-no-right u-border-no-top u-input u-input-rectangle u-input-3"
													required="required">
											</div>
											<div
												class="u-align-center u-form-group u-form-submit u-form-group-5">
												<input
													class="u-btn u-btn-submit u-button-style u-hover-palette-1-dark-1 u-palette-1-base u-btn-1"
													type="submit" value="Update" name="btn">
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
						xlink:href="#svg-d674"></use></svg>
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
	<style>
.u-section-5 {
	min-height: 826px;
}

.u-section-5 .u-dialog-1 {
	width: 545px;
	min-height: 317px;
	box-shadow: 0 0 14px 0 rgba(0, 0, 0, 0.3);
	margin: 60px auto;
}

.u-section-5 .u-container-layout-1 {
	padding: 30px;
}

.u-section-5 .u-text-1 {
	margin: 25px auto 0;
}

.u-section-5 .u-text-2 {
	margin: 20px 0 0;
}

.u-section-5 .u-form-1 {
	margin: 30px auto 0;
}

.u-section-5 .u-form-group-1 {
	width: 100%;
}

.u-section-5 .u-form-group-2 {
	width: 100%;
}

.u-section-5 .u-btn-1 {
	background-image: none;
	border-style: none;
	text-transform: uppercase;
}

.u-section-5 .u-icon-1 {
	width: 16px;
	height: 16px;
	left: auto;
	top: 17px;
	position: absolute;
	right: 16px;
}

@media ( max-width : 1199px) {
	.u-section-5 .u-dialog-1 {
		height: auto;
	}
}

@media ( max-width : 767px) {
	.u-section-5 .u-dialog-1 {
		width: 540px;
		min-height: 333px;
	}
}

@media ( max-width : 575px) {
	.u-section-5 .u-dialog-1 {
		width: 340px;
		min-height: 345px;
	}
	.u-section-5 .u-container-layout-1 {
		padding-left: 20px;
		padding-right: 20px;
	}
}
</style>
</body>
</html>