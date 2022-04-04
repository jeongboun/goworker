<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <h1>inputPro.jsp... 페이지	</h1>
    
    
<c:if test= "${result == null}">
	<script>
		alert("오류발생.");
		history.go(-1);
	</script>
</c:if>


<c:if test= "${result != null}">
	<script>
		alert("회원가입이 되었습니다..");
		window.location="/member/login"
		</script>
</c:if>    
    