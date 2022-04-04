<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<center>
<h1 align="center">광고수 = ${count }</h1>
<table border="1">
<c:if test="${count == 0}">
  <tr>
    <td align="center">
      <h1>등록된 광고가 없습니다.</h1>
    </td>
  </tr>
</c:if>

<c:if test="${count > 0}">	

	<tr>
		<td align="center">광고 번호</td>
		<td align="center">회사명or의뢰인</td>		
		<td align="center">광고 시작 일</td>
		<td align="center">광고 종료 일</td>
		<td align="center">광고료</td>
		<td align="center">광고료 입금일</td>
		<td align="center">광고 이미지</td>
		<td align="center">광고 내용</td>
		<td align="center">광고 url</td>
		<td align="center">광고 조회수</td>
		<td align="center">광고주 거래 은행</td>
		<td align="center">광고주 은행 계좌</td>
	</tr>

	<c:forEach var="ads" items="${adsList }">
	<tr>
		<td align="center">${ads.ads_num }</td>
		<td align="center">${ads.ads_costomer }</td>
		<td align="center">${ads.ads_start }</td>
		<td align="center">${ads.ads_end }</td>
		<td align="center">${ads.ads_fee }</td>
		<td align="center">${ads.depo_date }</td>
		<td align="center">${ads.ads_img }</td>
		<td align="center">${ads.ads_contents }</td>
		<td align="center"><a href="">${ads.ads_url}</a></td>
		<td align="center">${ads.ads_visit }</td>
		<td align="center">${ads.advs_bank }</td>
		<td align="center">${ads.advs_bank_account }</td>
	</tr>
	</c:forEach>
</c:if>
</table>
</center>
<center>
<c:if test="${count > 0}">
   <c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}"/>
   <c:set var="pageBlock" value="${10}"/>
   <fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
   <c:set var="startPage" value="${result * 10 + 1}" />
   <c:set var="endPage" value="${startPage + pageBlock-1}"/>
   <c:if test="${endPage > pageCount}">
        <c:set var="endPage" value="${pageCount}"/>
   </c:if> 
          
   <c:if test="${startPage > 10}">
        <a href="/ads/adsList?pageNum=${startPage - 10 }">[이전]</a>
   </c:if>

   <c:forEach var="i" begin="${startPage}" end="${endPage}">
       <a href="/ads/adsList?pageNum=${i}">[${i}]</a>
   </c:forEach>

   <c:if test="${endPage < pageCount}">
        <a href="/ads/adsList?pageNum=${startPage + 10}">[다음]</a>
   </c:if>
</c:if>
</center>

<center>
<a href="/ads/ads_insert">광고 등록</a>
</center>

<%@ include file = "/WEB-INF/views/include/footer.jsp" %>