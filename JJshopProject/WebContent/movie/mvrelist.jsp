<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*,mvReserve.*"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
	
   String userID = null;
if(session.getAttribute("userID") != null){
   userID = (String)session.getAttribute("userID");
}


%>
	<jsp:include page="/menu2.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<b class="navbar-brand" style="text-align: center;">예약현황</b>
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">


				<tr>
					<th style="background-color: #eeeeee; text-align: center;">상영지역</th>
					<th style="background-color: #eeeeee; text-align: center;">상영날짜</th>
					<th style="background-color: #eeeeee; text-align: center;">영화시간</th>
					<th style="background-color: #eeeeee; text-align: center;">영화제목</th>
					<th style="background-color: #eeeeee; text-align: center;">좌석</th>
					<th style="background-color: #eeeeee; text-align: center;">가격</th>
					<th style="background-color: #eeeeee; text-align: center;">주문자</th>
				</tr>
				
				<%		
				MvReDAO dao = new MvReDAO();
				ArrayList<MvReDTO> a = dao.getMvrelist(userID); 
				int sum =0;
				int ssum=0;
				if (a == null || a.size() == 0){%>

				<tr>
					<td colspan="7">예약하신 영화가 없습니다.</td>
				</tr>
				<%			}else { 
					for(int i = 0; i<a.size(); i++){
					
					
					%>
				<tr>

					<td><%=a.get(i).getMvArea()%></td>
					<td><%=a.get(i).getMvdate()%></td>
					 <td><%=a.get(i).getMvTime()%></td>
					<td><%=a.get(i).getMvName()%></td>
					<td><%=a.get(i).getSeatID()%></td>
					<td><%=a.get(i).getMvprice()%>원</td>
					<td><%=a.get(i).getMvuser()%></td>
				</tr>

					<%} %>
					
					<%} %>
				<tr >
					<td colspan="7" align ="center"><input type="button" value="메인으로" class="btn btn-primary "onclick="window.location='mvindex.jsp'"></td>
				</tr>
			</table>	
		</div>
		
	</div>
 <footer> <jsp:include page="/Bottom.jsp"></jsp:include> </footer>

</body>
</html>