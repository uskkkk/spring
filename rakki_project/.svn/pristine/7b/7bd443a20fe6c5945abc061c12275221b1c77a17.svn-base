<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.6.0/chart.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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

                            <div class="card shadow mb-4" style="margin: 15px; height: 95%">
                               <!-- Card Header - Dropdown -->
                                <div 
                                    class="card-header py-1" >
                            		<h4 style="font-weight: bold; margin-top: 5px; margin-left: 30px"> >> 매출관리</h4>
                            	</div>
								
								<div class="row mt-4" style="margin-left: 220px">
	                            	<a href="${pageContext.request.contextPath}/admin/year/2021" style="text-decoration: none;">
		                                <div style="width: 160px; margin-left: 10px; margin-right: 10px">
		                                    <div class="card bg-success text-white shadow">
		                                        <div class="card-body" style="text-align: center; font-size: 18px; font-weight: bold; ">
		                                            연도별
		                                        </div>
		                                    </div>
		                                </div>
	                                </a>
	                                <a href="${pageContext.request.contextPath}/admin/month/2021" style="text-decoration: none;">
		                                <div style="width: 160px; margin-left: 10px; margin-right: 10px">
		                                    <div class="card bg-success text-white shadow">
		                                        <div class="card-body" style="text-align: center; font-size: 18px; font-weight: bold;">
		                                            월별
		                                        </div>
		                                    </div>
		                                </div>
	                                </a>
	                                <a href="${pageContext.request.contextPath}/admin/day/11" style="text-decoration: none;">
		                                <div style="width: 160px; margin-left: 10px; margin-right: 10px">
		                                    <div class="card bg-Light text-white shadow">
		                                        <div class="card-body" style="text-align: center; font-size: 18px; font-weight: bold; color: black;">
		                                            일별
		                                        </div>
		                                    </div>
		                                </div>
	                                </a>
	                            </div>
								
								<form id="frm_search" method="post">
									<table class="wp-table" style="width: 600px; margin-left: 185px">
									    <tr>
										    <th>월</th>
										    <th style="text-align:center; ">검색</th>
									    </tr>
									    <tr>
									    	<td>
											    <select name="month" id="month" class="custom-select custom-select-sm form-control form-control-sm mr-3">
													<option value="1" >1</option>
													<option value="2" >2</option>
													<option value="3" >3</option>
													<option value="4" >4</option>
													<option value="5" >5</option>
													<option value="6" >6</option>
													<option value="7" >7</option>
													<option value="8" >8</option>
													<option value="9" >9</option>
													<option value="10" >10</option>
													<option value="11" selected>11</option>
													<option value="12" >12</option>
												</select>
										    </td>
										    <sec:csrfInput/>
										    <td rowspan="2"><button class="btn btn-outline-primary float-right" id="btnSubmit" style="width:150px;  border-radius: 8px; margin-right: 50px">검색</button></td>
									    </tr>
									 </table>
								</form>
										<div id="chart" style="width: 85%; height: 20%; margin-left: 80px">
										  	<canvas id="ctx"></canvas>
									  	</div>
										<table id="dataTableD" style="height: 70%">
		                                    <thead>
			                                	<tr>
			                                        <th>일</th>
			                                        <th>매출액</th>
			                                    </tr>
		                                	</thead>
		                                    <tbody>
											<c:forEach items="${day}" var="day">
												<tr>
													<td style="text-align: center;"><c:out value="${day.DAY}" />일</td>
													<td style="text-align: center;"><fmt:formatNumber type="number" value="${day.INCOME}"/>원</td>
												</tr>									
											</c:forEach>						
		                                	</tbody>
		                                </table>
			                  </div>
<script>
	var month = '${month}';
	$(function() {
		$.getJSON("/salesD/"+month)
		.done(function(data) {
			var ctx = $("#ctx")[0].getContext('2d');
			var labels = data.map(obj=>obj.DAY);
			var datas = data.map(obj=>obj.INCOME);
			var bgColer = [
				'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
			];
			var borderColer = [
				 'rgba(255,99,132,1)',
	             'rgba(54, 162, 235, 1)',
	             'rgba(255, 206, 86, 1)',
	             'rgba(75, 192, 192, 1)',
	             'rgba(153, 102, 255, 1)',
	             'rgba(255, 159, 64, 1)'
			];
			
			var myChart = new Chart(ctx, {
			    type: 'bar',
			    data: {
			        labels: labels,
			        datasets: [{
			            label: '일별 매출 현황',
			            data: datas,
			            backgroundColor: bgColer,
			            borderColor: borderColer,
			            borderWidth: 1
			        }]
			    },
			    options: {
			        maintainAspectRatio: false, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
			        scales: {
			            yAxes: [{
			                ticks: {
			                    beginAtZero:true
			                }
			            }]
			        }
			    }
			});
		})
	})
</script>
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

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

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
    
<script>
$(function() {
});
</script>
</body>

</html>