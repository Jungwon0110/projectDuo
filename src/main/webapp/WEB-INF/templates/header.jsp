<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div id="header">
	<label for="toggle" onclick>MENU</label> <input type="checkbox"id="toggle">
	<ul id="nav">
			<sec:authorize access="isAnonymous()">
				<li class="nav_li">[로그인 후 모든 기능을 이용할 수 있습니다]</li>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<li class="nav_li">
					[<sec:authentication property="principal.name"/>님 안녕하세요]
				</li>
			</sec:authorize>
					
				
		<li class="nav_li"><a class=nav_a href="#">Home</a></li>
		<li class="nav_li"><a class=nav_a href="#">About</a></li>
		<li style="margin-right:20px" class="nav_li"><a class=nav_a href="/notice">Notice</a></li>
		<sec:authorize access="isAuthenticated()">
			<li class="nav_li">
				<c:url var="logoutUrl" value="/logout"/>
					<form style="display: contents;" action="${logoutUrl}" method="post">
						<input class="blueButton" type="submit" value="Logout" />
						<input type="hidden"  name="${_csrf.parameterName}" value="${_csrf.token}"/>
					</form>
			</li>
		</sec:authorize>
	</ul>
</div>
