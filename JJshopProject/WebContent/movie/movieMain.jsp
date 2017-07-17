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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세페이지</title>
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
<% 

MovieInfoDto dto = (MovieInfoDto)request.getAttribute("mv");

%>
<center>
<form action="#" method="post" name = "#">
<table width="1000">
<tr height="100">
<td align="center" colspan="3">
<font size="6" color="gray"><%=dto.getMvName() %></font>
</tr>
<tr>
	<td rowspan="8" width="1000" align="center">
	<img src="images/<%=dto.getMvImg() %>" width= "350"><br>
	<td width="350" align="center"><b>영화명</b></td>	
	<td width="1000" align="center"><%=dto.getMvName() %>
	</td>
	</tr>
	<tr>
	<td width="1000" align="center"><b>감독:</b></td>
	<td width="1000" align="center"><b><%=dto.getMvDir() %></b></td>
</tr>


	
<tr>
	
	<td width="1000" align="center"><b></b></td>
		<td width="1000" align="center"></td>
</tr>
<tr>
	<td width="1000" align="center"><b></b></td>
		<td width="1000" align="center"><b></b></td>
</tr>
<tr>
<td width="1000" align="center" >
<input type="button"class="btn btn-primary pull-right" value="메인으로" onclick="location.href='mvindex.jsp'"></td>
<td width="1000" align="center" >
<input type="button"class="btn btn-primary pull-right" value="예매하기" onclick="#"></td>
</tr>
</table>
</form>
<footer>
	<jsp:include page="/Bottom.jsp"></jsp:include>
</footer>
</center>

</body>
</html>