<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h1>delete.jsp</h1>

${num} 글을 밴 하시겠습니까?  <br />

<form action="/admin/deletePro" >
	<input type="hidden" name="num" value="${num}" />
	<input type="submit" value="밴하기" />
</form>