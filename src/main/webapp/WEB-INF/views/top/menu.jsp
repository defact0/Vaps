<%-- 
	참고 : http://onwebdev.blogspot.com/2011/04/css-drop-down-menu-tutorial.html
	해당 페이지 bady 부분에
	<%@include file="title.jsp" %>
	<%@include file="menu.jsp" %>
	이런식으로 활용한다.
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="description"
	content="Slide Down Box Menu with jQuery and CSS3" />
<meta name="keywords"
	content="jquery, css3, sliding, box, menu, cube, navigation, portfolio, thumbnails" />
<link rel="styleSheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css" />
</head>
<body>

   <c:if test="${members.m_auth==0}" var="result">
  	 <%@include file="/WEB-INF/views/top/menuNormal.jsp"%>
   </c:if>
   <c:if test="${members.m_auth==1}" var="result">
  	 <%@include file="/WEB-INF/views/top/menuAdmin.jsp"%>
   </c:if>
   <c:if test="${members.m_auth==null}" var="result">
  	 <%@include file="/WEB-INF/views/top/menuGuest.jsp"%>
   </c:if>   

 
</body>
</html>
