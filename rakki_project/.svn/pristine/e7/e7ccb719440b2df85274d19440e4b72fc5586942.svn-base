<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">

  <head>
<jsp:include page="../includes/head.jsp"/>
<style>
p {max-width:100%; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;}
a {font-style: italic; color: #000;}

</style>
  </head>	
  <body>
  
<div class="site-wrap">
    <header class="site-navbar" role="banner">
<jsp:include page="../includes/header.jsp"/>      
    </header>

    <div class="site-section">
      <div class="container">

        <div class="row mb-5">
          <div class="col-md-9 order-2">

            <div class="row">
              <div class="col-md-12">
                <div class="float-md-left mb-4"><h2 class="text-black h3 font-italic"><u>SHOP</u></h2></div>
              </div>
            </div>
            <div class="row mb-5">
<c:forEach items="${list}" var="pd">
              <div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
	 			<a href="detail?product_no=${pd.product_no}">
                <div class="block-4 text-left border">
                  <figure class="block-4-image">
                   <img src="${pageContext.request.contextPath}/resources/images/${pd.image}/${pd.image}.png" alt="Image placeholder" class="img-fluid">
                  </figure>
                  <div class="block-4-text p-4">
                    <h3>${pd.brand}</h3>
                    <p class="mb-0">${pd.name_en}</p>
                    <p class="font-weight-bold">
						<c:if test="${ empty pd.buy_min_price }">-</c:if>
						<c:if test="${ not empty pd.buy_min_price }"><fmt:formatNumber value="${pd.buy_min_price}" pattern="#,###" />원</c:if>
					</p>
                  </div>
                </div>
	            </a>
              </div>
</c:forEach>

            </div>
			<div class="row" data-aos="fade-up">
			  <div class="col-md-12 text-center">
			    <div class="site-block-27">
				  <ul>
					<li class="page-item previous ${page.prev ? '' : 'disabled'}" id="dataTable_previous">
					  <a href="shop?pageNum=${page.startPage-1}&amount=${page.cri.amount}&type=${page.cri.type}&keyword=${page.cri.keyword}" class="page-link">&lt;</a>
					</li>
							
					<c:forEach begin="${page.startPage }" end="${page.endPage}" var="p">
					<li class="page-item ${p == page.cri.pageNum ? 'active' : ''}">
						<a href="shop?pageNum=${p}&amount=${page.cri.amount}&type=${page.cri.type}&keyword=${page.cri.keyword}"  class="page-link">${p}</a>
					</li>
					</c:forEach>
							
					<li class="page-item next ${page.next ? '' : 'disabled'}" id="dataTable_next">
					  <a href="shop?pageNum=${page.endPage +  1}&amount=${page.cri.amount}&type=${page.cri.type}&keyword=${page.cri.keyword}" class="page-link">&gt;</a>
					</li>												
				  </ul>
			    </div>
			  </div>
			</div>          
          </div>

          <div class="col-md-3 order-1 mb-5 mb-md-0">
            <div class="border p-4 rounded mb-4">
              <h3 class="mb-3 h6 text-uppercase text-black d-block">Categories</h3>
              <ul class="list-unstyled mb-0">
                <li class="mb-1"><a href="shop?amount=${page.cri.amount}&type=C&keyword=1" class="d-flex"><span>Snekers</span></a></li>
                <li class="mb-1"><a href="shop?amount=${page.cri.amount}&type=C&keyword=0" class="d-flex"><span>Clothes</span></a></li>
              </ul>
              <div class="mt-4 mb-4">
                <h3 class="mb-3 h6 text-uppercase text-black d-block">Color</h3>
                <a href="#" class="d-flex color-item align-items-center" >
                  <span class="bg-danger color d-inline-block rounded-circle mr-2"></span> <span class="text-black">Red (2,429)</span>
                </a>
                <a href="#" class="d-flex color-item align-items-center" >
                  <span class="bg-success color d-inline-block rounded-circle mr-2"></span> <span class="text-black">Green (2,298)</span>
                </a>
                <a href="#" class="d-flex color-item align-items-center" >
                  <span class="bg-info color d-inline-block rounded-circle mr-2"></span> <span class="text-black">Blue (1,075)</span>
                </a>
                <a href="#" class="d-flex color-item align-items-center" >
                  <span class="bg-primary color d-inline-block rounded-circle mr-2"></span> <span class="text-black">Purple (1,075)</span>
                </a>
              </div>
            </div>
          </div>
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
   
                <!-- Footer -->
<jsp:include page="../includes/footer.jsp"/>            
            <!-- End of Footer -->   
<jsp:include page="../includes/foot.jsp"/>  

<script>
$(function() {
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