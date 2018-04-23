<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,com.hit.MySQLAccess" %>
<!DOCTYPE html>
<html>
<head>
<title>修改内容</title>
</head>
<%
	String userid = (String)request.getSession().getAttribute("userid");
	session.setAttribute("userid",userid);
    String articleid = request.getParameter("articleid");
	int id = Integer.parseInt(articleid);
		String title = null;
		String content = null;
	MySQLAccess mySQL = new MySQLAccess();
	ResultSet rs = mySQL.executeQuery("select * from blog");
	while(rs.next())
	{
		if(id==rs.getInt(1)){
			title = rs.getString(2);
			content = rs.getString(3);
		}
	}
%>
<body>
<form id="form_addstuinfo" name="form_addstuinfo" method="post" action="MyServlet">
  <p>
    <input type="hidden" name="input" value="modify"/>
    <input type="hidden" name="articleid" value="<%=articleid %>"/>
  </p>
  <p>标题：</p>
  <p>
    <label>
    <input name="title" type="text" id="title" value="<%=title%>" />
    </label>
  </p>
  <p>内容：</p>
  <p>
    <label></label>
    <textarea name="content" rows="10"cols="50" id="content"><%=content%>
</textarea>
  </p>
  <p>
    <label>
    <input type="submit" name="Submit" value="提交" />
    </label>
  </p>
</form>
</body>
</html>