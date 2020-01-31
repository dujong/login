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
	아이디 : <%=dto.getId() %><br/>
	비밀번호 : <input type="password" name="pw"><br/>
	이름 : <%=dto.getName()%><br/>
	eMail : <input type="text" name="eMail" value="<%=dto.geteMail() %>" ><br/>
	주소 : <input type="text" name="address" value="<%=dto.getAddress() %>" ><br/>
	<input type="submit" value="수정" > <input type="reset" value="취소" onclick="location='main.jsp'">
	</form>
</body>
</html>