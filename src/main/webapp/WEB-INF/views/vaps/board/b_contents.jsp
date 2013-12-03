<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Vaps shopping mall</title>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	// 리플레이 전송에 관한
	function replyInsert(id, num) {
		var con= document.rFrm.contents.value; // 답글 내용
		var parameter = escape(encodeURIComponent(con));
		var param= "id="+id+"&bnum="+num+"&contents="+parameter;
		$('#rTable').load("/replyInsert",param,function(data){ });
		// load는 url 이다. param에 있는 쿼리로 전송, replyInsert컨트롤러 작성, 저장된 결과를 data로 뿌림
		// data가 replylistajax이다. function(data){}은 필수다!!!!
	}

</script>
<link rel="styleSheet" type="text/css"
	href="${pageContext.request.contextPath}/css/docStyle.css" />
</head>
<body>
<%@include file="/WEB-INF/views/conf/top/m_menu.jsp"%>
	<div style="padding: 1px 20px 30px 60px;">
	<img src="/images/members/FreeBoard.jpg"/>
	<table width="820" border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none;'>
		<tr height="30">
			<td width="100" id="setTd" align="center">&nbsp;NUM</td>
			<td colspan="5">&nbsp;${blist.b_num}</td>
		</tr>
		<tr height="30">
			<td id="setTd" align="center">&nbsp;WRITER</td>
			<td width="150">&nbsp;${blist.b_id}</td>
			<td id="setTd" align="center" width="90">&nbsp;DATE</td>
			<td width="100" align="center">&nbsp;${blist.b_date}</td>
			<td id="setTd" align="center" width="80">&nbsp;COUNT</td>
			<td align="center" width="50">&nbsp;${blist.b_readcount}</td>
		</tr>
		<tr height="30">
			<td id="setTd" align="center">&nbsp;TITLE</td>
			<td colspan="5">&nbsp;${blist.b_sub}</td>
		</tr>
		<tr height="200">
			<td id="setTd" align="center">&nbsp;CONTENTS</td>
			<td colspan="5">&nbsp;${blist.b_contents}</td>
		</tr>
		<tr>
			<td style='border-left:none;border-right:none;border-top:solid #000000 0.4pt;border-bottom:none;'>
			<a href="/board" class="button">목록</a>
			</td>
			<td colspan="5" align="right" style='border-left:none;border-right:none;border-top:solid #000000 0.4pt;border-bottom:none;'>
			<a href="/boardModiContentForm?idx=${blist.b_num}" class="button">수정</a>
			<a href="/boardDelContent?id=${blist.b_id}" class="button">삭제</a>
			</td>
		</tr>
	</table>
	
	<form name="rFrm">
		<table>
			<tr>
				<td><textarea cols="91" rows="1"  name="contents" class="inArea"></textarea></td>
				<td><input type="button" class="button" onclick="replyInsert('${user}','${blist.b_num}')"
					value="확인"></td>
			</tr>
		</table>
	</form>

	<table id="rTable" width="820" border="0" cellspacing="0" cellpadding="0">
		<c:forEach var="rlist" items="${rlist}">
			<tr height="25" align="center">
				<td width="100">${rlist.rid}</td>
				<td width="320">${rlist.rcontents}</td>
				<td width="150">${rlist.rdate}</td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>