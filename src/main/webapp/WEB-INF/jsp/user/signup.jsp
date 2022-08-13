<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tuttigram 회원 가입</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>

	<div id="wrap">
	
		<section class="content d-flex justify-content-center my-5">
			
			<div>
				
				<div class="join w-45 p-5 border rounded">
					<h1 class="text-center mt-2">Tuttigram</h1>
					
					<div class="d-flex justify-content-center">
						<b class="text-secondary mt-3">친구들의 사진과 동영상을 보려면 
						<br> 가입하세요.</b>
					</div>
				
				
					<div class="join-box">
					
						<div class="d-flex mt-4">
							<input type="text" class="form-control col-8" id="loginIdInput" placeholder="아이디">
							<button type="button" class="btn btn-primary ml-2" id="isDuplicateBtn">중복확인</button>
						</div>
						<div id="duplicateText" class="d-none"><small class="text-danger">중복된 ID 입니다</small></div>
						<div id="possibleText" class="d-none"><small class="text-success">사용가능한 ID 입니다</small></div>
						
						<input type="password" class="form-control mt-3" id="passwordInput" placeholder="비밀번호">
						<input type="Password" class="form-control mt-3" id="passwordConfirmInput" placeholder="비밀번호 확인">
						
						<input type="name" class="form-control mt-3" id="nameInput" placeholder="이름">
						<input type="email" class="form-control mt-3" id="emailInput" placeholder="이메일">
						
						<button type="button" id="signUpBtn" class="btn btn-primary btn-block mt-4">회원가입</button>
					</div>
				</div>
				
				<div class="mt-2 d-none">
					<div class="input-group form-inline">
						<label class="input-label">아이디</label>
						<input type="text" class="form-control text-input" id="idInput">
					</div>
				
				</div>
				
				<div class="w-40 p-3 mt-3 d-flex justify-content-center border rounded">
					<text class="text-secondary">계정이 있으신가요?</text>
	                <a href="/user/signin/view" class="ml-3"><b>로그인</b></a>
				</div>
			</div>
		
		</section>
	
	
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>
		
	<script type="text/javascript">
		
		$(document).ready(function() {
			
			var isDuplicateCheck = false;
			var isDuplicateId = true;
			
			$("#loginIdInput").on("input", function() {
				
				isDuplicateCheck = false;
				isDuplicateId = true;
				$("#possibleText").addClass("d-none");
				$("#duplicateText").addClass("d-none");
			});
			
			
			$("#isDuplicateBtn").on("click", function() {
				
				var loginId = $("#loginIdInput").val();
				
				if(loginId == "") {
					alert("아이디를 입력하세요");
					return;
				}
				
				
				$.ajax({
					type:"get",
					url:"/user/duplicate_id",
					data:{"loginId":loginId},
					success:function(data) {
							// {"is_duplicate":true}
							// {"is_duplicate":false}
							
						// 중복체크 여부 판단	
						isDuplicateCheck = true;
						
						
						if(data.is_duplicate) { 	// 중복된 경우, true가 기본값임
							// alert("중복되었습니다");
							$("#duplicateText").removeClass("d-none");
							$("#possibleText").addClass("d-none");
							isDuplicateId = true;
							
						} else {	// 중복되지 않은 경우
							//alert("사용 가능 합니다");
							$("#possibleText").removeClass("d-none");
							$("#duplicateText").addClass("d-none");
							isDuplicateId = false;
						}
						
					},
					error:function() {
						alert("중복 확인 에러");
					}
					
				});
				
			}); 
			
				
			$("#signUpBtn").on("click", function() {
					
				var loginId = $("#loginIdInput").val();
				var password = $("#passwordInput").val();
				var passwordConfirm = $("#passwordConfirmInput").val();
				var name = $("#nameInput").val();
				var email = $("#emailInput").val();
					
				if (loginId == "") {
					alert("아이디를 입력하세요");
					return;
				}
				
				// 중복 체크 여부 유효성 검사 
					// if (isDuplicateCheck == false) {
				if (!isDuplicateCheck) {	// 위의 코드랑 두개 다 사용 가능
					alert("아이디 중복 여부 체크를 진행해주세요");
					return;
				}
				
				// 아이디 중복 여부 유효성 검사
					// if (isDuplicateCheck == true) {
				if (isDuplicateId) {
					alert("중복된 아이디입니다");
					return;
				}
				
					
				if (password == "") {
					alert("비밀번호를 입력하세요");
					return;
				}
					
				if (password != passwordConfirm) {
					alert("비밀번호가 일치하지 않습니다");
					return;
				}
					
				if (name == "") {
					alert("이름을 입력하세요");
					return;
				}
					
				if (email == "") {
					alert("이메일을 입력하세요");
					return;
				}
					
					
				$.ajax({
					type:"post",
					url:"/user/signup",
					data:{"loginId":loginId, "password":password, "name":name, "email":email},
						
					success:function(data) {
							
						if(data.result == "success") {
							location.href = "/user/signin/view";
								
						} else {
							alert("회원가입 실패");
						}
							
					},
					error:function() {
						alert("회원가입 에러");
					}
						
				});
					
			});
			
		});
		
		</script>
	

</body>
</html>