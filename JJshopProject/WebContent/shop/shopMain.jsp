<%@page import="shop.ShopDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% ShopDTO dto = (ShopDTO)request.getAttribute("pd"); %>
샵 메인페이지<br>
상품 코드 :<%= dto.getPdnum() %><br>
상품 이름 :<%= dto.getPdname() %><br>
상품 수량 :<%= dto.getCountpd() %><br>
상품 카테고리 :<%= dto.getCategory() %><br>
상품 가격 :<%= dto.getPrice() %><br>
상품 이미지 :<img src="images/<%=dto.getImg() %>" style="height: 300px; width: 300px;"><br>
상품 설명 :<%= dto.getInfo() %><br>
상품 색상 :<%= dto.getColor() %><br>
상품 사이즈:<%= dto.getPdsize() %><br>
</body>
</html>