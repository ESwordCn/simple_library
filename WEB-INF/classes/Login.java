package servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import Dao.*;
import java.io.*;
import java.util.*;
import java.sql.*;

public class Login extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException {
		String user_id=request.getParameter("user_id");
		String password=request.getParameter("password");
		String userOrAdmin = request.getParameter("userOrAdmin");
		
		String sql = String.format("select * from %s where user_id=%s and password=%s",userOrAdmin,user_id,password);

		ResultSet rs = JDBC.query(sql);
		try{
			 if(rs.next())
			 {
				 String name = rs.getString("name");
				request.getSession().setAttribute("message", "登录成功");
				request.getSession().setAttribute("userOrAdmin", userOrAdmin);
				request.getSession().setAttribute("id", user_id);
				request.getSession().setAttribute("name", name);
				
				
				response.sendRedirect("BookList.jsp");
				 
			 
			 }
			 else {
				 request.getSession().setAttribute("message", "登录失败"+sql);
				 response.sendRedirect("index.jsp");
			 }
		}catch(SQLException e){
			PrintWriter out = response.getWriter();

			out.print(e);
		}
	}
	
}