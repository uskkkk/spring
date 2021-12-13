<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">


<head>
<jsp:include page="../includes/head.jsp" />
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
					<div class="content_title">
						<div class="title">
							<h3>구매 내역</h3>
						</div>
					</div>
					<div class="purchase_list_tab">
						<div class="purchase_list_item">
							<a class="tab_link" href="#">
								<dl class="tab_box">
									<dt class="title">전체</dt>
									<dd class="count">${count.count1 + count.count2+count.count3}</dd>
								</dl>
							</a>
						</div>
						<div class="purchase_list_item">
							<a class="tab_link" href="#">
								<dl class="tab_box">
									<dt class="title">구매 입찰 중</dt>
									<dd class="count">${count.count1}</dd>
								</dl>
							</a>
						</div>
						<div class="purchase_list_item">
							<a class="tab_link" href="#">
								<dl class="tab_box">
									<dt class="title">진행 중</dt>
									<dd class="count">${count.count2}</dd>
								</dl>
							</a>
						</div>
						<div class="purchase_list_item">
							<a class="tab_link" href="#">
								<dl class="tab_box">
									<dt class="title">종료</dt>
									<dd class="count">${count.count3}</dd>
								</dl>
							</a>
						</div>
					</div>
					<ul class="purchase_product_list">
						<li>No					
							<div class="row">
							  <div class="col-sm-2" >이미지</div>
							  <div class="col-sm-4" >
									<p class="user_product_list_name">상품명</p>
									<p class="user_product_list_name">사이즈</p>
							  </div>
							  <div class="col-sm-3" >
									<p class="user_product_list_name">가격</p>
									<p class="user_product_list_name">거래상태</p>
							  </div>
							  <div class="col-sm-3" >
									<p class="user_product_list_name">등록일</p>
									<p class="user_product_list_name">체결일</p>
							  </div>
							</div>							
						</li>					
<c:forEach items="${list}" var="buy">					
						<li >${buy.no}					
							<div class="row">
							  <div class="col-sm-2" ><img style="background-color: rgb(235,240,245); width:80px; height:80px;" alt="" src="${pageContext.request.contextPath}/resources/images/${buy.image}/${buy.image}.png"></div>
							  <div class="col-sm-4" >
									<p class="user_product_list_name">${buy.name_en}</p>
									<p class="user_product_list_name">${buy.size_type}</p>
							  </div>
							  <div class="col-sm-3" >
									<p class="user_product_list_name">
										<c:if test="${ empty buy.price }">-</c:if>
										<c:if test="${ not empty buy.price }"><fmt:formatNumber value="${buy.price}" pattern="#,###" />원</c:if>
									</p>
									<p class="user_product_list_name">${buy.buy_stat}</p>
							  </div>
							  <div class="col-sm-3" >
									<p class="user_product_list_name"><fmt:formatDate value="${buy.regdate}" pattern="yyyy-MM-dd" /></p>
									<p class="user_product_list_name">
										<c:if test="${ empty buy.trade_date }">-</c:if>
										<c:if test="${ not empty buy.trade_date }"><fmt:formatDate value="${buy.trade_date}" pattern="yyyy-MM-dd" /></c:if>
									</p>
							  </div>
							</div>							
						</li>
</c:forEach>												
					</ul>
				</div>
			</div>
		</div>
		<jsp:include page="../includes/footer.jsp" />
	</div>
	<!-- End of Footer -->
	<jsp:include page="../includes/foot.jsp" />
</body>
</html>