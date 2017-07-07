<%@page import="java.util.ArrayList"%>
<%@page import="shop.ShopDAO"%>
<%@page import="shop.ShopDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title> </title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

</head>
<body>




	<%String contextpath = request.getContextPath(); %>





	<jsp:include page="/menu.jsp"></jsp:include>

	&nbsp; &nbsp;


	 <div class="container">
   <% ShopDTO dto = new ShopDTO();
      ShopDAO dao = new ShopDAO();
      
      
      ArrayList<ShopDTO> dtos;
      dtos = dao.getHatList();
      
      for(int i =0; i<dtos.size(); i++){
   %>
   <div align ="center" style=" float:left; width: 33%;">
   &nbsp;<span><a href="shopMain.app?pdnum=<%=dtos.get(i).getPdnum()%>"><img src="images/<%=dtos.get(i).getImg() %>" style="height: 300px; width: 300px;"></a><br></span> &nbsp;
   
   <b><%=dtos.get(i).getPdname() %></b><p><br>
   <%					if (dtos.get(i).getPdnum()%2==0){ %>
							<img src="hot.gif">
<%					} %>
   <b><%=dtos.get(i).getPrice() %>원</b>
      </div>
   <%}%>
</body>
</html>