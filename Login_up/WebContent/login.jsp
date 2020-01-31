<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action = "login_OK.jsp" method="post">
아이디 : <input type="text" name="id"><br/>
비밀번호 : <input type="password" name="pw"><br/>
<input type="submit" value="로그인">		<input type="button" value="회원가입" onclick="location ='join.jsp'">
</form>
</body>
</html>