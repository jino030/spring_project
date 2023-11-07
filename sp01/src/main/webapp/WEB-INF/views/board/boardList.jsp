<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link rel="stylesheet" href="resources/css/emp.css">
<link rel="stylesheet" href="resources/css/common.css">
</head>
<body>
    <table>
        <thead>
            <tr>
                <th>No.</th>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th> <!-- yyyy년MM월dd일 -->
            </tr>
        </thead>
        <tbody>
	        <c:forEach var="board" items="${boardList }" varStatus="no">
	        	<tr onclick="location.href='boardInfo?bno=${board.bno}'">
	        		<td>${no.count }</td>
	        		<td>${board.bno }</td>
	        		<td>${board.title }</td>
	        		<td>${board.writer }</td>
	        		<td><fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
	        	</tr>
	        </c:forEach>
        </tbody>
    </table>
</body>
</html>