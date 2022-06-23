<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../inculde/header.jsp"></jsp:include>
<link href="/css/upload.css" type="text/css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var tagList = [];

	function imageUpload(event) { // 미리보기
		var reader = new FileReader();
		reader.onload = function(event) {
			$(".imageContainer img").remove();
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("div.imageContainer").appendChild(img);
			$(".input_file_button").addClass("hide");
		};
		reader.readAsDataURL(event.target.files[0]);
	}
	
	
	
	function add_tag(){ // 태그추가
		if(window.event.keyCode==13 || window.event.keyCode == 32){
			event.preventDefault();
			var input = document.getElementById("tag_input");
			if(check_div(input.value)){
				var div = document.createElement("div");
				var li = document.createElement("li");
				var i = document.createElement("i");
				tagList.push(input.value);
				
				
				li.innerHTML = input.value;
				i.classList.add("bi");
				i.classList.add("bi-x");
	
				$("div .tags .tag_list").append(div); 
				$(".tags .tag_list div").last().append(li);   
				$(".tags .tag_list div").last().append(i); 
				edit_div();
				
				input.value = null;
				
			}else{
				input.value = null;
			}
	
			
		}

	}
	function check_div(){ // 태그 유효성 검사
		var tag = document.getElementById("tag_input").value;
		if(tag == null || tag=="") //비어있는 태그 금지
			return false;
		else if(tagList.length >= 15)// 맥스갯수확인
			return false;
		
	
		for(var i =0; i < tagList.length; i++){ //중복확인
			if(tag === tagList[i])
				return false;
	
		}
		
		return true;
		
	}
	function edit_div(){ // 인풋칸 변경
		var input = document.getElementById("tag_input");
		var input_width= $("#tag_input").css("width");
		var list_width= $(".tag_list div").last().css("width");
		

		
		input_width = Number(input_width.substring(0, input_width.length-2));
		list_width = Number(list_width.substring(0, list_width.length-2));
		list_width = Number(list_width.toFixed(2)) + 10;
		

		input.style.width= (input_width-list_width)+"px";
		
	}

$(function() {
	$("#upload_Confirm").on("click", function(){
		alert("로그인 후 사용 가능합니다.");
	});
	
	$(".tag_list").on("click", ".bi-x", function() { // 태그삭제
		var a = $(this).siblings("li").text();
		$(this).parent().remove();
		var idx = tagList.indexOf(a);
		tagList.splice(idx,1);
	});
	
	$("#upload").on("click",function(){  
		var form = document.getElementById("fileForm");
		var formData = new FormData(document.getElementById("fileForm"));
		
		
		for(var i=0; i < tagList.length; i++){
			var input =  document.createElement("input");
			input.value = tagList[i];
			input.setAttribute("hidden","hidden");
			input.setAttribute("name","tag");
			$("#tagListContainer").append(input); 
		}

	
		form.submit(formData);

	});

	

		
});

