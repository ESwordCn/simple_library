package servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import Dao.*;
import java.io.*;

import java.util.*;

public class BookAdd extends HttpServlet {
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException {
	   request.setCharacterEncoding("UTF-8");
	   String id=request.getParameter("id");
	   String na=request.getParameter("name");
	   String pub=request.getParameter("publish");
	   String str=request.getParameter("call_number");
	   
	   String sql = String.format("insert into book(id,name,publish,call_number) values(%s,%s,%s,%s)",id,"'"+na+"'","'"+pub+"'",str);
	   
	   
	   if(JDBC.update(sql)){
		   request.getSession().setAttribute("message", "书籍添加成功");
		   response.sendRedirect("BookList.jsp");
	   }else{
			PrintWriter out = response.getWriter();
			out.println(sql);
	   }
       
       
  }
}