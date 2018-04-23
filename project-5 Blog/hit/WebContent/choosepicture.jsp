<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,com.hit.MySQLAccess" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<form id="form1" name="form1" method="post" action="index.jsp">
<%
	String url = null;
	int i = 0;
	MySQLAccess mySQL = new MySQLAccess();
	ResultSet rs = mySQL.executeQuery("select * from picture");
	while(rs.next())
	{
		url = rs.getString(1);
		i++;
%>
  <table width="200" border="1">
    <tr>
      <td><label>
        <input type="radio" name="radiobutton" value="<%=url%>" /> 图片<%=i%></label></td>
      <td><label>
        <img src="<%=url %>" height="150" width="512" />
      </label></td>
    </tr>
  </table>
  <%
	}
	mySQL.close();
  %>
  <input type="submit" name="Submit" value="提交" />
</form>
<form id="form2" name="form2" method="post" action="MyServlet">
<input type="hidden" name="input" value="addpic"/>
  <p>新增图片：</p>
  <p>请输入图片地址：
    <label>
      <input name="url" type="text" id="url" />
      </label>
      <label>
      <input type="submit" name="Submit" value="提交" />
      </label>
  </p>
</form>
</body>
</html>