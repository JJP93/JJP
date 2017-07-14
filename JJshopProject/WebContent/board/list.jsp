<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, board.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- list.jsp -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width initial-scale=1">
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
	<jsp:include page="/menu.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<b class="navbar-brand" style="text-align: center;">글 목 록</b>
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<tr>
					<%
          if(userID != null){
         %>

					<td align="right" colspan="7"><a href="write_form.board"
						class="btn btn-primary pull-right">글쓰기</a></td>
				</tr>
				<%} %>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">번호</th>
					<th style="background-color: #eeeeee; text-align: center;">제목</th>
					<th style="background-color: #eeeeee; text-align: center;">작성자</th>
					<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					<th style="background-color: #eeeeee; text-align: center;">조회</th>
					<th style="background-color: #eeeeee; text-align: center;">IP</th>
					<th style="background-color: #eeeeee; text-align: center;">파일</th>
				</tr>
				
				<%			List<BoardDBBean> boardList = (List)request.getAttribute("boardList"); 
				if (boardList == null || boardList.size() == 0){%>
				<tr>
					<td colspan="7">게시된 글이 없습니다.</td>
				</tr>
				<%			}else { 
					for(BoardDBBean dto : boardList){%>
				<tr>
					<td><%=dto.getNum()%></td>
					<td>
						<%					if (dto.getRe_level()>0){ %> <img src="level.gif"
						width="<%=dto.getRe_level()*10%>"> <img src="re.gif">
						<%					} %> <a href="content.board?num=<%=dto.getNum()%>"> <%=dto.getSubject()%>
					</a> <%					if (dto.getReadcount()>10){ %> <img src="hot.gif"> <%					} %>
					</td>
					<td><%=dto.getWriter()%></td>
					<td><%=dto.getReg_date()%></td>
					<td><%=dto.getReadcount()%></td>
					<td><%=dto.getIp()%></td>
					<td>
						<%					if (dto.getFilesize()>0){ %> <img src="folder.gif"> <%					}else { %>
						<img src="level.gif"> <%					} %>
					</td>
				</tr>
				<%				}
				} %>
			</table>
		</div>





		<div align="center">
		
		
		<c:if test="${pageMaker.prev }">
		<a href="board.app?pageNum=${pageMaker.startPage-1 }">&laquo;</a>
		</c:if>
			
		
		
<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">	
		
		<c:if test="${pageMaker.cri.page == idx }" >
		<a href="board.app?pageNum=${idx }&perPageNum=10">[${idx }]
			</a>
</c:if>
<c:if test="${pageMaker.cri.page != idx }" >
			<a href="board.app?pageNum=${idx }&perPageNum=10">${idx }</a>
			</c:if>
			</c:forEach>
		
				<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
			<a href="board.app?pageNum=${pageMaker.endPage+1 }&perPageNum=10">&raquo;</a>
	</c:if>
		</div>
	</div>
	<center>
	
		<footer>
			<jsp:include page="/Bottom.jsp"></jsp:include>
		</footer>
	</center>
</body>
</html>









