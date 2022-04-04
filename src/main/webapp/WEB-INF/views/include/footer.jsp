<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<footer>
<hr color="skyblue" size="2"  align="center" />

<c:if test="${sessionScope.userName =! admin }">
	<a href="${url }">
		<img src="/resources/img/${img}"
		alt="광고" width="500" height="100" align="center" border="0">
	</a>
</c:if>

<c:if test="${sessionScope.userName == admin }">
	<a href="/ads/ads_show">
		<img src="/resources/img/${img}"
		alt="광고 넣기" width="500" height="100" align="center" border="0">
	</a>
</c:if>

<table width="500" align="right">       
      <thead align="center">
        <tr>
          <th>메인</th>
          <th>회원</th>
          <th>고객센터</th>
        </tr>
      </thead>
      <tbody align="center">
        <tr>
          <td><a href="/recipe/main">음식검색</a></td>
          <td><a href="/member/input">회원가입</a></td>
          <td><a href="/notice/notice_list">공지사항</a></td>
          
        </tr>
        <tr>
          <td><a href="/recipe/list">전체글보기</a></td>
          <td><a href="/recipe/bestList">베스트레시피</a></td>
          <td><a href="/cs/list">문의사항</a></td>
        </tr>   
      </tbody>
    </table>
</footer>