<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link rel="stylesheet" href="/app/resources/css/emp.css">
<link rel="stylesheet" href="resources/css/common.css">
<style>
tr:last-child th:first-child {
    border-bottom-left-radius: 6px;
}
tr:first-child td {
    border-top: 1px solid #c6c9cc;
    border-top-right-radius: 6px;
}
tr th {
	text-align: center;
	border-bottom: 1px solid #c6c9cc;
}
textarea, input {
	width: 100%;
	border: none;
	background: transparent;
	padding: 5px 10px;
}
</style>
</head>
<body>
	<form name="updateForm">
		<table>
			<tr>
				<th>번호</th>
				<td><input type="text" name="bno" readonly value="${info.bno }"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="${info.title }"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer" value="${info.writer }"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="contents">${info.contents }</textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><input type="text" name="image" value="${info.image }"></td>
			</tr>
		</table>
		<button type="button">저장</button>
		<button type="button" onclick="location.href='boardInfo?bno=${info.bno}'">취소</button>
	</form>
	<script>
		document.querySelector('form > button:nth-of-type(1)').addEventListener('click', boardUpdateAjax);

		function boardUpdateAjax(e){
			let info = getBoardInfo();

			fetch('boardUpdate', {
				method: 'post',
				headers : {
					'content-type': 'application/json'
				},
				body : JSON.stringify(info)
			})
			.then(response => response.json())
			.then(result => {
				console.log(result);
			})
			.catch(err => console.log(err));
		}

		function getBoardInfo(){
			let form = document.getElementsByName('updateForm')[0];
			let formData = new FormData(form);

			let objData = {};
			formData.forEach((value, key) => {
				objData[key] = value;
			})

			return objData;
		}

	</script>
</body>
</html>