<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action = "join_OK.jsp" method="post">
이름 : <input type="text" name="name"><br/>
아이디 : <input type="text" name="id"><br/>
비밀번호 : <input type="password" name="pw"><br/>
eMail : <input type="text" name="eMail"><br/>
주소 : <input type="text" name="address"><br/>
<input type="submit" value="회원가입">		<input type="button" value="취소" onclick="location = 'login.jsp'">
</form>
</body>
</html>