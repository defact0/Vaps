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
 <!--  
	메뉴	: m_menu
	----------
	일반 	: firstNormal
	관리자 	: m_admin
	게스트	: m_guest
-->
	<%@include file="/WEB-INF/views/conf/top/m_menu.jsp"%>

   <c:if test="${members.m_auth==0}" var="result">
	   <meta http-equiv='refresh' content='0; url=/m_normal'> 
   </c:if>
   <c:if test="${members.m_auth==1}" var="result">
  	 <%@include file="/WEB-INF/views/conf/top/m_admin.jsp"%>
   </c:if>
   <c:if test="${members.m_auth==null}" var="result">
  	 <%@include file="/WEB-INF/views/conf/top/m_guest.jsp"%>
   </c:if>   

</body>
</html>

<%-- 
	버튼 CSS 관련 사용법을 얻을 수 있다.
	http://www.red-team-design.com/wp-content/uploads/2011/09/awesome-css3-buttons.html
 --%>