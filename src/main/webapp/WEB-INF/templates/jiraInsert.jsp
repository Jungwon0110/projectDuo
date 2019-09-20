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
	<jsp:include page="header.jsp"></jsp:include>
	<header>
		<h1>
			Drag &amp; Drop<br>
			<span>Lean Kanban Board</span>
		</h1>
	</header>
	<section class="add-task-container">
		<input type="text" maxlength="12" id="taskText" placeholder="New Task..." onkeydown="if (event.keyCode == 13)
                        document.getElementById('add').click()">
		<button id="add" class="button add-button" onclick="addTask()">Add New Task</button>
	</section>
	<main class="main-container">
	<ul class="columns">
		<li class="column to-do-column">
			<div class="column-header">
				<h4>To Do</h4>
			</div>
			<ul class="task-list" id="to-do">
				<li class="task">
					<p>Analysis</p>
				</li>
				<li class="task">
					<p>Coding</p>
				</li>
				<li class="task">
					<p>Card Sorting</p>
				</li>
				<li class="task">
					<p>Measure</p>
				</li>
			</ul>
		</li>
		<li class="column doing-column">
			<div class="column-header">
				<h4>Doing</h4>
			</div>
			<ul class="task-list" id="doing">
				<li class="task">
					<p>Hypothesis</p>
				</li>
				<li class="task">
					<p>User Testing</p>
				</li>
				<li class="task">
					<p>Prototype</p>
				</li>
			</ul>
		</li>
		<li class="column done-column">
			<div class="column-header">
				<h4>Done</h4>
			</div>
			<ul class="task-list" id="done">
				<li class="task">
					<p>Ideation</p>
				</li>
				<li class="task">
					<p>Sketches</p>
				</li>
			</ul>
		</li>
		<li class="column trash-column">
			<div class="column-header">
				<h4>Trash</h4>
			</div>
			<ul class="task-list" id="trash">
				<li class="task">
					<p>Interviews</p>
				</li>
				<li class="task">
					<p>Research</p>
				</li>
			</ul>
			<div class="column-button">
				<button class="button delete-button" onclick="emptyTrash()">Delete</button>
			</div>
		</li>
	</ul>
	</main>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/dragula/3.7.2/dragula.js"></script>
	<script id="rendered-js">
		/* Custom Dragula JS */
		dragula([ document.getElementById("to-do"),
				document.getElementById("doing"),
				document.getElementById("done"),
				document.getElementById("trash") ]);

		removeOnSpill: false.on("drag", function(el) {
			el.className.replace("ex-moved", "");
		}).on("drop", function(el) {
			el.className += "ex-moved";
		}).on("over", function(el, container) {
			container.className += "ex-over";
		}).on("out", function(el, container) {
			container.className.replace("ex-over", "");
		});

		/* Vanilla JS to add a new task */
		function addTask() {
			/* Get task text from input */
			var inputTask = document.getElementById("taskText").value;
			/* Add task to the 'To Do' column */
			document.getElementById("to-do").innerHTML += "<li class='task'><p>"
					+ inputTask + "</p></li>";
			/* Clear task text from input after adding task */
			document.getElementById("taskText").value = "";
		}

		/* Vanilla JS to delete tasks in 'Trash' column */
		function emptyTrash() {
			/* Clear tasks from 'Trash' column */
			document.getElementById("trash").innerHTML = "";
		}
		//# sourceURL=pen.js
	</script>


</body>
</html>