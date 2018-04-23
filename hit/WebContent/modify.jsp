<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="GB2312"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改学生信息</title>
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
学号: 
<input type="text" name="id" value=<%=id %>>
<br> 姓名:
<input type="text" name="name" value=<%=name %>>
<br> 性别:
<input type="text" name="sex" value=<%=sex %>>
<br> 年龄:
<input type="text" name="age" value=<%=age %>>
<br> 专业:
<input type="text" name="major" value=<%=major %>>
<br><br>
<input type="submit" value="提交">
</form>

</body>
</html>