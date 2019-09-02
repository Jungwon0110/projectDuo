<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<title>ProjectDuo</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/main.css">
<sec:authorize access="isAnonymous()">
<style>
.row {
	filter: blur(3px);
	pointer-events: none;
}
</style>
</sec:authorize>
<jsp:include page="bootStrap.jsp"></jsp:include>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<sec:authorize access="isAnonymous()">
			<p>
			<h1 style="position: absolute; top: 30%; background-color: rgba(0, 0, 0, 0.5); color: white; font-size: 5vw; text-align: center">로그인 후에 이용해주세요</h1>
			</p>
		</sec:authorize>
		<div class="row">
			<div class="col-sm-12 invisibleContents2"></div>
			<sec:authorize access="isAnonymous()">
				<div class="col-sm-3" style="background-color: rgba(0, 0, 0, 0.3)">
					<h1>공지사항</h1>
				</div>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_USER')">
				<div class="col-sm-3" style="background-color: rgba(0, 0, 0, 0.3)">
					<h1>공지사항</h1>
				</div>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<div class="col-sm-3" style="background-color: rgba(0, 0, 0, 0.3)">
					<form action="/insertProc" method="post">
						<div class="form-group">
							<label for="subject">제목</label> <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요." required="required">
						</div>
						<div class="form-group">
							<label for="writer">작성자</label> <input type="text" class="form-control" id="name" name="name" value="<sec:authentication property="principal.name"/>" readonly="readonly">
						</div>
						<div class="form-group">
							<label for=content">내용</label>
							<textarea class="form-control" id="contents" name="contents" rows="3"></textarea>
						</div>
						<input type="hidden" class="form-control" id="kategorie" name="kategorie" value="notice" required="required">
						<button type="submit" class="btn btn-primary">작성</button>
					</form>
				</div>
			</sec:authorize>

			<div class="col-sm-9">
				<table class="table table-hover">
					<tr>
						<th>No</th>
						<th>카테고리</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>수정일</th>
						<th>조회수</th>
					</tr>
					<c:forEach var="notice" items="${list}">
						<tr>
							<td><a href="/detail/${notice.num}">${notice.num}</a></td>
							<td><a href="/detail/${notice.num}">${notice.kategorie}</a></td>
							<td><a href="/detail/${notice.num}">${notice.title}</a></td>
							<td><a href="/detail/${notice.num}">${notice.name}</a></td>
							<td><a href="/detail/${notice.num}">${notice.createdDate}</a></td>
							<td><a href="/detail/${notice.num}">${notice.updatedDate}</a></td>
							<td><a href="/detail/${notice.num}">${notice.viewCount}</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>