<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<title>게시판</title>
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet" type="text/css">
</head>

<!-- searchRecipe 가 null 일경우 재료를 입력하세요 창만들기. -->
<body bgcolor="${bodyback_c}">
<center><b>레시피 리스트(전체글:${count})</b>
<table width="700">
    <tr>
    <td align="left" bgcolor="${value_c}">
       <a href="/recipe/search">[레시피 검색]</a>
    </td>
    <td align="center" bgcolor="${value_c}">
       <a href="/recipe/list">[전체 레시피]</a>
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


<!-- 이미지
	  제목
	 시간/좋아요/작성자 틀만들기  -->
<c:if test="${count > 0}">
	<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
    <tr height="30" bgcolor="${value_c}"> 
      <td align="center"  width="100"  >이미지</td> 
      <td align="center"  width="100" >요리명</td> 
      <td align="center"  width="50" >조리시간</td>
      <td align="center"  width="70" >좋아요</td> 
      <td align="center"  width="50" >작성자</td> 
    </tr>

   <c:forEach var="eachItem" items="${getRecipe}">
   <tr height="30">

    <td  width="250" >

          <a href="/recipe/content?num=${eachItem.num}&pageNum=${currentPage}">
          ${eachItem.image}</a> 
          <c:if test="${eachItem.readcount >= 20}">
		  </c:if>
	</td>

    <td align="center"  width="150">${eachItem.title}
	</td>
	<td align="center"  width="150">${eachItem.time_code}
	</td>
    <td align="center"  width="50">${eachItem.good}
    </td>
    <td align="center"  width="150">${eachItem.writer}
	</td>
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
          
   <c:if test="${startPage > 10}">
        <a href="/recipe/searchList?searchRecipe=${searchRecipe}&pageNum=${startPage - 10 }">[이전]</a>
   </c:if>

   <c:forEach var="i" begin="${startPage}" end="${endPage}">
       <a href="/recipe/searchList?searchRecipe=${searchRecipe}&pageNum=${i}">[${i}]</a>
   </c:forEach>

   <c:if test="${endPage < pageCount}">
        <a href="/recipe/searchList?searchRecipe=${searchRecipe}&pageNum=${startPage + 10}">[다음]</a>
   </c:if>
</c:if>

</center>
<!-- 검색창 -->
<div align="center">
	<form action="/recipe/searchList" method="get">
		<input type="text" name="searchRecipe" placeholder="요리명을 입력해주세요"/>
		<input type="submit" value="검색" />
	</form>
</div>


</body>
</html>