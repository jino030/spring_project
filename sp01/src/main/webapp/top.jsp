<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>top.jsp</title>
<!-- ajax를 사용하는 경우 이코드를 불러와서 아작스를 실행한다???? 
		document.querySelector All('meta[name="_csrf"]') -->
<sec:csrfMetaTags/> 
</head>
<body>
	<h1>톱 페이지입니다.</h1>
	<ul>
		<li><a href="user/user.jsp">일반 사용자용 페이지로</a></li>
		<sec:authorize access="hasAuthority('ROLE_ADMIN')">
			<li><a href="admin/admin.jsp">관리자 전용 페이지로</a></li>
		</sec:authorize>
	</ul>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.username" />
		<form action="logout" method="post">
			<sec:csrfInput/>
			<button>로그아웃</button>
		</form>
	</sec:authorize>
</body>
</html>