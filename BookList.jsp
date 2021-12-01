<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Dao.JDBC" %>
<%@ page import="java.sql.*" %>

<link rel="stylesheet" href="css/style.css" type="text/css" />
<link rel="Shortcut Icon" href="https://www.whut.edu.cn/favicon.ico" type="image/x-icon" />
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
	String search_content=request.getParameter("search_content");
	String sql="";
	if(search_content!=null){
		sql = "select * from book where name like '%"+search_content+"%'";
	}else {
	sql = "select * from book";
	search_content="";
	}
	rs = JDBC.query(sql);
	
	
    %>
		<p align='center' >
		<img  style="margin-bottom:-20px;" width='150' src='resource/book.png'/>
		</p>
	    <%
		String userOrAdmin = (String)session.getAttribute("userOrAdmin");
		String user_id = (String)session.getAttribute("id");
		String name = (String)session.getAttribute("name");
		if(userOrAdmin!=null && userOrAdmin.equals("admin")){
			out.print("<p align='center' >欢迎使用小型图书馆管理系统，当前登录: 管理员  "+name);
			out.print("</p><p align='center'><a href='UserAdd.jsp'>添加用户</a>");
			out.print(" / ");
			
			out.print("<a href='BookAdd.jsp'>添加书籍</a>");
		}else{
			
			
			out.print("<p align='center' >欢迎使用小型图书馆管理系统，当前登录: 读者 "+name);
			out.print("</p><p align='center'><a href='BookBorrowList.jsp?user_id="+user_id+"'>个人借阅记录(还书)</a>");
		}
		out.print(" / ");
		out.print("<a href='index.jsp'>退出登录</a></p>");
    
    
    %>
	<form align = "center" action="BookList.jsp">
		搜索内容:<input size=50 name="search_content" type="text" value=<%=search_content  %>>
		<input type="submit" value="  搜 索  ">
	</form>
     <table width="800" border="1"  align="center">
	 
    <tr>
    <td>索书号</td>
    <td>书名</td>
    <td>作者</td>
    <td>在馆数</td>
	<td>操作</td>
    </tr>
    <% 
	int count=0;
    while(rs.next())
		
    {	
		count++;
		out.print("<tr>");
		out.print("<td>"+rs.getString("id")+"</td>");
		out.print("<td>"+rs.getString("name")+"</td>");
		out.print("<td>"+rs.getString("publish")+"</td>");
		out.print("<td>"+rs.getString("call_number")+"</td>");
		if(userOrAdmin!=null && userOrAdmin.equals("admin")){
			out.print("<td align='center'><a  href='BookUpdate.jsp?id="+rs.getInt("id")+"'>修改</a>");
			out.print(" / ");
			out.print("<a href='BookDelete?id="+rs.getInt("id")+"'>删除</a></td>");   
		}else{
			if(Integer.parseInt(rs.getString("call_number"))>0)
				out.print("<td><a href='BookBorrow?book_id="+rs.getInt("id")+ "&user_id="+user_id+"&name="+rs.getString("name")+"'>借阅</a></td>");   
		}
			
		
		out.print("</tr>");
	}
        %>

      
      </table>
	  <p align="center">第 1 页 共 1 页  总书目:<%=count%></p>
	

  </body>
</html>
	
    