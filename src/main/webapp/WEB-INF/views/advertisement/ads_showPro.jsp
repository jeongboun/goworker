<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:if test="${result == 1}">
	<script>
		alert("광고 개시");
		window.location="/admin/post_manage_gather";
	</script>
</c:if>