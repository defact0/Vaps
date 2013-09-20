<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Vaps shopping mall</title>
</head>
<body>
	<%@include file="/WEB-INF/views/top/title.jsp"%>
	<%@include file="/WEB-INF/views/top/menu.jsp"%>
<br/>
	<div style="padding: 1px 20px 30px 60px;">
			<img src="/images/members/buyHistory.jpg"/>
		<table id="two_table" border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none;'>
			<tr>
			<td bgcolor="cyan" align="center" height="35">누적금액</td>
			<td colspan="4">&nbsp;${buyTotalMoney } 원</td>
			</tr>
			<tr bgcolor="cyan" align="center" height="35">
				<td width="100">판매코드</td>
				<td width="150">구입날짜</td>
				<td width="100">구입개수</td>
				<td width="150">구입가격</td>
				<td width="100">상세내역</td>
			</tr>
			<c:forEach var="buylist" items="${buylist}">
				<tr height="25">
					<td align="center">${buylist.s_buy_code}</td>
					<td align="center">${buylist.s_buy_date}</td>
					<td align="center">${buylist.s_buy_cnt}</td>
					<td align="center">${buylist.s_buy_price} 원</td>
					<td align="center">
						<a href="/buyDetailed?code=${buylist.s_buy_code}">상세내역</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>
