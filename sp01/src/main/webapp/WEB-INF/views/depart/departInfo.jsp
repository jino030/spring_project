<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 조회</title>
<style>
body {
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

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
</head>
<body>
	<form>
		<div>
			<label>department_id : <input type="text" name="departmentId" value="${departInfo.departmentId }" readonly></label>
		</div>
		<div>
			<label>department_name : <input type="text" name="departmentName" value="${departInfo.departmentName }"></label>
		</div>
		<div>
			<label>manager_id : <input type="text" name="managerId" value="${departInfo.managerId }"></label>
		</div>
		<div>
			<label>location_id : <input type="text" name="locationId" value="${departInfo.locationId }"></label>
		</div>
		<div>
			<button type="button" id="updateBtn">수정</button>
			<button type="button">삭제</button>
			<button type="button" onclick="location.href='departList'">목록으로</button>
		</div>
	</form>

</body>
</html>