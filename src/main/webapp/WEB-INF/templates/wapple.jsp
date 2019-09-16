<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="https://kit.fontawesome.com/1b10eafc75.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans&display=swap" rel="stylesheet">
<html>
<head>
<title>Google</title>

<link rel="stylesheet" href="css/google.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/button.css">
<jsp:include page="bootStrap.jsp"></jsp:include>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="container">
		<div class="row">
			<div class="col-xs-12" style="margin-top: 30%"></div>
			<div class="col-xs-12" style="text-align:center;margin:auto;margin-bottom:10px;width:100%">
				<p style="font-size: 6vw;font-family: 'Noto Sans', sans-serif;">
					<span style="color:blue">W</span><span style="color:red">a</span><span style="color:yellow">p</span><span style="color:blue">p</span><span style="color:green">l</span><span style="color:red">e</span>
				</p>
			</div>
			<form action="wappleCompleted" method="post" style="width:100%">
				<div class="col-xs-12" style="margin: auto;width:100%;max-width:700px">
					<input type="text" name="search" style="padding: 10px;border-radius: 10px;float: left;width: 89%;">
					<button type="submit" style="padding:10px;float: right;width: 10%;background: rgba(255,255,255,0.1);border:none;">
						<i style="font-size: 20px;" class="fas fa-search"></i>
					</button>
				</div>
			</form>
		</div>
	</div>




</body>
</html>