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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세페이지</title>
<style>
#panel {
	text-align: center;
	background-color: #FBF8EF;
	border: solid 1px #c3c3c3;
}

#panel {
	padding-top:50px;
	padding-bottom:300px;
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
<script>

function change1(obj){
    obj.style.background = '#08298A';
    obj.style.color = 'white';
}



var registerRequset = new XMLHttpRequest();
$(document).ready(function(){
	var cnt = 1;
	$("#count").keyup(function(){
		 cnt =  document.getElementById("count").value;
		
		 $("#mvprice").val(cnt*10000);
	});
	
	var hap = "";

	for(var i =0; i<4;i++){
		for(var j=0; j<5; j++){
			
			$("#btn"+i+j).click(function(){
				
				var str = $(this).val();
					if(str == 'x'){
						alert("이미 예약된 자리입니다.");
					}else if(str != "x"){
						$("#btn"+i+j).css("background","red");
						if(cnt>0){
							change1(this);
							hap += str;
							
							$("#view").text(hap);
							$("#seat").val($("#view").text());
							cnt--;
							
							
							
						}
						else if(cnt <= 0){
							alert("인원수초과");
							
						}
						
						
					}
				
					
				});
			
		}
		
	}

$("#init").click(function(){
		

		location.href="/JJshopProject/mvReserve/InitCommander";
	});
	
	$("#cancle").click(function(){
		

		var seatValue = document.getElementById("seat");
		seatValue.value = "";
		$("#view").text("");
		hap="";
	});
	
	


$("#add").click(function add(){
	alert('실행 확인');
	
	registerRequset.open("Post", "/JJshopProject/mvReserve/ReserveCommander?seat="+encodeURIComponent(document.getElementById("seat").value)+
			"&mvarea="+encodeURIComponent(document.getElementById("mvarea").value)+
			"&mvname="+encodeURIComponent(document.getElementById("mvname").value)+
			"&mvtime="+encodeURIComponent(document.getElementById("mvtime").value)+
			"&mvdate="+encodeURIComponent(document.getElementById("mvdate").value)+
			"&mvprice="+encodeURIComponent(document.getElementById("mvprice").value),true);
	registerRequset.onreadystatechange = registerProcess;
	registerRequset.send(null);
});

function registerProcess(){
	if(registerRequset.readyState == 4 && registerRequset.status == 200){
		var result = registerRequset.responseText;
		alert(registerRequset.responseText);
		if(result !=1){
			alert("등록 실패");
		}else{
			var seatValue = document.getElementById("seat");
			seatValue.value = "";
			
			hap="";
			$("#view").text(hap);
			
	
		}
	}
	
}

});	
	

</script>


</head>
<body>
	<%

		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
	<script>
		function order() {
			var id =
	<%=userID%>
		;
			if (id == null) {

				alert("예매를 하시려면 로그인 먼저 해주세요.");
				location.href = "loginForm.member";
			}
			if (id != null) {
			}
		}
	</script>
	<%
		MemberDto mdto = new MemberDto();
		MemberDao mdao = new MemberDao();
		mdto = mdao.memberInfo(userID);
	%>
	<%
		SeatDAO dao = new SeatDAO();
		ArrayList<SeatDTO> a = dao.listSeat();
	%>
	<%
		MovieInfoDto dto = (MovieInfoDto) request.getAttribute("mv");
	%>
	<jsp:include page="/menu2.jsp"></jsp:include>

	<div id="panel" >
		<div align="center" style="float: left; width: 44%;" >
		<table>
		<tr align="center">
						<td colspan="6" style="background-color: gray; color: white"><b>SCREEN</b></td>
					</tr>
					<tr align="center">
						<td></td>
						<%
							int k = 0;
							for (int j = 0; j < 5; j++) {
						%>
						<td><%=j + 1%></td>
						<%
							}
						%>
					</tr>
					<%
						int[][] seat = new int[4][5];
						String c = null;
						for (int i = 0; i < 4; i++) {
					%>
					<tr align="center">
						<td style="padding-right: 10px;">
							<%
								if (i == 0) {
										c = "A";
									} else if (i == 1) {
										c = "B";
									} else if (i == 2) {
										c = "C";
									} else if (i == 3) {
										c = "D";
									} else if (i == 4) {
										c = "E";
									}
							%> <%=c%></td>

						<%
							for (int j = 0; j < 5; j++) {
						%>
						<%
							if (a.get(k).getCk() == 1) {
						%>
						<td style="padding-right: 10px; padding-bottom: 10px;"><input
							id="btn<%=i%><%=j%>" type="button" value="x"
							class="btn btn-primary" style="background: red"></td>
						<%
							}
						%>
						<%
							if (a.get(k).getCk() == 0) {
						%>
						
						<td style="padding-right: 10px; padding-bottom: 10px;"><input
							id="btn<%=i%><%=j%>" type="button" value="<%=c%><%=j + 1%>"
							class="btn btn-primary"></td>
							
							
						<%
							}
						%>

						<%
							k += 1;
								}
						%>
					</tr>

					<%
						}
					%>
			</table>
			</div>
			
			<div style="float: left; width: 12%;">
