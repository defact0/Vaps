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
<%@include file="/WEB-INF/views/conf/top/m_menu.jsp"%>
	<form action="/noticeModiSet?id=${nlist.n_id}" name="modiFrm" method="post"
		onsubmit="return formCheck();">
		<div style="padding: 1px 20px 30px 60px;">
			<table>
				<tr>
					<td>제목:</td>
					<td><input class="inSub" type="text" name="sub" class="button"
						value="${nlist.n_sub}" /></td>
				</tr>
				<tr>
					<td>내용:</td>
					<td><pre><textarea cols="72" rows="10" name="contents" 
							class="inArea">${nlist.n_contents}</textarea></pre></td>
				</tr>
				<tr>
					<td colspan=2 align="right">
						<input type="submit" class="button" value="수정" />
					 	<a href="/notice" class="button">취소</a>
					 </td>
				</tr>
			</table>
		</div>
		</form>
</body>
</html>
