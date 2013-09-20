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
<script>
	function formCheck() {
				
		var length = document.forms[0].length - 1;

		for ( var i = 0; i < length - 1; i++) {
			if (document.forms[0][i].value == null
					|| document.forms[0][i].value == "") {

				alert(document.forms[0][i].name + "을/를 입력하세요.");
				document.forms[0][i].focus();
				return false;
			}
		}
	}
</script>
</head>
<body>
	<%@include file="/WEB-INF/views/top/title.jsp"%>
	<%@include file="/WEB-INF/views/top/menu.jsp"%>

	<form action="/itemsModify?str=${ilist.i_name}" name="modiFrm" method="post"
		onsubmit="return formCheck();">
		<div style="padding: 1px 20px 30px 60px;">
			<table>
				<tr>
					<td>상품이름</td>
					<td><input class="inSub" type="text" name="i_name" class="button"
						value="${ilist.i_name}" /></td>
				</tr>
				<tr>
					<td>상품범주</td>
					<td><input class="inSub" type="text" name="i_category" class="button"
						value="${ilist.i_category}" /></td>
				</tr>
				<tr>
					<td>상품가격</td>
					<td><input class="inSub" type="text" name="i_price" class="button"
						value="${ilist.i_price}" /></td>
				</tr>
				<tr>
					<td>상품사진</td>
					<td>&nbsp;<img src="/upload/${ilist.i_pic}" width="250" height="120"></td>
				</tr>
				<tr>
					<td>상품설명</td>
					<td><pre><textarea cols="67" rows="10" name="i_description" 
							class="inArea">${ilist.i_description}</textarea></pre></td>
				</tr>
				<tr>
					<td>상품수량</td>
					<td><input class="inSub" type="text" name="is_count" class="button"
						value="${ilist.is_count}" /></td>
				</tr>
				<tr>
					<td colspan=2 align="right">
						<input type="submit" class="button" value="수정" />
					 	<a href="/itemslist" class="button">취소</a>
					 </td>
				</tr>
			</table>
		</div>
		</form>
</body>
</html>
