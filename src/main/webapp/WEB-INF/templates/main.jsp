<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
<style>
img {
  vertical-align: middle;
}

/* Position the image container (needed to position the left and right arrows) */
.container {
  position: relative;
}

/* Hide the images by default */
.mySlides {
  display: none;
}

/* Add a pointer when hovering over the thumbnail images */
.cursor {
  cursor: pointer;
}

/* Next & previous buttons */
.prev,
.next {
  cursor: pointer;
  position: absolute;
  top: 40%;
  width: auto;
  padding: 16px;
  margin-top: -50px;
  color: white;
  font-weight: bold;
  font-size: 20px;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover,
.next:hover {
  background-color: rgba(0, 0, 0, 0.8);
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* Container for image text */
.caption-container {
  text-align: center;
  background-color: #222;
  padding: 2px 16px;
  color: white;
}

.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Six columns side by side */
.column {
  float: left;
  width: 16.66%;
}

/* Add a transparency effect for thumnbail images */
.demo {
  opacity: 0.6;
}

.active,
.demo:hover {
  opacity: 1;
}
</style>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="main_backgound">
		<img class="mainImage" alt="mainBackGround" src="/img/bgImage.jpg">
	</div>
	<div id="title">
		<h1>Portfolio</h1>
	</div>
	<div id="main_content">
	<div class="container">
	  <div class="mySlides">
	    <div class="numbertext">1 / 6</div>
	    <img src="https://source.unsplash.com/1600x900/?dog" style="width:70%">
	  </div>
	
	  <div class="mySlides">
	    <div class="numbertext">2 / 6</div>
	    <img src="https://source.unsplash.com/1600x900/?cat" style="width:70%">
	  </div>
	
	  <div class="mySlides">
	    <div class="numbertext">3 / 6</div>
	    <img src="https://source.unsplash.com/1600x900/?puppy" style="width:70%">
	  </div>
	    
	  <div class="mySlides">
	    <div class="numbertext">4 / 6</div>
	    <img src="https://source.unsplash.com/1600x900/?kitten" style="width:70%">
	  </div>
	
	  <div class="mySlides">
	    <div class="numbertext">5 / 6</div>
	    <img src="https://source.unsplash.com/1600x900/?tree" style="width:70%">
	  </div>
	    
	  <div class="mySlides">
	    <div class="numbertext">6 / 6</div>
	    <img src="https://source.unsplash.com/1600x900/?flower" style="width:70%">
	  </div>
	    
	  <a class="prev" onclick="plusSlides(-1)">❮</a>
	  <a class="next" onclick="plusSlides(1)">❯</a>
	
	  <div class="caption-container">
	    <p id="caption"></p>
	  </div>
	
	  <div class="row">
	    <div class="column">
	      <img class="demo cursor" src="https://source.unsplash.com/1600x900/?dog" style="width:70%" onclick="currentSlide(1)" alt="The Woods">
	    </div>
	    <div class="column">
	      <img class="demo cursor" src="https://source.unsplash.com/1600x900/?cat" style="width:70%" onclick="currentSlide(2)" alt="Cinque Terre">
	    </div>
	    <div class="column">
	      <img class="demo cursor" src="https://source.unsplash.com/1600x900/?puppy" style="width:70%" onclick="currentSlide(3)" alt="Mountains and fjords">
	    </div>
	    <div class="column">
	      <img class="demo cursor" src="https://source.unsplash.com/1600x900/?kitten" style="width:70%" onclick="currentSlide(4)" alt="Northern Lights">
	    </div>
	    <div class="column">
	      <img class="demo cursor" src="https://source.unsplash.com/1600x900/?tree" style="width:70%" onclick="currentSlide(5)" alt="Nature and sunrise">
	    </div>    
	    <div class="column">
	      <img class="demo cursor" src="https://source.unsplash.com/1600x900/?flower" style="width:70%" onclick="currentSlide(6)" alt="Snowy Mountains">
	    </div>
	  </div>
	</div>
</div>
		
		<jsp:include page="footer.jsp"></jsp:include>

	<script>
		var slideIndex = 1;
		showSlides(slideIndex);
		
		function plusSlides(n) {
		  showSlides(slideIndex += n);
		}
		
		function currentSlide(n) {
		  showSlides(slideIndex = n);
		}
		
		function showSlides(n) {
		  var i;
		  var slides = document.getElementsByClassName("mySlides");
		  var dots = document.getElementsByClassName("demo");
		  var captionText = document.getElementById("caption");
		  if (n > slides.length) {slideIndex = 1}
		  if (n < 1) {slideIndex = slides.length}
		  for (i = 0; i < slides.length; i++) {
		      slides[i].style.display = "none";
		  }
		  for (i = 0; i < dots.length; i++) {
		      dots[i].className = dots[i].className.replace(" active", "");
		  }
		  slides[slideIndex-1].style.display = "block";
		  dots[slideIndex-1].className += " active";
		  captionText.innerHTML = dots[slideIndex-1].alt;
		}
	</script>
</body>
</html>
