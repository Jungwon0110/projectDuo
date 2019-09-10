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
			<div class="col-xs-12" style="margin: auto;margin-bottom:10px">
				<p style="font-size: 10vw;font-family: 'Noto Sans', sans-serif;">
					<b style="color: blue">G</b>
					<b style="color: red">o</b>
					<b style="color: yellow">o</b>
					<b style="color: blue">g</b>
					<b style="color: green">l</b>
					<b style="color: red">e</b>
				<p>
			</div>
			<div class="col-xs-12" style="margin: auto">
				<input style="padding:10px;border-radius:10px;width:700px;margin-right:20px" type="text"><i style="font-size:20px" class="fas fa-search"></i>
			</div>
		</div>
	</div>




</body>
</html>