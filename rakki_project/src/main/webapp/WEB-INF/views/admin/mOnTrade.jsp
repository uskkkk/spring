<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
	
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>administrator</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper" style="position: relative;">

		<jsp:include page="../includes/adminSidebar.jsp"/>
		
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow" id="nav">
	                <div style="margin-left: 650px; margin-top: 25px">
						<ul>
					    	<li><a href="${pageContext.request.contextPath}/rakki/main">HOME</a></li>
					        <li><a href="${pageContext.request.contextPath}/admin/mNoticeList">NOTICE</a></li>
					        <li><a href="#">LOGOUT</a></li>
					    </ul>
					</div>
	            </nav>
	            <!-- End of Topbar -->

                            <div class="card shadow mb-4" style="margin: 15px; height: 90%">
                               <!-- Card Header - Dropdown -->
                                <div 
                                    class="card-header py-1" >
                            		<h4 style="font-weight: bold; margin-top: 5px; margin-left: 30px"> >>  거래 관리(거래 상태 체크)</h4>
                            	</div>
								
	                            <div class="row mt-4" style="margin-left: 320px">
	                            	<a href="${pageContext.request.contextPath}/admin/mTrade" style="text-decoration: none;">
		                                <div style="width: 160px; margin-left: 10px; margin-right: 10px">
		                                    <div class="card bg-Light text-white shadow">
		                                        <div class="card-body" style="text-align: center; font-size: 18px; font-weight: bold; color: black;">
		                                            거래대기
		                                        </div>
		                                    </div>
		                                </div>
	                                </a>
	                                <a href="${pageContext.request.contextPath}/admin/mOnTrade" style="text-decoration: none;">
		                                <div style="width: 160px; margin-left: 10px; margin-right: 10px">
		                                    <div class="card bg-success text-white shadow">
		                                        <div class="card-body" style="text-align: center; font-size: 18px; font-weight: bold;">
		                                            거래체결
		                                        </div>
		                                    </div>
		                                </div>
	                                </a>
	                            </div>
							<form id="frm_search">
									<!-- Product Code Search -->
							
							<div class="my-2" style="position: absolute; top: 170px">
							<h6 style="margin-left: 70px; ">상품 개수 : <b>[ <c:out value="${total}" /> ]</b> 개</h6>
							</div>
							
							<div class="row">
	                                <div class="col-sm-12 mt-3">
			                                <table id="dataTable">
			                                    <thead>
				                                	<tr>
				                                    	<th>거래번호</th>
				                                        <th>구매자ID</th>
				                                        <th>판매자ID</th>
				                                        <th>거래가격</th>
				                                        <th>체결일</th>
				                                        <th>판매상태</th>
				                                        <th>구매상태</th>
				                                    </tr>
			                                	</thead>
			                                    <tbody>
												<c:forEach items="${list}" var="trade">
													<tr>
														<td style="text-align: center;"><c:out value="${trade.tradeNo}" /></td>
														<td style="text-align: center;"><c:out value="${trade.buyer_id}" /></td>
														<td style="text-align: center;"><c:out value="${trade.seller_id}" /></td>
														<td style="text-align: center;"><c:out value="${trade.price}" /></td>
														<td style="text-align: center;"><fmt:formatDate value="${trade.trade_date}" pattern="yyyy-MM-dd" /></td>
														<td style="text-align: right;"><c:out value="${trade.sell_stat}" /><a href="mSellStatCheck${page.cri.params}&tradeNo=${trade.tradeNo}" class="btn btn-primary btn-sm ml-3" style="font-size: 11px" id="sSUpdate">update</a></td>
														<td style="text-align: right;"><c:out value="${trade.buy_stat}" /><a href="mBuyStatCheck${page.cri.params}&tradeNo=${trade.tradeNo}" class="btn btn-primary btn-sm ml-3" style="font-size: 11px" id="bSUpdate">update</a></td>
													</tr>									
												</c:forEach>						
			                                	</tbody>
			                                </table>
	                                </div>
	                            </div>  
								
								<div class="row" style="margin-top: 40px; margin-right: 50px;">
									<div class="col-sm-12 col-md-5"></div>
									<div class="col-sm-12 col-md-7">
										<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
											<ul class="pagination">
												<li class="paginate_button page-item previous ${page.prev ? '' : 'disabled'}" id="dataTable_previous">
													<a href="mOnTrade?pageNum=${page.startPage-1}&amount=${page.cri.amount}" class="page-link">이전</a>
												</li>
												
												<c:forEach begin="${page.startPage }" end="${page.endPage}" var="p">
													<li class="paginate_button page-item ${p == page.cri.pageNum ? 'active' : ''}">
														<a href="mOnTrade?pageNum=${p}&amount=${page.cri.amount}&type=${page.cri.type}&keyword=${page.cri.keyword}"  class="page-link">${p}</a>
													</li>
												</c:forEach>
												
												<li class="paginate_button page-item next ${page.next ? '' : 'disabled'}" id="dataTable_next">
													<a href="mOnTrade?pageNum=${page.endPage +  1}&amount=${page.cri.amount}" class="page-link">다음</a>
												</li>												
											</ul>
										</div>
									</div>
								</div>
			                  </div>
			            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>


    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/admin/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/admin/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/resources/admin/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/demo/chart-area-demo.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/demo/chart-pie-demo.js"></script>
    
<script>
$(function() {
 	
 	//검색 버튼 클릭 
	$('#btn_search').click(function() {
		event.preventDefault();			  
		if ($("#type option:selected").val() == "전체보기") {
			location.href = 'mProductList'
		}
		if ($("#keyword").val() == "") {
			alert("검색키워드를 입력해 주세요");
			$("#keyword").focus();
			return false;
		}
		$("#frm_search").submit();
	});    	
});
</script>

</body>

</html>