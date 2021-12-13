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

                    <!-- Page Heading -->
                    <h3 class="mb-1 ml-4 mt-4" style="color: black; font-weight: bold;">공지사항</h3>
                    <hr style="width:1040px;height:2px;border:none;background-color:black;">

                    <!-- DataTales Example -->
                    <div>
                        <div class="card-body">
                        	<form method="post">
	                        	<div class="form-group">
									<div style="margin-left: 2px; color: black; font-size: 15px"><fmt:formatDate value="${notice.regDate}" pattern="yy-MM-dd"/></div>
		                        	<h5 style="color: black;">${notice.title}</h5>
		                        	<input type="hidden" id="title" name="title" value="${notice.title}">
	                        	</div>
	                        	<div class="form-group mt-2">
		                        	<textarea style="background-color: #f7f7f7; color:black;" rows="20" class="form-control" id="content" name="content" disabled>${notice.content}</textarea>
		                        	<input type="hidden" id="content" name="content" value="${notice.content}"></input>
	                        	</div>
	                        	<div style="margin-left: 300px">
	                        	<a class="btn btn-outline-dark" href="mNoticeList1${cri.params}" style="margin-bottom:100px;  width:150px; border-radius: 8px">목록보기</a>
	                        	<a class="btn btn-outline-warning" href="mNoticeModify${cri.params}&nno=${notice.nno}"  style="margin-bottom:100px;  width:150px; border-radius: 8px">Modify</a>
                        		</div>
                        		<sec:csrfInput/>
                        	</form>
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