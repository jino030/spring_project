<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 등록</title>
<link rel="stylesheet" href="/app/resources/css/emp.css">
<style>
form {
  width: 500px;
  margin: 50px auto;
}
input, select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

button {
  width: 100%;
  background-color: #007fff;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

button:hover {
  background-color: #004a96;
}

form {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
</head>
<body>
	<form action="departInsert" method="post">
		<div>
			<label>department_name : <input type="text" name="departmentName"></label>
		</div>
		<div>
			<label>manager_id : </label>
			<select name="managerId" style="color:#969696">
			<option>===== select manager Id =====</option>
				<c:forEach var="empInfo" items="${empList }">
					<option value="${empInfo.employeeId }">${empInfo.employeeId } : ${empInfo.firstName } ${empInfo.lastName }</option>
				</c:forEach>
			</select>
		</div>
		<div>
			<label>location_id :</label>
			<select name="locationId" style="color:#969696">
			<option>===== select location Id =====</option>
				<c:forEach var="location" items="${locationList }">
					<option value="${location.locationId }">${location.locationId } : ${location.city } ${location.stateProvince }</option>
				</c:forEach>
			</select>
		</div>
		<div>
			<button type="submit">등록</button>
			<button type="button" onclick="location.href='departList'">목록으로</button>
		</div>
	</form>
</body>
</html>