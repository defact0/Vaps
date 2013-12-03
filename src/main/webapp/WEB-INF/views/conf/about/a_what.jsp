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
	<%@include file="/WEB-INF/views/conf/top/m_menu.jsp"%>
<br/>
	<div style="padding: 1px 20px 30px 60px;">

		<div>
			<form action="access" name="LogFrm" method="post"
				onsubmit="return formCheck();">
				<table width="820" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td id="setTd" align="left" height="40" colspan="3"><font
							size="6"> Vaps project </font></td>
					</tr>
					<tr>
						<td>
						<font size="4">
							밥스 프로젝트는 Team Project 으로 진행됩니다.<br /> 
							github : <a href="https://github.com/defact0">https://github.com/defact0</a> 에서 현상관리 합니다.<br />
							밥스는 온라인 도시락 판매관리 Web site입니다.<br />
							</font>
						</td>
					</tr>
				</table>
			</form>
		</div>

		<div style="padding: 30px 20px 30px 0px;">
			<table width="820" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td id="setTd" align="left" height="40" colspan="3">
					<font size="6">밥스 (Vaps) 의 어원!</font></td>
				</tr>
				<tr>
					<td>
					<font size="4">
						밥스는 빕스(Vips)라는 브랜드명을 패러디 했습니다.
						</font><br/></td>
					
				</tr>
			</table>
		</div>

	</div>
</body>
</html>