<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert Form</title>
</head>
<body>

	<h2>게시글 작성</h2>

	<div class="container">
		<form action="/noticeInsertProc" method="post" enctype="multipart/form-data">
			<!-- 추가 -->
			<div class="form-group">
				<label for="subject">제목</label> <input type="text" class="form-control" id="boardTitle" name="boardTitle" placeholder="제목을 입력하세요.">
			</div>
			<div class="form-group">
				<label for="writer">작성자</label> <input type="text" class="form-control" id="boardAuthor" name="boardAuthor" value="<sec:authentication property="principal.name"/>" readonly="readonly">
			</div>
			<div class="form-group">
				<label for=content">내용</label>
				<textarea class="form-control" id="boardContents" name="boardContents" rows="3"></textarea>
			</div>
			<input type="file" name="files">
			<!-- 추가 -->
			<button type="submit" class="customButton">작성</button>
		</form>
	</div>
</body>
</html>
