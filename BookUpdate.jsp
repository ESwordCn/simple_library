<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Dao.JDBC" %>
<link rel="stylesheet" href="css/style.css" type="text/css" />
<html>
<head>
     <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <title>编辑图书信息</title>
	<link rel="Shortcut Icon" href="https://www.whut.edu.cn/favicon.ico" type="image/x-icon" />

</head>
<body>
<link rel="stylesheet" href="css/style.css" type="text/css" />
<% 
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String sql = String.format("select * from book where id=%s",id);
ResultSet rs=JDBC.query(sql);
if(rs.next()){
%>
<form name="form1" method="get" action="BookUpdateConfirm">
<div align="center" class="STYLE1">编辑图书信息</div>
<table width="300" height="120" border="1" align="center">
<tr>
<td width="74">序号：</td>
<td width="210"><input name="id" type="text" id="id" value="<%=rs.getString("id") %>"></td>
</tr>
<tr>
<td width="74">书名：</td>
<td width="210"><input name="name" type="text" id="name" value="<%=rs.getString("name") %>"></td>
</tr>
<tr>
<td>出版社：</td>
<td><input name="publish" type="text" id="publish" value="<%=rs.getString("publish") %>"></td>
</tr>
<tr>
<td>在馆数：</td>
<td><input name="call_number" type="text" id="price" value="<%=rs.getInt("call_number") %>"></td>
</tr>
<tr>
<td colspan="2" align="center">
 <input type="submit" name="Submit"value="确定修改">
<input type="reset" name="Submit2" value="取消"></td>
</tr>
</table>
</form>
<%
}
%>
</body>
</html>