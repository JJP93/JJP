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

<body onload="InitializeStaticMenu();">
	<div class="container">
	<h1 align="center">J&J Main</h1>
	<div align="center" style="float: left; width:50% ">
		&nbsp;
		<a href="index.jsp"><img src="images/shop1.jpg" style="height: 300px; width: 300px;">
		<br><h1>쇼핑몰</h1></a>	
	</div>
	<div align="center" style="float: left; width:50% ">
		&nbsp;
		<a href="mvindex.jsp"><img src="images/movie.jpg" style="height: 300px; width: 300px;">
		<br><h1>영화관</h1></a>	
	</div>
	</div>	
	<footer>
	<jsp:include page="/Bottom.jsp"></jsp:include>
	</footer>		
</body>
	
</html>