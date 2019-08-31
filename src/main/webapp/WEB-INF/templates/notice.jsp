<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<title>ProjectDuo</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/main.css">
<jsp:include page="bootStrap.jsp"></jsp:include>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-sm-12 invisibleContents2"></div>
			<div class="col-sm-3" style="background-color : rgba(0,0,0,0.3)">
				<h1>공지사항</h1>
			</div>
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
							<td>${notice.num}</td>
							<td>${notice.kategorie}</td>
							<td>${notice.title}</td>
							<td>${notice.name}</td>
							<td>${notice.createdDate}</td>
							<td>${notice.updatedDate}</td>
							<td>${notice.viewCount}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>