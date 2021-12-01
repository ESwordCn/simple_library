<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/style.css" type="text/css" />
<link rel="Shortcut Icon" href="https://www.whut.edu.cn/favicon.ico" type="image/x-icon" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<title>添加图书信息</title>
<style type="text/css">
.m5{
	margin:5px;
}
</style>
</head>
<body>

<form name="form1" method="post" action="BookAdd">
		<h1 align="center" style="margin:30px">添加图书信息</h1>
		<table width="300" height="120" border="1" align="center">
	<tr>
		<td width="74" class="m5">&nbsp索书号:</td>
		<td width="210"><input class="m5" name="id" type="text" id="id"></td>
	</tr>

	<tr>
		<td width="74">&nbsp书名：</td>
		<td width="210"><input class="m5" name="name" type="text" id="name"></td>
	</tr>

		<tr>
			<td>&nbsp作者：</td>
			<td><input class="m5" name="publish" type="text" id="publish"></td>
		</tr>

		<tr>
			<td>&nbsp在馆数：</td>
			<td><input class="m5" name="call_number" type="text" id="call_number"></td>
		</tr>

	<tr>
		<td colspan="2" align="center"><input style="width:100px;height:30px" class="m5" type="submit" name="Submit"value="添加">
		<input class="m5" style="width:100px;height:30px" type="reset" name="Submit2" value="清空"></td>
		</tr>
		</table>
		</form>
		</body>
		</html>