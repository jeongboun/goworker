<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
</br></br></br></br></br> 
<table align="center">
  <tr>
    <th></th>
    <th>글수</th>
    <th>비율</th>
  </tr>
  <tr>
  	<td>한국</td>
    <td>${resultK }</td>
    <td>${resultK / sum *100}%</td>
  </tr>
  <tr>
  	<td>미국</td>
    <td>${resulU }</td>
    <td>${resultU /sum *100}%</td>
  </tr>
  <tr>
  	<td>일본</td>
    <td>${resultJ }</td>
    <td>${resultJ /sum *100}%</td>
  </tr>
  <tr>
  	<td>중국</td>
    <td>${resultC }</td>
    <td>${resultC /sum *100}%</td>
  </tr>
  <tr>
  	<td>이탈리아</td>
    <td>${resultI }</td>
    <td>${resultI /sum *100}%</td>
  </tr>
  <tr>
  	<td>베트남</td>
    <td>${resultV }</td>
    <td>${resultV /sum *100}%</td>
  </tr>
  <tr>
  	<td>멕시코</td>
    <td>${resultM }</td>
    <td>${resultM /sum *100}%</td>
  </tr>
</table>
<center><a href="/admin/post_manage_gather">목록으로</a></center>
</body>
<%@ include file = "/WEB-INF/views/include/footer.jsp" %>
