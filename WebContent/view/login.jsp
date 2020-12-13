<%@page import="com.web.bo.UserBO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="userBean" class="com.web.entity.User" scope="request" />
<jsp:useBean id="res" class="com.web.entity.Resp" scope="request" />

<c:if test='<%=request.getMethod().equals("POST")%>'>
	<jsp:setProperty property="*" name="userBean" />
	<jsp:useBean id="controller" scope="request"
		class="com.web.controller.AuthController" />

	<c:set var="val" value="<%=controller.login(userBean)%>" />
	<c:choose>
		<c:when test="${val==-2}">
			<jsp:setProperty name="res" property="err"
				value="Username doesn't exist" />
		</c:when>
		<c:when test="${val==-1}">
			<jsp:setProperty name="res" property="err" value="Invalid password" />
		</c:when>
		<c:otherwise>
			<%
				UserBO ubx = new UserBO(controller.getUser(), controller.getCon());
			session.setAttribute("subx", ubx.getId());
			%>
			<jsp:forward page="dashboard.jsp"  />
		</c:otherwise>
	</c:choose>

</c:if>

<!DOCTYPE html>
<html style="font-size: 16px;" lang="en">
<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<meta name="keywords" content="">
<meta name="description" content="Login">
<meta name="page_type" content="np-template-header-footer-from-plugin">

<title>Login</title>

<link rel="stylesheet" href="../style/root.css" media="screen">
<link rel="stylesheet" href="../style/login.css" media="screen">

<script class="u-script" type="text/javascript"
	src="../script/jquery.js"></script>
<script class="u-script" type="text/javascript" src="../script/root.js"></script>
<script class="u-script" type="text/javascript"
	src="../script/myJquery.js"></script>

<link id="u-theme-google-font" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">


<script type="application/ld+json">{
        "@context": "http://schema.org",
        "@type": "Organization",
        "name": "Inventory Management",
        "url": "index.html",
        "sameAs": []
    }</script>


<meta property="og:title" content="login">
<meta property="og:type" content="website">
<meta name="theme-color" content="#16b6a1">
<link rel="canonical" href="index.html">
<meta property="og:url" content="index.html">

</head>

