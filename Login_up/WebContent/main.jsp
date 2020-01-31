<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String name = (String)session.getAttribute("name");

%>
<%=name %>님 안녕하세요 <br />
	<form action="logout.jsp" method ="post">
	<input type="submit" value="로그아웃"> <input type="button" value="회원정보 수정" onclick="location = 'modify.jsp'">
	</form>
</body>
</html>