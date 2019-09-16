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

<body>
	<jsp:include page="header.jsp"></jsp:include>


	<div class="container">
		<section class="jumbotron text-center">
			<div class="container">
				<h1 class="jumbotron-heading">Portfolio</h1>
				<p class="lead text-muted">공유된 포트폴리오를 볼 수 있습니다.</p>
				<p class="lead text-muted">현재 공개된 포트폴리오 : ${count}</p>
				<p>
					<button class="customButton" onclick="changeLayout('list')">
						list <i class="fas fa-list"></i>
					</button>
					<button class="customButton" onclick="changeLayout('slide')">
						slide <i class="far fa-images"></i>
					</button>
				</p>
			</div>
		</section>


		<div class="slidePortfolio bg-light">
			<div class="row">
				<div class="col-md-12" style="margin: auto">
					<label style="font-size: 20px;"> <span class="glyphicon glyphicon-list-alt">포트폴리오</span>
					</label>
				</div>
				<div class="col-md-12">
					<c:forEach var="portfolio" items="${list}">
						<img class="mySlides" alt="${portfolio.portfolioTitle}" src="${portfolio.mainImage}" style="max-width: 700px; max-height: 300px">
					</c:forEach>
				</div>
				<div class="col-md-1" style="margin: auto">
					<label style="font-size: 20px;"> <span class="glyphicon glyphicon-list-alt">설명</span>
					</label>
				</div>
				<div class="col-md-11" style="margin-top: 10px; padding: 10px;">
					<c:forEach var="portfolio" items="${list}">
						<label class="mySummarys">${portfolio.summary}</label>
					</c:forEach>
				</div>
				<div class="btn-group btn-group-sm" role="group" style="float: left; margin-top: 20px;">
					<button class="customButton" onclick="plusDivs(-1)">❮ Prev</button>
				</div>
				<div class="btn-group btn-group-sm" role="group" style="float: right; margin-top: 20px;">
					<button class="customButton" onclick="plusDivs(1)">Next ❯</button>
				</div>
			</div>
		</div>

		<div class="albumPortfolio py-5 bg-light">
			<div class="container">
				<div class="row">
				
					<c:forEach var="portfolio" items="${list}">
					<div class="col-md-4">
						<div class="card mb-4 box-shadow">
							<img class="card-img-top" alt="Thumbnail [100%x225]" style="height: 225px; width: 100%; display: block;" src="${portfolio.mainImage}">
							<div class="card-body">
								<p class="card-text">${portfolio.summary}</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
										<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
									</div>
									<small class="text-muted">시간</small>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		var slideIndex = 1;
		showDivs(slideIndex);

		function plusDivs(n) {
			showDivs(slideIndex += n);
		}

		function currentDiv(n) {
			showDivs(slideIndex = n);
		}

		function showDivs(n) {
			var i;
			var x = document.getElementsByClassName("mySlides");
			var y = document.getElementsByClassName("mySummarys");
			if (n > x.length) {
				slideIndex = 1
			}
			if (n < 1) {
				slideIndex = x.length
			}
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
				y[i].style.display = "none";
			}
			x[slideIndex - 1].style.display = "block";
			y[slideIndex - 1].style.display = "block";
		}

		var album = document.getElementsByClassName("albumPortfolio");
		var slide = document.getElementsByClassName("slidePortfolio");

		function changeLayout(n) {
			if (n == "slide") {
				album[0].style.display = "none";
				slide[0].style.display = "block";
			} else {
				album[0].style.display = "block";
				slide[0].style.display = "none";
			}
		}
	</script>
</body>
</html>