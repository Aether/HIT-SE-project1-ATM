<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="GB2312"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>�޸�ѧ����Ϣ</title>
</head>
<% 
	request.setCharacterEncoding("gb2312");
	String id = request.getParameter("modifyId");
	String name = request.getParameter("modifyName");
	String sex = request.getParameter("modifySex");
	String age = request.getParameter("modifyAge");
	String major = request.getParameter("modifyMajor");
%>
<body>
<form id="form_modifystuinfo" name="modify" method="post" action="MyServlet" >
<input type="hidden" name="input" value="modify"/>
ѧ��: 
<input type="text" name="id" value=<%=id %>>
<br> ����:
<input type="text" name="name" value=<%=name %>>
<br> �Ա�:
<input type="text" name="sex" value=<%=sex %>>
<br> ����:
<input type="text" name="age" value=<%=age %>>
<br> רҵ:
<input type="text" name="major" value=<%=major %>>
<br><br>
<input type="submit" value="�ύ">
</form>

</body>
</html>