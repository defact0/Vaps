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
	<%@include file="/WEB-INF/views/conf/top/m_menu.jsp"%>
<br/>
	<div style="padding: 1px 20px 30px 60px;">
	<img src="/images/sales/AllItems.jpg"/>
		<table border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none;'>
			<tr id="setTd" align="center" height="35">
				<td width="100">카테고리</td>
				<td width="200">상품이름</td>
				<td width="150">가격</td>
				
			</tr>
			<c:forEach var="ilist" items="${ilist}">
				<tr height="25">
					<td width="100" align="center">${ilist.i_category}</td>
					<td width="400"><a href="/ViewItemsContent?num=${ilist.i_num}&str=${ilist.i_name}"> ${ilist.i_name} </a></td>
					<td width="150" align="center">${ilist.i_price}원</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
