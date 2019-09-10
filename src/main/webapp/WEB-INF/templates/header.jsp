<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="https://kit.fontawesome.com/1b10eafc75.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans&display=swap" rel="stylesheet">
<style>
	*{
		font-family: 'Noto Sans', sans-serif;
	}
</style>

<!-- Navigation -->

<nav id="header" class="navbar navbar-expand-md navbar-dark bg-dark">
	<a class="navbar-brand" href="/">WAP</a>
	<button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="navbar-collapse collapse" id="navbarsExample03" style="">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a></li>
			<li class="nav-item"><a class="nav-link" href="/portfolio">portFolio</a></li>
			<li class="nav-item"><a class="nav-link" href="/fileUpload">fileUpload</a></li>
			<li class="nav-item"><a class="nav-link" href="/google">Google</a></li>
			<li class="nav-item"><a class="nav-link" href="/jira">Jira</a></li>
			<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a></li>
			<sec:authorize access="isAuthenticated()">
				<li class="nav-item"><a class="nav-link" href="/noticeBoard">Notice</a></li>
			</sec:authorize>
			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
				<div class="dropdown-menu" aria-labelledby="dropdown03">
					<a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another action</a> <a class="dropdown-item" href="#">Something else here</a>
				</div></li>
		</ul>
		<sec:authorize access="isAuthenticated()">
				<li class="nav-item" style="list-style: none;"><a style="color:white;" class="nav-link" href="/myPage">myPage</a></li>
		</sec:authorize>
		<form style="margin-left:10px;" class="form-inline my-2 my-md-0">
			<input class="form-control" type="text" placeholder="Search">
		</form>
		<sec:authorize access="isAuthenticated()">
			<li class="nav-item" style="list-style: none;">
				<form style="display: contents;" action="/logout" method="post">
					<button type="submit" class="customButton">
						logout <i class="fas fa-sign-out-alt"></i>
					</button>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
			</li>
		</sec:authorize>
		<sec:authorize access="isAnonymous()">
			<li class="nav-item" style="list-style: none;">
				<form style="display: contents" action="/login" method="post">
					<button type="submit" class="customButton">
						login <i class="fas fa-sign-in-alt"></i>
					</button>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
			</li>
		</sec:authorize>
	</div>
</nav>
