<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 정보 조회</title>
<script
  src="https://code.jquery.com/jquery-3.7.1.js"
  integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
  crossorigin="anonymous"></script>
<style>
body {
  width: 800px;
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
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

button:hover {
  background-color: #45a049;
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
			<label>employee_id : <input type="text" name="employeeId" value="${empInfo.employeeId }" readonly></label>
		</div>
		<div>
			<label>first_name : <input type="text" name="firstName" value="${empInfo.firstName }"></label>
		</div>
		<div>
			<label>last_name : <input type="text" name="lastName" value="${empInfo.lastName }" readonly></label>
		</div>
		<div>
			<label>email : <input type="text" name="email" value="${empInfo.email }"></label>
		</div>
		<div>
			<label>hire_date : 
				<input readonly type="date" name="hireDate" 
					value='<fmt:formatDate value="${empInfo.hireDate }" pattern="yyyy-MM-dd" />'
				>
			</label>
		</div>
		<div>
			<label>job_id : <input type="text" name="jobId" value="${empInfo.jobId }" readonly></label>
		</div>
		<div>
			<label>salary : <input type="number" name="salary" value="${empInfo.salary }"></label>
		</div>
		<div>
			<button type="button" id="updateBtn">수정</button>
			<button type="button">삭제</button>
			<button type="button" onclick="location.href='empList'">목록으로</button>
		</div>
	</form>
	<script>
		// 자바스크립트 버전
		document.querySelector('#updateBtn')
						.addEventListener('click', updateEmpInfo);
		
		function updateEmpInfo(event) {
			// form 태그 내부의 input을 기반으로 수정할 대상 정보를 가져옴
			let empInfo = getEmpInfo();

			// 해당 정보를 기반으로 Ajax - QueryString
			fetch('empUpdate', {
				method: 'post',
				body: new URLSearchParams(empInfo)
			})
			.then(response => response.json())
			.then(result => {
				console.log('QueryString', result);
			})
			.catch(err => console.log(err));

			// 해당 정보를 기반으로 Ajax - JSON
			fetch('empUpdateAjax', {
				method: 'post',
				headers: {
					'content-type' : 'application/json'
				},
				body: JSON.stringify(empInfo)
			})
			.then(response => response.json())
			.then(result => {
				console.log('JSON', result);
			})
			.catch(err => console.log(err));
		}

		function getEmpInfo() {
			let inputList = document.querySelectorAll('form input');

			let objData = {};
			inputList.forEach((tag) => {
				objData[tag.name] = tag.value;
			});

			return objData;
		}
	</script>

	<script>
		// jQuery 버전
		$('#updateBtn').on('click', updateEmpInfoAjax);

		function updateEmpInfoAjax(event){
			let empInfo = getEmpInfoAjax();

			// Ajax - QueryString
			$.ajax('empUpdate', {
				type: 'post',
				data: empInfo
			})
			.done(result => {
				console.log('Query String', result);
			})
			.fail(err => console.log(err));

			// Ajax - JSON
			$.ajax('empUpdateAjax', {
				type: 'post',
				contentType: 'application/json',
				data: JSON.stringify(empInfo)
			})
			.done(result => {
				console.log('JSON', result);
			})
			.fail(err => console.log(err));

			return false;
		}

		function getEmpInfoAjax(){
			let formDta = $('form').serializeArray(); // form태그에만 사용가능한 함수. form 태그 내부의 name속성과 value속성을 가져온다.
			console.log(formDta);
			// [{name: 'employeeId', value: '1052'}, ...]
			let objDta = {};
			$.each(formDta, (idx, obj) => {
				objDta[obj.name] = obj.value;
			});

			return objDta;
		}
	</script>
</body>
</html>