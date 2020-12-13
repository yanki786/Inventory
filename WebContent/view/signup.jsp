<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="res" class="com.web.entity.Resp" scope="request" />
<jsp:useBean id="user" class="com.web.entity.User" scope="request" />

<c:if test='<%=request.getMethod().equals("POST")%>'>
	<jsp:setProperty property="*" name="user" />
	<jsp:useBean id="signupController" scope="request"
		class="com.web.controller.AuthController" />
	<c:choose>
		<c:when test="<%=signupController.sigup(user) == false%>">
			<jsp:setProperty name="res" property="err" value="Username exist" />
		</c:when>
		<c:otherwise>
			<jsp:forward page="login.jsp" />
		</c:otherwise>
	</c:choose>
</c:if>


<html style="font-size: 16px;" lang="en">
<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<meta name="keywords" content="">
<meta name="description" content="signup page">
<meta name="page_type" content="np-template-header-footer-from-plugin">

<title>Sign up</title>

<link rel="stylesheet" href="../style/root.css" media="screen">
<link rel="stylesheet" href="../style/signup.css" media="screen">

<script class="u-script" type="text/javascript"
	src="../script/jquery.js"></script>
<script class="u-script" type="text/javascript" src="../script/root.js"></script>


<link id="u-theme-google-font" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">


<script type="application/ld+json">{
        "@context": "http://schema.org",
        "@type": "Organization",
        "name": "Inventory Management",
        "url": "index.html",
        "sameAs": []
    }</script>
<meta property="og:title" content="signup">
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
							href="signup.jsp" style="padding: 10px;">Sign up</a></li>
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
		id="sec-4410">
		<div class="u-clearfix u-sheet u-sheet-1">
			<div
				class="u-expanded-height u-palette-5-base u-shape u-shape-rectangle u-shape-1"></div>
			<div
				class="u-clearfix u-expanded-width u-gutter-100 u-layout-wrap u-layout-wrap-1">
				<div class="u-gutter-0 u-layout">
					<div class="u-layout-row">
						<div
							class="u-container-style u-image u-layout-cell u-size-30 u-image-1"
							data-image-width="1600" data-image-height="1067">
							<div class="u-container-layout u-container-layout-1"></div>
						</div>
						<div
							class="u-align-left u-container-style u-layout-cell u-size-30 u-layout-cell-2">
							<div class="u-container-layout u-container-layout-2">
								<div
									class="u-container-style u-expanded-width u-group u-shape-rectangle u-white u-group-1">
									<div class="u-container-layout u-container-layout-3">
										<h3 class="u-align-left u-text u-text-default u-text-1">Sign
											up</h3>
										<div class="u-form u-form-1">

											<form action="#" method="POST"
												class="u-clearfix u-form-spacing-40 u-form-vertical u-inner-form"
												style="padding: 30px;" name="signup_form" source="custom">

												<div class="u-form-group u-form-name u-form-group-1">
													<label for="name-c8f3"
														class="u-form-control-hidden u-label">Name</label> <input
														type="text" placeholder="Enter name" id="name-c8f3"
														name="name"
														value='<%=user.getName() != null ? user.getName() : ""%>'
														class="u-border-1 u-border-black u-border-no-left u-border-no-right u-border-no-top u-input u-input-rectangle u-text-palette-5-dark-3"
														required="required">
												</div>
												<div class="u-form-group u-form-name">
													<label for="name-6c36"
														class="u-form-control-hidden u-label"></label> <input
														type="text" placeholder="Enter username" id="name-6c36"
														name="username"
														class="u-border-1 u-border-black u-border-no-left u-border-no-right u-border-no-top u-input u-input-rectangle u-text-palette-5-dark-3"
														required="required">
												</div>
												<div class="u-form-email u-form-group u-form-group-3">
													<label for="email-70eb"
														class="u-form-control-hidden u-label">Email</label> <input
														type="email" placeholder="Enter a valid email address"
														id="email-70eb" name="mailId"
														value='<%=user.getMailId() != null ? user.getMailId() : ""%>'
														class="u-border-1 u-border-black u-border-no-left u-border-no-right u-border-no-top u-input u-input-rectangle u-text-palette-5-dark-3"
														required="required">
												</div>
												<div class="u-form-group u-form-group-4">
													<label for="password-46d7"
														class="u-form-control-hidden u-label"></label> <input
														type="password" placeholder="Enter password"
														id="password-46d7" name="password"
														value='<%=user.getPassword() != null ? user.getPassword() : ""%>'
														class="u-border-1 u-border-black u-border-no-left u-border-no-right u-border-no-top u-input u-input-rectangle u-text-palette-5-dark-3"
														required="required">
												</div>
												<div class="u-form-group u-form-phone u-form-group-5">
													<label for="phone-5af3"
														class="u-form-control-hidden u-label">Phone</label> <input
														type="tel"
														pattern="\+?\d{0,3}[\s\(\-]?([0-9]{2,3})[\s\)\-]?([\s\-]?)([0-9]{3})[\s\-]?([0-9]{2})[\s\-]?([0-9]{2})"
														placeholder="Enter your phone (e.g. +14155552675)"
														id="phone-5af3" name="phoneNumber"
														value='<%=user.getPhoneNumber() != null ? user.getPhoneNumber() : ""%>'
														class="u-border-1 u-border-black u-border-no-left u-border-no-right u-border-no-top u-input u-input-rectangle u-text-palette-5-dark-3"
														required="required">
												</div>
												<c:if test="<%=res.getErr() != null%>">
													<div class="u-form-group u-form-message u-form-error"><%=res.getErr()%></div>
													<jsp:setProperty name="res" property="err" value="null" />
												</c:if>

												<div id="form-sub"
													class="u-align-center u-form-group u-form-submit">
													<input type="submit" value="submit"
														class="u-btn u-btn-submit u-button-style u-hover-palette-1-dark-1 u-palette-1-base u-text-body-alt-color u-btn-1">
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