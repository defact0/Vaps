<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dao" class="com.vaps.dao.MembersDAO"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel="styleSheet" type="text/css"
	href="${pageContext.request.contextPath}/css/docStyle.css" />
<link rel="styleSheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css" />
<%--
	css를 사용해서 스크롤바 없애고, container와 block div를 사용해 상하 좌우 가운데 정렬을 했음
 --%>
<style type="text/css">
body{overflow:hidden;}
#container {
	width :80px;
	height:80px;
	text-align: center;
	vertical-align: middle;
	display: table-cell;
}

#block {
	width: 50px;
	height: 50px;
	display: inline-block;
}
</style>	
	
<script>
function windowclose(){
	close(this);
}
	

</script>
</head>
<body>

	<div id="container">
		<div id="block">
			<c:if test="${xx == 1}">
				<table width="360" border="0" cellspacing="0" cellpadding="5">
					<tr align="center">
						<td height="30"><font size="2">이미 <font color="red">사용중</font>인 아이디입니다.
						</font></td>
					</tr>
				</table>

				<form action="./MemberIDCheckAction" method="post" name="joinFrm">
					<table width="360" border="0" cellspacing="0" cellpadding="5">
						<tr>
							<td align="center"><font size="2">다른 아이디를 선택하세요.</font>
								<p>
									<input type="text" size="10" maxlength="12" name="id" class="intxt" /> 
										<input type="submit" value="중복확인" onclick="MemberIDCheckAction()" class="buttonCh" /></td>
						</tr>
					</table>
				</form>
			</c:if>

			<c:if test="${xx == 0}">
				<table width="360" border="0" cellspacing="0" cellpadding="5">
					<tr>
						<td align="center"><font size="2"><font color="red">사용할수 있는</font> 아이디입니다.</font> 
						<br /> <br /> <input type="button" value="닫기" onclick="windowclose()" class="buttonCh" /></td>
					</tr>
				</table>
			</c:if>
		</div>
	</div>


</body>
</html>





