<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h1>deletePro.jsp</h1>

${num} 글 밴을 프시겠습니까?  <br />

<form action="/admin/unDeletePro" >
	<input type="hidden" name="num" value="${num}" />
	<input type="submit" value="밴풀기" />
</form>