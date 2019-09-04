<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<title>ProjectDuo</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/button.css">
<jsp:include page="../bootStrap.jsp"></jsp:include>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="container">
		<div class="col-xs-12" style="margin: 15px auto;">
			<label style="font-size: 20px;"><span class="glyphicon glyphicon-edit"></span>게시글 작성</label>
		</div>

		<div class="col-xs-12">
			<form action="/noticeInsertProc" method="post" enctype="multipart/form-data">
				<!-- 추가 -->
				<div class="form-group">
					<label for="subject">제목</label> <input type="text" class="form-control" id="boardTitle" name="boardTitle" placeholder="제목을 입력하세요." required="required">
				</div>
				<div class="form-group">
					<label for="writer">작성자</label> <input type="text" class="form-control" id="boardAuthor" name="boardAuthor" value="<sec:authentication property="principal.name"/>" readonly="readonly">
				</div>
				<div class="form-group">
					<label for=content">내용</label>
					<textarea class="form-control" id="boardContents" name="boardContents" rows="3" required="required"></textarea>
				</div>
				<input type="hidden" class="form-control" id="kategorie" name="kategorie" value="notice"> <input type="file" name="files">
				<div class="btn-group btn-group-sm" role="group" style="float: right;">
					<button class="customButton" onclick="location.href='/noticeBoard'">목록</button>
					<button type="reset" class="customButton">리셋</button>
					<button type="submit" class="customButton">작성</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>