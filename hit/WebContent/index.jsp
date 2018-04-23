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
	int i = 0;
	ResultSet rs = mySQL.executeQuery("select * from student");
	while(rs.next())
	{
		i++;
		id = rs.getString(1);
		name = rs.getString(2);
		sex = rs.getString(3);
		age = rs.getInt(4);
		major = rs.getString(5);
	%>
	  <tr>
	   <td><%=id%></td>
	   <td style="display:none;" id="stuid<%=i %>"><%=id%></td>
       <td><%=name%></td>
       <td style="display:none;" id="name<%=i %>"><%=name%></td>
	   <td><%=sex%></td>
	   <td style="display:none;" id="sex<%=i %>"><%=sex%></td>
       <td><%=age%></td>
       <td style="display:none;" id="age<%=i %>"><%=age%></td>
	   <td><%=major%></td>
	   <td style="display:none;" id="major<%=i %>"><%=major%></td>
	   <td><a href="#" onclick="return mod(<%=i %>)">修改</a></td>
	   <td><a href="#" onclick="return del(<%=i %>)">删除</a></td>
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

<form id="modifyform" method="post" action="modify.jsp">
<input type="hidden" id="modifyId" name="modifyId"/>
<input type="hidden" id="modifyName" name="modifyName"/>
<input type="hidden" id="modifySex" name="modifySex"/>
<input type="hidden" id="modifyAge" name="modifyAge"/>
<input type="hidden" id="modifyMajor" name="modifyMajor"/>
</form>

<script type="text/javascript" language="javaScript">
function del(i) { 
	 var msg = "确定要删除吗？"
	 if (confirm(msg)) {
		document.getElementById("deleteId").value = document.getElementById("stuid"+i).innerHTML
		document.getElementById("deleteform").submit()
		return true
	 }
	 else return false
}
</script>

<script type="text/javascript" language="javaScript">
function mod(i) { 
	document.getElementById("modifyId").value = document.getElementById("stuid"+i).innerHTML
	document.getElementById("modifyName").value = document.getElementById("name"+i).innerHTML
	document.getElementById("modifySex").value = document.getElementById("sex"+i).innerHTML
	document.getElementById("modifyAge").value = document.getElementById("age"+i).innerHTML
	document.getElementById("modifyMajor").value = document.getElementById("major"+i).innerHTML
	document.getElementById("modifyform").submit()
}
</script>
</body>
</html>