<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
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
label {
 width: 100%;
}
</style>
</head>
<body>
	<form action="boardInsert" method="post">
		<div>
			<label>title : <input type="text" name="title"></label>
		</div>
		<div>
			<label>contents : <input type="text" name="contents"></label>
		</div>
		<div>
			<label>writer : <input type="text" name="writer"></label>
		</div>
		<div>
			<label>image : <input type="text" name="image"></label>
		</div>
		<div>
			<button type="submit">등록</button>
			<button type="button" onclick="location.href='boardList'">목록으로</button>
		</div>
	</form>
</body>
</html>