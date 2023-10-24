<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 전체조회</title>
<link rel="stylesheet" href="/app/resources/css/emp.css">
</head>
<body>
	<button type="button" onclick="location.href='empInsert'">등록</button>
	<table>
		<thead>
			<tr>
				<th>NO.</th>
				<th>employee_id</th>
				<th>first_name</th>
				<th>last_name</th>
				<th>email</th>
				<th>hire_date</th>
				<th>job_id</th>
				<th>salary</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="e" items="${empList}" varStatus="no">
				<tr onclick="location.href='empInfo?employeeId=${e.employeeId}'">
					<td>${no.count }</td>
					<td>${e.employeeId }</td>
					<td>${e.firstName }</td>
					<td>${e.lastName }</td>
					<td>${e.email }</td>
					<td><fmt:formatDate value="${e.hireDate }" pattern="yyyy년 MM월 dd일" /></td>
					<td>${e.jobId }</td>
					<td><fmt:formatNumber value="${e.salary }" pattern="#,###원" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>