<%@page import="java.util.List"%>
<<<<<<< HEAD

=======
>>>>>>> 298f30de4ebe5e38cd37705dd8f0ff6ea813878f
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
<title>전체 상품</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

</head>
<body>

	<%String contextpath = request.getContextPath(); %>

	<jsp:include page="/menu.jsp"></jsp:include>
<div class="container">
	<div class="carousel-inner">
            <div class="item active" >
               <img src="images/11.jpg" style="height: 500px; width: 1500px;">
            </div>
            </div>
            <hr color ="black" size="3">
	&nbsp; &nbsp;


   <% 
  
      
	List<ShopDTO> list = (List)request.getAttribute("pdList");
  
 
     
      
      for(ShopDTO pdlist : list){
   %>
   <div align ="center" style=" float:left; width: 33%;">
   &nbsp;<span><a href="shopMain.app?pdnum=<%=pdlist.getPdnum()%>"><img src="images/<%=pdlist.getImg() %>" style="height: 300px; width: 300px;"></a><br></span> &nbsp;
   
   <b><%=pdlist.getPdname() %></b><p><br>
   <%					if (pdlist.getPdnum()%2==0){ %>
							<img src="hot.gif">
<%					} %>
   <b><%=pdlist.getPrice() %>원</b>
      </div>
   <%}%>
   </div>
   
   
   
   
   	<div align="center">
		<c:if test="${pageMaker.prev }">
			<a href="shop.shop?pageNum=${pageMaker.startPage-1 }&perPageNum=9">&laquo;</a>
				</c:if>
				
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">	
						<c:if test="${pageMaker.cri.page == idx }" >
		<a href="shop.shop?pageNum=${idx }&perPageNum=9">[${idx }]</a>
		</c:if>
		<c:if test="${pageMaker.cri.page != idx }" >
		<a href="shop.shop?pageNum=${idx }&perPageNum=9">${idx }</a>
			</c:if>
					</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
			<a href="shop.shop?pageNum=${pageMaker.endPage+1 }&perPageNum=9">&raquo;</a>
				</c:if>
			</div>
</body>
</html>