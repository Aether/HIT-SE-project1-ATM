<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,com.hit.MySQLAccess" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>主页</title>
</head>

<body>
<center><a href="add.html">增加学生</a>
<br/>
<form name="input" action="?" method="get" enctype="multipart/form-data">
学号: <input type="text" name="searchid"/>
<input type="submit" value="查询"/>
</form>
<% 
	String searchid = request.getParameter("searchid");
	if (searchid != null) {
		MySQLAccess mySQL = new MySQLAccess();
		try {
			ResultSet rs = mySQL.executeQuery("select * from student where id="+searchid);
			rs.next();
			out.println(rs.getString(1)+"\t"+rs.getString(2)+"\t"+rs.getString(3)+"\t"+
					rs.getInt(4)+"\t"+rs.getString(5));
		}catch(Exception e){
			out.println("查询失败");
		}
		mySQL.close();
	}
%>
</center>
<table border="1" align="center">
<%
	MySQLAccess mySQL = new MySQLAccess();
	String id = null;
	String name = null;
	String sex = null;
	int age = 0;
	String major = null;
	ResultSet rs = mySQL.executeQuery("select * from student");
	while(rs.next())
	{
		id = rs.getString(1);
		name = rs.getString(2);
		sex = rs.getString(3);
		age = rs.getInt(4);
		major = rs.getString(5);
	%>
	  <tr>
	   <td style="display:none;" id="stuid"><%=id%></td>
	   <td><%=id%></td>
       <td><%=name%></td>
	   <td><%=sex%></td>
       <td><%=age%></td>
	   <td><%=major%></td>
	   <td><a href="modify.jsp">修改</a></td>
	   <td><a href="#" onclick="return del()">删除</a></td>
	  </tr>
	<%
	}
	mySQL.close();
%>
</table>

<form id="deleteform" method="post" action="MyServlet">
<input type="hidden" name="input" value="delete"/>
<input type="hidden" id="deleteId" name="deleteId"/>
</form>

<form id="modifyform" method="post" action="MyServlet">
<input type="hidden" name="input" value="modify"/>
<input type="hidden" id="deleteId" name="modifyId"/>
</form>

<script type="text/javascript" language="javaScript">
function del() { 
	 var msg = "确定要删除吗？"
	 if (confirm(msg)) {		 
		document.getElementById("deleteId").value = document.getElementById("stuid").innerHTML
		document.getElementById("deleteform").submit()
		return true
	 }
	 else return false
}
</script>

<script type="text/javascript" language="javaScript">
function mod() { 
	document.getElementById("modifyId").value = document.getElementById("stuid").innerHTML
	document.getElementById("modifyform").submit()
}
</script>
</body>
</html>

