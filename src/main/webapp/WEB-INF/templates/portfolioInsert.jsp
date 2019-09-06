<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<title>ProjectDuo</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://kit.fontawesome.com/1b10eafc75.js"></script>
<link rel="stylesheet" href="/css/button.css">
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/portfolio.css">
<jsp:include page="bootStrap.jsp"></jsp:include>
<style>
.col-md-7 input[type=text],textarea{
	margin-top : 10px;
	width : 80%;
}
</style>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
		<h1 class="my-4">
			<input type="text" name="portfolioTitle" autocomplete="off" placeholder="Title"/>
		</h1>

		<div class="row">
			<div class="col-md-7">
				<h1><small><input type="text" name="teamName" autocomplete="off" placeholder="teamName"/></small></h1>
				<!-- 파일업로드 -->
				<img style="max-height: 500px; max-width: 500px;" id=image src=""> 
				<input id="imageUpload" type="hidden" name="mainImage" value=""> 
				<input class="upload-name" value="파일선택" disabled="disabled"> 
				<label for="file" class="customButton">업로드</label>
				<input style="display: none" type="file" id=file class="upload-hidden"><br>
				<!-- 파일업로드 -->
				<input type="text" name="githubRepo" autocomplete="off" placeholder="github Repository"/><br>
				<input type="text" name="pageUrl" autocomplete="off" placeholder="page url"/><br>
				<input type="text" name="youtubeUrl" autocomplete="off" placeholder="youtube url"/><br><br>
				<label>Start Time : </label>
				<input type="date" name="startTime"/>&nbsp;
				<label>  End Time : </label>
				<input type="date" name="endTime"/><br><br>
				<label><b>공개여부</b></label><br>
				<label>공개</label>
				<input type="radio" name="visible" value="1">&nbsp;
				<label>비공개</label>
				<input type="radio" name="visible" value="0">
				
				
			</div>

			<div class="col-md-5">
				<h3 class="my-3">Project Description</h3>
				<textarea rows="5" cols="50" name="summary"  placeholder="Description"></textarea>
				<h3 class="my-3">Project Member</h3>
				<ul>
					<li>Leader : </li><input type="text" name="leader"><br>
					<li style="list-style: none;"><b>Member</b></li>
					<li>Dolor Sit Amet</li>
					<li>Consectetur</li>
					<li>Adipiscing Elit</li>
				</ul>
			</div>
		</div>

		 <div class="container">

      <!-- Page Heading -->
      <h1 class="my-4">Page Description
      </h1>

      <!-- Project One -->
      <div class="row">
        <div class="col-md-7">
          <a href="#">
            <img class="img-fluid rounded mb-3 mb-md-0" src="http://placehold.it/700x300" alt="">
          </a>
        </div>
        <div class="col-md-5">
          <h3>Project One</h3>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium veniam exercitationem expedita laborum at voluptate. Labore, voluptates totam at aut nemo deserunt rem magni pariatur quos perspiciatis atque eveniet unde.</p>
          <a class="btn btn-primary" href="#">View Project</a>
        </div>
      </div>
      <!-- /.row -->

      <hr>

      <!-- Project Two -->
      <div class="row">
        <div class="col-md-7">
          <a href="#">
            <img class="img-fluid rounded mb-3 mb-md-0" src="http://placehold.it/700x300" alt="">
          </a>
        </div>
        <div class="col-md-5">
          <h3>Project Two</h3>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut, odit velit cumque vero doloremque repellendus distinctio maiores rem expedita a nam vitae modi quidem similique ducimus! Velit, esse totam tempore.</p>
          <a class="btn btn-primary" href="#">View Project</a>
        </div>
      </div>
      <!-- /.row -->

      <hr>

      <!-- Project Three -->
      <div class="row">
        <div class="col-md-7">
          <a href="#">
            <img class="img-fluid rounded mb-3 mb-md-0" src="http://placehold.it/700x300" alt="">
          </a>
        </div>
        <div class="col-md-5">
          <h3>Project Three</h3>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis, temporibus, dolores, at, praesentium ut unde repudiandae voluptatum sit ab debitis suscipit fugiat natus velit excepturi amet commodi deleniti alias possimus!</p>
          <a class="btn btn-primary" href="#">View Project</a>
        </div>
      </div>
      <!-- /.row -->

      <hr>

      <!-- Project Four -->
      <div class="row">

        <div class="col-md-7">
          <a href="#">
            <img class="img-fluid rounded mb-3 mb-md-0" src="http://placehold.it/700x300" alt="">
          </a>
        </div>
        <div class="col-md-5">
          <h3>Project Four</h3>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, quidem, consectetur, officia rem officiis illum aliquam perspiciatis aspernatur quod modi hic nemo qui soluta aut eius fugit quam in suscipit?</p>
          <a class="btn btn-primary" href="#">View Project</a>
        </div>
      </div>
      <!-- /.row -->

      <hr>

      <!-- Pagination -->
      <ul class="pagination justify-content-center">
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
          </a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">1</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">2</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">3</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">Next</span>
          </a>
        </li>
      </ul>

    </div>
		
		<button class="customButton" style="margin-bottom:20px;float:right">Upload</button>
	</div>
	
	
	
	<script type="text/javascript">
		/* 이미지 업로드 */
		var file = document.getElementById('file');
		var image = document.getElementById('image');
		var imageValue = document.getElementById('imageUpload');
		file.onchange = function(event) {
			var target = event.currentTarget;
			var xmlHttpRequest = new XMLHttpRequest();
			xmlHttpRequest.open('POST', 'https://api.imgur.com/3/image/', true);
			xmlHttpRequest.setRequestHeader("Authorization",
					"Client-ID 4a1ce5627a35af1");
			xmlHttpRequest.onreadystatechange = function() {
				if (xmlHttpRequest.readyState == 4) {
					if (xmlHttpRequest.status == 200) {
						var result = JSON.parse(xmlHttpRequest.responseText);
						image.src = result.data.link;
						imageValue.value = result.data.link;
						console.log(result);
					} else {
						alert("업로드 실패");
						image.src = "http://dy.gnch.or.kr/img/no-image.jpg";
					}
				}
			};
			xmlHttpRequest.send(target.files[0]);
			image.src = "https://nrm.dfg.ca.gov/images/image-loader.gif";
		};

		/* 이미지 삭제 */
		function deleteImage() {
			image.src = "http://dy.gnch.or.kr/img/no-image.jpg";
			imageValue.value = "http://dy.gnch.or.kr/img/no-image.jpg";
		}

		/* 업로드 폼 변경 */
		$(document).ready(
				function() {
					var fileTarget = $('.upload-hidden');

					fileTarget.on('change', function() {
						if (window.FileReader) {
							var filename = $(this)[0].files[0].name;
						} else {
							var filename = $(this).val().split('/').pop()
									.split('\\').pop();
						}

						$(this).siblings('.upload-name').val(filename);
					});
				});
	</script>
	
</body>
</html>
