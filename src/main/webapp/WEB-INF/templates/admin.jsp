<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<title> Happy WOrld </title>
</head>
<body>
<h1>admin</h1>

<sec:authentication property="principal.username"/>님 안녕하세요 !<br>
<sec:authentication property="principal.name"/>님 안녕하세요 !<br>



 <sec:authorize access="isAnonymous()">
 	<br> 로그아웃 중입니다.
 </sec:authorize>
 <sec:authorize access="isAuthenticated()">
 	<br> 로그인 중입니다. 
 </sec:authorize>

<form action="/logout" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="submit" value="로그아웃">
</form>
<a href="/">홈으로 이동</a>



</body>
</html>