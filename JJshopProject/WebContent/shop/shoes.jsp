
<%@page import="java.util.ArrayList"%>
<%@page import="shop.ShopDAO"%>
<%@page import="shop.ShopDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
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
<div class="container">
	<div class="carousel-inner">
            <div class="item active" >
               <img src="images/14.jpg" style="height: 600px; width: 1500px;">
            </div>
            </div>
            <hr color ="black" size="3">
	&nbsp; &nbsp;

  <% 
  
      
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
		<c:if test="${pageMaker.prev }">
			<a href="shoes.shop?pageNum=${pageMaker.startPage-1 }&perPageNum=9">&laquo;</a>
				</c:if>
				
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">	
						<c:if test="${pageMaker.cri.page == idx }" >
		<a href="shoes.shop?pageNum=${idx }&perPageNum=9">[${idx }]</a>
		</c:if>
		<c:if test="${pageMaker.cri.page != idx }" >
		<a href="shoes.shop?pageNum=${idx }&perPageNum=9">${idx }</a>
			</c:if>
					</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
			<a href="shoes.shop?pageNum=${pageMaker.endPage+1 }&perPageNum=9">&raquo;</a>
				</c:if>
			</div>
</body>
</html>