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
	<div style="padding: 1px 20px 30px 60px;">
		<img src="/images/ItemsContent.jpg"/>
		<table width="820" border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none;'>
			<tr>
				<td width="300">
					<img src="/upload/${ilist.i_pic}" width="300" height="200"/>
				</td>
				<td width="250" align="center">
				주문관련 기능이 들어갈 자리<br/>
				[수량], [장바구니] 설정<br/>
				<a href="/CartList?str=${ilist.i_name}" class="button">장바구니 담기</a>
				</td>
			</tr>
			<tr>
				<td width="100" bgcolor="#A6CAF0" align="center">i_name:</td>
				<td width="600">&nbsp;${ilist.i_name}</td>
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
			<td style='border-left:none;border-right:none;border-top:none;border-bottom:none;'>
			<a href="/itemslist" class="button">목록</a></td>
		</tr>
		</table>
	<br>
</div>
</body>
</html>