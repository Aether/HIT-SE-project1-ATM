<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
</head>

<body>
<%
String input = request.getParameter("input");
if(input.equals("login")) {
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
/* 	Cookie c = new Cookie("userid",userid);
	c.setMaxAge(60*60*24);
	response.addCookie(c); */
	response.sendRedirect("store.jsp");
}
else if(input.equals("addstuinfo")) {
	String id = request.getParameter("addid");
	String name = request.getParameter("addname");
	String sex = request.getParameter("addsex");
	int age = Integer.parseInt(request.getParameter("addage"));
	String major = request.getParameter("addmajor");

	response.sendRedirect("milk.jsp");
}
%>
</body>
</html>
