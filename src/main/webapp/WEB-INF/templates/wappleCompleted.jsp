<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="https://kit.fontawesome.com/1b10eafc75.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans&display=swap" rel="stylesheet">
<html>
<head>
<title>Google</title>
<link rel="stylesheet" href="css/google.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/button.css">

<jsp:include page="bootStrap.jsp"></jsp:include>

</head>
<body style="display: block;">
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="container">
	    <div class="row">
	        <div class="col-md-4" style="text-align: center;">
	        	<a href="/wapple" style="text-decoration: none;"> 
					<p style="font-size: 3vw;font-family: 'Noto Sans', sans-serif;">
						<span style="color:blue">W</span><span style="color:red">a</span><span style="color:yellow">p</span><span style="color:blue">p</span><span style="color:green">l</span><span style="color:red">e</span>
					</p>
				</a>
	        </div>
	        <div class="col-md-8">
        		<form action="wappleCompleted" method="post" style="width:100%">
		        	<input type="text" name="search" style="padding: 10px;border-radius: 10px;float: left;width: 89%;">
					<button type="submit" style="padding:10px;float: right;width: 10%;background: rgba(255,255,255,0.1);border:none;">
						<i style="font-size: 20px;" class="fas fa-search"></i>
					</button>
		        </form>
	        </div>
	        <div class="col-xs-12" style="width: 100%">
	       	 	<!-- 공지사항 검색결과 -->
	        	<h1>Notice</h1>
				<c:forEach var="notice" items="${notice}">
					<table class="table table-hover" style="margin:auto;width:100%">
						<tr onclick="location.href='/noticeDetail/${notice.boardNum}'" >
							<td><b>제목</b></td>
							<td>${notice.boardTitle}&nbsp;</td>
							<td><b>작성자</b></td>
							<td>${notice.boardAuthor}&nbsp;</td>
							<td><b>내용</b></td>
							<td>
								<p style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;width: 300px;height: 20px;">${notice.boardContents}</p>
							</td>
						</tr>
					</table>
					<hr>
				</c:forEach>
				<c:if test="${empty notice}">
					<p>검색 결과가 없습니다.</p>
				</c:if>
				<!-- 포트폴리오 검색결과 -->
	        	<h1>Portfolio</h1>
				<c:forEach var="portfolio" items="${portfolio}">
					<table class="table table-hover" style="margin:auto;width:100%">
						<tr>
<%-- <tr onclick="location.href='/portfolioDetail/${portfolio.portfolioNum}'" > --%>
							<td><b>제목</b></td>
							<td>${portfolio.portfolioTitle}&nbsp;</td>
							<td><b>팀명</b></td>
							<td>${portfolio.teamName}&nbsp;</td>
							<td><b>팀장</b></td>
							<td>${portfolio.leader}&nbsp;</td>
							<td><b>요약</b></td>
							<td>
								<p style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;width: 300px;height: 20px;">${portfolio.summary}</p>
							</td>
						</tr>
					</table>
					<hr>
				</c:forEach>
				<c:if test="${empty portfolio}">
					<p>검색 결과가 없습니다.</p>
				</c:if>
				
				
	        </div>
	    </div>
	</div>

</body>
</html>