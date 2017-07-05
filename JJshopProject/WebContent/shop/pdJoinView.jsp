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
</form>

</body>
</html>