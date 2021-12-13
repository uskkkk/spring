<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
							<h3 class="title_h3">결제 정보 (카드삭제)</h3>
							<p class="sub_title">수수료(페널티, 착불배송비 등)가 정산되지 않을 경우, 별도 고지 없이 해당 금액을 결제 시도할 수 있습니다.</p>
						</div>
					</div>
					
					<div class="my_list">
						<form method="post" name="Frm" >
							<sec:csrfInput/>
							<input type="hidden" name="payment_no" value="${payment.payment_no }" />
							<input type="hidden" name="mno" value="<sec:authentication property='principal.member.mno'/>"  readonly/>
							<div class="basic" style="width: 700px;" >
								<label for ="bank"><p class="label-txt">정산은행</p></label>
								<input type="email" class="input" id="bank" name="bank"  value="${payment.bank }">
								<div class="line-box">
									<div class="line"></div>
								</div>
								
								<label for ="account_num"><p class="label-txt">계좌번호</p></label>
								<input type="text"class="input" id="account_num" name="account_num" value="${payment.account_num }"   readonly/>
								<div class="line-box">
									<div class="line"></div>
								</div>
								
								<label for ="credit_num"><p class="label-txt">카드번호</p></label>
								<input type="text" class="input" id="credit_num" name="credit_num" value="${payment.credit_num }"   readonly/>
								<div class="line-box">
									<div class="line"></div>
								</div>

								<input class="btn btn-primary sm" id ="btnDlt" type="button"  value="삭제하기" />
							</div>
						</Form>
					</div>
		
				</div>
			</div>
		</div>
		<jsp:include page="../includes/footer.jsp" />
	</div>
	<!-- End of Footer -->
	<jsp:include page="../includes/foot.jsp" />
	
	<script>
		$(function() {
			
			if ("<sec:authentication property='principal.member.mno'/>" != "${payment.mno}" ) {
				alert("로그인유저의 계좌정보가 아닙니다.");
				location.href= "/common/mypage";		
			}
			
			$("#btnDlt").on("click",function() {
				
				if (confirm('이계좌정보를 삭제하시겠습니까?')) {
					$("form").submit();				
				}
			})						
		});
	</script>
	
</body>
</html>