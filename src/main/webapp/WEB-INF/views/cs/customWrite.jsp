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
<title>고객센터</title>
<div class="page">
	<header>
		<h2>[문의사항]</h2>
	</header>
	<section class="">
		<form action="/cs/writePro" method="post"
			enctype="multipart/form-data">

			<table class="cs" border=1>
				<input type="hidden" name="writer" value="${sessionScope.userName}" />
				<br />
				<tr>
					<td width="100px" align="center">제 목</td>
					<th width="300px" colspan=3 align="center"><input type="text"
						size="63" name="subject" /> <br /></th>
				</tr>
				<tr>
					<td width="100px" align="center">내 용</td>
					<td width="300px" colspan=3 align="center"><textarea
							name="content" cols="60" rows="10"></textarea></td>
				</tr>
				<tr>
					<td width="100px" align="center">첨부파일</td>
					<td width="300px" colspan=3 align="center"><input type="file"
						name="save" /></td>
				<tr>

					<td colspan=2 align="center"><input type="submit" value="글쓰기" />
						<input type="button" value="취소" onclick="history.go(-1)" /></td>
				</tr>
			</table>
		</form>
	</section>
</div>