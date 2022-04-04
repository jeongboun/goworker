<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<!DOCTYPE html>

<c:if test= "${sessionScope.id == null}">
	<script>
		alert("회원정보가 일치하지 않습니다.");
		window.location="/member/find_userpwPro_ste1"
	</script>
</c:if>


<c:if test= "${sessionScope.id != null}">
	<script>
		alert("회원정보가 일치합니다.");
		window.location="/member/find_userpwPro_step2";
	</script>
</c:if>