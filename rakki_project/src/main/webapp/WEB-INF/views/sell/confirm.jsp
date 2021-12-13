<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../includes/head.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/buysell.css">
</head>
<body>
<div class="site-wrap">
	<header class="site-navbar" role="banner">
		<jsp:include page="../includes/header.jsp" />
	</header>

	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

		<!-- Main Content -->
		<div class="content">

			<!-- Page Heading -->
			<h1 id="h1" class="h3 mb-2 text-gray-800">판매 입찰하기</h1>
			<div class="before">
				<div class="product_info">
					<div class="product_thumb">
						<div class="product">
							<c:if test="${ empty result.image }">
								<img style="background-color: rgb(235, 240, 245);" src="${pageContext.request.contextPath}/resources/images/noimage.png" class="product_img" />
							</c:if>
							<c:if test="${ not empty result.image }">
								<img style="background-color: rgb(235, 240, 245);" src="${pageContext.request.contextPath}/resources/images/${result.image}/${result.image}.png" class="product_img" />
							</c:if>
						</div>
					</div>
					<div class="product_detail">
						<p class="code">${result.serialNo}</p>
						<p class="name">${result.name_en}</p>
						<p class="translated_name">${result.name_ko}</p>
						<p class="translated_name">사이즈:${result.size_type}</p>
					</div>
				</div>

				<div class="before_select">
					<div class="select_area mo column_double">
						<div class="price_descision_box">
							<ul class="price_list">
								<li class="list_item">
									<p class="title">즉시 구매가</p><c:if test="${ empty result.buy_price }">-</c:if> <span class="price">${result.buy_price}</span><span class="unit">원</span>
								</li>
								<li class="list_item" >
									<p class="title">즉시 판매가</p><c:if test="${ empty result.sell_price }">-</c:if> <span class="price">${result.sell_price}</span><span class="unit">원</span>
								</li>
							</ul>
							<div class="instant_group">
								<button type="button" id="btn1" class="btn btn-success sm btn-con" style="width:200px;">판매 입찰</button>
								<button type="button" id="btn2" class="btn btn-secondary sm btn-con" style="width:200px;" >즉시 판매</button>
							</div>
							<div class="price_now" >
								<dl class="price_now_box"  id="pr1">
									<dt class="price_now_title">판매 희망가</dt>
									<dd class="price" style="text-align: right">
										<span class="amount"></span><span class="unit"><input type="text" id="inputPrice" pattern="([0-9]+.{0,1}[0-9]*,{0,1})*[0-9]" required="required" placeholder="희망가 입력" autocomplete="off" class="input_amount">원</span>
									</dd>
								</dl>
								<dl class="price_now_box"  id="pr2" style="display: none;">
									<dt class="price_now_title">즉시 판매가</dt>
									<dd class="price"  style="text-align: right">
										<span class="amount">${result.sell_price}</span><span class="unit">원</span>
									</dd>
								</dl>
							</div>
							<div class="price_bind">
								<dl class="price_addition">
									<dt class="price_title">
										<span>검수비</span>
									</dt>
									<dd class="price_text">-</dd>
								</dl>
								<dl class="price_addition">
									<dt class="price_title">
										<span data-v-e0b4568a="">판매 수수료 </span>
									</dt>
									<dd class="price_text">-</dd>
								</dl>
								<dl class="price_addition">
									<dt class="price_title">
										<span data-v-e0b4568a="">배송비</span>
									</dt>
									<dd class="price_text">선불・판매자 부담</dd>
								</dl>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="order_btn_area">
				<form method="post" name="Frm">
					<sec:csrfInput/>
					<input type=hidden name="id" id="id" value ="<sec:authentication property='principal.member.id'/>"/>
					<input type=hidden name="sell_flg" id="sell_flg" value ="1"/>
					<input type=hidden name="immSell" id="immSell" value ="${result.sell_price}"/>
					<input type=hidden name="sell_price" id="sell_price" value =""/>
<%--  				<input type=hidden name="product_no" value ="${result.product_no}"/>
					<input type=hidden name="size_type" value ="${result.size_type}"/> --%>
					<button type="button" id="btn3" class="btn btn-secondary sm " style="width:650px;" disabled>판매입찰계속</button>
				</form>
			</div>
		</div>
		<!-- End of Main Content -->

	</div>
	<!-- End of Content Wrapper -->

</div>
	<!-- end site-wrap -->

	<!-- Footer -->
	<jsp:include page="../includes/footer.jsp" />
	<!-- End of Footer -->
	<jsp:include page="../includes/foot.jsp" />
	<script>
		$(function() {
			
			//판매입찰선택
			$("#btn1").on("click",function() {
				$("#inputPrice").val("");
				fnBtnControll(1);                    // 1: 판매입찰표시용
				$("#sell_flg").val("1");             // sell_flg - 1:판매입찰,  2:즉시판매 
				$("#h1").text("즉시 입찰하기");
			})
	
			//즉시판매선택
			$("#btn2").on("click",function() {
				//즉시판매가 없을경우 
				if ($("#immSell").val() == "") return;
				
				fnBtnControll(2);                    // 2: 즉시판매표시용
				$("#sell_flg").val("2");             // sell_flg - 1:판매입찰,  2:즉시판매
				$("#sell_price").val($("#immSell").val());
				$("#inputPrice").val($("#immSell").val());
				$("#h1").text("즉시 판매하기");
			})
	
			$("#btn3").on("click",function() {
				$("form").submit();
			})			
			
			// on input
			//판매희망가 입력
			$("#inputPrice").on("input", function() {
				$("#btn3").attr('class','btn btn-success sm');
				if (parseInt($(this).val()) >= 30000) {
					$("#btn3").prop("disabled",false);
				} else {
					$("#btn3").prop("disabled",true);
				}
				
		    });
			//판매희망가 입력완료
			$("#inputPrice").on("change", function() {
				if ($.isNumeric($(this).val()) == false) {
					alert("정확한 금액을 입력해 주세요");
					$(this).val("");
					fnBtnControll(1);
					return;
				}
 				if (parseInt($(this).val()) < 30000) {
					alert("30000 이상의 판매금액을 입력해 주세요");
					fnBtnControll(1);
					$(this).val("");
					return;				
				} 
				if ($("#immSell").val() != "") {
					if (parseInt($(this).val()) <= parseInt($("#immSell").val())) {
						$(this).val($("#immSell").val());
						fnBtnControll(2);          // 2: 즉시판매표시용
						$("#sell_flg").val("2");
						$("#sell_price").val($("#immSell").val());
						return;
					}					
				}
				$("#sell_price").val($(this).val());				
		    });
			
			// 1:판매입찰표시용버튼   2:즉시판매표시용버튼
			function fnBtnControll(flg) {
				if (flg == 1) {
					$("#btn1").attr('class','btn btn-success sm btn-con');
					$("#btn2").attr('class','btn btn-secondary sm btn-con');
					$("#btn3").attr('class','btn btn-secondary sm');
					$("#btn3").prop("disabled",true);
					$("#pr1").css("display","block");
					$("#pr2").css("display","none");					
				} else {
					$("#btn1").attr('class','btn btn-secondary sm btn-con');
					$("#btn2").attr('class','btn btn-success sm btn-con');
					$("#btn3").attr('class','btn btn-success sm');
					$("#btn3").prop("disabled",false);
					$("#pr1").css("display","none");
					$("#pr2").css("display","block");
				}				
			} 
			
		});
	</script>

</body>
</html>