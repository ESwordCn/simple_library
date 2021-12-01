package servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import Dao.*;
import java.io.*;

import java.util.*;

public class BookReturn extends HttpServlet {
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException {
   		String user_id=request.getParameter("user_id");
		String book_id=request.getParameter("book_id");

   		

		String sql = String.format("update book set call_number=call_number+1  where id=%s",book_id);
		String sql2 = String.format("delete from borrow where user_id=%s and book_id=%s",user_id,book_id);
			
   		     if(JDBC.update(sql) && JDBC.update(sql2))	{
				 request.getSession().setAttribute("message", "书籍归还成功");
				 response.sendRedirect("BookBorrowList.jsp?user_id="+user_id);
   		     }else{
				 PrintWriter out = response.getWriter();
   		       	 out.print(sql);
   		     }	       

	   
	   
	   
       
  }
}