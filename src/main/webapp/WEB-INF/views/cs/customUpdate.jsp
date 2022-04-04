<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<style>
div.page {
	overflow: auto;
}

h2 {
	text-align: center;
}

nav {
	margin-left: 100px;
	float: left;
}

section {
	margin-left: 400px;
}
</style>
<title>문의사항</title>
<div class="page">
	<header>
		<h2>[문의사항-수정]</h2>
	</header>
	<section class="section1">
		<form action="customUpdatePro" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="num" value="${dto.num}" /> <input
				type="hidden" name="pageNum" value="${pageNum}" />
			<table class="cs" border=1>
				<tr>
					<th width="100px" align="center">제 목</th>
					<th width="300px" colspan=3 align="center"><input type="text"
						size="65" name="subject" value="${dto.subject}" /> <br /></th>
				</tr>
				<tr>
					<td width="100px" align="center">내 용</td>
					<td width="300px" colspan=3 align="center"><textarea
							name="content" id="contenet" maxlength="2000px"
							style="font-size: 14px" cols="62" rows="10">${dto.content}></textarea>
				</tr>
				<tr>
					<td width="100px" align="center">첨부파일</td>
					<td colspan="2" align="center"><c:if
							test="${dto.image ne null}">
							<img src="../resources/img/${dto.image}" width="100px"
								height="100px">
						</c:if> <c:if test="${dto.image eq null}">
						[첨부파일 없음] 
				</c:if> <input type="file" name="filename" /></td>
					<br />
				</tr>
			</table>
			<br />
			<section class="section1">
				<input type="button" value="목록"
					onclick=" window.location='csCenter?pageNum=${pageNum}' " />
				<!-- // 로그인된 id 와 글작성자 비교 -->
				<c:set var="id" value="${sessionScope.userName}"></c:set>
				<c:if test="${id eq null}">
					<c:if test="${id eq dto.writer || rank eq 'admin'}">
						<input type="submit" value="수정" />
					</c:if>
				</c:if>
			</section>
		</form>
	</section>
	<br />