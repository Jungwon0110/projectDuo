<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div id="header">
	<label for="toggle" onclick>MENU</label> <input type="checkbox"id="toggle">
	<ul id="nav">
			<sec:authorize access="isAnonymous()">
				로그인 후 모든 기능을 이용할 수 있습니다
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal.name"/>님 안녕하세요 !
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<c:url var="logoutUrl" value="/logout"/>
				<form action="${logoutUrl}" method="post">
					<input class="blueButton" type="submit" value="Log out" />
					<input type="hidden"  name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</form>
			</sec:authorize>
		<li class="nav_li"><a class=nav_a href="#">Home</a></li>
		<li class="nav_li"><a class=nav_a href="#">Home</a></li>
		<li class="nav_li"><a class=nav_a href="#">About</a></li>
		<li class="nav_li"><a class=nav_a href="#">Notice</a></li>
	</ul>
</div>
