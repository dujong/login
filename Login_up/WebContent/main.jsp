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
<%=name %>�� �ȳ��ϼ��� <br />
	<form action="logout.jsp" method ="post">
	<input type="submit" value="�α׾ƿ�"> <input type="button" value="ȸ������ ����" onclick="location = 'modify.jsp'">
	</form>
</body>
</html>