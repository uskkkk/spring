<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>	
	<!-- start navbar -->
	<div class="container">
      <div class="text-right">
        <div class="site-top-icons">
         <ul>
         	<sec:authorize access="isAnonymous()">
		     	<li><a href="${pageContext.request.contextPath}/common/login"><small>로그인</small></a></li>
	            <li><a href="${pageContext.request.contextPath}/common/tos"><small>회원가입</small></a></li>
         	</sec:authorize>
         	<sec:authorize access="isAuthenticated()">
         		<sec:authentication property="principal" var="pinfo"/>
		     	<li><strong><small>${pinfo.member.name}</small></strong></li>
    		  	<li class="dropdown">
	      			<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	      			<small>MEMBERSHIP</small>
	    	  		</a>
		        	<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
		          		<a class="dropdown-item" href="${pageContext.request.contextPath}/common/mypage"><small>MyPage</small></a>
		          		<a class="dropdown-item" href="${pageContext.request.contextPath}/common/userModify"><small>회원정보수정</small></a>
	            	</div>	
	      		</li>
         	</sec:authorize>
	            <li><a href="${pageContext.request.contextPath}/admin/mNoticeList"><small>고객센터</small></a></li>
	            <sec:authorize access="isAuthenticated()">
	            <li><a href="${pageContext.request.contextPath}/common/logout"><small>로그아웃</small></a></li>
	            </sec:authorize>
          </ul>
        </div> 
      </div>
    </div>
    <!-- end navbar -->
    
	<div class="site-navbar-top">
        <div class="container">
          <div class="row align-items-center">
			
			<!-- start search bar -->
            <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
              <form action="" class="site-block-top-search">
                <span class="icon icon-search2"></span>
                <input type="text" class="form-control border-0" placeholder="Search">
              </form>
            </div>
			<!-- end search bar -->
			
			<!-- start site logo -->
            <div class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
              <div class="site-logo">
                <a href="${pageContext.request.contextPath}/rakki/main" class="js-logo-clone"><img src="${pageContext.request.contextPath}/resources/images/RAKKI-logo-black_1.png" width="200" height="90"></a>
              </div>
            </div>
			<!-- end site logo -->
			
			<!-- start icons -->
            <div class="col-6 col-md-4 order-3 order-md-3 text-right">
              <div class="site-top-icons">
                <ul>
		          <li><a href="${pageContext.request.contextPath}/product/shop">SHOP</a></li>
                  <li><a href="${pageContext.request.contextPath}/admin/mNoticeList">NOTICE</a></li>
                  <sec:authorize access="hasRole('ROLE_ADMIN')">
		          <li><a href="${pageContext.request.contextPath}/admin/mProductList" style="color: red;">ADMIN</a></li>
                  </sec:authorize>
<%-- 		          <sec:authentication property="principal"/> --%>
                  <li class="d-inline-block d-md-none ml-md-0"><a href="#" class="site-menu-toggle js-menu-toggle"><span class="icon-menu"></span></a></li>
                </ul>
              </div> 
            </div>
			<!-- end icons -->
          </div>
        </div>
      </div> 
      
      