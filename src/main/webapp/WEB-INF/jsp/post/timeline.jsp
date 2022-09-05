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
						<a href="#" id="imageIcon"> <i class="bi bi-image"></i> </a>
						<input type="file" id="fileInput" class="d-none">
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
							<div>
									<%-- 로그인 한 사용자 userId가 해당 게시글의 사용자 userId가 일치하는 경우에 해당 버튼 노출 --%>
								<c:if test="${userId eq postDetail.user.id }">
								
									<%-- 삭제 버튼 --%>
								<a href="#" data-toggle="modal" data-target="#moreModal" class="more-btn" data-post-id="${postDetail.post.id }">
																					<!-- 'data-'는 정해진 값, 'post-id'는 내가 정한 변수 -->
									<i class="bi bi-three-dots"></i>
								</a>
								
								</c:if>
							</div>
						</div>
						<!-- /타이틀 -->
						
						<div>
							<img class="w-100" src="${postDetail.post.imagePath }">
						</div>
						
						<!-- 좋아요 -->
						<div class="p-2 d-flex mt-2">
							
						<c:choose>
						
							<c:when test="${postDetail.like }">	<!-- boolean에서 getter의 isLike 규칙 때문에 is 빼고 그냥 like로 옴 -->
								<a href="#" class="unlike-btn decoration-none" data-post-id="${postDetail.post.id }">
									<span class="heart-size text-danger"><i class="bi bi-heart-fill"></i></span>
								</a>
							</c:when>
							
							<c:otherwise>
								<a href="#" class="like-btn decoration-none" data-post-id="${postDetail.post.id }">
									<!-- 좋아요를 여러개 만들어야하니까 class로 만듦, id로 만들면 하나밖에 안됨 -->
									<span class="heart-size"> <i class="bi bi-heart" ></i> </span>
								</a>
							</c:otherwise>
							
						</c:choose>
							
							<div class="ml-2">좋아요 ${postDetail.likeCount }개 </div>
						</div>
						<!-- /좋아요 -->
						
						<!-- 게시글 -->
						<div class="p-2 d-flex">
							<b class="mr-2">${postDetail.user.loginId }</b>  
							${postDetail.post.content }
									<!-- <div class="ml-2">점심 메뉴 추천해주세요 -->
						</div>
						<!-- /게시글 -->
						
						<!-- 댓글 -->
						<div class="p-2">
							<div class="mb-2 mt-2 border-bottom small">댓글</div>
									<!-- border-bottom : 밑에만 줄 생성 -->
							
							<!-- 댓글 리스트 -->
							<div class="mt-2">
								<c:forEach var="commentDetail" items="${postDetail.commentList }">
														<!-- List는 items로 표기 -->
									<div>
										<b>${commentDetail.user.loginId }</b> 
										<div class="ml-2">${commentDetail.comment.content }</div>
									</div>
								</c:forEach>
							</div>
							<!-- /댓글 리스트 -->
							
							<!-- 댓글 입력 -->
							<div class="d-flex mt-3 p-0">
								<input type="text" class="form-control" placeholder="댓글 달기..." id="commentInput${postDetail.post.id }">  <!-- 댓글이 모든 게시물에 중복은 아니니까 id 뒤에 ${postDetail.post.id } 붙임 -->
								<button data-post-id="${postDetail.post.id }" type="button" class="btn btn-primary ml-2 comment-btn">게시</button>
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
		
		
			<!-- 'bootstrap modal' 구글링 -> Vertically centered 코드 복사 -->
		<!-- Modal -->
		<div class="modal fade" id="moreModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      
		      <div class="modal-body text-center">
		        <a href="#" id="deleteBtn">삭제하기</a>
		      </div>
		      
		    </div>
		  </div>
		</div>
	
	</div>
	
	
	<script>
		$(document).ready(function() {
			
			$(".more-btn").on("click", function() {
				
				// 이벤트가 발생한 버튼에서 post-id를 얻어 온다
				let postId = $(this).data("post-id");
				
				
				
				// 삭제하기 버튼에 해당 post-id를 저장한다 (data-post-id 속성에 값을 넣는다)
					// <a href="#" id="deleteBtn" data-post-id="8">삭제하기</a>
				$("deleteBtn").data("post-id", postId);
				
				
			});
			
			
			// 피드 삭제 버튼
			$("#deleteBtn").on("click", function() {
				
				// postId
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/delete",
					data:{"postId":postId},
					success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("삭제 실패");
						}
					},
					error:function() {
						alert("삭제 에러");
					}
					
				});
				
			});
			
			
			
			// 댓글 입력
			$(".comment-btn").on("click", function() {
				
				// alert();
				
				// 이벤트가 일어난 버튼에서 postId를 얻어온다
					// this = 현재 이벤트가 발생한 버튼, 그 버튼 안에 postId를 심어놨기때문에 post-id를 얻어오는 것
					// 얻어 오는 방법 : data 속성 안에 넣어놔서 data를 통해서 얻어옴 
				let postId = $(this).data("post-id");

				// 작성한 댓글 가져오기
				// #commentInput5
				let content = $("#commentInput" + postId).val();
				
				// alert(content);
				
				$.ajax({
					type:"post",
					url:"/post/comment/create",
					data:{"postId":postId, "content":content},
					success:function(data) {
						if (data.result == "success") {
							location.reload();
						} else {
							alert("댓글 작성 실패")
						}
						
					},
					error:function() {
						alert("댓글 작성 에러");
					}
					
				});
				
			});
			
			
			
			// 좋아요 취소
			$(".unlike-btn").on("click", function(e) {
				
				// alert();
				
				e.preventDefault();		// <a>의 #은 페이지 이동이라서 맨 위로 링크가 올라감, 그것을 방지하기 위해 사용
				
				// data-post-id
				let postId = $(this).data("post-id");
				
				$.ajax({
					
					type:"get".
					url:"/post/unlike",
					data:{"postId":postId},
					success:function(data) {
						
						if(data.result == "success") {
							location.reload();
						} else {
							alert("좋아요 취소 실패")
						}
					},
					error:function() {
						
						alert("좋아요 취소 에러");
					}
					
				});
				
			});
			
			
			
			// 좋아요 누르기
			$(".like-btn").on("click", function(e) {
				
				e.preventDefault();
				
				// 현재 클릭된 태그 객체를 얻어와서 postId를 얻어온다
				// ex) data-post-id="10"  => data-post-id 속성에 "10"의 형태로 값이 세팅되어있음
										  // 'data-'는 정해져있고 뒤에 'post-id'는 내가 원하는 이름으로 가능  
				let postId = $(this).data("post-id");
				
					// 테스트
				// alert(postId);
				
				$.ajax({
					
					type:"get",
					url:"/post/like",
					data:{"postId":postId},
					success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {	
							alert("좋아요 실패");
						}
					},
					
					error:function() {
						alert("좋아요 에러");
					}
					
				});
				
			});
			
			
			
			// 아이콘으로 파일 선택
			$("#imageIcon").on("click", function(e) {
				// alert();
				
				// fileInput을 클릭한 효과를 만들어야한다
				e.preventDefault();		// 해당하는 태그가 가지고 있는 기능을 막음 (어디에서든 사용 가능), 이 코드 쓰면 아이콘으로 파일 업로드 불가
				$("#fileInput").click();
			});
			
			
			
			$("#uploadBtn").on("click", function() {
				
				let content = $("#contentInput").val().trim();	 // <textarea>는 trim 함수 사용
				
				if(content == "") {
					alert("내용을 입력하세요");
					return;
				}
				
				
				
				// 파일 선택 유효성 검사
					// $("#fileInput")[0].files[0]
				if ($("#fileInput")[0].files.length == 0) {
					alert("이미지를 선택하세요");
					return;
				}
				
				
				
				// 파일을 포함한 파라미터 구성하기 (file은 필수 항목 아니라서 밸리데이션 따로 없음)
				var formData = new FormData();
				formData.append("content", content);
				formData.append("file", $("#fileInput")[0].files[0]);	// index 0으로 설정
				
				
				
				// 사용자가 입력한 content로 api를 호출해서 데이터를 입력한다
				$.ajax({
					type:"post",
					url:"/post/create",
					data:formData,	 // 파일 업로드 때문에 formData로 변경
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