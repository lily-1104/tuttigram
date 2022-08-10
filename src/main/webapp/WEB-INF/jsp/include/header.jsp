<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<header class="d-flex align-items-center justify-content-center mt-3">  
	
		<h2 class="ml-3">Tuttigram</h2>
		
		<input type="text" class="search-box form-control col-3 ml-4" placeholder="검색">
		
		<c:if test="${not empty userId }">
			<div class="mr-3">${userLoginId }님 <a href="/user/signout">로그아웃</a></div>
		</c:if>
	
	</header>
	
</body>
</html>