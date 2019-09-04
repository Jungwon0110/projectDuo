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
			<div class="col-sm-12">
				<table class="table table-hover">
					<colgroup>
						<col width="5%">
						<col width="60%">
						<col width="10%">
						<col width="9%">
						<col width="9%">
						<col width="7%">
					</colgroup>
					<tr>
						<th>No</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>수정일</th>
						<th>조회수</th>
					</tr>
					<tr>
						<td>${detail.num}</a></td>
						<td>${detail.title}</a></td>
						<td>${detail.name}</a></td>
						<td>${detail.createdDate}</a></td>
						<td>${detail.updatedDate}</a></td>
						<td>${detail.viewCount}</a></td>
					</tr>
					<tr>
						<th colspan="6" style="text-align: center">내용</th>
					</tr>
					<tr>
						<td>
						<td>${detail.contents}</a></td>
						</td>
					</tr>
					<tr>
						<button class="btn btn-primary" onclick="location.href='/update/${detail.num}'">수정</button>
						<button class="btn btn-danger" onclick="location.href='/delete/${detail.num}'">삭제</button>

					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>