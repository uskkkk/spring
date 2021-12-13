<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">


<head>
<jsp:include page="../includes/head.jsp" />
<sec:csrfMetaTags/>
</head>
<body>
	<!-- start of site-wrap -->
	<div class="site-wrap">
		<header class="site-navbar" role="banner">
			<jsp:include page="../includes/header.jsp" />
		</header>
		
		<!-- start of join -->
		<form class="join" method="post">
		<img alt="rakki" src="${pageContext.request.contextPath}/resources/images/RAKKI-logo-black_1.png" class="rakki_image1">
			<label>
				<p class="label-txt">아이디</p> 
				<input type="text" class="input" id="id" name="id">
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label>
			 <label>
				<p class="label-txt">비밀번호</p>
				<input type="password" class="input" id="password" name="password" placeholder="영문, 숫자 특수문자 조합 8-16자">
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label> 
<!-- 			 <label> -->
<!-- 				<p class="label-txt">비밀번호 확인</p> -->
<!-- 				<input type="password" class="input" id="passwordCk" name="passwordCk" > -->
<!-- 				<div> -->
<!-- 				</div> -->
<!-- 				<div class="line-box"> -->
<!-- 					<div class="line"></div> -->
<!-- 				</div> -->
<!-- 			</label>  -->
			<label>
				<p class="label-txt">이메일</p>
				<input type="email" class="input" id="email" name="email">
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label>
			<label>
				<p class="label-txt">이름</p>
				<input type="text"class="input" id="name" name="name">
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label>
			<label>
				<p class="label-txt">전화번호</p>
				<input type="text" class="input" id="phone" name="phone">
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label>
			<sec:csrfInput/>
			<button class="loginBtn" type="submit" onclick="joinform_check(this)">가입하기</button>
		</form>
		<!-- end of join -->
		<script>
		function joinform_check() {
			
			var id = document.getElementById("id");
			var password = document.getElementById("password");
			var passwordCk = document.getElementById("passwordCk");
			var email = document.getElementById("email");
			var name = document.getElementById("name");
			var phone = document.getElementById("phone");
			var re = /^[a-z][a-z0-9_]{6,14}$/;
			var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-])(?=.*[0-9]).{8,25}$/;
			var emailCk = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			var reg = /^[0-9]+/g;
			
			if(id.value == "") {
				event.preventDefault();
				alert("아이디를 입력해주세요");
				id.focus(); // 아이디 공백시 커서 깜빡임
				return false;
			};
// 			if(id.value != re ) {
// 				event.preventDefault();
// 				alert("영소문자 또는 숫자 또는 언더바(_)로 구성되어야함. 글자수는 7~15자 사이 이어야합니다");
// 				id.focus(); // 아이디 공백시	 커서 깜빡임
// 				return false;
// 			};
			
			
			if(password.value == "") {
				event.preventDefault();
				alert("비밀번호를 입력해주세요");
				password.focus(); // 비밀번호 공백시 커서 깜빡임
				return false;
			};
			
			if(!pwdCheck.test(password.value)) {
				event.preventDefault();
				alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
				password.focus(); // 비밀번호 공백시 커서 깜빡임
				return false;
			};
			
			if(password.value != passwordCk.value) {
				event.preventDefault();
				alert("비밀번호가 일치하지 않습니다.");
				passwordCk.focus();
				return false;
			};
			
			if(!email.value || !emailCk.test(email.value)) {
				event.preventDefault();
				alert("올바른 이메일 형식이 아닙니다.");
				email.focus();
				return false;
			};
			
			if(!name.value) {
				event.preventDefault();
				alert("이름을 입력해주세요");
				name.focus();
				return false;
			};
			
			if(!reg.test(phone.value)) {
				event.preventDefault();
				alert("전화번호는 숫자만 입력할 수 있습니다.");
				phone.focus();
				return false;
			};
			
			document.join_form.submit();
		};
		</script>
		<jsp:include page="../includes/footer.jsp" />
	<!-- End of Footer -->
	</div>
	<!-- end of site-wrap -->
	<jsp:include page="../includes/foot.jsp" />
</body>
</html>