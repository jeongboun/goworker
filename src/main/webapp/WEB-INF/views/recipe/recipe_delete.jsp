<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>삭제 페이지</h1>
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet" type="text/css">
글번호 [${num}]번 글을 삭제 하시겠습니까? <br />

<form action="/recipe/deletePro" >
	<input type="hidden" name="num" value="${num}" />
	<input type="submit" value="글삭제" />
</form>