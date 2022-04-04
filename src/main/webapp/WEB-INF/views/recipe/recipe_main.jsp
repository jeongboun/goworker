<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>유캔쿡</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
   crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
   rel="stylesheet" type="text/css" />
<link
   href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
   rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/bootstrap/css/styles.css" rel="stylesheet" />
</head>
<body id="page-top">
   <!-- Navigation-->
   <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
      <div class="container">
         <h3>
            <a href="/recipe/main">유캔쿡</a>
         </h3>
         <button class="navbar-toggler" type="button"
            data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
            aria-controls="navbarResponsive" aria-expanded="false"
            aria-label="Toggle navigation">
            Menu <i class="fas fa-bars ms-1"></i>
         </button>
         <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
               <li class="nav-item"><a class="nav-link"
                  href="/notice/notice_list">공지사항</a></li>
               <li class="nav-item"><a class="nav-link" href="/recipe/list">요리게시판</a></li>
               <li class="nav-item"><a class="nav-link"
                  href="/recipe/bestList">베스트 요리게시판</a></li>
               <li class="nav-item"><a class="nav-link" href="/cs/list">고객센터</a></li>
               
               <c:if test="${sessionScope.userName==null}">
               <li class="nav-item"><a class="nav-link" href="/member/login">로그인</a></li>
               </c:if>
               <c:if test="${sessionScope.userName!=null}">
               <li class="nav-item"><a class="nav-link" href="/member/logout">로그아웃</a></li>
               </c:if>
            </ul>
         </div>
      </div>
   </nav>
   <!-- Masthead-->
   <header class="masthead">
      <div class="container" align="center">
         <div class="masthead-heading text-uppercase">요리를 검색해보세요.</div>


         <form action="searchList" method="get">
            <div class="col-md-6">
               <div class="row align-items-stretch mb-5">


                  <div class="masthead">
                     <input class="form-control" name="searchRecipe" type="text"
                        placeholder="요리검색" /> <br />
                        <input type="submit" value="검색"
                        class="btn btn-primary btn-xl text-uppercase" />
                  </div>

               </div>
            </div>
         </form>



         <div class="masthead-subheading">재료의 맡게 요리를 알선해드립니다.</div>
      </div>
   </header>
   <!-- Services-->
   <section class="page-section" id="services">
      <div class="container">
         <div class="text-center">
            <h2 class="section-heading text-uppercase">진짜 사용자가 만드는 레시피</h2>
            <h3 class="section-subheading text-muted">유캔쿡들의 누적 레시피</h3>
         </div>
         <div class="row text-center">
            <div class="col-md-4">
               <span class="fa-stack fa-4x"> <i
                  class="fas fa-circle fa-stack-2x text-primary"></i> <i
                  class="fas fa-shopping-cart fa-stack-1x fa-inverse"></i>
               </span>
               <h4 class="my-3">손쉬운 구매</h4>
               <p class="text-muted">레시피 및 구매처 연동</p>
            </div>
            <div class="col-md-4">
               <span class="fa-stack fa-4x"> <i
                  class="fas fa-circle fa-stack-2x text-primary"></i> <i
                  class="fas fa-laptop fa-stack-1x fa-inverse"></i>
               </span>
               <h4 class="my-3">다양한 레시피 정보</h4>
               <p class="text-muted">선택한 식재료로 다양한 레시피검색</p>
            </div>
            <div class="col-md-4">
               <span class="fa-stack fa-4x"> <i
                  class="fas fa-circle fa-stack-2x text-primary"></i> <i
                  class="fas fa-lock fa-stack-1x fa-inverse"></i>
               </span>
               <h4 class="my-3">작성자 수익</h4>
               <p class="text-muted">레시피 등록시 수익 및 포인트 상품 구매가능</p>
            </div>
         </div>
      </div>
   </section>
   
   <!-- Bootstrap core JS-->
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <!-- Core theme JS-->
   <script src="../resources/bootstrap/js/scripts.js"></script>
   <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
   <!-- * *                               SB Forms JS                               * *-->
   <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
   <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
   <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>