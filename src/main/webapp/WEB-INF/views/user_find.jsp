<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="./inculde/header.jsp"></jsp:include>
<link href="/css/find.css" type="text/css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<title>회원가입</title>
<script>

$(function(){
	const msg = "<c:out value='${msg}'/>";
	if(msg == "일치하는 정보를 찾을 수 없습니다."){
		alert(msg);
		return;
	}
	
	if(msg.length >= 4){
		alert(`일치하는 아이디는 ${msg}입니다.`);
		return;
	}
	
	$("#upload_Confirm").on("click", function(){
		alert("로그인 후 사용 가능합니다.");
	});
	
	
});

function find_id(){
	const form = document.getElementById("find_id");
	//이메일 정규식 지정해줘야하는데 오류때문에 회원가입부터 정정 후에 추가하기! 
	if(form.email.value == ""){
		alert("이메일을 올바르게 입력해주세요");
		return;
	}
	
	form.submit();

}

function find_pw(){
	const form = document.getElementById("find_pw");
	//이메일 정규식 지정해줘야하는데 오류때문에 회원가입부터 정정 후에 추가하기! 
	if(form.id.value == ""){
		alert("ID를 올바르게 입력해주세요");
		return;
	}
	if(form.email.value == ""){
		alert("이메일을 올바르게 입력해주세요");
		return;
	}
	
	form.submit();

}


</script>
</head>
<body>
	<div class="wrap">
	<div class="header">
		<div class="logo">
			<a href="."><img src="/images/logo.png"></a>
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
				<li><a href="login">로그인</a></li>
				<li><a href="signup">회원가입</a></li>
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
			<div class="find">
				<h2>아이디 / 비밀번호 찾기</h2>
				<div class="find_form">
					<h2>아이디를 잊으셨나요?</h2>
					<form class="find_id" method="post" id="find_id">
						<div>
							<label>이메일</label> <input type="text" name="email">
						</div>
						<div>
							<button class="find_button" type="button" onclick="find_id()">확인</button>
						</div>
					</form>
					<hr>
					<h2>비밀번호를 잊으셨나요?</h2>
					<form class="find_pw" method="post" id="find_pw">
						<div>
							<div>
								<label>아이디</label> <input type="text" name="id">
							</div>
							<div>
								<label>이메일</label> <input type="text" name="email">
							</div>
						</div>
						<div>
							<button class="find_button" type="button" onclick="find_pw()">확인</button>
						</div>
					</form>
					<span>가입하신 이메일로 임시 비밀번호를 보내드립니다.</span>
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