<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.*,order.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP �Խ��� �� ����Ʈ</title>
</head>
<body>
	<%
	
   String userID = null;
if(session.getAttribute("userID") != null){
   userID = (String)session.getAttribute("userID");
}

%>
<jsp:include page="/menu.jsp"></jsp:include>
		<div class="container">
			 <div class="row">
			<b class="navbar-brand" style="text-align: center;">�ֹ� ���</b>
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tr >
					<%
          if(userID != null){
         %>
         
					<td align="right"colspan="7"><a href="write_form.board"class="btn btn-primary pull-right">�۾���</a></td>
				</tr>
				<%} %>
				<tr >
					<th style="background-color: #eeeeee; text-align: center;">��ȣ</th>
					<th style="background-color: #eeeeee; text-align: center;">�ֹ���ȣ</th>
					<th style="background-color: #eeeeee; text-align: center;">��ǰ��</th>
					<th style="background-color: #eeeeee; text-align: center;">��ǰ����</th>
					<th style="background-color: #eeeeee; text-align: center;">������</th>
					<th style="background-color: #eeeeee; text-align: center;">����</th>
					<th style="background-color: #eeeeee; text-align: center;">��</th>
					<th style="background-color: #eeeeee; text-align: center;">�ֹ���</th>
					<th style="background-color: #eeeeee; text-align: center;">��¥</th>					
				 	<th style="background-color: #eeeeee; text-align: center;">�ּ�</th>
				</tr>
<%			ArrayList<OrderDTO>getAllORList = (ArrayList<OrderDTO>)request.getAttribute("list"); 
				if (getAllORList == null || getAllORList.size() == 0){%>
				<tr>
					<td colspan="7">
						�ֹ��Ͻ� ��ǰ�� �����ϴ�.
					</td>
				</tr>								
<%			}else { 
					for(OrderDTO dto : getAllORList){%>
				<tr>
					<td><%=dto.getOrnum()%></td>
					<td><%=dto.getPdnum()%></td>
					<td><%=dto.getOrname()%></td>
					<td><%=dto.getOrprice()%></td>
					<td><%=dto.getOrsize()%></td>
					<td><%=dto.getOrcnt()%></td>
					<td><%=dto.getOrcolor()%></td>
					<td><%=dto.getOruser()%></td>
					<td><%=dto.getOrdate()%></td>
					<td><%=dto.getOraddr()%></td>				
					<%} %>
			<%} %>		
			</table>
			</div>
		</div>
	</body>
</html>