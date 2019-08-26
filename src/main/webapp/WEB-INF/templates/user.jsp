<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>user입니다.</h1>
	
	<sec:authentication property="principal.username"/>님 안녕하세요
	
		<c:url var="logoutUrl" value="/logout"/>
		<form action="${logoutUrl}" method="post">
			<input type="submit" value="Log out" />
			<input type="hidden"  name="${_csrf.parameterName}" value="${_csrf.token}"/>
		</form>
</body>
</html>