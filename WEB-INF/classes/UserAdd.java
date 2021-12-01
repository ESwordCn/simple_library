package servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import Dao.*;
import java.io.*;

import java.util.*;

public class UserAdd extends HttpServlet {
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException {
	   request.setCharacterEncoding("UTF-8");
	   String user_id=request.getParameter("user_id");
	   String name=request.getParameter("name");
	   String password=request.getParameter("password");

	   
	   String sql = String.format("insert into user(user_id,name,password) values(%s,%s,%s)",user_id,"'"+name+"'","'"+password+"'");
	   
	   
	   if(JDBC.update(sql)){
		   request.getSession().setAttribute("message", "用户添加成功");
		   response.sendRedirect("index.jsp");
	   }else{
			PrintWriter out = response.getWriter();
			out.println(sql);
	   }
       
       
  }
}