<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="ko">


<head>
<jsp:include page="../includes/head.jsp" />
<sec:csrfMetaTags/>
</head>
<body>
	<div class="site-wrap">
		<header class="site-navbar" role="banner">
			<jsp:include page="../includes/header.jsp" />
		</header>
		<div class="container my lg">
			<div>
			<!-- Side Bar -->
			<jsp:include page="../includes/mypageSidebar.jsp"></jsp:include>
				<!-- Side Bar -->
			</div>
			<div class="content_area">
				<div class="content_main">
					<div class="user_membership">
						<div class="user_detail">
							<div class="user_thumb">
<!-- 								<img alt="user" src="" class="thumbnail"> -->
							</div>
							<div class="user_info">
								<div class="info_box">
								<sec:authorize access="hasRole('ROLE_MEMBER')">
									<sec:authentication property="principal" var="pinfo"/>
									<strong class="name">${pinfo.member.name}</strong>
									<p class="email">${pinfo.member.email}</p>
								
								</div>
							</div>
						</div>
					</div>
					<div class="inventory_box">
					<!--  -->
					<!--  -->
					</div>
					<div class="login_info">
						<h4>로그인 정보</h4>
					</div>
					<form class="userModify" method="post" action="/common/userModify">
				<label>
					<p class="label-txt">아이디</p> 
					<p>${pinfo.member.id}</p>
					<div class="line-box">
						<div class="line"></div>
					</div>
					<button type="button" class="btn btn_modify outlinegrey small">변경</button>
				</label>
				 <label>
					<p class="label-txt">비밀번호</p>
					<input type="password" class="input" id="password" name="password">
					<div class="line-box">
						<div class="line"></div>
					</div>
					<button type="button" class="btn btn_modify outlinegrey small">변경</button>
				</label> 
				<label>
					<p class="label-txt">이메일</p>
					<input type="email" class="input" id="email" name="email" value="${pinfo.member.email}">
					<div class="line-box">
						<div class="line"></div>
					</div>
					<button type="button" class="btn btn_modify outlinegrey small">변경</button>
				</label>
				<label>
					<p class="label-txt">이름</p>
					<input type="text"class="input" id="name" name="name" value="${pinfo.member.name}">
					<div class="line-box">
						<div class="line"></div>
					</div>
					<button type="button" class="btn btn_modify outlinegrey small">변경</button>
				</label>
				<label>
					<p class="label-txt">전화번호</p>
					<input type="text" class="input" id="phone" name="phone" value="${pinfo.member.phone}">
					<div class="line-box">
						<div class="line"></div>
					</div>
					<button type="button" class="btn btn_modify outlinegrey small">변경</button>
				</label>
				</sec:authorize>
				<sec:csrfInput/>
				<div>
				<button class="loginBtn" type="submit" onclick="modify(this)">변경하기</button>
				<a href="${pageContext.request.contextPath}/common/deleteUser">탈퇴</a>
				</div>
			</form>
					</div>
				</div>
			</div>
		<jsp:include page="../includes/footer.jsp" />
		<script>
		function modify() {
			event.preventDefault();
			alert("미구현페이지입니다")
		}
		</script>
	</div>
	<!-- End of Footer -->
	<jsp:include page="../includes/foot.jsp" />
</body>
</html>