<table>
<tr><td><button class="btn btn-primary" style="background: red" disabled="disabled" ></button> 예약 불가</td></tr>
<tr><td><button class="btn btn-primary" style="background: #08298A" disabled="disabled"></button> 선택 좌석</td></tr>
<tr><td><button class="btn btn-primary"  disabled="disabled"></button> 예약 가능</td></tr>
</table>
</div>
			
			
			<br>
			<div align="center" style="float: left; width: 44%;">
				<table  >
					<tr>
				<td style="padding-right: 10px;">상영지역</td>
				<td><input type="text" id="mvarea" name="mvarea" value="<%=dto.getMvArea() %>" readonly></td>
			</tr>
			<tr>	
				<td style="padding-right: 10px;">예매영화</td>
				<td><input type="text" id="mvname" name="mvname" value="<%=dto.getMvName() %>" readonly></td>
			</tr>
			<tr>
				<td style="padding-right: 10px;">상영시간</td>
				<td><input type="text" id="mvtime" name="mvtime" value="<%=dto.getMvTime() %>" readonly></td>
			</tr>
			<tr>
				<td style="padding-right: 10px;">상영날짜</td>
				<td><input type="text" id="mvdate" name="mvdate" value="<%=dto.getMvDate() %>" readonly></td>
			</tr>
			<tr>
				<td style="padding-right: 10px;">인원수</td>
				<td><input type="text" name="count" id="count" placeholder="인원수를 선택해주세요"></td>
				</tr>
				
				<tr>
				<td style="padding-right: 10px;">좌석</td>
				<td><input type="text" name="seat" id="seat"></td>
				</tr>	
							
				<tr>
				<td style="padding-right: 10px;">총가격</td>
				<td><input type="text" id="mvprice" name="mvprice" value="영화가격" readonly></td>
			</tr>	
				</table><br>
				<p id="view">선택하신 자리가 없습니다.</p>

				<button id="add" class="btn btn-primary" style="padding-left: 10px;" >예약하기</button>
				<button id="cancle" class="btn btn-primary">다시 선택</button>
				<button id="init" class="btn btn-primary">초기화</button>
				</div>
			<br>
			
				
			
			</div>


	

	<div class="container">

		<form action="#" method="post" name="#">
			<table width="1000">
				<tr height="100">
					<td align="center" colspan="3"><font size="6" color="gray"><%=dto.getMvName()%></font>
				</tr>
				<tr>
					<td rowspan="4" width="1000" align="center"><img
						src="images/<%=dto.getMvImg()%>" width="350"><br>
					<td width="150" align="center"><b>영화명:</b></td>
					<td width="1000" align="center"><b><%=dto.getMvName()%></b></td>

				</tr>
				<tr>
					<td width="150" align="center"><b>감독:</b></td>
					<td width="1000" align="center"><b><%=dto.getMvDir()%></b></td>
				</tr>
				<tr>
					<td width="150" align="center"><b>주연:</b></td>
					<td align="center"><b><%=dto.getMvAc()%></b></td>
				</tr>
				<tr>
					<td width="150" align="center"><b></b></td>
					<td align="center"><b></b></td>
				</tr>
				<tr>
					<td width="150" align="center"><b></b></td>
					<td width="1000" align="center"><b></b></td>
				</tr>
			</table>
			<div style="padding-top: 30px;" align="center">
				<input type="button" value="메인으로" class="btn btn-primary"
					onclick="location.href='mvindex.jsp'"> <input type="button"
					value="즉시예매하기" class="btn btn-primary" id="btn">
				<hr size="3">

			</div>
		</form>
	</div>

	<footer>
		<jsp:include page="/Bottom.jsp"></jsp:include>
	</footer>

</body>
</html>