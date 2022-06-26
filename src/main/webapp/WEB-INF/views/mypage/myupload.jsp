<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../inculde/header.jsp"></jsp:include>
<link href="/css/myupload.css" type="text/css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<title>Login</title>
<script>
	$(function() {
		$("#upload_Confirm").on("click", function() {
			alert("로그인 후 사용 가능합니다.");
		});
		
		
		$("#imgContainer").on("click","img", function(){
			console.log("ddd");
			var selectImg = this.name;
			selectImg = selectImg.substring(0, selectImg.length-4);
			console.log(selectImg);
			location.href="/image/Loding/"+ selectImg;
			
		});

	});
	
	function setOrder(){
		console.log("dd");
		let form = document.getElementById("orderForm");
		form.submit();
	};

</script>
</head>
<body>
	<div class="wrap">
		<div class="header">
			<div class="logo">
				<a href="../"><img src="/images/logo.png"></a>
			</div>
			<div class="search">
				<form action="../image/">
					<button>
						<img src="/images/search.png">
					</button>
					<input type="search" name="search" placeholder="한글 또는 영문으로 검색어를 입력해주세요">
					<select>
						<option>JPG</option>
						<option>PNG</option>
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
						<li><a href="./">MyPage</a></li>
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
		<!-- intro END-->

		<div class="main">
			<div class="main_bg">
				<div class="profile"></div>
				<div>
					<h2>${sessionScope.user.id}님, 환영합니다!</h2>
				</div>
			</div>
			<div class="mypage">
				<div class="main_nav">
					<div id="download">
						<a href="./mydownload">최근다운로드</a>
					</div>
					<div id="collection">
						<a href="./collection">찜 목록</a>
					</div>
					<div id="upload">
						<a href="./myupload">내 업로드</a>
					</div>
				</div>
				<div>
				<div>
					<div>
						<span>전체삭제</span> ｜ <span>선택삭제</span>
					</div>
				</div>
				<div>
					<form id="orderForm">
						<select name="order" onchange="setOrder();">
							<option value="recent" ${filter.order == 'recent'? 'selected':''}>최신순</option>
							<option value="popular" ${filter.order == 'popular'? 'selected':''}>인기순</option>
						</select>
					</form>
				</div>
				</div>
				<div class="image">
					<c:if test="${myupload.size() < 1}">
						<span>사진을 공유해보세요!</span>
					</c:if>
					<div id="imgContainer">
						<c:forEach var="item" items="${myupload}">
							<img name="${item.imageUuid}" src="/upload/${item.imageUuid}">
						</c:forEach>
					</div>
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
	</div>
	<!-- footer END-->
</body>
</html>