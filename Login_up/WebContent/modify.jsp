<%@page import="com.javalec.ex.MemberDTO"%>
<%@page import="com.javalec.ex.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
	MemberDAO dao = MemberDAO.getInstance();
	MemberDTO dto = dao.getMember(id);
%>

	<form action="modify_OK.jsp" method="post">
	���̵� : <%=dto.getId() %><br/>
	��й�ȣ : <input type="password" name="pw"><br/>
	�̸� : <%=dto.getName()%><br/>
	eMail : <input type="text" name="eMail" value="<%=dto.geteMail() %>" ><br/>
	�ּ� : <input type="text" name="address" value="<%=dto.getAddress() %>" ><br/>
	<input type="submit" value="����" > <input type="reset" value="���" onclick="location='main.jsp'">
	</form>
</body>
</html>