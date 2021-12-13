<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
			<h1 class="h3 mb-2 text-gray-800">구매하기</h1>
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
					</div>			
				</div>
				
				<div class="before_select">
					<div class="select_area mo column_double">
						<ul class="select_result">
							<!-- 신발 -->
							<c:if test="${result.category == 1}">
								<c:forEach items="${result.getCat1()}" var="price">
									<li class="select_item">
										<a class="select_link" data-size="${price[0]}" data-price="${price[1]}">
											<div class="link_inner">
												<span class="size">${price[0]}</span>
												<c:if test="${ not empty price[1]}"><span class="price_red"><fmt:formatNumber value="${price[1]}" pattern="#,###" /></span></c:if><c:if test="${ empty price[1]}"><span class="price">구매입찰</span></c:if>							
											</div>
										</a>
									</li>
								</c:forEach>						
							</c:if>
							<!-- 의류 -->
							<c:if test="${result.category != 1}">
								<c:forEach items="${result.getCat2()}" var="price">
									<li class="select_item">
										<a class="select_link"  data-size="${price[0]}" data-price="${price[1]}">
											<div class="link_inner">
												<span class="size">${price[0]}</span>
												<c:if test="${ not empty price[1]}"><span class="price_red"><fmt:formatNumber value="${price[1]}" pattern="#,###" /></span></c:if><c:if test="${ empty price[1]}"><span class="price">구매입찰</span></c:if>							
											</div>
										</a>
									</li>
								</c:forEach>						
							</c:if>
							
						</ul>				
					</div>
				</div>
				
				<div>
					<div class="myCard">사이즈 :</div>
					</div>
				
				<div class="order_btn_area">
					<a  class="btn_order order_buy general clickable">
						<div class="box">
							<strong class="order_case_title">일반</strong>
							<div class="order_case_info">
								<span class="order_price"> </span>
								<span class="order_desc" > 일반배송 </span>
							</div>
						</div>
					</a>
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
<sec:csrfInput/>
 
<script>
$(function() {
	$(".select_item").on("click","a",function() {	
		var size = $(this).data("size");
		var price = $(this).data("price");
		if (price == "") {
			$(".order_price").html("구매입찰");
			$(".myCard").html("사이즈 : " + size);
		} else {
			$(".order_price").html(price);
			$(".myCard").html("사이즈 : "+ size);
		}
		$(".select_item").css({'background-color' : 'white'});        //clear
		$(this).parents("li").css({'background-color' : '#c7ecee'});  //선택영역표시
		//$(".myCard").css({'background-color' : '#ef6253', 'color' : 'white'});
    })
    
	$(".order_btn_area").on("click","a",function() {		
		if ($(".myCard").text() == "사이즈 :" ) {
			alert("사이즈를 선택해 주세요");
			return;
		}
		location.href= "check?product_no=${result.product_no}&size_type=" + $(".myCard").text().replace("사이즈 : ","") ;
    })

});

</script>
    
  </body>
</html>