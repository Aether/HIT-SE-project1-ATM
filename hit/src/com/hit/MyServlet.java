package com.hit;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MyServlet")
public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
	    resp.setCharacterEncoding("GB2312");
	    req.setCharacterEncoding("GB2312");
	    
	    if(req.getParameter("input").equals("add")) {
	    	String id = "\""+req.getParameter("id")+"\"";
	 	    String name = "\""+req.getParameter("name")+"\"";
	 	    String sex = "\""+req.getParameter("sex")+"\"";
	 	    String age = "\""+req.getParameter("age")+"\"";
	 	    String major = "\""+req.getParameter("major")+"\"";
	 	    MySQLAccess mySQL = new MySQLAccess();
	 	    mySQL.executeUpdate("insert into student (id,name,sex,age,major) "
	 		        +"values("+id+","+name+","+sex+","+age+","+major+")");
	 	    mySQL.close();
	 	    resp.sendRedirect("index.jsp");
	    }
	    else if(req.getParameter("input").equals("login")) {
	    	String userid =  req.getParameter("userid");
	    	String password = req.getParameter("password");
	    	MySQLAccess mySQL = new MySQLAccess();
	    	ResultSet rs = mySQL.executeQuery("select * from admin");
	    	Boolean isLegal = false;
	    	try {
				while(rs.next())
				{
					if(userid.equals(rs.getString(1)) && password.equals(rs.getString(2))) {
						HttpSession session = req.getSession();
					    session.setAttribute("isLegal", password);
						isLegal = true;
						break;
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
	    	if (isLegal==false) {
	    		PrintWriter out = resp.getWriter();
	    		out.println("用户名或密码错误");
	    	}
	    	else resp.sendRedirect("index.jsp");
	    	mySQL.close();	
	    }
	    else if(req.getParameter("input").equals("delete")) {
	    	String id = req.getParameter("deleteId");
	    	MySQLAccess mySQL = new MySQLAccess();
	    	mySQL.executeUpdate("delete from student where id ="+id);
	    	mySQL.close();
	    	resp.sendRedirect("index.jsp");
	    }
	    else if(req.getParameter("input").equals("modify")) {
	    	String id = "\""+req.getParameter("id")+"\"";
	 	    String name = "\""+req.getParameter("name")+"\"";
	 	    String sex = "\""+req.getParameter("sex")+"\"";
	 	    String age = "\""+req.getParameter("age")+"\"";
	 	    String major = "\""+req.getParameter("major")+"\"";
	 	    MySQLAccess mySQL = new MySQLAccess();
	 	    mySQL.executeUpdate("update student set name="+name+
	 	    		" ,sex="+sex+" ,age="+age+" ,major="+major+" where id ="+id);
	    	mySQL.close();
	    	resp.sendRedirect("index.jsp");
	    }
	    
	   
	}
}
