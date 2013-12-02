<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>logout</title>
<%
	// 세션 제거
	session.invalidate();
	// 쿠키 제거
	Cookie[] cookie = request.getCookies();
	for (int i = 0; i < cookie.length; i++) {
		cookie[i].setMaxAge(0);
		response.addCookie(cookie[i]);
	}
%>
</head>
<body>
	<meta http-equiv='refresh' content='0; url=/'> 
</body>
</html>