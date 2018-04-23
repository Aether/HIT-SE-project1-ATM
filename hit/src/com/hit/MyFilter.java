package com.hit;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyFilter implements Filter {
	
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
            FilterChain arg2) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest)arg0;
        HttpServletResponse resp =(HttpServletResponse) arg1;
        HttpSession session = req.getSession();
        String path = req.getRequestURI();
        String password = (String) session.getAttribute("isLeagal");
        if(path.indexOf("/login.html") > -1) {
            arg2.doFilter(req, resp);
            return;
        } else {
            	if (password == null || "".equals(password)) {
            		resp.sendRedirect("login.html");
            } else {
                arg2.doFilter(req, resp);
            }
        }
    }

}
