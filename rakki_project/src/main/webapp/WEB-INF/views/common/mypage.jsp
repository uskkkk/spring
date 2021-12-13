<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>
<!DOCTYPE html>
<html lang="ko">


<head>
<jsp:include page="../includes/head.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
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
								<sec:authorize access="isAuthenticated()">
								<sec:authentication property="principal" var="pinfo"/>
									<strong class="name">${pinfo.member.name}</strong>
									<p class="email">${pinfo.member.email}</p>
								</sec:authorize>
									<div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="inventory_box">
					<!--  -->
					<!--  -->
					</div>
					
					<!-- 구매 내역 시작 -->
					<div class="my_home_title">
						<h3 class="title">구매 내역</h3>
						<a class="btn_more">
							<a href="#" class="btn_txt">더보기</a>
						</a>
					</div>
					<div class="purchase_list_tab">
						<div class="purchase_list_item">
							<a class="tab_link" href="#">
								<dl class="tab_box">
									<dt class="title">전체</dt>
									<dd class="count">0</dd>
								</dl>
							</a>
						</div>
						<div class="purchase_list_item">
							<a class="tab_link" href="#">
								<dl class="tab_box">
									<dt class="title">입찰 중</dt>
									<dd class="count">0</dd>
								</dl>
							</a>
						</div>
						<div class="purchase_list_item">
							<a class="tab_link" href="#">
								<dl class="tab_box">
									<dt class="title">진행 중</dt>
									<dd class="count">0</dd>
								</dl>
							</a>
						</div>
						<div class="purchase_list_item">
							<a class="tab_link" href="#">
								<dl class="tab_box">
									<dt class="title">종료</dt>
									<dd class="count">0</dd>
								</dl>
							</a>
						</div>
					</div>
					<ul class="purchase_product_list">
						<li class="user_product_list">
							<img alt="" src="">
							<div>
								<p class="user_product_list_name">상품명</p>
								<p class="user_product_list_name">사이즈</p>
							</div>
							<div class="user_product_list_stat">
								<p>정산완료</p>
							</div>
						</li>
						<li class="user_product_list">
							<img alt="" src="">
							<div>
								<p class="user_product_list_name">상품명</p>
								<p class="user_product_list_name">사이즈</p>
							</div>
							<div class="user_product_list_stat">
								<p>정산완료</p>
							</div>
						</li>
						<li class="user_product_list">
							<img alt="" src="">
							<div>
								<p class="user_product_list_name">상품명</p>
								<p class="user_product_list_name">사이즈</p>
							</div>
							<div class="user_product_list_stat">
								<p>정산완료</p>
							</div>
						</li>
					</ul>
						<!-- 구매 내역 종료 -->
						
						<!-- 판매 내역 시작 -->
						<div class="my_home_title">
						<h3 class="title">판매 내역</h3>
						<a class="btn_more">
							<a href="#" class="btn_txt">더보기</a>
						</a>
					</div>
					<div class="purchase_list_tab">
						<div class="purchase_list_item">
							<a class="tab_link" href="#">
								<dl class="tab_box">
									<dt class="title">전체</dt>
									<dd class="count">0</dd>
								</dl>
							</a>
						</div>
						<div class="purchase_list_item">
							<a class="tab_link" href="#">
								<dl class="tab_box">
									<dt class="title">입찰 중</dt>
									<dd class="count">0</dd>
								</dl>
							</a>
						</div>
						<div class="purchase_list_item">
							<a class="tab_link" href="#">
								<dl class="tab_box">
									<dt class="title">진행 중</dt>
									<dd class="count">0</dd>
								</dl>
							</a>
						</div>
						<div class="purchase_list_item">
							<a class="tab_link" href="#">
								<dl class="tab_box">
									<dt class="title">종료</dt>
									<dd class="count">0</dd>
								</dl>
							</a>
						</div>
					</div>
						<ul class="purchase_product_list">
						<li class="user_product_list">
							<img alt="" src="">
							<div>
								<p class="user_product_list_name">상품명</p>
								<p class="user_product_list_name">사이즈</p>
							</div>
							<div class="user_product_list_stat">
								<p>정산완료</p>
							</div>
						</li>
						<li class="user_product_list">
							<img alt="" src="">
							<div>
								<p class="user_product_list_name">상품명</p>
								<p class="user_product_list_name">사이즈</p>
							</div>
							<div class="user_product_list_stat">
								<p>정산완료</p>
							</div>
						</li>
						<li class="user_product_list">
							<img alt="" src="">
							<div>
								<p class="user_product_list_name">상품명</p>
								<p class="user_product_list_name">사이즈</p>
							</div>
							<div class="user_product_list_stat">
								<p>정산완료</p>
							</div>
						</li>
					</ul>
						<!-- 판매 내역 종료 -->
						
						<!-- 관심 상품 시작-->
						<div class="my_home_title">
						<h3 class="title">관심 상품</h3>
						<a class="btn_more">
							<a href="#" class="btn_txt">더보기</a>
						</a>
					</div>
					<!-- 관심 상품 종료-->
					
				</div>
			</div>
		</div>
		<jsp:include page="../includes/footer.jsp" />
	</div>
	<!-- End of Footer -->
	<jsp:include page="../includes/foot.jsp" />
</body>
</html>