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
							<h3 class="title_h3">결제 정보</h3>
							<p class="sub_title">수수료(페널티, 착불배송비 등)가 정산되지 않을 경우, 별도 고지 없이 해당 금액을 결제 시도할 수 있습니다.</p>
						</div>
						<div class="btn_box">
							<a href="paymentReg" class="btn btn_add">
								<span>+ 새 카드 추가</span>
							</a>
						</div>
					</div>
					
					<div class="my_list">
<c:forEach items="${list}" var="pay">					
						<div class="basic">
							<div class="my_item is_active">
								<div class="info_bind">
									<div class="payment_info">
										<div class="name_box">
											<span class="bank_name">은행명:${pay.bank}</span>
										</div>

										<div class="number_info">
											<span class="account_num">계좌정보:${pay.account_num}</span>
										</div>
										<div class="number_info">
											<span class="creadit_num">카드정보:${pay.credit_num}</span>
										</div>
									</div>
								</div>
								<div class="btn_bind">			
									<a href="paymentMod?payment_no=${pay.payment_no}" type="button" class="btn outlinegrey small">수정</a>
									<a href="paymentRmv?payment_no=${pay.payment_no}" type="button" class="btn outlinegrey small">삭제</a>
								</div>
							</div>
						</div>
</c:forEach>						
					</div>
					
										
					
				</div>
			</div>
		</div>
		
     <!-- list Modal-->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Message</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body"></div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">close</button>
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
		
	if ("<sec:authentication property='principal.member.mno'/>" != "${mno}" ) {
		alert("로그인유저의 계좌정보가 아닙니다.");
		location.href= "/common/mypage";		
	}
	
	
	var result = '${result}';
	checkModal(result);
	history.replaceState({},null,null);
	function checkModal(result) {
		if (!result || history.state) {
			return;
		}
		var text = result == 'success' ? "처리가 완료되었습니다" : "" + result ;  
		
		$("#myModal .modal-body").text(text);
		$("#myModal").modal("show");
	}
	 	
});	
</script> 
</body>
</html>