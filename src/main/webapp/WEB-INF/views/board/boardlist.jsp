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
	<img src="/images/FreeBoard.jpg"/>
		<table id="two_table" width="820" border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none;'>
			<tr bgcolor="cyan" align="center" height="35">
				<td width="70">번호</td>
				<td width="400">제목</td>
				<td width="100">작성자</td>
				<td width="150">작성일</td>
				<td width="100">조회수</td>
			</tr>
			<c:forEach var="blist" items="${blist}">
				<tr height="25">
					<td width="70" align="center">${blist.b_num}</td>
					<td width="400"><a href="contents?idx=${blist.b_num}"> ${blist.b_sub} </a></td>
					<td width="100" align="center">${blist.m_nick}</td>
					<td width="150" align="center">${blist.b_date}</td>
					<td width="100" align="center">${blist.b_readcount}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan=4  style='border-left:none;border-right:none;border-top:solid #000000 0.4pt;border-bottom:none;'>
					<center>${paging }<p>
					</center>
				</td>
				<td style='border-left:none;border-right:none;border-top:solid #000000 0.4pt;border-bottom:none;'>
					<a href="/boardWriteForm" class="button">글쓰기</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
