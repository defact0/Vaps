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
	href="${pageContext.request.contextPath}/css/bt.css" />
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
	<br />
	<div style="padding: 1px 20px 30px 60px;">
		<h1> 파일 업로드</h1>
		<form action="/itemsUpload" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td>상품이름</td>
					<td><input class="button" id="fileTxt" type="text" name="i_name"/></td>
				</tr>
				<tr>
					<td>카테고리</td>
					<td><input class="button" id="fileTxt" name="i_category"/></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input class="button" id="fileTxt" name="i_price"/></td>
				</tr>
				<tr>
					<td>재고수량</td>
					<td><input class="button" id="fileTxt" name="is_count"/></td>
				</tr>
				<tr>
					<td>설명</td>
					<td><textarea cols="67" rows="10"  name="i_description" class="inArea"></textarea></td>
				</tr>
				<tr>
					<td>이미지</td>
					<td>
						<input type="text" id="fileName" class="file_input_textbox" readonly="readonly">
						 
						<div class="file_input_div">
						<input type="button" value="파일" class="button" />
						<input type="file" name="i_pic" class="file_input_hidden" onchange="javascript: document.getElementById('fileName').value = this.value" />
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input class="button" type="submit" value="등록" />
						<a href="/itemslist" class="button">취소</a>
					</td>
				</tr>
			</table>
			
		</form>
	</div>
</body>
</html>
