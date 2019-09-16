<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>ProjectDuo</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/button.css">
<jsp:include page="../bootStrap.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="container">
		<div class="col-xs-12" style="margin: auto">
			<label style="font-size: 20px;"> <span class="glyphicon glyphicon-list-alt"></span>게시글 상세
			</label>
		</div>
		<div class="col-xs-12">
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
				<label>첨부파일</label><br> <img width="30%" alt="첨부파일이 없습니다." src="/uploadFile/image/${files.fileName}">
				<p>
					<a href="/fileDown/${detail.boardNum}">${files.fileOriName}</a>
				</p>
			</div>
			<div class="form-group">
				<label>내용</label>
				<p>${detail.boardContents}</p>
			</div>
			<div class="btn-group btn-group-sm" role="group" style="float: right;">
				<button class="customButton" onclick="location.href='/noticeBoard'">목록</button>
				<button class="customButton" onclick="location.href='/noticeUpdate/${detail.boardNum}'">수정</button>
				<button class="customButton" onclick="location.href='/noticeDelete/${detail.boardNum}'">삭제</button>
			</div>
		</div>
	</div>
<jsp:include page="../comment.jsp"></jsp:include>
</body>
</html>
