<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<title>ProjectDuo</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="js/main.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/main.css">
<jsp:include page="../bootStrap.jsp"></jsp:include>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="container">
		<div class="form-group">
			<label>제목</label>
			<p>${detail.boardTitle}</p>
		</div>
		<div class="form-group">
			<label>작성자</label>
			<p>${detail.boardAuthor}</p>
		</div>
		<div class="form-group">
			<label>작성일</label>
			<p>${detail.createdDate}</p>
		</div>
		<div class="form-group">
			<label>수정일</label>
			<p>${detail.updatedDate}</p>
		</div>
		<div class="form-group">
			<label>조회수</label>
			<p>${detail.viewCount}</p>
		</div>
		<div class="form-group">
			<label>내용</label>
			<p>${detail.boardContents}</p>
		</div>
		<button class="customButton" onclick="location.href='/noticeBoard'">목록</button>
		<button class="customButton" onclick="location.href='/noticeUpdate/${detail.boardNum}'">수정</button>
		<button class="customButton" onclick="location.href='/noticeDelete/${detail.boardNum}'">삭제</button>
	</div>
</body>
</html>