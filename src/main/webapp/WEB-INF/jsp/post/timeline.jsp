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

</head>
<body>

	<div id="wrap">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<hr class="col-6">
		
		<section class="content">
			
			<div class="d-flex align-items-center justify-content-center">
				<textarea rows="8" class="form-control col-6" placeholder="내용을 입력해주세요"></textarea>
			
				<button type="button" class="btn btn-primary">업로드</button>
			</div>
			
			
			<div class="d-flex align-items-center justify-content-center mt-3">
			
				<div class="id-box form-control col-6 d-flex align-items-center justify-content-start">
					<img width="30" alt="profile image" class="d-flex justify-content-start" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6xSz0eMW7GmpKukczOHvPWWGDqaBCqWA-Mw&usqp=CAU">
					<b class="ml-2">id</b>
				</div>
				
				<div class="d-flex justify-content-end">
					...
				</div>
				
			</div>
			
			<div class="d-flex align-items-center justify-content-center mt-3">
				<img width="500" alt="햄버거 사진" src="https://img.insight.co.kr/static/2022/04/26/700/img_20220426101341_o1p9v26t.webp">
			</div>
			
			<div class="d-flex justify-content-center mt-3">
				<b class="d-flex justify-content-start">id</b>
				<text class="ml-3">점심 메뉴 추천해 주세요</text>
			</div>
			
			<div class="d-flex align-items-center justify-content-center mt-3">
			
				<div class="id-box form-control col-6 d-flex align-items-center justify-content-start">
					댓글
				</div>
			</div>
			
			<div class="d-flex justify-content-center mt-3">
				<id><b>victor</b></id>
				<text class="ml-4">샐러드 추천합니다</text>
			</div>
				
			<div class="d-flex justify-content-center mt-2">
				<id><b>maeve</b></id>
				<text class="ml-4">Fish and Chips~!</text>
			</div>
			
			<div class="d-flex justify-content-center mt-4">
				<input type="text" class="form-control col-5" placeholder="댓글 달기...">
				<button type="button" class="btn btn-primary ml-3">게시</button>
			</div>
			
			
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>


</body>
</html>