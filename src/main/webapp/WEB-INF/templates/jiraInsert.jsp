<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jira</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/button.css">
<link rel="stylesheet" href="/css/jira.css">
<jsp:include page="bootStrap.jsp"></jsp:include>
<script>
	window.console = window.console || function(t) {
	};
</script>
<script>
	if (document.location.search.match(/type=embed/gi)) {
		window.parent.postMessage("resize", "*");
	}
</script>
</head>
<body style="min-width: 650px">
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<div class="col-xs-12" style="margin: auto;">
					<header>
						<h1>[${jiraList.agileTitle}]</h1>
						<span style="float:right;font-size: 20px">담당자 : ${jiraList.agileAuthor}</span>
					</header>
			</div>
			<div class="col-xs-12" style="margin: auto; width: 90%">
				<section class="add-task-container">
					<input type="text" maxlength="12" id="taskText" placeholder="New Task..." onkeydown="if (event.keyCode == 13)document.getElementById('add').click()">
					<button id="add" class="button add-button" onclick="addTask()">Add New Task</button>
				</section>
			</div>
			<ul class="columns">
				<li class="column to-do-column">
					<div class="column-header">
						<h4>To Do</h4>
					</div>
					<ul class="task-list" id="to-do">
						<li class="task">
							<p>Analysis</p>
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
					</ul>
					<div class="column-button">
						<button class="button delete-button" onclick="emptyTrash()">Delete</button>
					</div>
				</li>
			</ul>
		</div>
	</div>



	<main class="main-container"> </main>
	<footer>
		<p>
			<button>저장</button>
		</p>
	</footer>


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
			document.getElementById("to-do").innerHTML += "<li class='task'><input class=\"jiraInput\" type=\"text\" value=\""
					+ inputTask + "\" readonly onfocus=\"this.blur();\"></li>";
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