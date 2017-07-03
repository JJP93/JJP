<%@page import="java.util.ArrayList"%>
<%@page import="shop.ShopDAO"%>
<%@page import="shop.ShopDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>J&J Shop</title>
</head>
<style>
s
</style>
<body>


<jsp:include page="/menu.jsp"></jsp:include>

   <div class="container">
      <div id="myCarousel" class="carousel" data-ride="carousel">
         <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
         </ol>
         <div class="carousel-inner"    >
            <div class="item active" >
               <img src="images/1.png" style="height: 300px; width: 1500px;">
            </div>
            <div class="item">
               <img src="images/2.png" style="height: 300px; width: 1500px;" >
            </div>
            <div class="item ">
               <img src="images/3.png" style="height: 300px; width: 1500px;" >
            </div>
         </div>
         <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
         </a>
         <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
         </a>
      </div>
   </div>
   
   <br>
   <div class="container">
   <% ShopDTO dto = new ShopDTO();
      ShopDAO dao = new ShopDAO();
      
      
      ArrayList<ShopDTO> dtos;
      dtos = dao.getAllPDList();
      
      for(int i =0; i<dtos.size(); i++){
   %>
   <div align ="center" style="border: 1px solid gold;  float:left; width: 33%;">
   &nbsp;<span><a href="shopMain.app?pdnum=<%=dtos.get(i).getPdnum()%>"><img src="images/<%=dtos.get(i).getImg() %>" style="height: 300px; width: 300px;"></a><br>이것은</span> &nbsp;
   
   <%=dtos.get(i).getPdname() %><p>
      </div>
   <%}%>
</body>
</html>