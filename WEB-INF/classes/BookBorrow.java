package servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import Dao.*;
import java.io.*;
import java.sql.Date;
import java.util.*;

public class BookBorrow extends HttpServlet {
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException {
	   request.setCharacterEncoding("UTF-8");
	   String user_id =request.getParameter("user_id");
	   String book_id =request.getParameter("book_id");
	   String name =request.getParameter("name");
	   
	   String sql = String.format("update book set call_number = call_number-1 where id =%s",book_id);
	   
	   if(JDBC.update(sql)){
		   
		   
		   Date time= new java.sql.Date(new java.util.Date().getTime());
		   sql = String.format("insert into borrow(user_id,book_id,name,time) values(%s,%s,%s,%s)",user_id,book_id,"'"+name+"'","'"+time+"'");
		   if(JDBC.update(sql)){
			   request.getSession().setAttribute("message", "书籍借阅成功");
			   response.sendRedirect("BookList.jsp");
			   
		   }else{
			   request.getSession().setAttribute("message", "书籍借阅失败!!!");
		   }
	   }else{
		   request.getSession().setAttribute("message", "书籍借阅失败!!!");
	   }
	   
	   
	   PrintWriter out = response.getWriter();
		out.print(sql);
		   
	   // 
       
       
  }
}