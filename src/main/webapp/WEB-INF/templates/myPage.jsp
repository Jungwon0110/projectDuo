<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<title>ProjectDuo</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://kit.fontawesome.com/1b10eafc75.js"></script>
<link rel="stylesheet" href="/css/button.css">
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/about.css">
<jsp:include page="bootStrap.jsp"></jsp:include>
<link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">

<title>Product example for Bootstrap</title>

<link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/product/">

<!-- Bootstrap core CSS -->
<link href="../../dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="product.css" rel="stylesheet">
<style type="text/css">
#updateForm {
	display: none;
}

.where {
	display: block;
	margin: 25px 15px;
	font-size: 11px;
	color: #000;
	text-decoration: none;
	font-family: verdana;
	font-style: italic;
}

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

/* named upload */
.filebox .upload-name {
	display: inline-block;
	padding: .5em .75em;
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

.filebox.bs3-primary label {
	color: #fff;
	background-color: #337ab7;
	border-color: #2e6da4;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<!-- Page Content -->
	<div class="container">

		<!-- Heading Row -->
		<div id="viewForm" class="row align-items-center my-5">
			<div class="col-lg-5">
				<img class="img-fluid rounded mb-4 mb-lg-0" src="${user.my_image}" alt="사진을 등록해주세요.">
			</div>
			<div class="col-lg-7">
				<h1 class="font-weight-light">${user.name}</h1>
				<p>github : ${user.github_account}</p>
				<p>birth : ${user.birth}</p>
				<p>${user.introduce}</p>
				<button class="customButton" onclick="changeView()">자기소개 수정</button>
			</div>
		</div>
		<div id="updateForm">
			<form action="/updateMyPageProc/${user.email}" method="post">
				<div class="row align-items-center my-5">
					<div class="col-lg-5">
						<img style="max-height: 300px; max-width: 300px;" id=image src="${user.my_image}"> 
						<input id="imageUpload" type="hidden" name="my_image" value="${user.my_image}"> 
						


							<input class="upload-name" value="파일선택" disabled="disabled"> 
							<label for="file" class="customButton">업로드</label>
							 <input style="display: none" type="file" id=file class="upload-hidden">


						<input type="button" class="customButton" onclick="deleteImage()" value="이미지 삭제">
					</div>
					<div class="col-lg-7">
						<label>Name</label> <input class="form-control" type="text" name="name" autocomplete="off" placeholder="이름" value="${user.name}"> <label>Github</label> <input class="form-control" type="text" name="github_account" autocomplete="off" placeholder="github" value="${user.github_account}"> <label>Birth</label> <input class="form-control" type="text" name="birth" autocomplete="off" placeholder="birth" value="${user.birth}">
						<textarea class="form-control" name="introduce" rows="3" required="required" placeholder="자기소개">${user.introduce}</textarea>
						<button type="submit" class="customButton" onclick="changeForm()">수정 완료</button>
					</div>
				</div>
			</form>
		</div>
		<!-- /.row -->

		<!-- Call to Action Well -->
		<div class="card text-white bg-secondary my-5 py-4 text-center">
			<div class="card-body">
				<p class="text-white m-0"></p>
			</div>
		</div>

		<!-- Content Row -->
		<div class="row">
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">Card One</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary btn-sm">More Info</a>
					</div>
				</div>
			</div>
			<!-- /.col-md-4 -->
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">Card Two</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod tenetur ex natus at dolorem enim! Nesciunt pariatur voluptatem sunt quam eaque, vel, non in id dolore voluptates quos eligendi labore.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary btn-sm">More Info</a>
					</div>
				</div>
			</div>
			<!-- /.col-md-4 -->
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">Card Three</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary btn-sm">More Info</a>
					</div>
				</div>
			</div>
			<!-- /.col-md-4 -->

		</div>
		<!-- /.row -->

	</div>
	<script type="text/javascript">
		var view = document.getElementById("viewForm");
		var update = document.getElementById("updateForm");
		function changeView() {
			view.style.display = "none";
			update.style.display = "block";
		}
		function changeForm() {
			view.style.display = "block";
			update.style.display = "none";
		}

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