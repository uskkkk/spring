<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">


<head>
<jsp:include page="../includes/head.jsp" />
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
</head>
<body>
	<div class="site-wrap">
		<header class="site-navbar" role="banner">
			<jsp:include page="../includes/header.jsp" />
		</header>
		<div class="container">
			
			<!-- Main Content -->
            <div id="content">

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
		                                		<th colspan="2"><h4 class="font-weight-bold text-dark mt-3" style="margin-top: 20px;">공지사항</h4></th>
		                                	</thead>
		                                    <tbody>
		                                    <c:forEach items="${list}" var="notice">
		                                    	<tr>
		                                    		<td><a href="mNoticeDetail${page.cri.params}&nno=${notice.nno}" style="color: black;"><c:out value="${notice.title}"/></a></td>
		                                    		<td><fmt:formatDate value="${notice.regDate}" pattern="yy-MM-dd"/></td>
		                                    	</tr>
		                                    </c:forEach>
		                                    </tbody>
		                                </table>
	                                </div>
	                            </div>    
						    	<hr style="width: 830px; margin-right: 95px">
						    	
						    	<div class="row mb-3" style="margin-left: 580px; width: 800px">
                            		<div class="col-md-6">
                            			<form class="form-inline">
	                            			<select name="type" class="custom-select custom-select-sm form-control form-control-sm" style="margin-top: 12px; margin-right: 10px">
	                            				<option value="T">제목</option>
	                            				<option value="C">내용</option>
	                            			</select>
	                            			<div id="dataTable_filter" class="input-group" >
	                            				 <input name="keyword" style="margin-top: 12px;" type="search" class="form-control form-control-sm" placeholder="search.." aria-controls="dataTable">
						                         <button class="btn btn-primary " id="btn_search" style="width: 60px; height: 42px; padding: 2px; float: right;">검색</button>
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
                            						<a href="mNoticeList?pageNum=${page.startPage-1}&amount=${page.cri.amount}" class="page-link">&lt;</a>
                            					</li>
                            					
                            					<c:forEach begin="${page.startPage}" end="${page.endPage}" var = "p">
                            					<li class="paginate_button page-item ${p == page.cri.pageNum? 'active' : ''}">
                            						<a href="mNoticeList?pageNum=${p}&amount=${page.cri.amount}" class="page-link">${p}</a>
                            					</li>
                            					</c:forEach>
                            					
                            					<li class="paginate_button page-item next ${page.next ? '' : 'disabled'}" id="dataTable_next">
                            						<a href="mNoticeList?pageNum=${page.endPage+1}&amount=${page.cri.amount}"class="page-link">&gt;</a>
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
            <!-- End of Main Content -->



		</div>
		<jsp:include page="../includes/footer.jsp" />
	</div>
	<!-- End of Footer -->
	<jsp:include page="../includes/foot.jsp" />
</body>
</html>