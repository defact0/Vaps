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
		function openConfirmId(joinFrm){			
			var id=joinFrm.id.value;
			var url="./MemberIDCheckAction?id="+joinFrm.id.value;
			
			if(id.length == 0){
				alert("아이디를 입력하세요.");
				joinFrm.id.focus();
				return false;
			}
			 open(url, "confirm", "width=400,height=200,location=no" );
		
		}  
		
</script>
</head>
<body>
	<%@include file="/WEB-INF/views/conf/top/m_menu.jsp"%>
<br/>
	<div style="padding: 1px 20px 30px 60px;">
		<form action="memJoin" name="joinFrm" method="post"
			onsubmit="return formCheck();">
			<div>
			<table width="820" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td id="setTd" align="left" height="40" colspan="3"><font
							size="6"> Vaps 가입 </font></td>
					</tr>
					<tr height="10"><td></td></tr>
				<tr>
			</table>
			</div>
			<div style="float: left;">
			<table>
				<tr>
					<td width="65" align="left">아이디:</td>
					<td align="left"><input class="intxt" type="text" name="id" />
					<input type="button" name="confirm_id" value="아이디 확인" 
								onclick="openConfirmId(this.form)" class="buttonCh"/>
					</td>
				</tr>
				<tr>
					<td>닉네임:</td>
					<td><input class="intxt" type="text" name="nick" /></td>
				</tr>
				<tr>
					<td>비밀번호:</td>
					<td><input class="intxt" type="password" name="pwd" /></td>
				</tr>
				<tr>
					<td>전화번호:</td>
					<td><input class="intxt" type="text" name="phone" /></td>
				</tr>
				<tr>
					<td>주소:</td>
					<td><input class="intxt" type="text" name="addr" /></td>
				</tr>
			</table>
			</div>
			<div style="float: left;">
			<table border="0" style="PADDING-RIGHT: 1px; PADDING-LEFT: 1px; PADDING-BOTTOM:1px; PADDING-TOP: 1px">
				<tr>
					<td align="left" style="padding-left: 0px;">
						<input class="button" id="mJoingSubmit" type="submit" value="회원가입" />
					</td>
				</tr>
				<tr>
					<td align="left" style="padding-left: 0px;">
						<a href="javascript:location.href='/'" class="button" id="mJoingBack">　 메인 페이지로 이동</a>
					</td>
				</tr>
			</table>
			</div>
		</form>
	</div>




</body>
</html>

<%-- 
	버튼 CSS 관련 사용법을 얻을 수 있다.
	http://www.red-team-design.com/wp-content/uploads/2011/09/awesome-css3-buttons.html
 --%>