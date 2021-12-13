<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">


  <head>
<jsp:include page="../includes/head.jsp"/>
<style>
	.code, .name { line-height: 17px; font-size: 14px; margin-bottom: 5px;}
	.translated_name { line-height: 16px; font-size: 13px; letter-spacing: -.07px; letter-spacing: -.05px; color: rgba(34,34,34,.5);}
	.align-right { text-align: right;}
	.font-bold { font-weight: bold; color:black;}
	.btn-sell-now { background-color: #41b979; border-radius: 10px; color: white; width:240px; margin-left: 40px; line-height :20px;}
	.btn-buy-now { background-color: #ef6253; border-radius: 10px; color: white; width:240px; line-height :20px;}
	.p-info1 { border-right: 1px solid rgba(0, 0, 0, 0.1); padding-left: 10px;}
	.p-info2 { padding-left: 10px;}
	.way_img { width: 40px; height: 40px;}
</style>

  </head>
  <body>
    
<div class="site-wrap">
    <header class="site-navbar" role="banner">
<jsp:include page="../includes/header.jsp"/>      
    </header>
	<div class="site-section">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<c:if test="${ empty result.image }">
						<img style="background-color: rgb(235,240,245);" src="${pageContext.request.contextPath}/resources/images/noimage.png" alt="Image"  class="img-fluid" />
					</c:if>
					<c:if test="${ not empty result.image }">
						<img style="background-color: rgb(235,240,245);" src="${pageContext.request.contextPath}/resources/images/${result.image}/${result.image}.png" alt="Image"  class="img-fluid" />
					</c:if>				
				</div>
				<div class="col-md-6">
					<h2 class="text-black">${result.brand}</h2>
					<div class="product_detail">
						<p class="name font-bold">${result.name_en}</p>
						<p class="translated_name">${result.name_ko}</p>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-6"><p class="name">최근거래가</p> </div>
						<div class="col-md-6 align-right font-bold"><fmt:formatNumber value="${result.trade_price}" pattern="#,###" />원 </div>
					</div>
					<p>
						<a href="/buy/select?product_no=${result.product_no}" class="btn btn-sm btn-buy-now"><b>구 매</b><BR>&nbsp;<c:if test="${ not empty result.buy_price}">즉시구매가:&nbsp;&nbsp;<fmt:formatNumber value="${result.buy_price}" pattern="#,###" />원</c:if> </a>
						<a href="/sell/select?product_no=${result.product_no}" class="btn btn-sm btn-sell-now"><b>판 매</b><BR>&nbsp;<c:if test="${ not empty result.sell_price}">즉시판매가:&nbsp;&nbsp;<fmt:formatNumber value="${result.sell_price}" pattern="#,###" />원</c:if></a>
					</p>
					<hr>
					<h5 class="text-black">상품정보</h5>
					<div class="row">
						<div class="col-md-3 p-info1">
							<p class="name">모델번호</p>
							<p class="name font-bold">${result.serialNo}</p>
						</div>
						<div class="col-md-3 p-info1">
							<p class="name">출시일</p>
							<p class="name font-bold"><fmt:formatDate value="${result.release}" pattern="yyyy-MM-dd" /></p>
						</div>
						<div class="col-md-3 p-info1">
							<p class="name">컬러</p>
							<p class="name font-bold">${result.color}</p>
						</div>
						<div class="col-md-3 p-info2">
							<p class="name">발매가</p>
							<p class="name font-bold">${result.price_rel}</p>
						</div>
					</div>	
					<hr>
					<div class="name">배송정보</div>
					<div class="row">
						<div class="col-md-1">
							<img data-v-05855c6e="" src="https://kream-phinf.pstatic.net/MjAyMTA5MDZfMjIx/MDAxNjMwODk1NjkzMzQz.UtRbBxzFBX_H7Z4P8pmLdfZe8Erk1qH9pKWthl3qnvMg.EQeekXUH0aqR-mVPXiO9tmbWdI4LQ6frB-CiE_a3sHsg.PNG/a_d8e9ca1d381b4514b82b28d9c18e4794.png" alt="무료 이벤트" class="way_img">
						</div>
						<div class="col-md-11">
							<span class="name font-bold">일반택배</span><span class="name">무료이벤트</span>
							<p class="name">판매자 발송・검수 합격 후 출고</p>
						</div>
					</div>			
					
				</div>
			</div>
		</div>
	</div>
</div>
		<!-- end main content -->   

            <!-- Footer -->
<jsp:include page="../includes/footer.jsp"/>            
            <!-- End of Footer -->   
<jsp:include page="../includes/foot.jsp"/>        
  </body>
</html>