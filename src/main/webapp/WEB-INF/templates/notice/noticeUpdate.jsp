<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<title>ProjectDuo</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="js/main.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/main.css">
<jsp:include page="../bootStrap.jsp"></jsp:include>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="container">
    <form action="/noticeUpdateProc" method="post">
      <div class="form-group">
        <label for=""boardTitle"">제목</label>
        <input type="text" class="form-control" id="boardTitle" name="boardTitle" value="${detail.boardTitle}">
      </div>
      <div class="form-group">
        <label for="boardContents">내용</label>
        <textarea class="form-control" id="boardContents" name="boardContents" rows="3">${detail.boardContents}</textarea>
      </div>
      <input type="hidden" name="boardNum" value="${boardNum}"/>
      <button type="submit" class="btn btn-primary">수정</button>
    </form>
</div>
</body>
</html>
