<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>小型图书管理系统</title>
<link rel="Shortcut Icon" href="https://www.whut.edu.cn/favicon.ico" type="image/x-icon" />
</head>
 

<link rel="stylesheet" href="css/style.css" type="text/css" />
<body  >

<form name="form1" method="post" action="Login" align="center">

<img style="margin:50px;" src="resource/whut.png" width=500/>
</br>
 <table width="350" height="200" border="1" align="center">
 
    <caption>
     
	 
      </caption>
     <tr>
     <td width="150">&nbsp&nbsp账号:</td>
     <td width="250"><input style="margin:5px;" size=25 name="user_id" type="text" id="user_id"></td>
   </tr>
   <tr>
    <td width="150">&nbsp&nbsp密码:</td>
    <td width="250"><input style="margin:5px;" size=25 type="password" name="password" type="text" id="password"></td>   
    </tr>
	<tr>
		<td width="150">&nbsp&nbsp身份:</td>
		<td width="350">
		<input checked type="radio" name="userOrAdmin" value='user'>用户</input>
		<input  type="radio" name="userOrAdmin" value='admin'>管理员</input>
		</td>
			
	</tr>
   

	<tr>
     <td colspan="2" align="center" > 
     <input type="submit" style="width:200px;height:40px" name="Submit" value="登  陆">
    </td> 
     </tr>
   </table>
   
   <p align="center"><%=(String)session.getAttribute("message")==null?"版权所有：武汉理工大学":(String)session.getAttribute("message")%></p>
   <% if(session.getAttribute("message")!=null)
	   session.removeAttribute("message");
	   %>
 </form>
</body>
 </html>