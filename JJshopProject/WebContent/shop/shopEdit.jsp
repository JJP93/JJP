<%@ page import="java.util.*,order.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<%
		OrderDTO dto = (OrderDTO)request.getAttribute("getOrder");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정페이지</title>
</head>
<body>
<jsp:include page="/menu.jsp"></jsp:include>
<form method="post" >
<table width="1000">
<tr height="100">
<td align="center" colspan="3">
<font size="6" color="gray"><%=dto.getOrname() %>상품 수정</font>
</tr>

</table>
</form>
<center>
<footer>
	<jsp:include page="/Bottom.jsp"></jsp:include>
</footer>
</center>

</body>
</html>