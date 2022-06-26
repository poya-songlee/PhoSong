<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../inculde/header.jsp"></jsp:include>
<link href="/css/list.css" type="text/css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
	
	
<script>

function getParameterByName(name) {
	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]"); var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	results = regex.exec(location.search); return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}

$(function(){
	
	
	search = {
	};
	

	
	
	$("#upload_Confirm").on("click", function(){
		alert("로그인 후 사용 가능합니다.");
	});
	
	$("#imgContainer").on("click","img", function(){
		var selectImg = this.name;
		selectImg = selectImg.substring(0, selectImg.length-4);
		location.href="./Loding/"+ selectImg;
		
	});
	$(".sb").on("click", function(){

		search.search = getParameterByName('search');
		search.format = $(".format").val();
		search.license =  $(".license").val();
		search.order = $(".order").val();
		search.size =  $(".size").val();
		
		$.ajax({
			type: "post",
			url: "./list",
			contentType : "application/json;charset=UTF-8",
			data: JSON.stringify(search),
			dataType : 'json',
			success: function(result){
				console.log(result);
				$("#imgContainer  *").remove();
				
				for(var i = 0; i < result.length; i++){
					var uuid = result[i].imageUuid;
					var img = document.createElement("img");
					img.setAttribute("src","/upload/"+result[i].imageUuid);
					img.setAttribute("name",uuid.substring(0, uuid.length-4));
					$("#imgContainer").append(img); 
				}

			},error: function(xhr){
			}
		});

	});
	
	
	

	
});
</script>
</head>
<body>
	<div class="wrap">
		<div class="header">
			<div class="logo">
				<a href=".."><img
					src="/images/logo.png"></a>
			</div>
			<div class="search">
				<form id="searchFrom" action="./">
					<button>
						<img
							src="/images/search.png">
					</button>
					<input type="search" name ="search" placeholder="한글 또는 영문으로 검색어를 입력해주세요">
					<select name="type">
						<option value="image" ${filter.type == 'image'? 'selected':''}>이미지</option>
						<option value="jpg" ${filter.type == 'jpg'? 'selected':''}>JPG</option>
						<option value="png" ${filter.type == 'png'? 'selected':''}>PNG</option>
					</select>
				</form>
			</div>
			<div class="nav">
				<ul>
					<c:if test="${sessionScope.user == null}">
						<li><a href="../login">Login</a></li>
						<li><a href="../signup">Signup</a></li>
					</c:if>
					<c:if test="${sessionScope.user != null}">
						<li><a href="../mypage/">MyPage</a></li>
						<li><a href="../logout">Logout</a></li>
					</c:if>
					<c:if test="${sessionScope.user == null}">
						<li><a><button type="button" id="upload_Confirm">Upload</button></a></li>
					</c:if>
					<c:if test="${sessionScope.user != null}">
						<li><a href="/image/fileUpload"><button type="button">Upload</button></a></li>
					</c:if>
				</ul>
			</div>
		</div>
		<!-- header END-->
		<div class="main">
			<div class="filter">
				<form id="searchFrom" action="./">
					<select name="format" class="format async">
						<option value="ALL" ${filter.type == 'image'? 'selected':''}>이미지</option>
						<option value="JPG" ${filter.type == 'jpg'? 'selected':''}>JPG</option>
						<option value="PNG" ${filter.type == 'png'? 'selected':''}>PNG</option>
					</select>
					<select name="license" class="license async">
						<option value="ALL" >전체</option>
						<option value="상업적용도 허용/출처 미표시">상업적 허용 / 출처미표시</option>
						<option value="상업적용도 금지/출처 미표시">상업적 불가 / 출처미표시</option>
						<option value="상업적용도 허용/출처 표시">상업적 허용 / 출처표시</option>
						<option value="상업적용도 금지/출처 표시">상업적 불가 / 출처표시</option>
					</select>
					<select name="order" class="order async">
						<option value="recent" ${filter.order == 'recent'? 'selected':''} >최신순</option>
						<option value="popular" ${filter.order == 'popular'? 'selected':''}>인기순</option>
					</select>
					<select name="size" class="size async">
						<option value="ALL" >전체</option>
						<option value="width">가로</option>
						<option value="height">세로</option>
					</select>
					<input  class="tagText" type="text">
					<select  class="tag">
						<option value="includ">태그 검색</option>
						<option value="except">태그 제외</option>
					</select>
					<button class = "sb" type="button" >적용</button>
					
				</form>
			</div>
			<div>
				<span>홈</span> <span>${image.size()}건 검색됨</span>
			</div>
			<div class="search_result">
				<c:if test="${image.size() < 1}">
					<span>검색된 결과가 없습니다.</span>
				</c:if>
				<div id="imgContainer">
				<c:forEach var="item" items="${image}">
					<img name="${item.imageUuid}" src="/upload/${item.imageUuid}">
				</c:forEach>
				</div>
			</div>
		</div>


		<!-- main END-->
		<div class="footer">
			<div>
				<ul>
					<li><a href="#">홈페이지 소개</a></li>
					<li><a href="#">FAQ</a></li>
					<li><a href="#">이용약관</a></li>
					<li><a href="#">License</a></li>
				</ul>
			</div>
		</div>
		<!-- footer END-->
	</div>
</body>
</html>