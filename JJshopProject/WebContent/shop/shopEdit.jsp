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
<form method="post" action="orderEditOk.order" >
<table width="1000">
<tr height="100">
<td align="center" colspan="3">
<font size="6" color="gray"><%=dto.getOrname() %>상품 수정</font>
</tr>
<tr>
	<td rowspan="8" width="1000" align="center">
	<img src="images/<%=dto.getImg() %>" width= "350"><br>
	<td width="350" align="center"><b>상품명</b></td>	
	<td width="1000" align="center"><%=dto.getOrname() %>
	</td>
	</tr>
	<tr>
	<td width="1000" align="center"><b>가격:</b></td>
	<td width="1000" align="center"><b><%=dto.getOrprice() %>원</b></td>
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
	
	<td width="1000" align="center"><b>주소 </b></td>
		<td width="1000" align="center"> <input  type="text" name="oraddr" value="<%=dto.getOraddr() %>" ></td>
</tr>
		
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
		<input type="hidden" name="orname" value="<%=dto.getOrname() %>">
		<input type="hidden" name="orprice" value="<%=dto.getOrprice()%>">
			<input type="hidden" name="orcolor" value="<%=dto.getOrcolor() %>">
		<input type="hidden" name="oruser" value="<%=dto.getOruser() %>">
	
		<input type="hidden" name="img" value="<%=dto.getImg() %>">
		<input type="hidden" name="category" value="<%=dto.getCategory() %>">
	
<input type="submit"class="btn btn-primary pull-right" value="주문 수정 완료" ></td>
</table>
</form>
<center>
<footer>
	<jsp:include page="/Bottom.jsp"></jsp:include>
</footer>
</center>

</body>
</html>