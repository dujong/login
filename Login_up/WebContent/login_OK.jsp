<%@page import="com.javalec.ex.MemberDTO"%>
<%@page import="com.javalec.ex.MemberDAO"%>
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
	request.setCharacterEncoding("EUC-KR");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberDAO dao = MemberDAO.getInstance();
	
	int checkNum = dao.userCheck(id, pw);
	
	if(checkNum == MemberDAO.MEMBER_LOGIN_IS_NOT){
%>

	<script language="JavaScript">
		alert("아이디가 존재하지 않습니다.");
		history.go(-1);
	</script>
<%
	}else if(checkNum == MemberDAO.MEMBER_LOGIN_PW_NO){
%>
	<script language="javascript">
	alert("비밀번호가 틀립니다.");
	history.go(-1);
	</script>
<%
	}else if(checkNum == MemberDAO.MEMBER_LOGIN_SUCCESS){
	MemberDTO dto = dao.getMember(id);	// getMember라는 객체를 이용해서 DB에 있는 동일한 id의 정보를 가져온다. 후에 인스턴스 생성
	
	if(dto == null){
%>
	<script language="JavaScript">
		alert("존재하지 않는 회원입니다");
		history.go(-1);
	</script>

<%	
	}
	else{
		String name = dto.getName();
		session.setAttribute("name", name);
		session.setAttribute("id", id);
		response.sendRedirect("main.jsp");
	
	}
}
%>
</body>
</html>