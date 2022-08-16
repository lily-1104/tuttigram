<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tuttigram</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	
</head>
<body>

	<div id="wrap">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<hr>
		
		<section class="content d-flex justify-content-center">
		
			<!-- timeline -->
			<div class="timeline col-5">
			
				<!-- 입력 상자 -->
				<div class="input-box border rounded">
					<textarea class="form-control border-0" rows="3" id="contentInput" placeholder="내용을 입력하세요"></textarea>
							<!-- border-0 : 외곽선의 두께를 0으로 변경 -->
						
					<!-- 파일 업로드 -->
					<div class="d-flex mt-2 justify-content-between">
						<input type="file" id="fileInput">
						<button type="button" id="uploadBtn" class="btn btn-primary">업로드</button>
					</div>
					<!-- /파일 업로드 -->
					
				</div>
				<!-- /입력 상자 -->
			
				<!-- 피드들 -->
				<div class="mt-4">
					<c:forEach var="postDetail" items="${postList }">
				
					<!-- 피드 -->
					<div class="border rounded mt-3">
					
						<!-- 타이틀 -->
						<div class="d-flex justify-content-between p-2">
							<div><b>${postDetail.user.loginId }</b></div>
							<div><i class="bi bi-three-dots"></i></div>
						</div>
						<!-- /타이틀 -->
						
						<div>
							<img class="w-100" src="https://img.insight.co.kr/static/2022/04/26/700/img_20220426101341_o1p9v26t.webp">
						</div>
						
						<!-- 좋아요 -->
						<div class="p-2 d-flex">
							<i class="bi bi-heart"></i> 
							<div class="ml-2">좋아요 11개</div>
						</div>
						<!-- /좋아요 -->
						
						<!-- 게시글 -->
						<div class="p-2 d-flex">
							<b class="mr-2">${postDetail.user.loginId }</b>  
							${postDetail.post.content }
									<!-- <div class="ml-2">점심 메뉴 추천해주세요</div>  -->
						</div>
						<!-- /게시글 -->
						
						<!-- 댓글 -->
						<div class="p-2">
							<div class="mb-2 mt-2 border-bottom small">댓글</div>
									<!-- border-bottom : 밑에만 줄 생성 -->
							
							<!-- 댓글 리스트 -->
							<div class="mt-2">
								<div class="mt-1 d-flex">
									<b>victor</b> 
									<div class="ml-2">샐러드 추천합니다</div>
								</div>
								<div class="mt-1 d-flex">
									<b>maeve</b> 
									<div class="ml-2">Fish and Chips ~!</div>
								</div>
							</div>
							<!-- /댓글 리스트 -->
							
							<!-- 댓글 입력 -->
							<div class="d-flex mt-3 p-0">
								<input type="text" class="form-control" placeholder="댓글 달기...">
								<button type="button" class="btn btn-primary ml-2">게시</button>
							</div>
							<!-- /댓글 입력 -->
						
						</div>
						<!-- /댓글 -->
						
					</div>
					<!-- /피드 -->
					
					</c:forEach>
				</div>
				<!-- /피드들 -->
				
			</div>
			<!-- /timeline -->
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>
	
	
	<script>
		$(document).ready(function() {
			
			$("#uploadBtn").on("click", function() {
				
				let content = $("#contentInput").val().trim();	 // <textarea>는 trim 함수 사용
				
				if(content == "") {
					alert("내용을 입력하세요");
					return;
				}
				
				
				// 파일을 포함한 파라미터 구성하기 (file은 필수 항목 아니라서 밸리데이션 따로 없음)
				var formData = new formData();
				formData.append("content" = content);
				formData.append("file", ${"#fileInput"}[0].files[0]);	// index 0으로 설정
				
				
				
				// 사용자가 입력한 content로 api를 호출해서 데이터를 입력한다
				$.ajax({
					type:"post",
					url:"/post/create",
					data:{"content":content},//formData,	 // 파일 업로드 때문에 formData로 변경
					enctype:"multipart/form-data",	// 파일 업로드 필수 옵션
					processData:false,				// 파일 업로드 필수 옵션
					contentType:false,				// 파일 업로드 필수 옵션
					success:function(data) {
						
						if(data.result == "success") {
							location.reload();
							
						} else {
							alert("업로드 실패");
						}
						
					},
					error:function() {
						alert("업로드 에러");
					}
						
				});
				
			});
			
		});
	
	</script>
	
</body>
</html>