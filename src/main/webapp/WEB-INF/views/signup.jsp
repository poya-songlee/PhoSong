<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/css/signup.css" type="text/css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<jsp:include page="./inculde/header.jsp"></jsp:include>
<title>회원가입</title>
<script>
	$(function() {
		const form = document.getElementById("signup_form");
		const id_regex = /^[A-Za-z0-9]{4,12}$/;
		const pw_regex = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		const email_regex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

		// ID 중복체크]
		$("#id").on("propertychange change keyup paste input", function() {
			var id = $("#id").val();
			$.ajax({
				type : "post",
				url : "checkId",
				data : id,
				contentType : "application/json",
				success : function(result) {

					if (id_regex.test(id)) {
						if (result == "success") {
							$(".id_ok").css("display", "inline-block");
							$(".id_fail").css("display", "none");
							$(".id_wrong").css("display", "none");
						} else if (result == "fail") {
							$(".id_ok").css("display", "none");
							$(".id_fail").css("display", "inline-block");
							$(".id_wrong").css("display", "none");
						}
					} else {
						$(".id_ok").css("display", "none");
						$(".id_fail").css("display", "none");
						$(".id_wrong").css("display", "inline-block");
					}
				},
				error : function(result) {
					$(".id_ok").css("display", "none");
					$(".id_fail").css("display", "none");
					$(".id_wrong").css("display", "none");
				}
			});

		});

		$("#password").on("propertychange change keyup paste input",function() {
					var pw = $("#password").val();

					if (pw.length == 0) {
						$(".pw_ok").css("display", "none");
						$(".pw_fail").css("display", "none");
						$(".pw_wrong").css("display", "none");
					} else if (pw_regex.test(pw)) {
						$(".pw_ok").css("display", "inline-block");
						$(".pw_fail").css("display", "none");
						$(".pw_wrong").css("display", "none");
					} else {
						$(".pw_ok").css("display", "none");
						$(".pw_fail").css("display", "none");
						$(".pw_wrong").css("display", "inline-block");
					}
				});
		
		$("#check_password").on("propertychange change keyup paste input",function() {
			var pw = $("#check_password").val();

			if (pw.length == 0) {
				$(".pw_check_ok").css("display", "none");
				$(".pw_check_fail").css("display", "none");
				$(".pw_check_wrong").css("display", "none");
			} else if (pw == form.password.value) {
				$(".pw_check_ok").css("display", "inline-block");
				$(".pw_check_fail").css("display", "none");
				$(".pw_check_wrong").css("display", "none");
			} else {
				$(".pw_check_ok").css("display", "none");
				$(".pw_check_fail").css("display", "none");
				$(".pw_check_wrong").css("display", "inline-block");
			}
		});
		
		$("#email").on("propertychange change keyup paste input", function() {
			var email = $("#email").val();
			$.ajax({
				type : "post",
				url : "checkEmail",
				data : email,
				contentType : "application/json",
				success : function(result) {

					if (email_regex.test(email)) {
						if (result == "success") {
							$(".email_ok").css("display", "inline-block");
							$(".email_fail").css("display", "none");
							$(".email_wrong").css("display", "none");
						} else if (result == "fail") {
							$(".email_ok").css("display", "none");
							$(".email_fail").css("display", "inline-block");
							$(".email_wrong").css("display", "none");
						}
					} else {
						$(".email_ok").css("display", "none");
						$(".email_fail").css("display", "none");
						$(".email_wrong").css("display", "inline-block");
					}
				},
				error : function(result) {
					$(".email_ok").css("display", "none");
					$(".email_fail").css("display", "none");
					$(".email_wrong").css("display", "none");
				}
			});

		});
		
		$("#upload_Confirm").on("click", function(){
			alert("로그인 후 사용 가능합니다.");
		});
		
		
	});

	function signup() {
		const form = document.getElementById("signup_form");
		const id_regex = /^[A-Za-z0-9]{4,12}$/;
		const pw_regex = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		const email_regex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

		if (form.id.value == "" || form.password.value == ""
				|| form.check_password.value == "" || form.email.value == "") {
			alert("입력 정보를 모두 입력해주세요");
			return;
		}

		if (form.use.checked != true) {
			alert("이용약관에 동의해주세요.");
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
				<a href="."><img
					src="/images/logo.png"></a>
			</div>
			<div class="search">
				<form action="./image/">
					<button>
						<img
							src="/images/search.png">
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
			<div class=signup>
				<h2>회원가입</h2>
				<form id="signup_form" method="post">
					<div class="signup_id">
						<label>아이디 <span class="red">*</span></label> <input type="text"
							name="id" id="id"> <span>(특수문자 제외 / 4자~12자 이내)</span> <span
							class="id_ok">시용 가능한 아이디입니다.</span> <span class="id_fail">이미
							존재하는 아이디입니다.</span><span class="id_wrong">형식에 맞지않는 아이디입니다.</span>
					</div>
					<div class="signup_password">
						<label>비밀번호 <span class="red">*</span></label> <input
							type="password" name="password" id="password"> <span>(영문, 숫자,
							특수문자 포함 / 8자~16자 이내)</span> <span class="pw_ok">시용 가능한 비밀번호입니다.</span> <span
							class="pw_wrong">형식에 맞지않는 비밀번호입니다.</span>
					</div>

					<div class="signup_password_check">
						<label>비밀번호 확인 <span class="red">*</span></label> <input
							type="password" name="check_password" id="check_password"> <span
							class="pw_check_ok">비밀번호가 일치합니다.</span> <span
							class="pw_check_wrong">비밀번호가 일치하지 않습니다.</span>

					</div>

					<div class="signup_email">
						<label>이메일 <span class="red">*</span></label> <input type="text"
							name="email" id="email"> <span class="email_ok">시용
							가능한 이메일입니다.</span><span class="email_fail">이미
							등록된 이메일입니다.</span> <span class="email_wrong">형식에 맞지않는 이메일입니다.</span>
					</div>

					<div class="signup_Use">
						<label>이용약관 동의 <span class="red">*</span></label> <input
							type="checkbox" name="use"> <span><a href="#">전체
								이용약관에 동의합니다.</a></span>
					</div>

					<div class="signup_button">
						<button type="button" onclick="signup()">가입</button>
					</div>
				</form>
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