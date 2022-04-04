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
<h3 align="center">총글수 = ${count }</h1>

<center>

<form action="/admin/good" method="post">
<input type="submit" value="좋아요순">
</form>

<form action="/admin/visit" method="post">
<input type="submit" value="조회수순">
</form>

<a href="/admin/stats">통계보기</a>
</center>

<table border="1" align="center" class="admin_list">

<c:if test="${count == 0}">
  <tr>
    <td align="center">
      <h1>게시판에 저장된 글이 없습니다.</h1>
    </td>
  </tr>
</c:if>
	
<c:if test="${count > 0}">	
	<tr>
		<td align="center">글번호</td>
		<td align="center">제목</td>
		<td align="center">작성자</td>
		<td align="center">작성일</td>
		<td align="center">좋아요수</td>
		<td align="center">방문자수</td>
		<td align="center">첨부이미지</td>
		<td align="center">글상태</td>
		<td align="center">삭제</td>
	</tr>
	<c:forEach var="admin" items="${searchList }">
	<tr>
		<td align="center">${admin.num }</td>
		<td align="center">
		<a href="/recipe/content?subject=${admin.subject }"></a>
		</td>
		<td align="center">${admin.writer }</td>
		<td align="center">${admin.regdate }</td>
		<td align="center">${admin.good }</td>
		<td align="center">${admin.visit }</td>
		<td align="center">${admin.image }</td>
		<td align="center">${admin.state }</td>
		<c:if test="${admin.state == 1 }">
			<td align="center"><input type="button" onClick="location.href='delete?num=${admin.num }'" value="밴하기"></td>
		</c:if>
		<c:if test="${admin.state == 0 }" >
			<td align="center"><input type="button" onClick="location.href='unDelete?num=${admin.num }" value="밴풀기"></td>
		</c:if>
	</tr>
	</c:forEach>
</c:if>		
</table>
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
        <a href="/admin/post_manage_gather?pageNum=${startPage - 10 }">[이전]</a>
   </c:if>

   <c:forEach var="i" begin="${startPage}" end="${endPage}">
       <a href="/admin/post_manage_gather?pageNum=${i}">[${i}]</a>
   </c:forEach>

   <c:if test="${endPage < pageCount}">
        <a href="/admin/post_manage_gather?pageNum=${startPage + 10}">[다음]</a>
   </c:if>
</c:if>
</center>

</body>
<%@ include file = "/WEB-INF/views/include/footer.jsp" %>