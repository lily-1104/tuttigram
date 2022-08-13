<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tuttigram 로그인</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>

<body>

    <div id="wrap">
	
		<section class="content d-flex justify-content-center my-5">
		
            <div class="mr-5">
               <img width="400" alt="로고" src="https://cdn.pixabay.com/photo/2016/09/17/07/03/instagram-1675670_960_720.png">
            </div>
            
            <div class="w-60 d-flex align-items-center">
            
	            <div class="login-box d-flex justify-content-center align-items-start border rounded">
	         
	            	<div class="p-5">
	                	<h2 class="text-center">Tuttigram</h2>
	                	
	                	<br>
	                	
	                	<form id="loginForm">
		                    <input type="text" class="form-control mt-4" id="loginIdInput" placeholder="아이디">
		                    <input type="password" class="form-control mt-3" id="passwordInput" placeholder="비밀번호">
		                  
		                    <button type="submit" id="loginBtn" class="btn btn-primary btn-block mt-4">로그인</button>
	                 		
	                 		<hr class="mt-3">
	                 	</form>
	                 	
	                    <div class="text-center text-secondary mt-2">
	                    	<small>비밀번호를 잊으셨나요?</small>
	                    </div>
	                 
	         		</div>
	            </div>
	            
	            <div class="mt-4 p-2 align-items-center border rounded">
	               <small class="text-secondary">계정이 없으신가요?
	               <a href="/user/signup/view" class="ml-3"><b>가입하기</b></a></small>
	            </div>
	            
         	</div>
         
        </section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>
		
		<script>
			$(document).ready(function() {
				
				$("#loginForm").on("submit", function(e) {
					
					// 해당 이벤트가 가지고 있는 기능을 비활성화
					e.preventDefault();
					
					// loginId와 password를 통해서 로그인 진행
					// 로그인 api 호출
					let loginId = $("#loginIdInput").val();
					let password = $("#passwordInput").val();
					
					if (loginId == "") {
						alert("아이디를 입력하세요");
						return;
					}
					
					if (password == "") {
						alert("비밀번호를 입력하세요");
						return;
					}
					
					
					$.ajax({
						type:"post",
						url:"/user/signin",
						data:{"loginId":loginId, "password":password},
						
						success:function(data) {
							
							if(data.result == "success") {
								location.href = "/post/timeline/vieww";
								
							} else {
								alert("아이디/비밀번호를 확인해주세요");
							}
							
						},
						error:function() {
							alert("로그인 에러");
						}
						
					});
					
				});
				
			});
		
		</script>

</body>


</html> 
