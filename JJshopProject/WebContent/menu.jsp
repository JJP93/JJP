<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
	<meta charset="utf-8">
    <style>
      body {
        margin: 0px;
        padding: 0px;
      }
      .jbTitle {
        text-align: center;
      }
      .jbMenu {
        text-align: center;
        padding: 0px 0px;
        width: 100%;
      }
      .jbContent {
        height: 2000px;
      }
      .jbFixed {
        position: fixed;
        top: 0px;
      }
    </style>
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script>
      $( document ).ready( function() {
        var jbOffset = $( '.jbMenu' ).offset();
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > jbOffset.top ) {
            $( '.jbMenu' ).addClass( 'jbFixed' );
          }
          else {
            $( '.jbMenu' ).removeClass( 'jbFixed' );
          }
        });
      } );
    </script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>Insert title here</title>
</head>
<body>
	<%String contextpath = request.getContextPath(); %>
	<%
	
   String userID = null;
if(session.getAttribute("userID") != null){
   userID = (String)session.getAttribute("userID");
}

%>
<!-- 비로그인모드 -->
	<%
          if(userID == null){
         %>

<div class="jbMenu">
	<nav class="navbar navbar-default">

	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expended="false">
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="index.jsp">J&J Shop</a>
	</div>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li class="active"><a href="index.jsp">메인</a></li>
			<li><a href="board.app">게시판</a></li>
			
			<ul class="nav navbar-nav ">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">SHOP<span class="caret"></span></a>
					<ul class="dropdown-menu">
					<li><a href="shop.shop">전체보기</a></li>
						<li><a href="hat.shop">모자</a></li>
						<li><a href="top.shop">상의</a></li>
						<li><a href="pants.shop">바지</a></li>
						<li><a href="shoes.shop">신발</a></li>
						<li><a href="acc.shop">악세사리</a></li>
						
					</ul></li>
			</ul>


		</ul>

		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">접속하기<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="loginForm.app">로그인</a></li>
					<li><a href="joinForm.app">회원가입</a></li>
				</ul></li>
		</ul>

		<%}%>
		</div>
<!-- 일반사용자모드 -->
		<%
          if(userID != null){
 if(!userID.equals("admin")){
        		  
        	  
         %>

	<div class="jbMenu">
		<nav class="navbar navbar-default">

		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expended="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">J&J Shop</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="index.jsp">메인</a></li>
				<li><a href="board.app">게시판</a></li>
					<ul class="nav navbar-nav ">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">SHOP<span class="caret"></span></a>
					<ul class="dropdown-menu">
					<li><a href="shop.shop">전체보기</a></li>
						<li><a href="hat.shop">모자</a></li>
						<li><a href="top.shop">상의</a></li>
						<li><a href="pants.shop">바지</a></li>
						<li><a href="shoes.shop">신발</a></li>
						<li><a href="acc.shop">악세사리</a></li>
						
					</ul></li>
			</ul>
				

			</ul>



			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.app">로그아웃</a></li>
						<li><a href="mypage.member?id=<%=userID%>">마이페이지</a></li>
					</ul></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li><a href="mypage.member?id=<%=userID%>"><%=userID %> 님
						접속중</a></li>
			</ul>
			</div>
		<!-- 관리자모드 -->
<%}else if(userID.equals("admin")){ %>
	<div class="jbMenu">
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expended="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">J&J Shop</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="index.jsp">메인</a></li>
				<li><a href="board.app">게시판</a></li>
				<li><a href="memberManagement.app">회원관리</a></li>
				
				<ul class="nav navbar-nav ">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">SHOP<span class="caret"></span></a>
					<ul class="dropdown-menu">
					<li><a href="shop.shop">전체보기</a></li>
						<li><a href="hat.shop">모자</a></li>
						<li><a href="top.shop">상의</a></li>
						<li><a href="pants.shop">바지</a></li>
						<li><a href="shoes.shop">신발</a></li>
						<li><a href="acc.shop">악세사리</a></li>
						
					</ul></li>
			</ul>
				<li><a href="pdJoinView.app">상품 등록</a></li>
					<li><a href="orderManagement.app">주문관리</a></li>
			</ul>



			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.app">로그아웃</a></li>
						<li><a href="mypage.member?id=<%=userID%>">마이페이지</a></li>
					</ul></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li><a href="mypage.member?id=<%=userID%>"><%=userID %> (관리자) 님
						접속중</a></li>
			</ul>
			<%}} %>
		</div>
		</nav>
</div>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="js/bootstrap.js"></script>
</body>
</html>