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
	href="${pageContext.request.contextPath}/css/docStyle.css" />
</head>
<body>
	<%@include file="/WEB-INF/views/top/title.jsp"%>
	<%@include file="/WEB-INF/views/top/menu.jsp"%>
	
	<div style="padding: 1px 20px 30px 60px;">
		<table border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none;'>
			<tr>
				<td bgcolor="#A6CAF0" align="center" width="150">i_name:</td>
				<td>&nbsp;${ilist.i_name}</td>
			</tr>
			<tr>
				<td bgcolor="#A6CAF0" align="center">i_category:</td>
				<td>&nbsp;${ilist.i_category}</td>
			</tr>
			<tr>
				<td bgcolor="#A6CAF0" align="center">i_price:</td>
				<td>&nbsp;${ilist.i_price}</td>
			</tr>
			<tr>
				<td bgcolor="#A6CAF0" align="center">i_pic:</td>
				<td>&nbsp;${ilist.i_pic}</td>
			</tr>
			<tr>
				<td bgcolor="#A6CAF0" align="center">i_description:</td>
				<td>&nbsp;${ilist.i_description}</td>
			</tr>
			<tr>
				<td bgcolor="#A6CAF0" align="center">is_name:</td>
				<td>&nbsp;${ilist.is_name}</td>
			</tr>
			<tr>
				<td bgcolor="#A6CAF0" align="center">is_count:</td>
				<td>&nbsp;${ilist.is_count}</td>
			</tr>
			<tr>
				<td colspan="2"  style='border-left:none;border-right:none;border-top:solid #000000 0.4pt;border-bottom:none;'>
					<img src="/upload/${ilist.i_pic}" width="550" height="250"/>
				</td>
			</tr>
			<tr>
			<td align="left" style='border-left:none;border-right:none;border-top:none;border-bottom:none;'>
			<a href="/itemslist" class="button">목록</a>
			</td>
			<td align="right" style='border-left:none;border-right:none;border-top:none;border-bottom:none;'>
			<a href="/itemsModifyForm?str=${ilist.i_name}" class="button">수정</a>
			<a href="/itemsDelContent?str=${ilist.i_name}" class="button">삭제</a>
			</td>
		</tr>
		</table>
	<br>
</div>
</body>
</html>