<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <div class="d-flex justify-content-center">
    
		<div class="contents-box">
		
			<%-- 글쓰기 영역 (로그인 된 사람만 보이도록) --%>
			<c:if test="${not empty userId }">
			
			<div class="write-box border rounded m-3">
				<textarea id="writeTextArea" placeholder="내용을 입력해주세요" class="w-100 border-0"></textarea>
				
				<%-- 이미지 업로드를 위한 아이콘과 업로드 버튼을 한 행에 멀리 떨어뜨리기 위한 div --%>
				<div class="d-flex justify-content-between">
					<div class="file-upload d-flex">
						
						<%-- file 태그를 숨겨두고 이미지를 클릭하면 file 태그를 클릭한 효과 --%>
						<input type="file" id="file" accept=".jpg, .png, .gif, .jpeg" class="d-none" >
						
						<a href="#" id="fileUploadBtn"><img width="35" src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-image-512.png"></a>
					
						<%-- 업로드 된 임시 파일명 노출 --%>
						<div id="fileName" class="ml-2"></div>
						
					</div>
					
					<button id="writeBtn" class="btn btn-info">게시</button>
					
				</div>
			</div> <%--// 글쓰기 영역 끝 --%>
			
			</c:if>
			
			
			<%-- 타임라인 영역 --%>
			<div class="timeline-box my-5">
				
				<c:forEach items="${cardList }" var="card">
				<%-- 카드1 --%>
				<div class="card border rounded mt-3">
					<%-- 글쓴이, 더보기(삭제) --%>
					<div class="p-2 d-flex justify-content-between">
						<span class="font-weight-bold">${card.user.loginId }</span>
						
						<%-- 더보기 (내가 쓴 글 일 때만 노출 - 삭제 or 수정) --%>
						<c:if test="${userId eq card.user.id }">
						<a href="#" class="more-btn" data-toggle="modal" data-target="modal" data-post-id="${card.post.id }">
							<img src="https://www.iconninja.com/files/860/824/939/more-icon.png" width="30">
						</a>
						</c:if>
					</div>	
					
					<%-- 카드 이미지 --%>
					<div class="card-img">
						<img src="${card.post.imagePath }" class="w-100" alt="본문 이미지">
					</div>
					
					<%-- 좋아요 --%>
					<div class="card-like m-3">
					
						<%-- 빈 하트가 나오는 경우 : 1) 비로그인일 때, 2) 좋아요를 누르지 않았고 로그인 상태일 때 --%>
						<c:if test="${card.filledLike eq false }">
						<a href="#" class="like-btn" data-post-id="${card.post.id }">
							<img src="https://www.iconninja.com/files/214/518/441/heart-icon.png" width="18" height="18" alt="empty heart">
						</a>
						</c:if>
						
						<%-- 채워진 하트 : 로그인 상태 && 좋아요 눌렀을 때 --%>
						<c:if test="${card.filledLike eq true }">
						<a href="#" class="like-btn" data-post-id="${card.post.id }">
							<img src="https://www.iconninja.com/files/214/518/441/heart-icon.png" width="18" height="18" alt="filled heart">
						</a>
						</c:if>
						
						좋아요 ${card.likeCount }개
					</div>
					
					<%-- 글 --%>
					<div class="card-post m-3">
						<span class="font-weight-bold">${card.user.loginId }</span>
						<span>${card.post.content }</span>
					</div>
					
					<%-- 댓글 제목 --%>
					<div class="card-comment-desc border-bottom">
						<div class="ml-3 mb-1 font-weight-bold">댓글</div>
					</div>
					
					<%-- 댓글 목록 --%>
					<div class="card-comment-list m-2">
					
						<c:forEach items="${card.commentList }" var="commentView"> 
						<%-- 댓글 내용들 --%>
						<div class="card-comment m-1">
							<span class="font-weight-bold">${commentView.user.loginId }</span>
							<span>${commentView.comment.content }</span>
							
							<%-- 댓글 삭제 버튼 --%>
							<%-- 로그인 된 사람과 댓글쓴이 일치 시 삭제 버튼 노출 --%>
							<c:if test="${userId eq commentView.user.id }">	   <%-- commentView.user.id or commentView.comment.userId --%>
							<a href="#" class="comment-del-btn" data-comment-id="${commentView.comment.id }">
								<img src="https://www.iconninja.com/files/603/22/506/x-icon.png" width="10" height="10">
							</a>
							</c:if>
						</div>
						</c:forEach>
						
						<%-- 댓글 쓰기 --%>
						<div class="comment-write d-flex border-top mt-2">
							<input type="text" class="form-control border-0 mr-2 comment-input" placeholder="댓글 달기"/> 
							<button type="button" class="comment-btn btn btn-light" data-post-id="${card.post.id }">게시</button>
						</div>
					</div> <%--// 댓글 목록 끝 --%>
					
				</div> <%--// 카드1 끝 --%>
				</c:forEach>
				
			</div> <%--// 타임라인 영역 끝  --%>
		</div> <%--// contents-box 끝  --%>
	</div>
	
	
	<%-- 수정, 삭제 modal 창 --%>
	<div class="modal fade" id="modal">
	
	  <div class="modal-dialog modal-dialog-centered modal-sm">	
	  					<%--  modal-dialog-centered : modal창 위치 수직 기준 가운데 정렬 / modal-sm : modal 창 작게 (small) --%>
	    <div class="modal-content text-center">
	    	<div class="py-3 border-bottom">
	    		<a href="#" id="deletePostLink">삭제하기</a>
	    	</div>
	    	
	    	<div class="py-3">
	    		<a href="#" data-dismiss="modal">취소하기</a>	<%-- data-dismiss="modal" : 취소하기 버튼 누르면 모달창 꺼짐 --%>
	    	</div>
	    </div>
	    
	  </div>
	</div>
	
	
	<script>
	
		$(document).ready(function() {
			
			// 파일 이미지 클릭 => 숨겨져 있던 type="file"을 동작시킨다
			$('#fileUploadBtn').on('click', function(e) {
				
				e.preventDefault();		// a 태그의 올라가는 현상 방지
				
				$('#file').click();		// 이미지 아이콘을 눌렀을 때 파일 폴더 열림
			});
			
			
			// 이미지를 선택하는 순간 -> 유효성 체크 및 업로드 된 파일명 노출
			$('#file').on('change', function(e) {	// 변경이 일어나는 거라서 change 사용
				
				// alert("선택");
				
				let fileName = e.target.files[0].name;	// 변경이 일어난 것을 가져올 때는 target 사용 (this랑 같음)
				console.log(fileName);
				
				// 확장자 유효성 확인
				let ext = fileName.split(".").pop().toLowerCase();	// toLowerCase : 소문자로 바꿈
				
				// alert(ext);
				
				if (ext != 'jpg' && ext != 'gif' && ext != 'png' && ext != 'jpeg') {
					
					alert("이미지 파일만 업로드 할 수 있습니다");
					
					// 이미지 파일 등록 후 다른 확장자 파일을 등록했을 경우 위의 얼럿과 함께 아래 코드로 기존 이미지 파일 등록을 리셋
					$('#file').val("");		// 파일 태그에 파일 제거 (보이지 않지만 업로드 될 수 있으므로 주의)
					$('#fileName').text("");	// 파일명 비우기
					
					return;
				}
				
				// 유효성 통과한 이미지는 업로드 된 파일명 노출
				$('#fileName').text(fileName);
				
			});
			
			
			// 글쓰기
			$('#writeBtn').on('click', function() {
				
				// alert("클릭");
				
				let content = $('#writeTextArea').val();
				console.log(content);
				
				if (content.length < 1) {
					alert("글 내용을 입력해주세요");
					return;
				}
				
				let file = $('#file').val();
				
				// alert(file);		// 파일 경로
				
				if (file == '') {
					alert("파일을 업로드 해주세요");
					return;
				}
				
				// 파일이 업로드 된 경우 확장자 체크
				let ext = file.split(".").pop().toLowerCase();
				
				// 이미지를 찾을 수 없을 때 기존에 등록된 파일 리셋
				if ($.inArray(ext, ['jpg', 'jpeg', 'png', 'gif']) == -1) {	
					alert("이미지 파일만 업로드 할 수 있습니다");
					$('#file').val("");		// 파일을 비운다
					return;
				}
				
				let formData = new FormData();
				formData.append("content", content);
				formData.append("file", $('#file')[0].files[0]);	// $('#file')[0] : 첫번쩨 input file 태그를 의미, files[0]는 업로드된 첫번째 파일
				
				
				// ajax
				$.ajax({
					
					// request
					typr:"post"
					, url:"/post/create"
					, data:formData
					, enctype:"multipart/form-data"		// 파일 업로드를 위한 필수 설정
	    			, processData:false		// 파일 업로드를 위한 필수 설정
	    			, contentType:false		// 파일 업로드를 위한 필수 설정
					
	    			// response
    				, success:function(data) {
    					
						if (data.code == 200) {
    						
    						alert("게시글이 저장되었습니다");
    						location.reroad();
    						
    					} else if (data.code == 500) {	// 비로그인 일 때
    						
    						location.href = "/user/sign-in-view";
    						
    					} else {
    						
    						// 로직 실패
    						alert(data.errorMessage);
    					}
    					
    				}
					, error: function(e) {
						
						alert("글 저장에 실패했습니다. 관리자에게 문의해주세요");
					}
				});
				
			});
			
			
			// 댓글 쓰기
			$('.comment-btn').on('click', function() {
				
				let postId = $(this).data('post-id');	// data-post-id=13
				
				// alert(postId);
				
				// 댓글 내용 가져오기
				// 1) 
				// let content = $(this).siblings("input").val().trim();
				
				// 2)
				let content = $(this).prev().val().trim();
				
				// alert(content);
				
				
				// ajax
				$.ajax({
					
					type:"post"
					, url:"/comment/create"
					, data:{"postId":postId, "content":content}
				
					, success:function(data) {
						
						if (data.code == 200) {
							
							location.reload(true);
							
						} else if (data.code == 500) {
							
							alert(data.errorMessage);
							location.href = "/user/sign-in-view";
						}
					}
					, error:function(request, status, error) {
						
						alert("댓글 작성에 실패했습니다");
					}
				});
			});
			
			
			// 댓글 삭제
			$('.comment-del-btn').on('click', function(e) {
				
				// alert("클릭");
				e.preventDefault();
				
				let commentId = $(this).data("comment-id");
				alert(commentId);
				
				
				$.ajax({
					
					// request
					type:"delete"
					, url:"/comment/delete"
					, data:{"commentId":commentId}
					
					// response
					, success:function(data) {
						
						if (data.code == 200) {
							
							location.reload(true);
							
						} else {
							
							alert(data.errorMessage);
						}
					}
					, error:function(request, status, error) {
						
						alert("댓글 삭제에 실패했습니다");
					}
				});
				
			});
			
			
			//  좋아요 해제
			$('.like-btn').on('click', function(e) {
				
				e.preventDefault();
				alert("라이크");
				
				let postId = $(this).data("post-id");
				alert(postId);
				
				
				$.ajax({
					
					// request
					url:"/like/" + postId
					
					// response
					, success:function(data) {
						
						if (data.code == 200) {
							location.reload(true);	// 새로고침 후 timeline 다시 가져오고 하트가 채워지거나 or 비워지거나
							
						} else if (data.code == 500) {
							
							// 비로그인 상태
							alert(data.errorMessage);
							location.href = "/user//sign-in-view";	// 로그인 페이지로 이동
						}
					}
					, error:function(request, status, error) {
						
						alert("좋아요를 실패했습니다");
					}
				});
			});
			
			
			// 글 삭제 (... 더보기 버튼 클릭 했을 때 모달 띄우기 => 모달에 글번호 세팅)
			$(".more-btn").on("click", function(e) {
				
				e.preventDefault();		// a 태그 맨 위로 올라가는 현상 방지
				
				let postId = $(this).data("post-id");	// ... 버튼에 넣어둔 글 번호 getting
				// alert(postId);
				
				// 1개인 모달 태그에 재활용 => data-post-id를 심어줌
				$("#modal").data("post-id", postId);	// 모달 태그에 setting
				
			});
			
			
			// 모달 안에 있는 삭제하기 클릭 => 진짜 삭제
			$("#modal #deletePostLink").on("click", function(e) {	// #modal #deletePostLink : id="modal" 안에 id="deletePostLink"
				
				e.preventDefault();
			
				let postId = $("#modal").data("post-id");	// getting
				// alert(postId);
				
				
				// ajax 글 삭제 요청
				
				
				
				
				
			});
			
			
			
			
			
		});
	
	</script>

