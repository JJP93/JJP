<%@page import="java.util.ArrayList"%>
<%@page import="movie.MovieInfoDao"%>
<%@page import="movie.MovieInfoDto"%>
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
<style type="text/css">
#STATICMENU {
	margin: 10pt;
	padding: 0pt;
	position: absolute;
	right: 0px;
	top: 0px;;
}

</style>
<title>J&J Main</title>
</head>

<body onload="InitializeStaticMenu();" style="background-color:#F6D8CE;">
	<jsp:include page="/menu2.jsp"></jsp:include>
	
	<div class="container">
		<div id="myCarousel" class="carousel" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="images/mv1.jpg" style="height: 300px; width: 1500px;">
				</div>
				<div class="item">
					<img src="images/mv2.jpg" style="height: 300px; width: 1500px;">
				</div>
				<div class="item ">
					<img src="images/mv3.jpg" style="height: 300px; width: 1500px;">
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
	
	<div class="container" style="padding-top: 100px;">
		<% MovieInfoDto dto = new MovieInfoDto();
      MovieInfoDao dao = new MovieInfoDao();
      
      
      ArrayList<MovieInfoDto> dtos;
      dtos = dao.getmoveListAll();
      
      for(int i =0; i<3; i++){
   %>
   	<div align="center" style="float: left; width: 33%;">
			&nbsp;<span><a
				href="movieMain.app?mvnum=<%=dtos.get(i).getMvNum()%>"><img
					src="images/<%=dtos.get(i).getMvImg() %>"
					style="height: 300px; width: 300px;"></a><br></span> &nbsp;<b>영화제목:<%=dtos.get(i).getMvName() %></b>
			<p>
				<br>
				<b>장르:<%=dtos.get(i).getMvG()%></b><br>
				<b>감독:<%=dtos.get(i).getMvDir() %></b><br>
				<b>주연:<%=dtos.get(i).getMvAc() %></b><br>
			</p>
		</div>
   
	<%} %>
	</div>
	
	
	
	<footer>
	<jsp:include page="/Bottom.jsp"></jsp:include>
	</footer>		
</body>	
</html>