<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*,order.*"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
   String userID = null;
if(session.getAttribute("userID") != null){
   userID = (String)session.getAttribute("userID");
}


%>
	<jsp:include page="/menu.jsp"></jsp:include>
	
	<div class="container">
	
	&nbsp;
	<div id = "search1">
	<form action="searchOrder.order">
	
	<input type="text" class="form-control"  placeholder="검색" name = "search" style="width: 200px;"/>
	<select name = "searchList">
	<option value="oruser">주문자 이름</option>
	<option value="orname">주문 상품명</option>
	<option value="pdnum">상품 번호</option>
	<option value="ornum">주문 번호</option>
	</select>
	<input type="submit"  value = "search" class="btn btn-primary "/>
	&nbsp;
	
		<div class="row">
			<b class="navbar-brand" style="text-align: center;">주문 목록</b>
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">


				<tr>
					<th style="background-color: #eeeeee; text-align: center;">번호</th>
					<th style="background-color: #eeeeee; text-align: center;">주문번호</th>
					<th style="background-color: #eeeeee; text-align: center;">상품명</th>
					<th style="background-color: #eeeeee; text-align: center;">상품가격</th>
					<th style="background-color: #eeeeee; text-align: center;">사이즈</th>
					<th style="background-color: #eeeeee; text-align: center;">수량</th>
					<th style="background-color: #eeeeee; text-align: center;">색</th>
					<th style="background-color: #eeeeee; text-align: center;">주문자</th>
					<th style="background-color: #eeeeee; text-align: center;">날짜</th>
					<th style="background-color: #eeeeee; text-align: center;">주소</th>
				</tr>
				<%		
				OrderDAO dao = new OrderDAO();
				
				ArrayList<OrderDTO> a = dao.getOrder(userID); 
				if (a == null || a.size() == 0){%>
				<tr>
					<td colspan="7">주문하신 상품이 없습니다.</td>
				</tr>
				<%			}else { 
					for(int i = 0; i<a.size(); i++){
					
					System.out.println("i값:"+i);
					System.out.println("get i 값:"+ a.get(i).getOrnum());
					%>
				<tr>
					<td><%=a.get(i).getPdnum()%></td>
					<td><%=a.get(i).getOrnum()%></td>
					 <td><%=a.get(i).getOrname()%></td>
					<td><%=a.get(i).getOrprice()%></td>
					<td><%=a.get(i).getOrsize()%></td>
					<td><%=a.get(i).getOrcnt()%></td>
					<td><%=a.get(i).getOrcolor()%></td>
					<td><%=a.get(i).getOruser()%></td>
					<td><%=a.get(i).getOrdate()%></td>
					<td><%=a.get(i).getOraddr()%></td> 
				</tr>
					<%} %>
					<%} %>
				
			</table>	
		</div>
		
	</div>
	<center>
 <footer> <jsp:include page="/Bottom.jsp"></jsp:include> </footer>
 </center>
</body>
</html>