<%@page import="com.javalec.ex.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="dto" class="com.javalec.ex.MemberDTO" scope="page"/>
<jsp:setProperty name="dto" property="*"/>

<%
	String id = (String)session.getAttribute("id");
	dto.setId(id);
	
	MemberDAO dao = MemberDAO.getInstance();
	int ri = dao.UpdateMember(dto);
	
	if(ri == 1){
%>
	<script language="javascript">
	alert("���������� �Ϸ�Ǿ����ϴ�."):
	</script>
<%
	response.sendRedirect("main.jsp");
	} else {
%>
	<script language = "javascript">
	alert("���������� �����Ͽ����ϴ�.");
	history.go(-1);
	</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>