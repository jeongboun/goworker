<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<title>게시판</title>
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="${bodyback_c}">
<div align="center"><b>레시피 게시판(전체글:${count})</b>
<table width="700">
    <tr>
    <td align="left" bgcolor="${value_c}">
       <a href="/recipe/main">[메인]</a>
    </td>
    <td align="left" bgcolor="${value_c}">
       <a href="/recipe/search">[레시피 검색]</a>
    </td>
        <td align="left" bgcolor="${value_c}">
       <a href="/recipe/bestList">[베스트레시피 게시판]</a>
    </td>
    <td align="right" bgcolor="${value_c}">
       <a href="/recipe/write">[레시피 등록]</a>
    </td>
  </tr>
</table>

<c:if test="${count == 0}">
<table width="700" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">
      게시판에 저장된 글이 없습니다.
    </td>
  </tr>
</table>
</c:if>

<c:if test="${count > 0}">
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
    <tr height="30" bgcolor="${value_c}"> 
      <td align="center"  width="50"  >번호</td> 
      <td align="center"  width="250" >요리명</td> 
      <td align="center"  width="100" >작성자</td>
      <td align="center"  width="150" >작성일</td> 
      <td align="center"  width="50" >조 회</td> 
      <td align="center"  width="50" >좋아요</td> 
    </tr>

   <c:forEach var="article" items="${articleList}">
   <tr height="30">
    <td align="center"  width="50" >
	  ${number}
	  <c:set var="number" value="${number - 1}"/>
	</td>
    <td  width="250" >

           
      <a href="/recipe/content?num=${article.num}&pageNum=${currentPage}">
          ${article.title}</a> 
          <c:if test="${article.readcount >= 20}">
		  </c:if>
	</td>
    <td align="center"  width="100">${article.writer}</a>
	</td>
    <td align="center"  width="150">${article.regdate}
	</td>
    <td align="center"  width="50">${article.readcount}</td>
    <td align="center"  width="50">${article.good}</td>
  </tr>
  </c:forEach>
</table>
</c:if>

<c:if test="${count > 0}">
   <c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}"/>
   <c:set var="pageBlock" value="${10}"/>
   <fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
   <c:set var="startPage" value="${result * 10 + 1}" />
   <c:set var="endPage" value="${startPage + pageBlock-1}"/>
   <c:if test="${endPage > pageCount}">
        <c:set var="endPage" value="${pageCount}"/>
   </c:if> 
          
	<!--이전-->
   <c:if test="${startPage > 10}">
	   <c:choose>
		    <c:when test="${searchWord ne null}">
		        <a href="/recipe/list?searchCategory=${searchCategory}&searchWord=${searchWord}&pageNum=${startPage - 10 }">[이전]</a>
		    </c:when>
		    <c:when test="${searchWord eq null}">
		        <a href="/recipe/list?pageNum=${startPage - 10 }">[이전]</a>
		    </c:when>
	   </c:choose>
   </c:if>

	<!--숫자들-->
   <c:forEach var="i" begin="${startPage}" end="${endPage}">
       	   <c:choose>
		    <c:when test="${searchWord ne null}">
		       <a href="/recipe/list?searchCategory=${searchCategory}&searchWord=${searchWord}&pageNum=${i}">[${i}]</a>
		    </c:when>
		    <c:when test="${searchWord eq null}">
		       <a href="/recipe/list?pageNum=${i}">[${i}]</a>
		    </c:when>
	   </c:choose>
   </c:forEach>

	<!--다음-->
   <c:if test="${endPage < pageCount}">
           <c:choose>
		    <c:when test="${searchWord ne null}">
	        <a href="/recipe/list?searchCategory=${searchCategory}&searchWord=${searchWord}&pageNum=${startPage + 10}">[다음]</a>
		    </c:when>
		    <c:when test="${searchWord eq null}">
	        <a href="/recipe/list?pageNum=${startPage + 10}">[다음]</a>
		    </c:when>
	   </c:choose>
   </c:if>
</c:if>

</div>
<!-- 검색창 -->

<div align="center">
	<form action="/recipe/list" method="get">
		<select name="searchCategory">
			<option value="title">요리명</option>
			<option value="writer">작성자</option>
		</select>
		<input type="text" name="searchWord" />
		<input type="submit" value="검색" />
	</form>
</div>



</body>
</html>