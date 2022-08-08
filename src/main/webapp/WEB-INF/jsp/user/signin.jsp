<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>


<body>

    <div id="wrap">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		
		<form id="loginForm">
		<section class="content">
		
            <div class="d-flex justify-content-center">
         
            <div class="logo w-40">
               <img width="400" alt="로고" src="data:image/jpeg;base64,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"
               		class="mr-4 mt-4">
            </div>
         
         
            <div class="content w-50 ml-3">
            
                <h1 class="text-center">Tuttigram</h1>
               
                <div class="login-box">
                    <input type="text" class="form-control col-10 mt-5" id="idInput" placeholder="아이디">
                    <input type="password" class="form-control col-10 mt-3" id="passwordInput" placeholder="비밀번호">
                  
                    <button type="submit" id="loginBtn" class="btn btn-primary btn-block col-10 mt-4">로그인</button>
                 </div>
                 
                    <hr class=" col-10 mt-4">
                  
                    <text class="text-center">비밀번호를 잊으셨나요?</text>
         
                 <div class="join-box">
                    <text class="text-center">계정이 없으신가요?</text>
                    <a href="/user/signup/view" class="ml-3"><b>가입하기</b></a>
                 </div>
         
            </div> 
            
        </div>
      
        </section>
        </form>
	
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
		
		<script>
			$(document).ready(function() {
				
				$("#loginForm").on("submit", function(e)) {
					
					e.preventDefault();
					
					let loginId = $("#idInput").val();
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
								location.href = "/post/list/view";
								
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
