<%@page import="movie.MovieInfoDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>영화 등록 페이지</title>
</head>
<body>
<%String contextpath = request.getContextPath(); %>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
function aa(){
	function getFileExtension(filePath){  // 파일의 확장자를 가져옮
	    var lastIndex = -1;
	    lastIndex  = filePath.lastIndexOf('.');
	    var extension = "";

	 if(lastIndex != -1){
	  extension = filePath.substring( lastIndex+1, filePath.len );
	 }else{
	  extension = "";
	 }
	    return extension;
	}
	var imgName = document.reg_frm.imgFile.value;
	var imgType = getFileExtension(imgName);
	var ary = imgName.split('\\');
	var nn = ary[ary.length-1].split('.')[0]+"."+imgType;
	document.getElementById("mvImg").innerText =  ary[ary.length-1].split('.')[0]+"."+imgType;
	$("#mvImg").text(nn);
	

	document.reg_frm.myImg.src = imgName
	document.reg_frm.myImg.style.visibility = 'visible';
	
}

function addMovie(){
	
	document.reg_frm.submit();
}

</script>
<jsp:include page="/menu2.jsp"></jsp:include>

	&nbsp; &nbsp;


	<div class="container">

		<div class="center-block" style="width: 600px; padding: 15px;">
			<div class="jumbotron"
				style="padding-top: 20px; width: 500px; left: auto;">
				<form method="post" action="<%=contextpath %>/addMovie.movie"
					name="reg_frm">
					<h3 style="text-align: center;">영화 등록</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="영화 이름 "
							name="mvName" maxlength="20" style="ime-mode: active;"
							style="width: 100px;">
					</div>

					<div class="form-group">
						<input type="text" class="form-control" placeholder="상영 지역 "
							name="mvArea" maxlength="20" style="ime-mode: active;"
							style="width: 100px;">
					</div>
					
					<div class="form-group">
						<input type="text" class="form-control" placeholder="상영 시간 "
							name="mvTime" maxlength="20" style="ime-mode: active;"
							style="width: 100px;">
					</div>
					
					<div class="form-group">
						<input type="text" class="form-control" placeholder="감독"
							name="mvDir" maxlength="20" style="ime-mode: active;"
							style="width: 100px;">
					</div>
					
					<div class="form-group">
						<input type="text" class="form-control" placeholder="장르 "
							name="mvG" maxlength="20" style="ime-mode: active;"
							style="width: 100px;">
					</div>
					
					<div class="form-group">
						<input type="text" class="form-control" placeholder="배우"
							name="mvAc" maxlength="20" style="ime-mode: active;"
							style="width: 100px;">
					</div>
					
					<div class="form-group">
						이미지 <input type="file" id="imgFile" onchange="aa()"
							class="form-control" placeholder="이미지 " name="countpd"
							maxlength="20">
					</div>
					
					
					
					<div class="form-group">
						<input type="text" class="form-control" 
							name="mvImg" id = "mvImg" maxlength="20" style="ime-mode: active;"
							style="width: 100px;">
					</div>
					
					이미지 파일 미리보기 : <IMG id="myImg"  alt='미리보기 이미지..~!!' Style='VISIBILITY: hidden'> <br><br>
					
					<div class="form-group">
						<input type="text" class="form-control" placeholder="상영 날짜 "
							name="mvDate" maxlength="20" style="ime-mode: active;"
							style="width: 100px;">
					</div>
					
					<div class="form-group">
						<input type="text" class="form-control" placeholder="좌석 수 "
							name="mvSeat" maxlength="20" style="ime-mode: active;"
							style="width: 100px;">
					</div>
					
					

					<input type="button" class="btn btn-primary form-control"
						value="영화등록" onclick="addMovie()">

				</form>
			</div>
			<div class="col-lg-4"></div>
		</div>

	</div>

			<jsp:include page="/Bottom.jsp"></jsp:include>
	


</body>
</html>