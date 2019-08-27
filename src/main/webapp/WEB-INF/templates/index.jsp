<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<title>ProjectDuo</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="js/main.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/main.css">

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="main_backgound">
<!-- 		<img class="mainImage" alt="mainBackGround" src="/img/bgImage.jpg"> -->
		<video autoplay muted loop id="myVideo">
		  <source src="/video/coding1.mp4" type="video/mp4">
		  Your browser does not support HTML5 video.
		</video>
	</div>
	<div id="main_contents">
		<div id="main_forwardIcon">
			<p>We Are Programmer</p>
			<sec:authorize access="isAnonymous()">
				<button id="mainButton1">Enter as a Guest</button>
			</sec:authorize>
		</div>
		<sec:authorize access="isAnonymous()">
		<div class="form-wrap">
			<div class="form-tabs">
				<h3 class="login-tab">
					<button class="signinupButton" onclick="signin();">Login</button>
				</h3>
				<h3 class="signup-tab">
					<button class="signinupButton" onclick="signup();">Sign Up</button>
				</h3>
			</div>
			<!--.tabs-->

			<div class="tabs-content">
				<div id="signup-tab-content">
					<form class="signup-form" action="/register" method="post">
						<input type="email" id="email" name="email"  autocomplete="off" placeholder="Email"> 
						<input type="text" id="name" name="name"  autocomplete="off" placeholder="Username"> 
						<input type="password" name="password" id="signup_pass" autocomplete="off" placeholder="Password">
						<a onclick="signup_eye();"><i id="signup_eye" class="fa fa-eye-slash fa-lg"></i></a>
						<input type="text"  class="input" id="birth" name="birth" autocomplete="off" placeholder="ex.19921201"> 
						<input type="text" id="githubAccount"  name="githubAccount"autocomplete="off" placeholder="github Account"> 
						<input type="hidden" name="role" value="ROLE_USER" />
						
						<input type="submit" class="blueButton" value="Sign Up">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					</form>
				</div>
				<!--.signup-tab-content-->

				<div id="login-tab-content">
					<c:if test="${param.error != null}">        
						<p>
							Invalid email and password.
						</p>
					</c:if>
					<c:if test="${param.logout != null}">       
						<p>
							You have been logged out.
						</p>
					</c:if>
				
					<c:url value="/login" var="loginUrl"/>
					<form class="login-form" action="${loginUrl}" method="post">  
						<input type="text" id="user_login" name="username" placeholder="Email or Username" autocomplete="off"> 
						<input type="password" id="login_pass" name="password"placeholder="Password"  autocomplete="off"> 
						<a onclick="login_eye();"><i id="login_eye" class="fa fa-eye-slash fa-lg"></i></a>
						<%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
						<sec:csrfInput />
						<input type="submit" class="blueButton" value="Login">
					</form>
					<!--.login-form-->
					<div class="help-text">
						<p style="text-align:center">
							Remember Me : <input type="checkbox" name="_spring_security_remember_me" value="true"/>
						</p>
						<p style="text-align:center">
							<a style="color:white;text-decoration:none;" href="#">Forget your password?</a>
						</p>
					</div>
					<!--.help-text-->
				</div>
				<!--.login-tab-content-->
			</div>
			<!--.tabs-content-->
		</div>
		<!--.form-wrap-->
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<div class="form-wrap">
				<button id="mainButton1">Show PortFolio</button>
			</div>
		</sec:authorize>
	</div>
	<script type="text/javascript">
		/* button action */
		function signup() {
		    var x = document.getElementById("signup-tab-content");
		    var y = document.getElementById("login-tab-content");
		    x.style.display = "block";           
		    y.style.display = "none";           
		}
		function signin() {
		    var x = document.getElementById("signup-tab-content");
		    var y = document.getElementById("login-tab-content");
		    x.style.display = "none";           
		    y.style.display = "block";           
		}
		
		
		/* password view */
		function signup_eye() {
			if(document.getElementById("signup_pass").getAttribute("type")=="password"){
				document.getElementById("signup_pass").setAttribute("type", "text"); 
		  		document.getElementById("signup_eye").className = "fa fa-eye fa-lg"
			}else if(document.getElementById("signup_pass").getAttribute("type")=="text"){
				document.getElementById("signup_pass").setAttribute("type", "password"); 
				document.getElementById("signup_eye").className = "fa fa-eye-slash fa-lg"
			}
		}
		function login_eye() {
			if(document.getElementById("login_pass").getAttribute("type")=="password"){
				document.getElementById("login_pass").setAttribute("type", "text"); 
		  		document.getElementById("login_eye").className = "fa fa-eye fa-lg"
			}else if(document.getElementById("login_pass").getAttribute("type")=="text"){
				document.getElementById("login_pass").setAttribute("type", "password"); 
				document.getElementById("login_eye").className = "fa fa-eye-slash fa-lg"
			}
		}
		</script>
</body>
</html>