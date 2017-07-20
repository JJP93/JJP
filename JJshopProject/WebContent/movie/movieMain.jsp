<%@page import="java.util.ArrayList"%>
<%@page import="mvSeat.SeatDAO"%>
<%@page import="mvSeat.SeatDTO"%>
<%@page import="movie.MovieInfoDto"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="MemberDao.MemberDao"%>
<%@page import="memberDto.MemberDto"%>
<%@page import="movie.MovieInfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세페이지</title>
  <style> 
#panel {
    text-align: center;
    background-color: #FBF8EF;
    border: solid 1px #c3c3c3;
}

#panel {
    padding:200px;
    display: none;
}
</style>

<script> 
$(document).ready(function(){
    $("#btn").click(function(){
        $("#panel").toggle("slide");
    });
});
</script>

</head>
<body>
<%
String userID = null;
if(session.getAttribute("userID") != null){
  userID = (String)session.getAttribute("userID");
}
%>
<script>
function order(){	
var id = <%=userID%>;
if(id==null){
	 
	 alert("예매를 하시려면 로그인 먼저 해주세요.");
		location.href = "loginForm.member";
}
if(id!=null){		
}
}
</script>	
	<%
MemberDto mdto = new MemberDto();
MemberDao mdao = new MemberDao();
mdto = mdao.memberInfo(userID);

%>
<jsp:include page="/menu2.jsp"></jsp:include>

<div id="panel">

<%@ include file="/movie/test.jsp" %>


</div>		

<% 

MovieInfoDto dto = (MovieInfoDto)request.getAttribute("mv");

%>

<div class="container">

<form action="#" method="post" name = "#">
<table width="1000">
<tr height="100">
<td align="center" colspan="3">
<font size="6" color="gray"><%=dto.getMvName() %></font>
</tr>
<tr>
	<td rowspan="4" width="1000" align="center">
	<img src="images/<%=dto.getMvImg() %>" width= "350"><br>
	<td width="150" align="center"><b>영화명:</b></td>	
	<td width="1000" align="center"><b><%=dto.getMvName() %></b></td>
	
	</tr>
	<tr>
	<td width="150" align="center"><b>감독:</b></td>
	<td width="1000" align="center"><b><%=dto.getMvDir() %></b></td>
</tr>	
<tr>	
	<td width="150" align="center"><b>주연:</b></td>
	<td align="center"><b><%=dto.getMvAc() %></b></td>
</tr>
<tr>
	<td width="150" align="center"><b></b></td>
	<td  align="center"><b></b></td>
</tr>
<tr>
	<td width="150" align="center"><b></b></td>
	<td width="1000" align="center"><b></b></td>
</tr>
</table>
<div style="padding-top: 30px;" align ="center">
<input type="button" value="메인으로" class="btn btn-primary"onclick="location.href='mvindex.jsp'">

<input type="button" value="즉시예매하기" class="btn btn-primary" id="btn">
<hr size="3">

</div>
</form>
</div>

<footer>
	<jsp:include page="/Bottom.jsp"></jsp:include>
</footer>

</body>
</html>