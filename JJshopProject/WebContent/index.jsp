<%@page import="java.util.ArrayList"%>
<%@page import="shop.ShopDAO"%>
<%@page import="shop.ShopDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<script type="text/javascript">
 var stmnLEFT = 10; // 오른쪽 여백 
 var stmnGAP1 = 0; // 위쪽 여백 
 var stmnGAP2 = 150; // 스크롤시 브라우저 위쪽과 떨어지는 거리 
 var stmnBASE = 150; // 스크롤 시작위치 
 var stmnActivateSpeed = 35; //스크롤을 인식하는 딜레이 (숫자가 클수록 느리게 인식)
 var stmnScrollSpeed = 150; //스크롤 속도 (클수록 느림)
 var stmnTimer; 
 
 function RefreshStaticMenu() { 
  var stmnStartPoint, stmnEndPoint; 
  stmnStartPoint = parseInt(document.getElementById('STATICMENU').style.top, 10); 
  stmnEndPoint = Math.max(document.documentElement.scrollTop, document.body.scrollTop) + stmnGAP2; 
  if (stmnEndPoint < stmnGAP1) stmnEndPoint = stmnGAP1; 
  if (stmnStartPoint != stmnEndPoint) { 
   stmnScrollAmount = Math.ceil( Math.abs( stmnEndPoint - stmnStartPoint ) / 15 ); 
   document.getElementById('STATICMENU').style.top = parseInt(document.getElementById('STATICMENU').style.top, 10) + ( ( stmnEndPoint<stmnStartPoint ) ? -stmnScrollAmount : stmnScrollAmount ) + 'px'; 
   stmnRefreshTimer = stmnScrollSpeed; 
   }
  stmnTimer = setTimeout("RefreshStaticMenu();", stmnActivateSpeed); 
  } 
 
 function InitializeStaticMenu() {
  document.getElementById('STATICMENU').style.right = stmnLEFT + 'px';  //처음에 오른쪽에 위치. left로 바꿔도.
  document.getElementById('STATICMENU').style.top = document.body.scrollTop + stmnBASE + 'px'; 
  RefreshStaticMenu();
  }
</script>

<style type="text/css">
#STATICMENU {
	margin: 10pt;
	padding: 0pt;
	position: absolute;
	right: 0px;
	top: 0px;;
}
</style>

<title>J&J Shop</title>
</head>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
      $( document ).ready( function() {
        var jbOffset = $( '.jbMenu' ).offset();
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > jbOffset.top ) {
            $( '.jbMenu' ).addClass( 'jbFixed' );
          }
          else {
            $( '.jbMenu' ).removeClass( 'jbFixed' );
          }
        });
      } );
      
      function ini() {
		location.href = "cookieInit.shop"
	}
   
    </script>
<body onload="InitializeStaticMenu();">


	<jsp:include page="/menu.jsp"></jsp:include>
	<div id="STATICMENU">
		<table>
			<tr>
				<td align="center">
					<div style="cursor: pointer;" onclick="window.scrollTo(0,0);">
						<img src="images/top.jpg" width="80">

					</div>
				</td>
			</tr>
			<tr>
				<td><input type="button" value="임시 쿠키 삭제 버튼" onclick="ini()"></td>
			</tr>
			<tr>
				<td><img src="images/kk.gif" width="150"></td>
			</tr>
			<tr>
				<td><img src="images/ll.gif" width="150"></td>
			</tr>
			<% 
			
			Cookie [] ck = request.getCookies();
  	int z=150;

  	
  	 out.println("<tr>");
	   out.println("<td align='center"+"'>");
	   out.println("<b>");
	   out.println("최근본상품");
	   out.println("</b >");
	   out.println("</td>");
	   out.println("</tr>");
   
	   if(ck != null){
		   int ii=0;
		   String url = "";
		   String imageName = "";
   for(Cookie c: ck){
	 
	   if(c.getName().indexOf("pdcook") != -1){
		   String cookieValue = java.net.URLDecoder.decode(c.getValue(),"UTF-8");
		   
		    ii =  cookieValue.indexOf("!");
		    url = cookieValue.substring(cookieValue.indexOf("!")+1);
		    imageName = cookieValue.substring(0, ii);
		   
		   out.println("<tr>");
		   out.println("<td >");
		   out.println("<a href ="+url+">");
	   out.println("<img src=\"images/"+imageName+"\" width=\""+z+"\">");
	   out.println("</a>");
	   out.println("</td>");
	   out.println("</tr>");
	   }
   }
   }else if(ck==null) {
	   out.println("<br><tr>");
	   out.println("<td>");
	   out.println("최근 본 항목이 없습니다.");
	   out.println("</td>");
	   out.println("</tr>");
   }
   
	 
	   
   
   %>

		</table>
	</div>
	<div class="container">
		<div id="myCarousel" class="carousel" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="images/1.png" style="height: 300px; width: 1500px;">
				</div>
				<div class="item">
					<img src="images/2.png" style="height: 300px; width: 1500px;">
				</div>
				<div class="item ">
					<img src="images/3.png" style="height: 300px; width: 1500px;">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>

	<br>


	<div class="container">
		<% ShopDTO dto = new ShopDTO();
      ShopDAO dao = new ShopDAO();
      
      
      ArrayList<ShopDTO> dtos;
      dtos = dao.getAllPDList1();
      
      for(int i =0; i<9; i++){
   %>
		<div align="center" style="float: left; width: 33%;">
			&nbsp;<span><a
				href="shopMain.app?pdnum=<%=dtos.get(i).getPdnum()%>"><img
					src="images/<%=dtos.get(i).getImg() %>"
					style="height: 300px; width: 300px;"></a><br></span> &nbsp; <b><%=dtos.get(i).getPdname() %></b>
			<p>
				<br>
				<%if (dtos.get(i).getPdnum()%2==0){ %>
				<img src="hot.gif">
				<%	} %>
				<b><%=dtos.get(i).getPrice() %>원</b>
		</div>
		<%}%>
		</div>
	
	
		<jsp:include page="/Bottom.jsp"></jsp:include>
	
</body>
	
</html>