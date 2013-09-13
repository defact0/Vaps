<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Vaps shopping mall</title>
<link rel="styleSheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bt.css" />
</head>
<body>
	<%@include file="/WEB-INF/views/top/title.jsp"%>
	<%@include file="/WEB-INF/views/top/menu.jsp"%>
	<br />
	<div style="padding: 1px 20px 30px 60px;">
		<table>
			<tr>
				<td bgcolor="#A6CAF0" align="center">i_name:</td>
				<td>${ilist.i_name}</td>
			</tr>
			<tr>
				<td bgcolor="#A6CAF0" align="center">i_category:</td>
				<td>${ilist.i_category}</td>
			</tr>
			<tr>
				<td bgcolor="#A6CAF0" align="center">i_price:</td>
				<td>${ilist.i_price}</td>
			</tr>
			<tr>
				<td bgcolor="#A6CAF0" align="center">i_pic:</td>
				<td>${ilist.i_pic}</td>
			</tr>
			<tr>
				<td bgcolor="#A6CAF0" align="center">i_description:</td>
				<td>${ilist.i_description}</td>
			</tr>
			<tr>
				<td bgcolor="#A6CAF0" align="center">is_name:</td>
				<td>${ilist.is_name}</td>
			</tr>
			<tr>
				<td bgcolor="#A6CAF0" align="center">is_count:</td>
				<td>${ilist.is_count}</td>
			</tr>
			<tr>
				<td colspan="2"><img src="/upload/${ilist.i_pic}" /></td>
			</tr>
		</table>

		<a href="/itemslist" class="button">목록</a>
		<a href="/itemsModifyForm?str=${ilist.i_name}" class="button">수정</a>

	<br>
</div>
</body>
</html>