<%@page import="mvSeat.SeatDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mvSeat.SeatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
var registerRequset = new XMLHttpRequest();
$(document).ready(function(){
	var hap = "";
	
	for(var i =0; i<4;i++){
		for(var j=0; j<5; j++){
			
			$("#btn"+i+j).click(function(){
				var str = $(this).val();
					if(str == 'x'){
						alert("이미 예약된 자리입니다.");
					}else if(str != "x"){
						hap += str+"|";
						
						$("#view").text(hap);
						$("#seat").val($("#view").text());
						
					}
				
					
				});
			
		}
		
	}

	
	
	$("#cancle").click(function(){
		

		var seatValue = document.getElementById("seat");
		seatValue.value = "";
		$("#view").text("");
		hap="";
	});
	
	


$("#add").click(function add(){
	alert('실행 확인');
	
	registerRequset.open("Post", "./ReserveCommander?seat="+encodeURIComponent(document.getElementById("seat").value)+
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
<title>Insert title here</title>
</head>
<body>
<div class="container">
<%SeatDAO dao = new SeatDAO();
ArrayList<SeatDTO> a = dao.listSeat();


%>








<table align="center" cellpadding="10px" >
<tr><td><input type="text" id="mvarea" name="mvarea" value="인천"></td>
<td><input type="text" id="mvname" name="mvname" value="영화이름"></td>
<td><input type="text" id="mvtime" name="mvtime" value="영화시간"></td>
<td><input type="text" id="mvdate" name="mvdate" value="영화날짜"></td>
<td><input type="text" id="mvprice" name="mvprice" value="영화가격"></td>

</tr>
<tr align="center"><td colspan="5">SCREEN</td></tr>
<tr align="center"><td></td>
<% 
int k = 0;
for(int j =0; j < 5; j++){ %>
<td><%=j+1 %></td>
<%} %>
</tr>
<%
int[][] seat = new int[4][5];
String c = null;
for(int i =0; i < 4; i++){ %>
<tr align="center"><td >
<%if(i==0){
	 c = "A";
}else if(i==1){
	c = "B";
}else if(i==2){
	c = "C";
}else if(i==3){
	c = "D";
}else if(i==4){
	c = "E";
} %>
<%=c %></td>

	<% for(int j =0; j < 5; j++){
		
		%>



<%

if(a.get(k).getCk() == 1){ %>
<td>

<input  id = "btn<%=i %><%=j %>" type="button"  value="x"  class="btn btn-primary" > 
</td>
<% }%>
<% if(a.get(k).getCk() == 0){ %>
<td>
<input  id = "btn<%=i %><%=j %>" type="button"  value="<%=c %><%=j+1 %>"  class="btn btn-primary" > 
</td>
<% }%>

<%  k += 1; } %>
</tr>
<br>
<%} %>
</table>

<p id = "view" >선택하신 자리가 없습니다.</p>
<input type="text" name = "seat" id="seat"> 

<button id = "add" >예약하기</button>
<button id = "cancle">다시 선택</button>
</div>
</body>
</html>