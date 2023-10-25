<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>Home</title>
<style type="text/css">
body {
	color: #666;
	font: 14px/24px "Open Sans", "HelveticaNeue-Light",
		"Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial,
		"Lucida Grande", Sans-Serif;
	width: 75vw;
	max-width: 1280px;
	margin: 0 auto;
}
#wrapper {
margin: 50px auto;
}
</style>
</head>
<body>
	<div id="wrapper">
		<h1>Hello world!</h1>

		<P>The time on the server is ${serverTime}.</P>

		<div>
			<form action="reqParamTest" method="post">
				<input type="text" name="employeeId">
				<!-- <input type="text" name="lastName"> -->
				<input type="text" name="jobId">
				<button type="submit">전송</button>
			</form>
		</div>
	</div>
</body>
</html>
