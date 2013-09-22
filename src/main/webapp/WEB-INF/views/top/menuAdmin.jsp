<%-- 
	참고 : http://onwebdev.blogspot.com/2011/04/css-drop-down-menu-tutorial.html
	해당 페이지 bady 부분에
	<%@include file="title.jsp" %>
	<%@include file="menu.jsp" %>
	이런식으로 활용한다.
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
 
	<ul id="navigation">
		<li><img src="/images/Logo.jpg"/></li>

		<li><a href="/">HOME</a></li>

		<li class="sub"><a href="/itemslist">item manage</a>
			<ul>
				<li><a href="/itemslist">상품리스트</a></li>
				<li><a href="/itemsUploadForm">상품등록</a></li>
				<li><a href="#">추천도시락</a></li>
				<li><a href="#">인기도시락</a></li>
			</ul></li>
			
		<li><a href="/board">free board</a></li>
		
		<li class="sub"><a href="#">ABOUT</a>
			<ul>
				<li><a href="/what">VAPS(밥스)란?</a></li>
				<li><a href="/developer">개발자 소개</a></li>
			</ul></li>

		<li class="sub"><a href="#"><font color="#FFFFFF">관리자 접속</font> </a>
			<ul>
				<li><a href="/logout">Sign out</a></li>
			</ul></li>
		
	</ul>
 
</body>
</html>
