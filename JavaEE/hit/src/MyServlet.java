

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MyServlet
 */
@WebServlet("/MyServlet")
public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	private String message;

	@Override
	public void init() throws ServletException {
	    message = "Hello World sdf";
	    super.init();
	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
	    response.setContentType("text/html; charset=GB2312");
	    PrintWriter writer = response.getWriter();
	    writer.write("<h1>" + message + "</h1>");
	    destroy();
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    // TODO Auto-generated method stub
	    super.doPost(req, resp);
	}

	@Override
	public void destroy() {
	    System.out.println("servlet销毁！");
	    super.destroy();
	}

}
