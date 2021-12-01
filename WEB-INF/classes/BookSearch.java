package servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import Dao.*;
import java.io.*;

import java.util.*;

public class BookSearch extends HttpServlet {
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException {
	   request.setCharacterEncoding("UTF-8");
	   String search_content=request.getParameter("search_content");
	   
	   
	   String sql = String.format("select * from book where name like %%s%",search_content);
	   
	   PrintWriter out = response.getWriter();
	   out.println(sql);
	   JDBC.query(sql);
	   request.setAttribute(""
       response.sendRedirect("BookList.jsp");
       
  }
}