<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
			<div >
			<form method="post">
			<sec:authorize access="isAuthenticated()">
				<fieldset>
					<legend>배송지 수정</legend>
					
					<label for="addName">주소명</label>
					<input type="text" name="addName" id="addName" class="form-control" value="변경전 주소명" autocomplete="off">
					<p class="msg"></p>
					
					<label for="phoneNum">전화번호</label>
					<input type="text" name="phoneNum" id="phoneNum" class="form-control" value="변경전 전화번호" autocomplete="off">
					<p class="msg"></p>
					
					<label for="address1">주소1</label>
					<input type="text" name="address1" id="address1" class="form-control" value="" readonly autocomplete="off">
					<p class="msg"></p>
		
					<label for="address2">주소2</label>
					<input type="text" name="address2" id="address2" class="form-control" value="" autocomplete="off">
					<p class="msg"></p>
					<sec:csrfInput/>
					<p><button class="btn btn-primary" id="btnMod">정보 수정</button></p>
				</fieldset>
				</sec:authorize>
			</form>
			
			</div>
			</div>
		</div>
		<jsp:include page="../includes/footer.jsp" />
	</div>
	<!-- End of Footer -->
	<jsp:include page="../includes/foot.jsp" />
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    //주소입력칸을 클릭하면
	document.getElementById("address1").addEventListener("click", function(){ 
    //카카오 지도 발생
    new daum.Postcode({
    	oncomplete: function(data) { //선택시 입력값 세팅
        	document.getElementById("address1").value = data.address; // 주소 넣기
            document.querySelector("input[name=address2]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
</script>
</html>