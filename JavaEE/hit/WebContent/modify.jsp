<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改学生信息</title>
</head>
<body>
<form id="form_addstuinfo" name="form_addstuinfo" method="post" action="<%=request.getContextPath()%>/MyServlet" >
<input type="hidden" name="input" value="modifystuinfo"/>
学号: 
<input type="tel" name="id" id="addid">
<br> 姓名:
<input type="text" name="name" id="addname">
<br> 性别:
<input type="text" name="sex" id="addsex">
<br> 年龄:
<input type="tel" name="age" id="addage">
<br> 专业:
<input type="text" name="manjor" id="addmajor">
<br><br>
<input type="submit" value="提交">
</form>
</body>
</html>