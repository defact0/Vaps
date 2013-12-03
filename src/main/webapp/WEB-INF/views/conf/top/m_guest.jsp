<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

				alert(document.forms[0][i].name + "(을/를) 입력하세요.");
				document.forms[0][i].focus();
				return false;
			}
		}
		
</script>
</head>
<body margin="0" padding="0">
	<div style="padding: 1px 20px 30px 60px;">
		</br>
		<form action="access" name="LogFrm" method="post"
			onsubmit="return formCheck();">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td id="setTd" align="left" height="35" colspan="3"> Vaps
						SignIn</td>
				</tr>
				<tr>
					<td width="70">아이디:</td>
					<td width="100"><input class="intxt" type="text" name="id" /></td>
					<td width="70"><input class="button" id="mGuestButton"
						type="submit" value="로그인 "></td>
				</tr>
				<tr>
					<td>비밀번호:</td>
					<td><input class="intxt" type="password" name="pwd" /></td>
					<td><a href="javascript:location.href='/join'" class="button">회원가입</a></td>
				</tr>
			</table>
		</form>

</br>
		<table width="820" border="1" cellspacing="0" cellpadding="0"
			style='border-collapse: collapse; border: none;'>
			<tr>
				<td id="setTd" align="left" height="35" colspan="3"> Vaps
					Menu!</td>
			</tr>
			<tr>
				<td rowspan="4" width="300"><img src="/upload/${ranDom.i_pic}"
					width="300" height="200" /></td>
				<td align="center" id="setTd" width="80">이름</td>
				<td>${ranDom.i_name}</td>
			</tr>
			<tr>
				<td align="center" id="setTd">가격</td>
				<td>${ranDom.i_price}원</td>
			</tr>
			<tr>
				<td align="center" id="setTd">수량</td>
				<td>${ranDom.is_count}개</td>
			</tr>
			<tr>
				<td align="center" id="setTd">설명</td>
				<td>${ranDom.i_description}</td>
			</tr>
		</table>
	</div>


</body>
</html>
