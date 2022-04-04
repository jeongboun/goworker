<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>unDeletePro.jsp</h1>

<c:if test="${result == 1}">
	<script>
		alert("벤풀기 완료");
		window.location="/admin/post_manage_gather";
	</script>
</c:if>