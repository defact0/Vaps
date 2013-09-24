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
	<%@include file="/WEB-INF/views/top/menu.jsp"%>

   <c:if test="${members.m_auth==0}" var="result">
	   <meta http-equiv='refresh' content='0; url=/firstNormal'> 
   </c:if>
   <c:if test="${members.m_auth==1}" var="result">
  	 <%@include file="/WEB-INF/views/top/firstAdmin.jsp"%>
   </c:if>
   <c:if test="${members.m_auth==null}" var="result">
  	 <%@include file="/WEB-INF/views/top/firstGuest.jsp"%>
   </c:if>   

</body>
</html>
