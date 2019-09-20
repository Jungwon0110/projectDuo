<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<title>ProjectDuo</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/button.css">
<jsp:include page="bootStrap.jsp"></jsp:include>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-xs-12" style="margin: auto;width: 85%">
				<label style="font-size: 20px;">
				<span class="glyphicon glyphicon-list-alt">
				</span>Agile Board List</label>
				<table class="table table-hover" width="100%">
					<colgroup>
						<col width="5%">
						<col width="50%">
						<col  class="mobileHiddenContents" width="10%">
						<col class="mobileHiddenContents" width="10%">
						<col class="mobileHiddenContents" width="10%">
					</colgroup>
					<tr>
						<th>No</th>
						<th>보드명</th>
						<th>리더</th>
						<th class="mobileHiddenContents">작성일</th>
						<th class="mobileHiddenContents">수정일</th>
						<th class="mobileHiddenContents">조회수</th>
					</tr>
					<c:forEach var="notice" items="${list}">
						<tr onclick="location.href='/noticeDetail/${notice.boardNum}'" style="cursor: pointer">
							<td>${notice.boardNum}</td>
							<td>${notice.boardTitle}</td>
							<td>${notice.boardAuthor}</td>
							
							<td class="mobileHiddenContents"><fmt:formatDate value="${notice.createdDate}" pattern="yyyy.MM.dd HH:mm:ss"/></td>
							<td class="mobileHiddenContents"><fmt:formatDate value="${notice.updatedDate}" pattern="yyyy.MM.dd HH:mm:ss"/></td>
							<td class="mobileHiddenContents">${notice.viewCount}</td>
						</tr>
					</c:forEach>
					<tr>
					<tr>
				</table>
				<div class="btn-group btn-group-sm" role="group" style="float: right;">
					<button class="customButton" onclick="location.href='/noticeInsert'">공지사항 작성</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
