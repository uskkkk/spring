<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
<style>
  #noticeTable {
    width: 90%;
    border-collapse: collapse;
  }
  #noticeTable th{
    border-bottom: 1px solid #444444;
    padding: 10px;
    border-top: none;
    border-width: 2px;
  }
  #noticeTable tbody td{
  }
</style>
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

                            <div class="card shadow mb-4" style="margin: 15px; height: 89%">
                               <!-- Card Header - Dropdown -->
                                <div 
                                    class="card-header py-1" >
                            		<h4 style="font-weight: bold; margin-top: 5px; margin-left: 30px"> >> 공지사항</h4>
                            	</div>
								
								<!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- DataTales Example -->
                    <div class="" style=" height: 850px;">
                        <div class="card-body">
                            <div class="table dataTables_wrapper">
                            
	                            <div class="row" style=" margin-left: 100px">
	                                <div class="col-sm-12">
		                                <table  id="noticeTable">
		                                	<thead>
		                                		<th><h4 class="font-weight-bold text-dark mt-3" style="margin-top: 20px;">공지사항</h4></th>
		                                		<th><a href="mNoticeRegister" class="btn btn-sm btn-primary float-right">Register Notice</a></th>
		                                	</thead>
		                                    <tbody>
		                                    <c:forEach items="${list}" var="notice">
		                                    	<tr>
		                                    		<td><a href="mNoticeDetail1${page.cri.params}&nno=${notice.nno}" style="color: black;"><c:out value="${notice.title}"/></a></td>
		                                    		<td><fmt:formatDate value="${notice.regDate}" pattern="yy-MM-dd"/></td>
		                                    	</tr>
		                                    </c:forEach>
		                                    </tbody>
		                                </table>
	                                </div>
	                            </div>    
						    	<hr style="width: 730px; margin-right: 80px">
						    	
						    	<div class="row mb-3" style="margin-left: 580px; width: 800px">
                            		<div class="col-md-6">
                            			<form class="form-inline">
	                            			<select name="type" class="custom-select custom-select-sm form-control form-control-sm" style="margin-top: 12px; margin-right: 10px">
	                            				<option value="T">제목</option>
	                            				<option value="C">내용</option>
	                            			</select>
	                            			<div id="dataTable_filter" class="input-group" >
	                            				 <input name="keyword" style="margin-top: 12px;" type="search" class="form-control form-control-sm" placeholder="search.." aria-controls="dataTable">
						                         <button class="btn btn-primary mt-2" id="btn_search" style="width: 60px; height: 36px;  padding: 2px; float: right;">검색</button>
	                            			</div>
	                            			<input type="hidden" name="pageNum" value="1">
	                            			<input type="hidden" name="amount" value="${page.cri.amount}">
	                            			<sec:csrfInput/>
                            			</form>
                            		</div>
                            	</div>
                            	<div class="row" >
                            		<div class="col-sm-12 col-md-5">
                            		</div>
                            		<div class="col-sm-12 col-md-7" style="margin-top: 10px">
                            			<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                            				<ul class="pagination pagination-sm">
                            					<li class="paginate_button page-item previous ${page.prev ? '' : 'disabled'}" id="dataTable_previous">
                            						<a href="mNoticeList?pageNum=${page.startPage-1}&amount=${page.cri.amount}" class="page-link">Previous</a>
                            					</li>
                            					
                            					<c:forEach begin="${page.startPage}" end="${page.endPage}" var = "p">
                            					<li class="paginate_button page-item ${p == page.cri.pageNum? 'active' : ''}">
                            						<a href="mNoticeList?pageNum=${p}&amount=${page.cri.amount}" class="page-link">${p}</a>
                            					</li>
                            					</c:forEach>
                            					
                            					<li class="paginate_button page-item next ${page.next ? '' : 'disabled'}" id="dataTable_next">
                            						<a href="mNoticeList?pageNum=${page.endPage+1}&amount=${page.cri.amount}"class="page-link">Next</a>
                            					</li>
                            				</ul>
                            			</div>
                            		</div>
                            	</div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->
							
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