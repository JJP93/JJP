<%@page import="shop.ShopDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 등록 폼</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

</head>
<body>


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
	var imgName = document.pdJoin.imgFile.value;
	var imgType = getFileExtension(imgName);
	var ary = imgName.split('\\');
	document.getElementById("img").innerText =  ary[ary.length-1].split('.')[0]+"."+imgType;
}

</script>

	<%String contextpath = request.getContextPath(); %>
	<%-- 
<form name ="pdJoin"action="<%= contextpath %>/pdJoin.app" method="post">

상품명: <input name="pdname" type="text"><br>
재고 : <input name="countpd" type="text"><br>
카테고리: <select name = "category">

<option value="1">모자</option>
<option value="2">상의</option>
<option value="3">바지</option>
<option value="4">신발</option>
<option value="5">악세사리</option>
</select><br>
가격: <input name="price" type="text"><br>
사진: <input id = "imgFile"  type="file" onchange="aa()" > <br>
등록되는 파일 명 : <input type="text" id = "img" name="img"><br>
설명: <input name="info" type="text"><br>
색상: <input name="color" type="text"><br>
사이즈: <input name="pdname" type="text"><br>

<input type="submit" value="상품 등록">
</form> --%>




	<jsp:include page="/menu.jsp"></jsp:include>

	&nbsp; &nbsp;


	<div class="container">

		<div class="center-block" style="width: 600px; padding: 15px;">
			<div class="jumbotron"
				style="padding-top: 20px; width: 500px; left: auto;">
				<form method="post" action="<%=contextpath %>/pdJoin.app"
					name="pdJoin">
					<h3 style="text-align: center;">상품 등록</h3>


					<div class="form-group">
						상품명 <input type="text" class="form-control" placeholder="상품명 "
							name="pdname" maxlength="20">
					</div>

					<div class="form-group">
					재고	<input type="text" class="form-control" placeholder="재고 "
							name="countpd" maxlength="20">
					</div>





					<div class="form-group">
						 <select name="category">

							<option value="1">모자</option>
							<option value="2">상의</option>
							<option value="3">바지</option>
							<option value="4">신발</option>
							<option value="5">악세사리</option>
						</select>
					</div>


					<div class="form-group">
						가격 <input type="text" class="form-control" placeholder="가격 "
							name="price" maxlength="20">
					</div>


					<div class="form-group">
						이미지 <input type="file" id="imgFile" onchange="aa()"
							class="form-control" placeholder="이미지 " name="countpd"
							maxlength="20">
					</div>

					<div class="form-group">
						<input type="text"   class="form-control"
							id="img" name="img" >
					</div>

					<div class="form-group">
						설명 <input type="text" class="form-control" placeholder="설명 "
							name="info" maxlength="20">
					</div>

					<div class="form-group">
						 색상 <input type="text" class="form-control" placeholder="색상 "
							name="color" maxlength="20">
					</div>

					<div class="form-group">
						사이즈 <input type="text" class="form-control" placeholder="사이즈 "
							name="size" maxlength="20">
					</div>


					<input type="submit" class="btn btn-primary form-control"
						value="상품 등록">

				</form>
			</div>
			<div class="col-lg-4"></div>
		</div>

	</div>
</body>
</html>