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
		alert("���̵� �������� �ʽ��ϴ�.");
		history.go(-1);
	</script>
<%
	}else if(checkNum == MemberDAO.MEMBER_LOGIN_PW_NO){
%>
	<script language="javascript">
	alert("��й�ȣ�� Ʋ���ϴ�.");
	history.go(-1);
	</script>
<%
	}else if(checkNum == MemberDAO.MEMBER_LOGIN_SUCCESS){
	MemberDTO dto = dao.getMember(id);	// getMember��� ��ü�� �̿��ؼ� DB�� �ִ� ������ id�� ������ �����´�. �Ŀ� �ν��Ͻ� ����
	
	if(dto == null){
%>
	<script language="JavaScript">
		alert("�������� �ʴ� ȸ���Դϴ�");
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