</script>
</head>
<body>
<body>
	<div class="wrap">
		<div class="header">
			<div class="logo">
				<a href=".."><img
					src="/images/logo.png"></a>
			</div>
			<div class="search">
				<form action="./">
					<button>
						<img
							src="/images/search.png">
					</button>
					<input type="search" name ="search" placeholder="한글 또는 영문으로 검색어를 입력해주세요">
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
			<div class="edit">
				<div class="text">
					<h2>이미지 업로드</h2>
				</div>
				<div>
					<hr>
					<form id ="fileForm" name="fileForm" method="post" enctype="multipart/form-data">
						<input type="file" id="file" class="file" name="file"
							onchange="imageUpload(event);" accept="image/*" />
							<label for="file" class="input_file_button">
							<div class="input_file_div">
								<div>
									<svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor" class="bi bi-plus-circle-dotted" viewBox="0 0 16 16">
  										<path class="gray" d="M8 0c-.176 0-.35.006-.523.017l.064.998a7.117 7.117 0 0 1 .918 0l.064-.998A8.113 8.113 0 0 0 8 0zM6.44.152c-.346.069-.684.16-1.012.27l.321.948c.287-.098.582-.177.884-.237L6.44.153zm4.132.271a7.946 7.946 0 0 0-1.011-.27l-.194.98c.302.06.597.14.884.237l.321-.947zm1.873.925a8 8 0 0 0-.906-.524l-.443.896c.275.136.54.29.793.459l.556-.831zM4.46.824c-.314.155-.616.33-.905.524l.556.83a7.07 7.07 0 0 1 .793-.458L4.46.824zM2.725 1.985c-.262.23-.51.478-.74.74l.752.66c.202-.23.418-.446.648-.648l-.66-.752zm11.29.74a8.058 8.058 0 0 0-.74-.74l-.66.752c.23.202.447.418.648.648l.752-.66zm1.161 1.735a7.98 7.98 0 0 0-.524-.905l-.83.556c.169.253.322.518.458.793l.896-.443zM1.348 3.555c-.194.289-.37.591-.524.906l.896.443c.136-.275.29-.54.459-.793l-.831-.556zM.423 5.428a7.945 7.945 0 0 0-.27 1.011l.98.194c.06-.302.14-.597.237-.884l-.947-.321zM15.848 6.44a7.943 7.943 0 0 0-.27-1.012l-.948.321c.098.287.177.582.237.884l.98-.194zM.017 7.477a8.113 8.113 0 0 0 0 1.046l.998-.064a7.117 7.117 0 0 1 0-.918l-.998-.064zM16 8a8.1 8.1 0 0 0-.017-.523l-.998.064a7.11 7.11 0 0 1 0 .918l.998.064A8.1 8.1 0 0 0 16 8zM.152 9.56c.069.346.16.684.27 1.012l.948-.321a6.944 6.944 0 0 1-.237-.884l-.98.194zm15.425 1.012c.112-.328.202-.666.27-1.011l-.98-.194c-.06.302-.14.597-.237.884l.947.321zM.824 11.54a8 8 0 0 0 .524.905l.83-.556a6.999 6.999 0 0 1-.458-.793l-.896.443zm13.828.905c.194-.289.37-.591.524-.906l-.896-.443c-.136.275-.29.54-.459.793l.831.556zm-12.667.83c.23.262.478.51.74.74l.66-.752a7.047 7.047 0 0 1-.648-.648l-.752.66zm11.29.74c.262-.23.51-.478.74-.74l-.752-.66c-.201.23-.418.447-.648.648l.66.752zm-1.735 1.161c.314-.155.616-.33.905-.524l-.556-.83a7.07 7.07 0 0 1-.793.458l.443.896zm-7.985-.524c.289.194.591.37.906.524l.443-.896a6.998 6.998 0 0 1-.793-.459l-.556.831zm1.873.925c.328.112.666.202 1.011.27l.194-.98a6.953 6.953 0 0 1-.884-.237l-.321.947zm4.132.271a7.944 7.944 0 0 0 1.012-.27l-.321-.948a6.954 6.954 0 0 1-.884.237l.194.98zm-2.083.135a8.1 8.1 0 0 0 1.046 0l-.064-.998a7.11 7.11 0 0 1-.918 0l-.064.998zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
									</svg>
								</div>
								<span>+ Select Image</span>
							</div>
							</label>
			
						<div class="imageContainer"></div>
						<hr>


						<div class="text">
							<h4>검색 태그를 추가해보세요 ></h4>
							<h6>3개 이상의 태그를 추가하여, 검색 가능성을 높여보세요</h6>
						</div>
						<div class="tags">
							<ul class="tag_list">
								
							</ul>
							<div id = "tagListContainer">
								<input id="tag_input" name="tagList"type="text" placeholder="스페이스 또는 엔터를 눌러 태그를 추가" onkeypress="add_tag()" >
							</div>
						</div>
						<div class="text">
							<h4>이 사진의 사용범위를 선택해주세요 ></h4>
						</div>
						<div class="check_license">
							<input type="radio" name="check_license" value="상업적용도 허용/출처 미표시" checked>상업적용도
							<span class="text_blue">허용</span>[출처 미표시] <input type="radio"
								name="check_license" value="상업적용도 허용/출처 표시">상업적용도 <span
								class="text_blue">허용</span>[출처 표시] <input type="radio"
								name="check_license" value="상업적용도 금지/출처 미표시">상업적용도 <span
								class="text_red">금지</span>[출처 미표시] <input type="radio"
								name="check_license" value="상업적용도 금지/출처 표시">상업적용도 <span
								class="text_red">금지</span>[출처 표시]
						</div>
						<div class="Enrollment_button">
							<button id="upload" type="button">등록</button>
						</div>
					</form>
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