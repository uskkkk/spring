<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>
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
		<div class="container" style="margin-bottom: 250px;">
			<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 m-auto">
				<div class="panel panel-success">
					<div class="panel-heading">
					<img alt="rakki" src="${pageContext.request.contextPath}/resources/images/RAKKI-logo-black_1.png" class="rakki_image1">
						<div class="panel-title text-center">환영합니다!</div>
						<p>${error}</p>
					</div>
					<div class="panel-body">
						<form id="login-form " method="post" action="/login">
							<div class="m-5">
								<input type="text" class="form-control" name="username" id="id" placeholder="아이디를 입력해주세요." autofocus>
							</div>
							<div class="m-5">
								<input type="password" class="form-control" name="password" id="password" placeholder="비밀번호를 입력해주세요">
							</div>
							<div class="m-5">
							<sec:csrfInput/>
								<button type="submit" class="form-control btn btn-primary">로그인</button>
								<ul class="login-list">
									<li><a href="#">아이디 찾기</a></li>
									<li><a href="#">비밀번호 찾기</a></li>
								</ul>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer -->
		<jsp:include page="../includes/footer.jsp" />
	</div>
	<!-- End of Footer -->
	<jsp:include page="../includes/foot.jsp" />
</body>
</html>