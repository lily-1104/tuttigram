<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 하기</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>

	<div id="wrap bg-success">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
	
	
		<section class="content bg-success d-flex justify-content-center">
			
			<div class="join-box bg-warning w-50 ">
				
				<h2 class="text-center mt-5">Tuttigram</h2>
				
				<div class="d-flex justify-content-center">
					<b class="text-secondary mt-3">친구들의 사진과 동영상을 보려면 
					<br> 가입하세요.</b>
				</div>
				
				
				<div class="join-box w-50">
				
					<div class="d-flex mt-4">
						<input type="text col-7" class="form-control" id="idInput" placeholder="아이디">
						<button type="button" class="btn btn-primary ml-2">중복확인</button>
					</div>
					
					<input type="password col-10" class="form-control mt-3" id="passwordInput" placeholder="비밀번호">
					<input type="confirmPassword col-10" class="form-control mt-3" id="passwordConfirmInput" placeholder="비밀번호 확인">
					
					<input type="name col-10" class="form-control mt-3" id="nameInput" placeholder="이름">
					<input type="email col-10" class="form-control mt-3" id="emailInput" placeholder="이메일">
					
					<button type="button" id="joinBtn" class="btn btn-primary btn-block mt-4">회원가입</button>
				
				</div>
				
				<div class="mt-5">
					<text class="text-center">계정이 있으신가요?</text>
                    <a href="/user/signin/view" class="ml-3"><b>로그인</b></a>
				</div>
				
			</div>
		
		</section>
	
	
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
		
		<script>
		
			$(document).ready(function() {
				
				$("#joinBtn").on("click", function(e) {
					
					let id = $("#idInput").val();
					let password = $("#passwordInput").val();
					let passwordConfirm = $("#passwordConfirmInput").val();
					let name = $("#nameInput").val();
					let email = $("#emailInput").val();
					
					if (id == "") {
						alert("아이디를 입력하세요");
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
						data:{"loginId":id, "password":password, "name":name, "email":email},
						
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
	
	</div>

</body>
</html>