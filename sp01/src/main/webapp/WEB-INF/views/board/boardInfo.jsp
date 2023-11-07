<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세조회</title>
<link rel="stylesheet" href="resources/css/emp.css">
<link rel="stylesheet" href="resources/css/common.css">
<style type="text/css">
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
textarea {
	width: 100%;
	border: none;
	background: transparent;
}
img {
	max-height: 365px;
}
</style>
</head>
<body>
    <table>
        <tr>
            <th>번호</th>
            <td>${info.bno}</td>
        </tr>
        <tr>
            <th>제목</th>
            <td>${info.title}</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${info.writer}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td>
                <textarea cols="30" rows="2" readonly>${info.contents}</textarea>
            </td>
        </tr>
        <tr>
            <th>첨부파일</th>
            <c:choose>
            	<c:when test="${not empty info.image }">
            		<td>
                        <img src="<c:url value='/resources/${info.image}'/>" alt="첨부이미지">
                    </td>
            	</c:when>
            	<c:otherwise>
            		<td>파일없음</td>
            	</c:otherwise>
            </c:choose>
            	
        </tr>
        <tr>
            <th>작성일자</th>
            <td><fmt:formatDate value="${info.regdate}" pattern="yyyy/MM/dd"/></td>
        </tr>
    </table>
    <button type="button" onclick="location.href='boardUpdate?bno=${info.bno}'">수정</button>
    <button type="button" onclick="location.href='boardDelete?bno=${info.bno}'">삭제</button>
</body>
</html>