<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="d-flex justify-content-center">
    
		<div class="shadow-box m-5">
		
			<div class="d-flex justify-content-center m-5">
				<%-- 키보드 Enter키로 로그인이 될 수 있도록 form 태그를 만들어준다.(submit 타입의 버튼이 동작됨) --%>
				
				<form id="loginForm" action="/user/sign-in" method="post">
				
					<%-- input-group-prepend: input box 앞에 ID 부분을 회색으로 붙인다. --%>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">ID</span>
						</div>
						<input type="text" class="form-control" id="loginId" name="loginId">
					</div>
					
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">PW</span>
						</div>
						<input type="password" class="form-control" id="password" name="password">
					</div>
					
					<%-- btn-block: 로그인 박스 영역에 버튼을 가득 채운다. --%>
					<input type="submit" id="signInBtn" class="btn btn-block btn-info" value="로그인">
					
					<a class="btn btn-block btn-dark" href="/user/sign-up-view">회원가입</a>
				</form>
				
			</div>
		</div>
	</div>
	
	
	<script>
	
		$(document).ready(function() {
			
			// 로그인
			$('#loginForm').on('submit', function(e) {
				
				e.preventDefault();
				
				// alert("클릭");
				
				
				// validation
				let loginId = $('#loginId').val().trim();
				let password = $('#password').val();
				
				if (!loginId) {
					alert("아이디를 입력하세요");
					return;
				}
				
				if (!password) {
					alert("비밀번호를 입력하세요");
					return;
				}
				
				
				// AJAX
				let url = $(this).attr('action');
				console.log(url);
				
				let params = $(this).serialize();
				console.log(params);
				
				$.post(url, params)
				.done(function(data) {
					
					if(data.code == 200) {
						
						// 성공
						location.href = "/timeline/timeline-view";
						
					} else {
						
						// 로직 실패
						alert(data.errorMessage);
						
					}
				});
				
			});
		});
	
	</script>
	
	