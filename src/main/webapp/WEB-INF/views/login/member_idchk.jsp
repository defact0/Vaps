<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="dao" class="com.vaps.dao.MembersDAO"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<script>
function windowclose(){
	close(this);
}
	

</script>
</head>
<body>

<c:if test="${xx == 1}">
<table width="360" border="0" cellspacing="0" cellpadding="5">
	<tr align="center">
	<td height="30">
		<font size="2">�̹� ��� ���� ���̵��Դϴ�.</font>
	</td>
	</tr>
</table>

<form action="./MemberIDCheckAction" method="post" name="joinFrm" >
<table width="360" border="0" cellspacing="0" cellpadding="5">
	<tr>
	<td align="center">
		<font size="2">�ٸ� ���̵� �����ϼ���.</font><p>
		<input type="text" size="10" maxlength="12" name="id"/>
		<input type="submit" value="�ߺ�Ȯ��" onclick="MemberIDCheckAction()"/>
	</td>					
	</tr>
</table>
</form>
</c:if>
<c:if test="${xx == 0}">
<table width="360" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td align="center">
		<font size="2">����� �� �ִ� ���̵��Դϴ�.</font>
		<br/><br/>
		<input type="button" value="�ݱ�" onclick="windowclose()" />
		</td>
	</tr>
</table>
</c:if>

</body>
</html>





