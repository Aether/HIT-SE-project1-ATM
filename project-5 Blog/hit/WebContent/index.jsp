<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,com.hit.MySQLAccess" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<%
  	String userid = (String)request.getSession().getAttribute("userid");
  	String picture = request.getParameter("radiobutton");
  	if(picture==null){
  		%>
  		<img src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1523945956265&di=62d4d7a81ab5dea63be6e7146c69944a&imgtype=0&src=http%3A%2F%2Fwww.wyzu.cn%2Fuploadfile%2F2013%2F0603%2F20130603123602957.jpg" height="150" width="512" />
  		<%
  	}else{
  		%>
  		<img src="<%=picture %>" height="150" width="512" />
  		<%
  	}
  	session.setAttribute("userid",userid);
 %>
 
 <p>欢迎您：<%=userid %></p>
<label>
    <a href="add.html">新建日志</a>
    <a href="choosepicture.jsp">选择背景</a>
</label>
 
 <%
	String title = null;
	String content = null;
 	int articleid = 0;
	MySQLAccess mySQL = new MySQLAccess();
	ResultSet rs = mySQL.executeQuery("select * from blog");
	while(rs.next())
	{
		if(rs.getString(4).equals(userid)){
			title = rs.getString(2);
			content = rs.getString(3);
			articleid = rs.getInt(1);

%>

<table width="512" border="1">
  <tr>
    <td><%=title%></td>
  </tr>
  <tr>
    <td height="118"><%=content%></td>
  </tr>
  
</table>
 <table width="200" border="1">
  <tr>
    <td width="42"><label>
        <a href="modify.jsp?articleid=<%=articleid%>">修改</a>
      </label></td>
    <td width="56"><label>
        <input type="button" value="删除" onclick="del(<%=articleid%>)"/>
     </label></td>
  </tr>
</table>
  <%
		}
}
mySQL.close();
%>
<form id="deleteform" method="post" action="MyServlet">
<input type="hidden" name="input" value="delete"/>
<input type="hidden" id="deleteId" name="deleteId"/>
</form>

<script type="text/javascript" language="javaScript">
function del(i) { 
	 var msg = "确定要删除吗？"
	 if (confirm(msg)) {
		document.getElementById("deleteId").value = i
		document.getElementById("deleteform").submit()
		return true
	 }
	 else return false
}
</script>
</body>
</html>