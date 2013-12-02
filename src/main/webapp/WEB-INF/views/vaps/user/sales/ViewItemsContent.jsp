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
	<%@include file="/WEB-INF/views/top/menu.jsp"%>
	<br/>
	<div style="padding: 1px 20px 30px 60px;">
		<img src="/images/sales/ItemsContent.jpg"/>
		<table width="820" border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none;'>
			<tr>
				<td rowspan="4" width="300"><img src="/upload/${ilist.i_pic}" width="300" height="200" /></td>
				<td width="200" align="center" id="setTd">상품명</td>
				<td>&nbsp;${ilist.i_name}</td>
			</tr>
			<tr>
				<td align="center" id="setTd">상품 카테고리</td>
				<td>&nbsp;${ilist.i_category}</td>
			</tr>
			<tr>
				<td align="center" id="setTd">상품 가격</td>
				<td>&nbsp;${ilist.i_price}원</td>
			</tr>
			<tr>
				<td align="center" id="setTd">남은 수량</td>
				<td>&nbsp;${ilist.is_count}개 남았습니다.</td>
			</tr>
			<tr>
				<td align="center" id="setTd">상품 설명</td>
				<td colspan="2">${ilist.i_description}</td>
			</tr>
			<tr>
			<td colspan="3" align="right" style='border-left:none;border-right:none;border-top:none;border-bottom:none;'>
			<a href="/AllItems" class="button">목록</a>
			<a href="/CartListAdd?str=${ilist.i_name}" class="button">장바구니 담기</a></td>
		</tr>
		</table>
	<br>
</div>
</body>
</html>