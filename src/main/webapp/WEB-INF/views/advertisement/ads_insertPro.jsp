<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result==1}">
	<script>
	alert("등록되었습니다.");
	window.location="/ads/ads";
	</script>
</c:if>

<c:if test="${result==0}">
	<script>
	alert("등록 실패");
	window.location="/ads/ads";
	</script>
</c:if>