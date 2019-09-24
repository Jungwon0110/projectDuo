<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>ProjectDuo</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/button.css">
<style type="text/css">
#agileInsert {
	display: none;
	margin: 10px auto;
	width: 85%;
	border: 1px solid black;
	padding: 10px;
}
</style>
<jsp:include page="bootStrap.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div id="agileInsert" class="col-xs-12">
				<form action="/makeJiraBoardProc" method="post">
					<label>Agile Board Title</label><br> <input type="text" name="agileTitle"> 
					<input type="hidden" name="agileAuthor" value="<sec:authentication property="principal.name"/>">
					<button style="float: right" class="customButton">만들기</button>
					<button style="float: right" class="customButton" onclick="closeInsertJira()">Cancel</button>
				</form>
			</div>
			<div class="col-xs-12" style="margin: auto; width: 85%">
				<label style="font-size: 20px;"> <span class="glyphicon glyphicon-list-alt"> </span>애자일 보드 목록
				</label>
				<table class="table table-hover" width="100%">
					<colgroup>
						<col width="5%">
						<col width="50%">
						<col class="mobileHiddenContents" width="10%">
						<col class="mobileHiddenContents" width="10%">
						<col class="mobileHiddenContents" width="10%">
					</colgroup>
					<tr>
						<th>No</th>
						<th>보드명</th>
						<th>담당자</th>
						<th class="mobileHiddenContents">작성일</th>
						<th class="mobileHiddenContents">수정일</th>
					</tr>
					<c:forEach var="jira" items="${jiraList}">
						<tr onclick="location.href='/agileBoard/${jira.agileNum}'" style="cursor: pointer">
							<td>${jira.agileNum}</td>
							<td>${jira.agileTitle}</td>
							<td>${jira.agileAuthor}</td>
							<td class="mobileHiddenContents"><fmt:formatDate value="${jira.startTime}" pattern="yyyy.MM.dd HH:mm:ss" /></td>
							<td class="mobileHiddenContents">수정일 입력 준비중</td>
						</tr>
					</c:forEach>
					<tr>
					<tr>
				</table>
				<div class="btn-group btn-group-sm" role="group" style="float: right;">
					<button class="customButton" onclick="viewJiraInsert()">보드 생성</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function viewJiraInsert() {
			var x = document.getElementById("agileInsert");
			x.style.display = "block";
		}
		function closeInsertJira() {
			var x = document.getElementById("agileInsert");
			x.style.display = "none";
		}
	</script>
</body>
</html>