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
		<h2>[문의사항]</h2>
	</header>
	<section class="section1">
		<table border=1 align="center">
			<tr>
				<td align="center" width="90px" height="4" align="center">작성자</td>
				<td align="center">${dto.writer}</td>
				<td align="right" width="200px">${dto.regdate}</td>
			</tr>
			<tr>
				<td align="center" width="90px" height="4">제목</td>
				<td colspan="2" align="center" style="font-size: 18px">
					${dto.subject}</td>
			</tr>
			<tr>
				<td align="center" width="90px">내 용</td>
				<td colspan="2"><textarea name="content" id="content"
						maxlength="2000px" style="font-size: 14px" cols="62" rows="10"
						readonly>${dto.content}</textarea></td>
			</tr>
			<c:if test="${dto.image != null}">
				<tr>
					<td align="center" width="90px">첨부파일</td>
					<td colspan="2" align="center"><img
						src="../resources/img/${dto.image}" width="300px" height="300px"></td>
				</tr>
			</c:if>
		</table>
	</section>
	<section class="section1">
		<c:set var="id" value="${sessionScope.userName}"></c:set>
		<table class="comments" border="1" width="566px" align="center">
			<tr>
				<td width="60px" align="center">작성자</td>
				<td width="300px" align="center">내용</td>
				<td width="80px" align="center">작성일</td>
				<td width="40px" align="center">버튼</td>
			</tr>
			<tr>
				<td align="center"><img src="../resources/img/image.jpg"
					width="50" height="50"><br /> ${cdto.comment_writerid} <input
					typ e="hidden" name="comment_writerid"
					value="${cdto.comment_writerid}" /></td>

				<td><c:if test="${cdto.comment_level > 0}">
						<!-- // 답글일때에만 Re_level()의 값이 0 이상이다. / 답글일때에만 조건문 수행 -->
						<!-- // 답글 들여쓰기 사이즈(width의 값으로 넣을 변수와 값 저장해서 아래에 대입) -->
						<img src="../resources/image/white.jpg" width="${wid}" height="16">
						<img src="../resources/image/re.gif">
					</c:if> <c:if test="${cdto.comment_level < 0}">
						<img src="../resources/image/white.jpg" width="${wid}" height="16">
					</c:if> ${cdto.comment_content}</td>

				<td align="center">${sdf.format(cdto.comment_regdate())}</td>

				<c:if test="${id ne null}">
					<c:if test="${id eq cdto.comment_writerid || rank eq 'admin'}">
						<td align="center">
							<form
								action="/comment/commentDelete?comment_num=${cdto.comment_num}&board_num=${dto.num}&comment_ref=${cdto.comment_ref}"
								method="post">
								<input type="button" value="수정"
									onclick="window.open('/comment/commentUpdate?comment_num=${cdto.comment_num()}','update','width=800,height=300');" />
								<input type="submit" value="삭제" onclick="comment_removeCheck()" />
								<input type="button" value="답글"
									onclick="window.open('/comment/commentReply?comment_num=${cdto.comment_num}&board_num=${dto.num}&comment_ref=${cdto.comment_ref}>&comment_step=${cdto.comment_step}&comment_level=${cdto.comment_level()}&pageNum=${pageNum}','reply','width=600,height=300');" />
						</td>
					</c:if>
				</c:if>
				<td algin="center"><input type="button" value="답글"
					onclick="window.open('/goworker/cs/comment/commentReply.jsp?comment_num=${cdto.comment_num}&board_num=${dto.num}&comment_ref=${cdto.comment_ref}&comment_step=${cdto.comment_step}&comment_level=${cdto.comment_level}&pageNum=${pageNum}','reply','width=600,height=300');" />
				</td>
				</form>
			</tr>
		</table>
		<br />
	</section>
	</section>
	<br />
	<center>
		<form action="customDelete" method="post" align="center">
			<input type="button" value="목록"
				onclick=" window.location='csCenter?pageNum=${pageNum}' " />

			<!--  로그인된 id 와 글작성자 비교 또는 관리자 일때 조건 -->
			<c:if test="${id ne null}"></c:if>
			<c:if test="${id eq dto.writer || rank eq 'admin'}">
				<input type="button" value="글수정"
					onclick=" window.location='customUpdate?num=${dto.num}&pageNum=${pageNum}'" />
				<input type="submit" value="글삭제" onclick="button_event()" />
				<input type="hidden" name="num" value="${dto.num}" />
			</c:if>
		</form>
	</center>
	<br />

	<script>
		function button_event() {

			if (confirm("정말 삭제하시겠습니까??") == true) {
				document.form.submit();
				window.loction = '/cs/delete';
			}
		}

		function comment_removeCheck() {
			if (confirm("삭제 시, 복구가 되지 않습니다. \n 정말로 삭제하시겠습니까??") == true) {
				document.form.submit;
				window.location = '/cs/comment/delete';
			}
		}
	</script>