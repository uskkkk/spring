<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
<jsp:include page="../includes/head.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/buysell.css">
  </head>
  <body>
<div class="site-wrap">
    <header class="site-navbar" role="banner">
<jsp:include page="../includes/header.jsp"/>      
    </header>
	
	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">
	
		<!-- Main Content -->
		<div class="content">
		
			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800"><font color="green">판매</font>하시기 전에 꼭 확인하세요</h1>
			<div class="before">
				<div class="product_info">
					<div class="product_thumb">
						<div class="product" >
							<c:if test="${ empty result.image }">
								<img style="background-color: rgb(235,240,245);" src="${pageContext.request.contextPath}/resources/images/noimage.png" class="product_img" />
							</c:if>
							<c:if test="${ not empty result.image }">
								<img style="background-color: rgb(235,240,245);" src="${pageContext.request.contextPath}/resources/images/${result.image}/${result.image}.png" class="product_img" />
							</c:if>
						</div>					
					</div>
					<div class="product_detail">
						<p class="code">${result.serialNo}</p>
						<p class="name">${result.name_en}</p>
						<p class="translated_name">${result.name_ko}</p>
						<p class="translated_name">사이즈:${result.size_type} </p>
					</div>			
				</div>
	
				<div class="before_select">
					<div class="select_area mo column_double">
						<div class="notice_group">
							<p class="notice_maintext">판매하려는 상품이 맞습니다.</p>
							<div class="row">
								<p class="notice_subtext col-sm-11">상품 이미지, 모델번호, 출시일, 상품명, 사이즈를 한 번 더 확인했습니다.</p>						
								<p class="notice_check col-sm-1"><input type="checkbox" class="form-check-input notice_check"  id="chk1"></p>						
							</div>
						</div>
						<hr>
						<div class="notice_group">
							<p class="notice_maintext">국내/해외에서 발매한 정품·새상품입니다.</p>
							<div class="row">
								<p class="notice_subtext col-sm-11">모든 구성품이 그대로이며, 한 번도 착용하지 않은 정품・새상품입니다. 중고품 판매는 불가능합니다.</p>					
								<p class="notice_check col-sm-1"><input type="checkbox" class="form-check-input notice_check" id="chk2"></p>				
							</div>
						</div>
						<hr>
						<div class="notice_group">
							<p class="notice_maintext">박스/패키지의 상태를 확인합니다.</p>
							<div class="row">
								<p class="notice_subtext col-sm-11">박스/패키지 상태에 따른 검수 기준을 확인했습니다.</p>
								<p class="notice_check col-sm-1"><input type="checkbox" class="form-check-input notice_check"  id="chk3"></p>					
							</div>								
							<a href="https://kream.co.kr/auth_policy?category=sneakers" target="_blank" class="check_view"> 검수기준 보기 </a>						
						</div>
						<hr>
						<div class="notice_group">
							<p class="notice_maintext">이중 포장하여 선불 발송합니다.</p>
							<div class="row">
								<p class="notice_subtext col-sm-11">반드시 이중 포장하여 택배 상자에 담아 선불 발송합니다. 합배송은 권장하지 않으며 이로 인한 박스/패키지 훼손은 판매자의 책임입니다.</p>					
								<p class="notice_check col-sm-1"><input type="checkbox" class="form-check-input notice_check"  id="chk4"></p>				
							</div>	
						</div>
						<hr>
						<div class="notice_group">
							<p class="notice_maintext">RAKKI의 최신 이용정책을 모두 확인하였으며, 판매를 계속합니다.</p>
							<div class="row">
								<p class="notice_subtext col-sm-11">건전하고 안전한 거래를 위해 반드시 숙지해야 할 미입고, 페널티, 부정거래 등의 이용정책을 확인했습니다.</p>
								<p class="notice_check col-sm-1"><input type="checkbox" class="form-check-input notice_check"  id="chk5"></p>					
							</div>
							<a data-v-4d5eb3c9="" href="https://kream.co.kr/faq?category=policy" target="_blank" class="check_view"> 이용정책 보기 </a>						
						</div>
												
					</div>
					
				</div>

				
				<div class="order_btn_area">
				<form method="get" name="Frm" action="confirm">
					<input type=hidden name="product_no" value ="${result.product_no}"/>
					<input type=hidden name="size_type" value ="${result.size_type}"/>
					<button type="button" id="btn3" class="btn btn-secondary sm " style="width:650px;" disabled>판매입찰계속</button>
				</form>
				</div>			
			</div>
			


		</div>
		<!-- End of Main Content -->
		
	</div>
<!-- End of Content Wrapper -->
		
</div>
<!-- end site-wrap -->   
   
            <!-- Footer -->
<jsp:include page="../includes/footer.jsp"/>            
            <!-- End of Footer -->   
<jsp:include page="../includes/foot.jsp"/>  
<script>
$(function() {
	
	
	$("#chk1").click(function(){
		chkControl();
	});
	$("#chk2").click(function(){
		chkControl();
	});
	$("#chk3").click(function(){
		chkControl();
	});
	$("#chk4").click(function(){
		chkControl();
	});
	$("#chk5").click(function(){
		chkControl();
	});

	//체크박스처리
	function chkControl() {
		 if ($("#chk1").is(":checked") && $("#chk2").is(":checked") && $("#chk3").is(":checked") && $("#chk4").is(":checked") && $("#chk5").is(":checked") ) {
			 $("#btn3").attr('class','btn btn-success sm');
			 $("#btn3").prop("disabled",false);
		 } else {
			 $("#btn3").attr('class','btn btn-secondary sm');
			 $("#btn3").prop("disabled",true);		 
		 }	
	}
	
	//구매계속버튼 처리
	$("#btn3").click(function(){
		$("form").submit();
    })

});

</script>
    
  </body>
</html>