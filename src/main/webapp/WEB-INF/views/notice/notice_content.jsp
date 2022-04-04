<%@ page contentType = "text/html; charset=UTF-8"     
pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<html>
<head>
<title>공지사항</title>
</head>

<script>
	function delCheck(num){
		
		if(confirm("삭제할까요?")){
			window.location="/notice/notice_del?num="+num;
		}else{
			return false;
		}
	}
</script>


<body bgcolor="${bodyback_c}">  

<div align="center"><b>글내용 보기</b></div>
<br>
<form>
<table width="500" border="1" cellspacing="0" cellpadding="0"  bgcolor="${bodyback_c}" align="center">  
  <tr height="30">
    <td align="center" width="125" bgcolor="${value_c}">글번호</td>
    <td align="center" width="125" align="center">
        ${content.num}</td>
    <td align="center" width="125" bgcolor="${value_c}">조회수</td>
    <td align="center" width="125" align="center">
        ${content.nreadcount}</td>
  </tr>
   <tr height="30">
    <td align="center" width="125" bgcolor="${value_c}">작성일</td>
    <td align="center" width="375" align="center" colspan="3">
        ${content.ndate}</td>
        
     <tr>
  
  <tr height="30">
    <td align="center" width="125" bgcolor="${value_c}">제목</td>
    <td align="center" width="375" align="center" colspan="3">
        ${content.nsubject}</td>
        
     <tr>
  </tr> 
       
   <tr height="30">
    <td align="center" width="125" bgcolor="${value_c}">내용</td>
    <td align="center" width="375" align="center" colspan="3">
        ${content.ncontent}</td>
  </tr>
  
  
  
  <tr height="30">      
    
    <td colspan="4" bgcolor="${value_c}" align="right" > 
      <c:if test="${sessionScope.id!=admin}">
	     <input type="button" value="글수정" 
	       onclick="document.location.href='/notice/notice_update?num=${content.num}&pageNum=${pageNum}'">
	      &nbsp;&nbsp;&nbsp;&nbsp;
	     <input type="button" value="글삭제" 
	       onclick="delCheck(${content.num});">
	      &nbsp;&nbsp;&nbsp;&nbsp;
      </c:if>
      
       <input type="button" value="글목록" 
       onclick="document.location.href='/notice/notice_list'">
    </td>
  </tr>
</table>    
</form>      
</body>
</html>      