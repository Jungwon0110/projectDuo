<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<title>ProjectDuo</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<body>
	<h1>어드민</h1>
	
	<sec:authentication property="principal.username"/>님 안녕하세요
	

	<c:url var="logoutUrl" value="/logout"/>
		<form action="${logoutUrl}" method="post">
			<input type="submit" value="Log out" />
			<input type="hidden"  name="${_csrf.parameterName}" value="${_csrf.token}"/>
		</form>
</body>
</html>