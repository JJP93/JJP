<%@page import="java.util.ArrayList"%>
<%@page import="movie.MovieInfoDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
영화 목록 페이지
<% ArrayList<MovieInfoDto> a = (ArrayList<MovieInfoDto>)request.getAttribute("mvlist"); 


%>


<% 
System.out.println(a.size());
for(int j=0; j < a.size(); j++){ %>
<%=a.get(j).getMvNum() %><br>


<%} %>



</body>
</html>