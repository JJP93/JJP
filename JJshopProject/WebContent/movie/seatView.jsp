<%@page import="java.util.Map"%>
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
<title>Insert title here</title>
<script>
$(document).ready(function(){
	var hap = "";
	for(var i =0; i<4;i++){
		for(var j=0; j<5; j++){
			
			$("#btn"+i+j).click(function(){
				var str = $(this).val();
					hap += str;
					
					$("#view").text(hap);
				});
			
		}
		
	}


});	
	

</script>
</head>
<body>


<table align="center"  >
<tr align="center"><td colspan="5">SCREEN</td></tr>
<tr align="center"><td></td>
<% for(int j =0; j < 5; j++){ %>
<td><%=j+1 %></td>
<%} %>
</tr>
<%
int[][] seat = new int[4][5];
for(int i =0; i < 4; i++){ %>
<tr align="center"><td ><%=i+1 %></td>

	<% for(int j =0; j < 5; j++){ %>
<td>
<input  id = "btn<%=i %><%=j %>" type="button" value="[<%=i %>,<%=j %>]" class="btn btn-primary">
</td>

<%} %>
</tr>
<br>
<%} %>
</table>
<ol>


</ol>
<p id = "view">선택하신 자리가 없습니다.</p>

</body>
</html>