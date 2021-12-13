<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">


  <head>
<jsp:include page="../includes/head.jsp"/>
<style>
.carousel-inner {max-width: 1100px; margin: auto;}
.carousel-inner .carousel-item img{max-height:400px; max-width: 100%;}
p {max-width:100%; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;}
header > a {color: #000;}
</style>
  </head>
  <body>
    
  <div class="site-wrap">
    <header class="site-navbar" role="banner">
<jsp:include page="../includes/header.jsp"/>      
    </header>
	<!-- Start slider -->
	<div id="slider" class="carousel slide" data-ride="carousel" data-aos="fade">
	
	  <!-- Indicators -->
	  <ul class="carousel-indicators ">
	    <li data-target="#slider" data-slide-to="0" class="active"></li>
	    <li data-target="#slider" data-slide-to="1"></li>
	    <li data-target="#slider" data-slide-to="2"></li>
	  </ul>
	
	  <!-- The slideshow -->
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <a href="/product/detail?product_no=355"><img class="mx-auto d-block" src="${pageContext.request.contextPath}/resources/images/Nike_SB_Dunk_Low_Pro_Premium_Mummy.jpg"></a>
	    </div>
	    <div class="carousel-item">
	      <a href="/product/detail?product_no=273"><img class="mx-auto d-block" src="${pageContext.request.contextPath}/resources/images/Nike_x_Sacai_x_Clot_LDWaffle_Cool_Grey.jpg"></a>
	    </div>
	    <div class="carousel-item">
	      <a href="/product/detail?product_no=264"><img class="mx-auto d-block" src="${pageContext.request.contextPath}/resources/images/a_21001215a1bb43959226aa48d155950c(1).jpg"></a>
	    </div>
	  </div>
	
	</div>
	<!-- End slider -->


    <div class="site-section block-3 site-blocks-2">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-11 text-dark text-left font-italic">
            <h4><u>Snekers</u></h4>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="nonloop-block-3 owl-carousel" id="item">
 	          
 	          <!-- start item -->
<c:forEach items="${list}" var="pd"> 	          
	          <a href="/product/detail?product_no=${pd.product_no}" class="text-dark" style="display: block">
              <div class="item" >
                <div class="block-4 text-left">
                  <figure class="block-4-image">
                    <img src="${pageContext.request.contextPath}/resources/images/${pd.image}/${pd.image}.png" alt="Image placeholder" class="img-fluid" ">
                  </figure>
                  <div class="block-4-text p-4">
                    <h3>${pd.brand}</h3>
                    <p class="mb-0">${pd.name_en}</p>
                    <p class="text-dark font-weight-bold">
 						<c:if test="${ empty pd.buy_min_price }">-</c:if>
						<c:if test="${ not empty pd.buy_min_price }"><fmt:formatNumber value="${pd.buy_min_price}" pattern="#,###" />원</c:if>
                    </p>
                  </div>
                </div>
              </div>
              </a>
</c:forEach>

              <!-- End item -->
          </div>
        </div>
      </div>
    </div>

    <div class="site-section block-8">
    	<div class="container">
    		<!-- Start slider -->
			<div id="slider" class="carousel slide" data-ride="carousel" data-aos="fade">
			
			  <!-- The slideshow -->
			  <div class="carousel-inner" style="background-color: #2342b0">
			    <div class="carousel-item active">
			      <a href="/product/detail?product_no=376"><img class="mx-auto d-block" src="${pageContext.request.contextPath}/resources/images/MaisonKitsunexAderErrorTheBluestFoxSweatshirtGrey.png" ></a>
			    </div>
			  </div>
			
			</div>
			<!-- End slider -->
		
		
		    <div class="site-section block-3 site-blocks-2">
		      <div class="container">
		        <div class="row justify-content-center">
		          <div class="col-md-11 text-dark text-left font-italic">
		            <h4><u>Clothes</u></h4>
		          </div>
		        </div>
		        <div class="row">
		          <div class="col-md-12">
		            <div class="nonloop-block-3 owl-carousel" id="item">
		 	          
		 	          <!-- start item -->
<c:forEach items="${list2}" var="pd"> 	          
	          <a href="/product/detail?product_no=${pd.product_no}" class="text-dark" style="display: block">
              <div class="item" >
                <div class="block-4 text-left">
                  <figure class="block-4-image">
                    <img src="${pageContext.request.contextPath}/resources/images/${pd.image}/${pd.image}.png" alt="Image placeholder" class="img-fluid" ">
                  </figure>
                  <div class="block-4-text p-4">
                    <h3>${pd.brand}</h3>
                    <p class="mb-0">${pd.name_en}</p>
                    <p class="text-dark font-weight-bold">
 						<c:if test="${ empty pd.buy_min_price }">-</c:if>
						<c:if test="${ not empty pd.buy_min_price }"><fmt:formatNumber value="${pd.buy_min_price}" pattern="#,###" />원</c:if>
                    </p>
                  </div>
                </div>
              </div>
              </a>
</c:forEach>
		              <!-- End item -->
		          </div>
		        </div>
		      </div>
		    </div>
    	</div>
    </div>
   </div>
  </div>
<!-- end main content -->   

            <!-- Footer -->
<jsp:include page="../includes/footer.jsp"/>            
            <!-- End of Footer -->   
<jsp:include page="../includes/foot.jsp"/>        
  </body>
</html>