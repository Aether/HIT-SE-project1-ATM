<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改学生信息</title>
</head>
<body>
<form id="form_addstuinfo" name="form_addstuinfo" method="post" action="MyServlet" >
<input type="hidden" name="input" value="modify"/>
学号: 
<input type="text" name="id" value="">
<br> 姓名:
<input type="text" name="name" value="">
<br> 性别:
<input type="text" name="sex" value="">
<br> 年龄:
<input type="text" name="age" value="">
<br> 专业:
<input type="text" name="major" value="">
<br><br>
<input type="submit" value="提交">
</form>
</body>
</html>