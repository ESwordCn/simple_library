package servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import Dao.*;
import java.io.*;

import java.util.*;

public class BookUpdateConfirm extends HttpServlet {
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException {
   		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String publish=request.getParameter("publish");
		String call_number=request.getParameter("call_number");
   		

		String sql = String.format("update book set id=%s,name=%s,publish=%s,call_number=%s  where id=%s",id,"'"+name+"'","'"+publish+"'",call_number,id);

			
   		     if(JDBC.update(sql))	{
   		         request.getSession().setAttribute("message", "书籍更新成功");
				 response.sendRedirect("BookList.jsp");
   		     }else{
				 PrintWriter out = response.getWriter();
   		       	 out.print(sql);
   		     }	       

	   
	   
	   
       
  }
}