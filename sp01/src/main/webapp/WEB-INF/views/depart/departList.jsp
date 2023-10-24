<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 전체조회</title>
<link rel="stylesheet" href="/app/resources/css/emp.css">
</head>
<body>
	<button type="button" onclick="location.href='departInsert'">등록</button>
	<table>
		<thead>
			<tr>
				<th>NO.</th>
				<th>department_id</th>
				<th>department_name</th>
				<th>manager_id</th>
				<th>location_id</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="d" items="${departList}" varStatus="no">
				<tr onclick="location.href='departInfo?departmentId=${d.departmentId}'">
					<td>${no.count }</td>
					<td>${d.departmentId }</td>
					<td>${d.departmentName }</td>
					<td>${d.managerId }</td>
					<td>${d.locationId }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>