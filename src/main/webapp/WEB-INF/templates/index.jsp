<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<title>ProjectDuo</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<script type="text/javascript" src="js/main.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/table.css">
<link rel="stylesheet" href="css/main.css">
<jsp:include page="bootStrap.jsp"></jsp:include>
<style>
* {
	box-sizing: border-box;
}
</style>
<body>

	<jsp:include page="header.jsp"></jsp:include>



	<div class="container" style="color: white">
		<video autoplay muted loop id="myVideo">
			<source src="/video/coding1.mp4" type="video/mp4">
			Your browser does not support HTML5 video.
		</video>
		<div class="row">
			<div class="col-sm-12 invisibleContents"></div>
			<div class="col-sm-6" style="margin-bottom: 50px;">
				<h1>We Are Programmer</h1>
				<button id="mainButton1">
					<a href="https://github.com/Jungwon0110/projectDuo" target="_blank"> <i class="fab fa-github"></i>
					</a>
				</button>
				<sec:authorize access="isAnonymous()">
					<button id="mainButton1">Enter as a Guest</button>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<button id="mainButton1">Show PortFolio</button>
				</sec:authorize>
			</div>
			<sec:authorize access="isAnonymous()">
				<div class="col-sm-6">
					<div id="form-wrap">
						<div class="form-tabs">
							<h3 class="login-tab">
								<button class="signinupButton" onclick="signin();">Login</button>
							</h3>
							<h3 class="signup-tab">
								<button class="signinupButton" onclick="signup();">Sign Up</button>
							</h3>
						</div>
						<!--.tabs-->

						<div id="tabs-content">
							<div id="signup-tab-content">
								<form id="signup-form" class="signup-form" action="/register" method="post">
									<input type="email" id="email" name="email" autocomplete="off" placeholder="Email" onKeyup="chkEmail(this)">
									<p id="chkemail">이메일 형식으로 입력하세요.</p>
									<input type="button" id="existchk" style="display: none;" onClick="isexist()"> 
									<input type="checkbox" id="emailchecking" name="emailchecking" style="display: none;">
									<input type="button" id="sendEmail" style="display: none;" onClick="sendregEmail()" value="이메일인증하기"> 
									<input type="text" id="name" name="name" autocomplete="off" placeholder="Username"> 
									<input type="password" name="password" id="signup_pass" autocomplete="off" placeholder="Password"> 
									<a onclick="signup_eye();"> <i style="color: white" id="signup_eye" class="fa fa-eye-slash fa-lg"></i></a> 
									<input type="text" class="input" id="birth" name="birth" autocomplete="off" placeholder="ex.19921201">
									 <input type="text" id="githubAccount" name="githubAccount" autocomplete="off" placeholder="github Account"> 
									 <input type="hidden" name="role" value="ROLE_GUEST" /> 
									 <input type="checkbox" id="chk" name="chk" onClick="boxChk(this)"><a>약관동의?</a> 
									 <input type="button" id="register_btn" class="customButton" value="Sign Up" onClick="register()" disabled="disabled"> <input
										type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"
									/>
								</form>
							</div>
							<!--.signup-tab-content-->

							<div id="login-tab-content">
								<c:if test="${param.error != null}">
									<p>Invalid email and password.</p>
								</c:if>
								<c:if test="${param.logout != null}">
									<p>You have been logged out.</p>
								</c:if>

								<c:url value="/login" var="loginUrl" />
								<form class="login-form" action="${loginUrl}" method="post">
									<input type="text" id="user_login" name="username" placeholder="Email or Username" autocomplete="off"> <input type="password" id="login_pass" name="password" placeholder="Password" autocomplete="off"> <a onclick="login_eye();"><i style="color: white" id="login_eye" class="fa fa-eye-slash fa-lg"></i></a>
									<%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
									<sec:csrfInput />
									<input type="submit" class="customButton" value="Login">
								</form>
								<!--.login-form-->
								<div class="help-text">
									<p style="text-align: center">
										Remember Me : <input type="checkbox" name="_spring_security_remember_me" value="true" />
									</p>
									<p style="text-align: center">
										<a style="color: white; text-decoration: none;" href="#">Forget your password?</a>
									</p>
								</div>
								<!--.help-text-->
							</div>
							<!--.login-tab-content-->
						</div>
						<!--.tabs-content-->
					</div>
				</div>
			</sec:authorize>
		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		/* button action */
		function signup() {
			var x = document.getElementById("signup-tab-content");
			var y = document.getElementById("login-tab-content");
			boxChk(document.getElementById("chk"))
			x.style.display = "block";
			y.style.display = "none";
		}
		function signin() {
			var x = document.getElementById("signup-tab-content");
			var y = document.getElementById("login-tab-content");
			x.style.display = "none";
			y.style.display = "block";
		}

		/* 약관동의 */
		function boxChk(checkbox) {
			var btn = document.getElementById("register_btn")
			if (checkbox.checked) {
				btn.className = "customButton"
				btn.disabled = "";
			} else {
				btn.disabled = "disabled";
				btn.className = "customButton";
			}
		}

		/* 회원가입하기 & 인증 메일 발송 */
		function register(){
			var chkemail = document.getElementById("emailchecking").checked;
			var chkagreement = document.getElementById("chk").checked;
			if(chkemail&&chkagreement){
				document.getElementById("signup-form").submit();
			}
    }
		
		/*이메일 형식 체크 */
		function chkEmail(obj) {
			if (obj.value.length > 0) {
				var regExp = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/i;

				if (!regExp.test(obj.value)) {
					document.getElementById("chkemail").style.display="block";
					document.getElementById("chkemail").innerHTML = "이메일 형식으로 입력하세요.";
						document.getElementById("emailchecking").checked="";
					return false;
				}else{
					document.getElementById("chkemail").style.display="none";
					document.getElementById("existchk").click();
				}
			}
		}
		
		/*이메일 중복체크*/
		function isexist() {
			var email = document.getElementById("email").value;
			$.ajax({
				url : "/find/" + email,
				method : "POST",
				dataType : "json",
				success : function(data) {
					document.getElementById("chkemail").style.display = "block";
					document.getElementById("chkemail").innerHTML = "이미 존재하는 이메일입니다.";
					document.getElementById("email").value = "";
				},
				error : function(data) {
					document.getElementById("chkemail").style.display = "block";
					document.getElementById("chkemail").innerHTML = "중복체크 성공";
					document.getElementById("sendEmail").style.display="block";
					document.getElementById("emailchecking").checked="checked";

				}
			});
			boxChk(document.getElementById("chk"));
		}
		
		/*이메일 인증하기*/
		function sendregEmail(){
			var email = document.getElementById("email").value;
			$.ajax({
				url:"/emailConfirm/"+email,
				method:"POST",
				success:function(data){
					alert("메일이 발송되었습니다.");
				}
			});
		}

	      /* 생년월일 숫자체크 */
	      function numchk(chknum){
	          if(chknum.value.length != 8){
	             alert("생년월일은  8자리 입니다.");
	            document.getElementById("birth").focus();
	            return false;
	         }
	          if(isNaN(chknum.value)){
	            alert("문자가 있습니다. 숫자 8자리로 입력하세요.");
	            document.getElementById("birth").value="";
	            return false;
	         }
	      }

	      /* 약관동의 */
	      function boxChk(agree){
	         if(agree.checked && existchk.checked){
	            document.getElementById("register_btn").disabled="";
	         }else if(agree.checked && !existchk.checked){
	            document.getElementById("register_btn").disabled="disabled";
	         }else{
	            document.getElementById("register_btn").disabled="disabled";
	         }
	      }

	      /* sign up */
	      function submitsignup(){
	         document.getElementById("signup").submit();
	      }

		/* password view */
		function signup_eye() {
			if (document.getElementById("signup_pass").getAttribute("type") == "password") {
				document.getElementById("signup_pass").setAttribute("type",
						"text");
				document.getElementById("signup_eye").className = "fa fa-eye fa-lg"
			} else if (document.getElementById("signup_pass").getAttribute(
					"type") == "text") {
				document.getElementById("signup_pass").setAttribute("type",
						"password");
				document.getElementById("signup_eye").className = "fa fa-eye-slash fa-lg"
			}
		}
		function login_eye() {
			if (document.getElementById("login_pass").getAttribute("type") == "password") {
				document.getElementById("login_pass").setAttribute("type",
						"text");
				document.getElementById("login_eye").className = "fa fa-eye fa-lg"
			} else if (document.getElementById("login_pass").getAttribute(
					"type") == "text") {
				document.getElementById("login_pass").setAttribute("type",
						"password");
				document.getElementById("login_eye").className = "fa fa-eye-slash fa-lg"
			}
		}
	</script>
</body>
</html>