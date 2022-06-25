<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../inculde/header.jsp"></jsp:include>
<link href="/css/download.css" type="text/css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(function() {

		$("#download").on("click", function() {
			var imageCode = "<c:out value='${img.imageCode}'/>";
			location.href = "../fileDownload/" + imageCode;
		});

		$("#collection").on("click", function() {
			var imageCode = "<c:out value='${img.imageCode}'/>";
			$.ajax({
				type: "post",
				url: ".././addCollection",
				contentType : "application/json;charset=UTF-8",
				data: imageCode,
				success: function(result){
					if(result == "success"){
						alert("찜 목록에 추가되었습니다.");
					}else{
						alert("로그인 후 이용 가능한 기능입니다.");
					}
				},error: function(){
				}
				
			});
	
			
			
		});
		
		$(".relevantContainer img").on("click", function(){
			var selectImg = this.name;
			selectImg = selectImg.substring(0, selectImg.length-4);
			location.href="./"+ selectImg;
			
		});
		
		

		$("#upload_Confirm").on("click", function() {
			alert("로그인 후 사용 가능합니다.");
		});
		

	

	});
</script>
</head>
<body>
<body>
	<div class="wrap">
		<div class="header">
			<div class="logo">
				<a href="../.."><img src="/images/logo.png"></a>
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
			<div class="nav">
				<ul>
					<c:if test="${sessionScope.user == null}">
						<li><a href="../../login">Login</a></li>
						<li><a href="../../signup" >Signup</a></li>
					</c:if>
					<c:if test="${sessionScope.user != null}">
						<li><a href="../../mypage/">MyPage</a></li>
						<li><a href="../../logout">Logout</a></li>
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
			<div class="download">
				<div>
					<h3>관련 태그</h3>
					<div id="tagContainer">
						<c:forEach var="tags" items="${tag}">
							<div class="tags">
								<span><a href="/image/?search=${tags}">${tags}</a></span>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="middle">
					<div>
						<img src="/upload/${img.imageUuid}">
					</div>
					<div>
						<div class="profile">
							<div id="profile_picture"><a href="/user/${img.unique}"></a></div>
							<div>
								<div id="name">
									<span><a href="/user/${img.unique}">${img.id}</a></span>
								</div>
								<div id="item">
									<span>26items</span>
								</div>
							</div>
						</div>
						<div>
							<div>
								<div class="Detail">
									<table>
										<tbody>
											<tr>
												<th>유형</th>
												<td>${img.imageFormat}</td>
											</tr>
											<tr>
												<th>크기</th>
												<td>${img.imageWidth}x${img.imageHeight}</td>
											</tr>
											<tr>
												<th>Uplate</th>
												<td>2021년 10월 19일</td>
											</tr>
											<tr>
												<th>다운로드</th>
												<td>${img.imageCount}</td>
											</tr>
										</tbody>
									</table>
									<hr>
									<span>License</span><br>
									<p>${img.imageLicense}</p>
								</div>
								<div class="download_but but">
									<button id="download">무료 다운로드</button>
								</div>
								<div class="collection_but but">
									<button id="collection">찜</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="relevant">
					<h2>비슷한 이미지</h2>
					<hr>
				</div>
				<div class="relevantContainer">
					<c:forEach begin="0" end="3" items="${relevant}" var="relevant">
						<img name="${relevant.imageUuid}" src="/upload/${relevant.imageUuid}">
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