<%@page import="util.PagingBtn"%>
<%@page import="util.Paging"%>
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
   <% 
   Paging pg = new Paging();
  	PagingBtn pb = new PagingBtn();
  	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
  	
  	int perPageNum = Integer.parseInt(request.getParameter("perPageNum"));
  	
  	pg.setPerPageNum(perPageNum);
        
      
      ArrayList<ShopDTO> list = (ArrayList<ShopDTO>)request.getAttribute("pdList");
      
      for(ShopDTO dtos : list){
   %>
   <div align ="center" style=" float:left; width: 33%;">
   &nbsp;<span><a href="shopMain.app?pdnum=<%=dtos.getPdnum()%>"><img src="images/<%=dtos.getImg() %>" style="height: 300px; width: 300px;"></a><br></span> &nbsp;
   
   <b><%=dtos.getPdname() %></b><p><br>
   <%					if (dtos.getPdnum()%2==0){ %>
							<img src="hot.gif">
<%					} %>
   <b><%=dtos.getPrice() %>원</b>
      </div>
   <%}%>
   	<div align="center">
		<%
		ShopDAO dao1 = new ShopDAO();
		int totalShop = dao1.totalAcc();
		pb.setTempEndPage(totalShop,pg);
		int tempEndPage = pb.getTempEndPage();
		for(int i =1;i<=tempEndPage;i++){
			if(pageNum == i){%>
		
		<a href="acc.shop?pageNum=<%=i%>&perPageNum=9">[<%=i %>]</a>
		<%}else if(pageNum != i){ %>
		<a href="acc.shop?pageNum=<%=i%>&perPageNum=9"><%=i %></a>
		<%} %>
			<%} %>
			</div>
</body>
</html>