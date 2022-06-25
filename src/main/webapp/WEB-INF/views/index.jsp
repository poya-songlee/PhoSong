<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="./inculde/header.jsp"></jsp:include>
<link href="/css/index.css" type="text/css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<title>편리한 이미지 공유 - PhoSong</title>
<script>
	$(function() {
		$("#upload_Confirm").on("click", function() {
			alert("로그인 후 사용 가능합니다.");
		});
		$("#imgContainer").on("click","img", function(){
			var selectImg = this.name;
			selectImg = selectImg.substring(0, selectImg.length-4);
			location.href="./image/Loding/"+ selectImg;
			
		});

	});
</script>
</head>
<body>
	<div class="wrap">
		<div class="intro">
			<div class="header">
				<div class="logo">
					<a href="."><img src="/images/logo.png"></a>
				</div>
				<ul class="nav">
					<c:if test="${sessionScope.user == null}">
						<li><a href="login">Login</a></li>
						<li><a href="signup">Signup</a></li>
					</c:if>
					<c:if test="${sessionScope.user != null}">
						<li><a href="mypage/">MyPage</a></li>
						<li><a href="logout">Logout</a></li>
					</c:if>
					<c:if test="${sessionScope.user == null}">
						<li><a><button type="button" id="upload_Confirm">Upload</button></a></li>
					</c:if>
					<c:if test="${sessionScope.user != null}">
						<li><a href="/image/fileUpload"><button type="button">Upload</button></a></li>
					</c:if>
				</ul>
			</div>

			<div class="intro_bg">
				<div class="intro_text">
					<h1>언제? 어디서나! 편리한 이미지 공유</h1>
					<h4>Get the amazing free image!</h4>
				</div>
				<div class="search">
					<form action="/image/">
						<button>
							<img src="/images/search.png">
						</button>
						<input type="search" name="search" placeholder="한글 또는 영문으로 검색어를 입력해주세요">
						<select name="type">
							<option value="image" selected="selected">이미지</option>
							<option value="jpg">JPG</option>
							<option value="png">PNG</option>
						</select>
					</form>
				</div>
				<div class="popular_search">
					<span><a href="/image/?search=계절">[1위] 계절</a></span>
				</div>
			</div>
		</div>
		<!-- intro END-->
		<div class="main">
			<div class="image">
				<div id="imgContainer">
					<c:forEach var="item" items="${indexImage}">
						<img name="${item.imageUuid}" src="/upload/${item.imageUuid}">
					</c:forEach>
				</div>
			</div>

			<div class="more_button">
				<span>MORE</span>
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