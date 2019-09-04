<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<style>
	.nav-item{
		color:white;
	}
</style>

<!-- Navigation -->
  <nav id=header class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
    <div class="container">
      <a class="navbar-brand" href="/">WAP</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
			<sec:authorize access="isAnonymous()">
				<li class="nav-item">[로그인 후 모든 기능을 이용할 수 있습니다]</li>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<li class="nav-item">
					[<sec:authentication property="principal.name"/>님 안녕하세요]
				</li>
			</sec:authorize>
          <li class="nav-item active">
            <a class="nav-link" href="/">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">portFolio</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/noticeBoard">Notice</a>
          </li>
          <sec:authorize access="isAuthenticated()">
          <li class="nav-item">
            <c:url var="logoutUrl" value="/logout"/>
			<form style="display: contents;" action="${logoutUrl}" method="post">
				<input class="blueButton" type="submit" value="Logout" />
				<input type="hidden"  name="${_csrf.parameterName}" value="${_csrf.token}"/>
			</form>
          </li>
          </sec:authorize>
        </ul>
      </div>
    </div>
  </nav>

