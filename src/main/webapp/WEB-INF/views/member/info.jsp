<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<br/>
	<div style="padding: 1px 20px 30px 60px;">
			<img src="/images/members/InfoProfile.jpg"/>
		<table width="260">
			<tr>
				<td width="50">id</td>
				<td width="10">:</td>
				<td width="200">${members.m_id }</td>
			</tr>
			<tr>
				<td>nick</td>
				<td width="10">:</td>
				<td>${members.m_nick }</td>
			</tr>
			<tr>
				<td>pwd</td>
				<td width="10">:</td>
				<td><font color="red">암호화처리 되었습니다.</font></td>
			</tr>
			<tr>
				<td>phone</td>
				<td width="10">:</td>
				<td>${members.m_phone }</td>
			</tr>
			<tr>
				<td>addr</td>
				<td width="10">:</td>
				<td>${members.m_addr }</td>
			</tr>
			<tr>
				<td>point</td>
				<td width="10">:</td>
				<td>${members.m_point }</td>
			</tr>
			</table>
	</div>

</body>
</html>
