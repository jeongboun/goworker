<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<style>
		div.page {
			overflow: auto;
		}
		h2 { text-align: center; }
		nav {
			margin-left:100px;
			float:left; 
		}
		section {
			margin-left: 400px;
		}
	</style>
<title>고객센터</title>
<div class="page">
	<header>
		<h2>고객센터 [문의사항]</h2>
	</header>
	<nav>
		<div class="row" style="float: inherit;">
			<a href="#" class="sideicon2">
				<h4>[공지사항]</h4>
			</a> <a href="/cs/list" class="sideicon2">
				<h4>[문의사항]</h4>
			</a>
		</div>
	</nav>
	<section class="section1">
		<table border=1 width="750px" style="table-layout: fixed">
			<c:if test="${sessionScope.userName==null}">
				<script>
					alert("로그인하세요");
					window.location = "/member/login";
				</script>
			</c:if>
			<c:if test="${count} == 0">
				<tr>
					<th colspan="6">저장된 글이 없습니다. <br />본인의 글만 볼수 있습니다.
					</th>
				</tr>
			</c:if>
			<tr>
				<th width="70">글번호</th>
				<th width="120">작성자</th>
				<th width="200">제목</th>
				<th width="150">작성일</th>
				<th width="70">조회</th>
				<th colspan="2">답변진행사항</th>
			</tr>

			<c:forEach var="dto" items="${list}">
				<tr>
					<th width="70">${dto.num}
					</td>
					<th width="120">${dto.writer}
					</td>
					<th width="200"
						style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
						<a href="content?num=${dto.num}&pageNum=${pageNum}">${dto.subject}</a>
					</td>
					<th width="150">${sdf.format(dto.regdate)}
					</td>
					<th width="70">${dto.readcount}
					</td>
					<!-- //댓글답변 갯수 -->

					<c:if test="${ccount} == 0">
						<th colspan="2">답변진행중</th>
					</c:if>
					<c:if test="${ccount} != 0">
						<th colspan="2">답변완료</th>
				</tr>
				</c:if>
			</c:forEach>
		</table>
	</section>

	<section class="section2">
		<c:if test="${count} > 0">
			<c:if test="${startPage} > 10">
				<a href="list.jsp?pageNum=${startPage-10}">>[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="list.jsp?pageNum=${i}">[${i}]</a>
			</c:forEach>
			<c:if test="${endPage} < ${pageCount}">>
		<a href="list.jsp?pageNum=${startPage + 10}">[다음]</a>
			</c:if>
		</c:if>
	</section>
	<section class="section2">
		<c:if test="${sessionScope.userName!=null}">
			<input type="button" value="글쓰기"
				onclick="window.location='/cs/write' " />
		</c:if>
	</section>
</div>