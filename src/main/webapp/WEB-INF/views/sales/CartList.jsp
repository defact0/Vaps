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
<link rel="styleSheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bt.css" />
	
<script language='javascript'>
	function submitForm1() { 
		var form = document.forms['myForm']; 
		form.action = '/itemsRemove'; 
		form.submit(); 
	} 
	function submitForm2() { 
		var form = document.forms['myForm']; 
		form.action = '/itemsPurchase'; 
		form.submit(); 
	}
	function checkCNT(name,cnt){
		if(cnt != 1){
		location.href="/itemsCntDown?str="+name;	
		}
		else{
		return;
		}
	}
</script>
<style>
<!-- 
A:link {COLOR:white; text-decoration:none}
A:visited {COLOR:white; text-decoration:none}
A:active {COLOR:white; text-decoration:none}
A:hover {COLOR:white; text-decoration:underline}
-->
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/top/title.jsp"%>
	<%@include file="/WEB-INF/views/top/menu.jsp"%>

	<div style="padding: 1px 20px 30px 60px;">
		<img src="/images/sales/CartList.jpg"/>

		<%
			ArrayList<Items> cartList = (ArrayList<Items>) request
					.getAttribute("cartList");
			int totalMoney = (Integer) request.getAttribute("totalMoney");

			if (cartList == null || cartList.size() == 0) {
		%>
				<br/>
				<br/>
				<br/>
				<img src="/images/sales/noItemsCart.jpg"/>
		<%
			} else {
		%>
				<form method="post" name="myForm">
					<table width="820" >
						<tr align="center" bgcolor="orange">
							<td>번호</td>
							<td>상품이미지</td>
							<td>상품명</td>
							<td>가격</td>
							<td>수량</td>
							<td align="center">
								<input type="button" class="button" value="삭제" onclick="submitForm1();"> 
							</td>
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
										href="itemsCntUp?str=<%=cartList.get(i).getI_name()%>">
										<img src="/images/sales/cntUp.jpg"/></a> <br> <%=cartList.get(i).getBuyCount()%><br> <a
										href="javascript:checkCNT('<%=cartList.get(i).getI_name()%>',<%=cartList.get(i).getBuyCount()%>)">
										<img src="/images/sales/cntDown.jpg"/></a> <br></td>
									<td align="center">
									<input type="checkbox" name="delete"
										value="<%=cartList.get(i).getI_name()%>" /></td>
								</tr>
						<%
							}
						%>
				</table>

				<table width="820">
					<tr align="center" bgcolor="yellow">
						<td align="right" colspan="6"><font color="gray" size="5">총
								결제금액 : </font><font color="black" size="8"><%=totalMoney%>원</font></td>
					</tr>
					<tr>
						<td align="right"><input type="button" class="button" value="구매하기" onclick="submitForm2();"> </td>
					</tr>
				</table>
						</form>
		<%
			}
		%>
	</div>

</body>
</html>