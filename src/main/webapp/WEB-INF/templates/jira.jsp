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
<link rel="stylesheet" href="/css/jira.css">
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<jsp:include page="bootStrap.jsp"></jsp:include>

</head>
<body>
	<script>
		window.console = window.console || function(t) {
		};
	</script>
	<script>
		if (document.location.search.match(/type=embed/gi)) {
			window.parent.postMessage("resize", "*");
		}
	</script>
	<jsp:include page="header.jsp"></jsp:include>
	<section class="section">
		<h1>Agile Board Layout</h1>
		<h4>Drag and Drop Interface</h4>
	</section>
	<div class="drag-container">
		<ul class="drag-list">
			<li class="drag-column drag-column-on-hold"><span class="drag-column-header">
					<h2>On Hold</h2> <svg class="drag-header-more" data-target="options1" fill="#FFFFFF" height="24" viewBox="0 0 24 24" width="24">
						<path d="M0 0h24v24H0z" fill="none"></path>
						<path d="M12 8c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm0 2c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm0 6c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z" />
</path>
			
			</span>
				<div class="drag-options" id="options1">
					<label class="drag-options-label"><input type="checkbox"><span>Research</span></label><label class="drag-options-label"><input type="checkbox"><span>Strategy</span></label><label class="drag-options-label"><input type="checkbox"><span>Inspiration</span></label><label class="drag-options-label"><input type="checkbox"><span>Execution</span></label>
				</div>
				<ul class="drag-inner-list" id="1">
					<li class="drag-item"></li>
					<li class="drag-item"></li>
				</ul></li>
			<li class="drag-column drag-column-in-progress"><span class="drag-column-header">
					<h2>In Progress</h2> <svg class="drag-header-more" data-target="options2" fill="#FFFFFF" height="24" viewBox="0 0 24 24" width="24">
						<path d="M0 0h24v24H0z" fill="none"></path>
						<path d="M12 8c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm0 2c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm0 6c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z" />
</path></svg>
			</span>
				<div class="drag-options" id="options2">
					<label class="drag-options-label"><input type="checkbox"><span>Research</span></label><label class="drag-options-label"><input type="checkbox"><span>Strategy</span></label><label class="drag-options-label"><input type="checkbox"><span>Inspiration</span></label><label class="drag-options-label"><input type="checkbox"><span>Execution</span></label>
				</div>
				<ul class="drag-inner-list" id="2">
					<li class="drag-item"></li>
					<li class="drag-item"></li>
					<li class="drag-item"></li>
				</ul></li>
			<li class="drag-column drag-column-needs-review"><span class="drag-column-header">
					<h2>Needs Review</h2> <svg data-target="options3" class="drag-header-more" fill="#FFFFFF" height="24" viewBox="0 0 24 24" width="24">
						<path d="M0 0h24v24H0z" fill="none"></path>
						<path d="M12 8c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm0 2c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm0 6c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z" />
</path></svg>
			</span>
				<div class="drag-options" id="options3">
					<label class="drag-options-label"><input type="checkbox"><span>Research</span></label><label class="drag-options-label"><input type="checkbox"><span>Strategy</span></label><label class="drag-options-label"><input type="checkbox"><span>Inspiration</span></label><label class="drag-options-label"><input type="checkbox"><span>Execution</span></label>
				</div>
				<ul class="drag-inner-list" id="3">
					<li class="drag-item"></li>
					<li class="drag-item"></li>
					<li class="drag-item"></li>
					<li class="drag-item"></li>
				</ul></li>
			<li class="drag-column drag-column-approved"><span class="drag-column-header">
					<h2>Approved</h2> <svg data-target="options4" class="drag-header-more" fill="#FFFFFF" height="24" viewBox="0 0 24 24" width="24">
						<path d="M0 0h24v24H0z" fill="none"></path>
						<path d="M12 8c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm0 2c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm0 6c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z" />
</path></svg>
			</span>
				<div class="drag-options" id="options4">
					<label class="drag-options-label"><input type="checkbox"><span>Research</span></label><label class="drag-options-label"><input type="checkbox"><span>Strategy</span></label><label class="drag-options-label"><input type="checkbox"><span>Inspiration</span></label><label class="drag-options-label"><input type="checkbox"><span>Execution</span></label>
				</div>
				<ul class="drag-inner-list" id="4">
					<li class="drag-item"></li>
					<li class="drag-item"></li>
				</ul></li>
		</ul>
	</div>
	<section class="section">
		<a href="https://github.com/bevacqua/dragula">Drag and drop functionality by <strong>bevacqua/dragula</strong></a>
	</section>

	<script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-de7e2ef6bfefd24b79a3f68b414b87b8db5b08439cac3f1012092b2290c719cd.js"></script>
	<script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/45226/dragula.min.js"></script>
	<script id="rendered-js">
		dragula(
				[ document.getElementById('1'), document.getElementById('2'),
						document.getElementById('3'),
						document.getElementById('4'),
						document.getElementById('5') ]).

		on('drag', function(el) {

			// add 'is-moving' class to element being dragged
			el.classList.add('is-moving');
		}).on('dragend', function(el) {

			// remove 'is-moving' class from element after dragging has stopped
			el.classList.remove('is-moving');

			// add the 'is-moved' class for 600ms then remove it
			window.setTimeout(function() {
				el.classList.add('is-moved');
				window.setTimeout(function() {
					el.classList.remove('is-moved');
				}, 600);
			}, 100);
		});

		var createOptions = function() {
			var dragOptions = document.querySelectorAll('.drag-options');

			// these strings are used for the checkbox labels
			var options = [ 'Research', 'Strategy', 'Inspiration', 'Execution' ];

			// create the checkbox and labels here, just to keep the html clean. append the <label> to '.drag-options'
			function create() {
				for (var i = 0; i < dragOptions.length; i++) {
					if (window.CP.shouldStopExecution(0))
						break;

					options.forEach(function(item) {
						var checkbox = document.createElement('input');
						var label = document.createElement('label');
						var span = document.createElement('span');
						checkbox.setAttribute('type', 'checkbox');
						span.innerHTML = item;
						label.appendChild(span);
						label.insertBefore(checkbox, label.firstChild);
						label.classList.add('drag-options-label');
						dragOptions[i].appendChild(label);
					});

				}
				window.CP.exitedLoop(0);
			}

			return {
				create : create
			};

		}();

		var showOptions = function() {

			// the 3 dot icon
			var more = document.querySelectorAll('.drag-header-more');

			function show() {
				// show 'drag-options' div when the more icon is clicked
				var target = this.getAttribute('data-target');
				var options = document.getElementById(target);
				options.classList.toggle('active');
			}

			function init() {
				for (i = 0; i < more.length; i++) {
					if (window.CP.shouldStopExecution(1))
						break;
					more[i].addEventListener('click', show, false);
				}
				window.CP.exitedLoop(1);
			}

			return {
				init : init
			};

		}();

		createOptions.create();
		showOptions.init();
		//# sourceURL=pen.js
	</script>


</body>
</html>