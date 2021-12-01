<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Dao.JDBC" %>
<%@ page import="java.sql.*" %>

<link rel="stylesheet" href="css/style.css" type="text/css" />
    <html>
  <head>
    <title>小型图书馆系统</title>

  </head>
	<%
		String message = (String)session.getAttribute("message");
		if(message!=null){%>
			<script type="text/javascript">
				alert('<%=message%>');
			</script><%
			session.removeAttribute("message");
		}
	%>
	
  <body>
    <% 
	request.setCharacterEncoding("UTF-8");
	ResultSet rs=null;
	String user_id=request.getParameter("user_id");
	String sql="";

	sql = "select * from borrow where user_id="+user_id;

	
	rs = JDBC.query(sql);
	
    %>
	
		<br/>
        <h3 align="center" style="font-size:30px">我的借阅记录</h3>

     <table width="650" border="1" style="font-size:14pt;" align="center">
	 
    <tr>
    <td>序号</td>
    <td>书名</td>
    <td>借阅时间</td>

    </tr>
    <% 
    while(rs.next())
    {
		out.print("<tr>");
		out.print("<td>"+rs.getString("book_id")+"</td>");
		out.print("<td>"+rs.getString("name")+"</td>");
		out.print("<td>"+rs.getString("time")+"</td>");
		out.print("<td><a href='BookReturn?book_id="+rs.getInt("book_id")+"&user_id="+user_id+"'>还书</a></td>");   
			
		
		out.print("</tr>");
	}
        %>

    
      </table>
	  
      <p align="center"><a href='BookList.jsp'>返回图书列表</a></p>
	

  </body>
</html>
	
    