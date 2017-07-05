<%@page import="MemberDao.MemberDao"%>
<%@page import="memberDto.MemberDto"%>
<%@page import="shop.ShopDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세페이지</title>
</head>
<body>
<script>
function order(){
	
	document.order_tb.submit();
}
</script>
	<%
	
   String userID = null;
if(session.getAttribute("userID") != null){
   userID = (String)session.getAttribute("userID");
}
System.out.println(userID);
MemberDto mdto = new MemberDto();
MemberDao mdao = new MemberDao();
mdto = mdao.memberInfo(userID);
%>
<jsp:include page="/menu.jsp"></jsp:include>
<% ShopDTO dto = (ShopDTO)request.getAttribute("pd"); %>
<center>
<form action="order.app" method="post" name = "order_tb">
<table width="1000">
<tr height="100">
<td align="center" colspan="3">
<font size="6" color="gray"><%=dto.getPdname() %>상품 선택</font>
</tr>
<tr>
	<td rowspan="8" width="1000" align="center">
	<img src="images/<%=dto.getImg() %>" width= "350"><br>
	<td width="350" align="center"><b>상품명</b></td>	
	<td width="1000" align="center"><%=dto.getPdname() %>
	</td>
	</tr>
	<tr>
	<td width="1000" align="center"><b>가격:</b></td>
	<td width="1000" align="center"><b><%=dto.getPrice() %>원</b></td>
</tr>
<tr>
	<td width="50" align="center"><b>상품수량</b></td>
	<td align="center">&nbsp;&nbsp;<input type="text" name="orcnt" size="2" value="1" width="50" ></td>
</tr>
<%					if (dto.getCategory()==4){ %>
<tr>
	<td width="50" align="center"><b>사이즈:</b></td>
		<td width="350" align="center">
		<select name="orsize">
			<option>230
			<option>240
			<option>250
		</select>
		</td>
</tr>	
<%					}else if(dto.getCategory()==1||dto.getCategory()==2||dto.getCategory()==3){ %>
<tr>
	<td width="50" align="center"><b>사이즈:</b></td>
		<td width="350" align="center"><select name="orsize">
			<option>S
			<option>M
			<option>L
		</select>
		</td>
</tr>	
<%} %>
	
<tr>
	
	<td width="1000" align="center"><b>DELIVERY INFO</b></td>
		<td width="1000" align="center">배송 정보</td>
</tr>
<tr>
	<td width="1000" align="center"><b>-평균 발송일</b></td>
		<td width="1000" align="center"><b>1.2일(결제완료후 평균발송시간)</b></td>
</tr>
<tr>
<td width="1000" align="center" colspan="1">
		<input type="hidden" name="pdnum" value="<%=dto.getPdnum() %>">
		<input type="hidden" name="orname" value="<%=dto.getPdname() %>">
		<input type="hidden" name="orprice" value="<%=dto.getPrice()%>">
			<input type="hidden" name="orcolor" value="<%=dto.getColor() %>">
		<input type="hidden" name="oruser" value="<%=userID %>">
		<input type="hidden" name="oraddr" value="<%=mdto.getAddr() %>">

<input type="button"class="btn btn-primary pull-right" value="주문하기" onclick="order()"></td>
</tr>
</table>
</form>

</center>
</body>
</html>