<body class="u-body">
	<header
		class="u-align-right u-clearfix u-header u-palette-5-dark-3 u-sticky u-header"
		id="sec-f89e">
		<div class="u-clearfix u-sheet u-sheet-1">
			<nav class="u-menu u-menu-dropdown u-offcanvas u-menu-1">
				<div class="menu-collapse"
					style="font-size: 1rem; letter-spacing: 0px; font-weight: 700;">
					<a
						class="u-border-active-palette-1-base u-border-hover-palette-1-base u-border-no-left u-border-no-right u-border-no-top u-button-style u-custom-left-right-menu-spacing u-custom-padding-bottom u-custom-text-shadow u-custom-top-bottom-menu-spacing u-nav-link u-text-active-palette-4-dark-1 u-text-hover-palette-4-light-1 u-text-white"
						href="#" style="text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.4);">
						<svg>
                        <use xmlns:xlink="http://www.w3.org/1999/xlink"
								xlink:href="#menu-hamburger"></use>
                    </svg> <svg version="1.1"
							xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink">
                        <defs>
                            <symbol id="menu-hamburger"
								viewBox="0 0 16 16" style="width: 16px; height: 16px;">
                                <rect y="1" width="16" height="2"></rect>
                                <rect y="7" width="16" height="2"></rect>
                                <rect y="13" width="16" height="2"></rect>
                            </symbol>
                        </defs>
                    </svg>
					</a>
				</div>
				<div class="u-custom-menu u-nav-container">
					<ul class="u-nav u-spacing-20 u-unstyled u-nav-1">
						<li class="u-nav-item"><a
							class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-palette-4-dark-1 u-text-hover-palette-4-light-1 u-text-white"
							href="index.html" style="padding: 10px;">Home</a></li>
						<li class="u-nav-item"><a
							class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-palette-4-dark-1 u-text-hover-palette-4-light-1 u-text-white"
							href="index.html#carousel_b5cb" data-page-id="29012699"
							style="padding: 10px;">Features</a></li>

						<li class="u-nav-item"><a
							class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-palette-4-dark-1 u-text-hover-palette-4-light-1 u-text-white"
							href="index.html#carousel_f864" data-page-id="29012699"
							style="padding: 10px;">Contact Us</a></li>



						<li class="u-nav-item"><a
							class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-palette-4-dark-1 u-text-hover-palette-4-light-1 u-text-white"
							href="login.jsp" style="padding: 10px;">Login</a></li>
						<li class="u-nav-item"><a
							class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-palette-4-dark-1 u-text-hover-palette-4-light-1 u-text-white"
							href="signup.jsp" style="padding: 10px;">Signup</a></li>
					</ul>
				</div>
				<div class="u-custom-menu u-nav-container-collapse">
					<div
						class="u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
						<div class="u-sidenav-overflow">
							<div class="u-menu-close"></div>
							<ul
								class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-2">
								<li class="u-nav-item"><a class="u-button-style u-nav-link"
									href="index.html" style="padding: 10px;">Home</a></li>
								<li class="u-nav-item"><a class="u-button-style u-nav-link"
									href="index.html#carousel_b5cb" data-page-id="29012699"
									style="padding: 10px;">Features</a></li>
								<li class="u-nav-item"><a class="u-button-style u-nav-link"
									href="index.html#carousel_f864" data-page-id="29012699"
									style="padding: 10px;">Contact Us</a></li>
								<li class="u-nav-item"><a class="u-button-style u-nav-link"
									href="login.jsp" style="padding: 10px;">Login</a></li>
								<li class="u-nav-item"><a class="u-button-style u-nav-link"
									href="signup.jsp" style="padding: 10px;">Sign up</a></li>
							</ul>
						</div>
					</div>
					<div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
				</div>
			</nav>
		</div>
	</header>
	<section
		class="u-clearfix u-expanded-width-xl u-palette-5-dark-3 u-section-1"
		id="carousel_7433">
		<div class="u-clearfix u-sheet u-valign-middle-md u-sheet-1">
			<div
				class="u-expanded-height u-palette-5-base u-shape u-shape-rectangle u-shape-1"></div>
			<div
				class="u-clearfix u-expanded-width u-gutter-100 u-layout-wrap u-layout-wrap-1">
				<div class="u-gutter-0 u-layout">
					<div class="u-layout-row">
						<div
							class="u-container-style u-image u-layout-cell u-size-30 u-image-1"
							data-image-width="1306" data-image-height="704">
							<div class="u-container-layout u-container-layout-1"></div>
						</div>
						<div
							class="u-align-left u-container-style u-layout-cell u-size-30 u-layout-cell-2">
							<div
								class="u-container-layout u-valign-middle u-container-layout-2">
								<div
									class="u-container-style u-expanded-width u-group u-opacity u-opacity-10 u-palette-5-base u-shape-rectangle u-group-1">
									<div class="u-container-layout u-container-layout-3">
										<h3
											class="u-align-left u-text u-text-body-alt-color u-text-default u-text-1">
											Login <span style="font-weight: 700;"></span>
										</h3>
										<div alt=""
											class="u-align-center u-image u-image-circle u-preserve-proportions u-image-2"
											data-image-width="1024" data-image-height="1024"></div>
										<div class="u-form u-form-1">

											<form action="#" method="POST"
												class="u-clearfix u-form-spacing-50 u-form-vertical u-inner-form"
												style="padding: 20px;" source="custom" name="login_form">
												<div class="u-form-group u-form-name">
													<label for="name-6c36"
														class="u-form-control-hidden u-label"></label> <input
														type="text" placeholder="Enter username" id="name-6c36"
														name="username"
														value='<%=userBean.getUsername() != null ? userBean.getUsername() : ""%>'
														class="u-border-1 u-border-no-left u-border-no-right u-border-no-top u-border-palette-5-light-2 u-input u-input-rectangle u-text-palette-5-light-3"
														required="required">
												</div>
												<div class="u-form-group">
													<label for="password-6c36"
														class="u-form-control-hidden u-label">Email</label> <input
														type="password" placeholder="Enter password"
														id="password-6c36" name="password"
														class="u-border-1 u-border-no-left u-border-no-right u-border-no-top u-border-palette-5-light-2 u-input u-input-rectangle u-text-palette-5-light-3"
														required="required">
												</div>
												<c:if test="<%=res.getErr() != null%>">
													<div class="u-form-group u-form-message u-form-error"><%=res.getErr()%></div>
													<jsp:setProperty name="res" property="err" value="null" />
												</c:if>
												<div class="u-align-center u-form-group u-form-submit">
													<input type="submit" value="Log in"
														class="u-btn u-btn-submit u-button-style u-palette-1-base u-btn-1">
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
		</div>
	</section>
</body>
</html>