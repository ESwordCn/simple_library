package servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import Dao.*;
import java.io.*;

import java.util.*;

public class BookDelete extends HttpServlet {
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException {
   		String id=request.getParameter("id");
   		

		String sql = String.format("delete from book where id=%s",id);
		PrintWriter out = response.getWriter();
			
   		     if(JDBC.update(sql))	{
				 request.getSession().setAttribute("message", "书籍删除成功");
   		         response.sendRedirect("BookList.jsp");  
   		     }else{
   		       	 out.print(sql);
   		     }	       

	   
	   
	   
       
  }
}