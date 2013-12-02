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
	<div style="padding: 1px 20px 30px 60px;">
	<h1>포인트 :${members.m_point }</h1>
	<h1> 최근 구입한 메뉴</h1>
	<table width="820" border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none;'>
				<tr id="setTd" align="center" height="35">
				<td width="100">제품이름</td>
				<td width="150">구입날짜</td>
				<td width="100">구입개수</td>
			</tr>
			<c:forEach var="getRecentItem" items="${getRecentItem}">
				<tr height="25">
					<td align="center"><a href="/ViewItemsContent?str=${getRecentItem.s_item_name}">${getRecentItem.s_item_name} </a></td>
					<td align="center">${getRecentItem.s_buy_date}</td>
					<td align="center">${getRecentItem.s_buy_cnt}개</td>
				</tr>
			</c:forEach>
			<tr>
				<td id="setTd" align="center" height="35">상세내역</td>
				<td colspan="2">
					<a href="/buyDetailed?code=${getRecentItemCode}">보기</a>
				</td>
				</tr>
			</table>
	<h1>추천메뉴!</h1>
		<table width="820" border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none;'>
		<tr>
			<td rowspan="4" width="300">
				<img src="/upload/${ranDom.i_pic}" width="300" height="200" />
			</td>
			<td align="center" id="setTd" width="80">
				이름
			</td>
			<td>
			<a href="/ViewItemsContent?str=${ranDom.i_name}&num=${ilist.i_num}"> ${ranDom.i_name} </a>
			</td>
		</tr>
		<tr>
			<td align="center" id="setTd">
				가격
			</td>
			<td>
				${ranDom.i_price}원
			</td>
		</tr>
		<tr>
			<td align="center" id="setTd">
				수량
			</td>
			<td>
				${ranDom.is_count}개
			</td>
		</tr>
		<tr>
			<td align="center" id="setTd">
				설명
			</td>
			<td>
				${ranDom.i_description}
			</td>
		</tr>
		</table>
	</div>
</body>
</html>
