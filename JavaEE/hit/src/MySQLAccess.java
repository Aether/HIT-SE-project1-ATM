
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;


@WebServlet("/MySQLAccess")
public class MySQLAccess extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public MySQLAccess() {
        super();
    }
    
    public Connection connectSQL() {
    	try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hit","root","379756572.");
	    	Statement stmt = con.createStatement();
	    	
	    	String username = null;
	    	String password = null;
	    	ResultSet rs = stmt.executeQuery("select * from admin");
	    	while(rs.next())
			{
				username = rs.getString(1);
				password = rs.getString(2);
				
			}
	    	return con;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
    	return null;
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("hi");
		try {
			getStuInfo(connectSQL());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		String input = request.getParameter("input");
//		if(input.equals("login")) {
//			String userid = request.getParameter("userid");
//			String password = request.getParameter("password");
//		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void getStuInfo(Connection con) throws SQLException {
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from student");
		String id = null;
		String name = null;
		String sex = null;
		int age = 0;
		String major = null;
		System.out.println("id\t\tname\tsex\tage\tmajor");
		while(rs.next())
		{
			id = rs.getString(1);
			name = rs.getString(2);
			sex = rs.getString(3);
			age = rs.getInt(4);
			major = rs.getString(5);
			System.out.println(id+"\t"+name+"\t"+sex+"\t"+age+"\t"+major);
		}
	}

}