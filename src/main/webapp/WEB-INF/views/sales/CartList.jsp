<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.vaps.bean.Items"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Vaps shopping mall</title>
</head>
<body>
	<%@include file="/WEB-INF/views/top/title.jsp"%>
	<%@include file="/WEB-INF/views/top/menu.jsp"%>

	<div style="padding: 1px 20px 30px 60px;">
		<img src="/images/CartList.jpg"/>

		<%
			ArrayList<Items> cartList = (ArrayList<Items>) request
					.getAttribute("cartList");
			int totalMoney = (Integer) request.getAttribute("totalMoney");
		%>
		<h1 align="center">
			<font color="black"><font size=15> 장바구니</font></font>
		</h1>
		<table width="600" align="center">
			<tr>
				<td align="right"><a href="/AllItems">쇼핑계속하기</a></td>
			</tr>
		</table>
		<%
			if (cartList == null || cartList.size() == 0) {
		%>
		<h1 align="center">상품이 존재하지 않습니다.</h1>
		<%
			} else {
		%>
		<form action="dogCartRemove.dog" method="post" name="myForm">
			<table align="center" width="600" border="1">
				<tr align="center" bgcolor="orange">
					<td>번호</td>
					<td>상품이미지</td>
					<td>상품명</td>
					<td>가격</td>
					<td>수량</td>
					<td align="center"><input type="submit" name="delete"
						value="삭제" /></td>

				</tr>

				<%
					int num = 1;
						for (int i = 0; i < cartList.size(); i++) {
				%>
				<tr align="center">
					<td><%=num++%></td>
					<td><img src="/upload/<%=cartList.get(i).getI_pic()%>" width="70"
						height="70" /></td>
					<td><%=cartList.get(i).getI_name()%></td>
					<td><%=cartList.get(i).getI_price()%></td>
					<td><a
						href="dogCartQtyUp.dog?kind=<%=cartList.get(i).getI_name()%>">
							<img src="images/up.jpg" width="15" height="15" border="0" />
					</a> <br> <%=cartList.get(i).getBuyCount()%><br> <a
						href="javascript:checkQty('<%=cartList.get(i).getI_name()%>',<%=cartList.get(i).getBuyCount()%>)">
							<img src="images/down.jpg" width="15" height="15" border="0" />
					</a> <br></td>
					<td align="center"><input type="checkbox" name="delete"
						value="<%=cartList.get(i).getI_name()%>" /></td>

				</tr>

				<%
					}
				%>
				<tr>
					<!-- 세션 지우기195 -->
					<input type="button"
						onclick="location.href='sessionInvalidate.jsp'" value="세션삭제" />
				</tr>


			</table>
		</form>
		<table align="center" width="600" border="0">
			<tr align="center" bgcolor="yellow">
				<td align="right" colspan="6"><font color="gray" size="5">총
						결제금액 : </font><font color="black" size="8"><%=totalMoney%>원</font></td>
			</tr>
		</table>
		<%
}
%>
	</div>

</body>
</html>
