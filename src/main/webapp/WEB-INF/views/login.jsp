<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="./inculde/header.jsp"></jsp:include>
<link href="/css/login.css" type="text/css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<title>Login</title>
<script>
	$(function() {
		const msg = "<c:out value='${msg}'/>";
		if (msg == "로그인 실패") {
			alert("로그인 정보가 일치하지 않습니다.");
		}
		
		$("#upload_Confirm").on("click", function(){
			alert("로그인 후 사용 가능합니다.");
		});
		
	});

	function login() {
		const form = document.getElementById("login_form");

		if (form.id.value == "") {
			alert("ID를 입력하세요.");
			return;
		}

		if (form.password.value == "") {
			alert("비밀번호를 입력하세요.");
			return;
		}

		form.submit();
	}
</script>
</head>
<div class="wrap">
	<div class="header">
		<div class="logo">
			<a href="."><img
				src="/images/logo.png"></a>
		</div>
		<div class="search">
			<form action="./image/">
				<button>
					<img
						src="/images/search.png">
				</button>
				<input type="search" name="search" placeholder="한글 또는 영문으로 검색어를 입력해주세요"> <select>
					<option>JPG</option>
					<option>PNG</option>
				</select>
			</form>
		</div>
		<div class="nav">
			<ul>
				<li><a href="login">Login</a></li>
				<li><a href="signup">Signup</a></li>
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
		<div class="login">
			<div class="login_form">
				<div class="login_text">
					<h2>MEMBER LOGIN</h2>
				</div>
				<form method="post" id="login_form">
					<div class="user_id">
						<input type="text" placeholder="ID" name="id">
					</div>
					<div class="user_password">
						<input type="password" placeholder="PASSWORD" name="password">
					</div>
					<div class="login_button">
						<button type="button" onclick="login()">로그인</button>
					</div>
				</form>
				<div class="signup_button" onclick="location.href='signup'">
					<button type="button">회원가입</button>
				</div>
				<div class="find">
					<span><a href="user_find">아이디 찾기 / 비밀번호 찾기</a></span>
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