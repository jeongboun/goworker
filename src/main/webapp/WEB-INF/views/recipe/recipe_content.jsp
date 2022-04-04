<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title>레시피 페이지</title>
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="${bodyback_c}">
	<center>
		<b>글내용 보기</b> <br>

		<table width="500" border="1" cellspacing="0" cellpadding="0" bgcolor="${bodyback_c}" align="center">
			<tr height="30">
				<td align="center" width="125" bgcolor="${value_c}">글번호</td>
				<td align="center" width="125" align="center">${article.num}</td>
				<td align="center" width="125" bgcolor="${value_c}">조회수</td>
				<td align="center" width="125" align="center">${article.readcount}</td>
			</tr>
			<tr height="30">
				<td align="center" width="125" bgcolor="${value_c}">작성자</td>
				<td align="center" width="125" align="center">${article.writer}</td>
				<td align="center" width="125" bgcolor="${value_c}">작성일</td>
				<td align="center" width="125" align="center">${article.regdate}</td>
			</tr>
			<tr height="30">
				<td align="center" width="125" bgcolor="${value_c}">요리제목</td>
				<td align="center" width="375" align="center" colspan="3">${article.title}</td>
			<tr height="30">
				<td align="center" width="125" bgcolor="${value_c}">좋아요</td>
				<td align="left" width="125" colspan="3">${article.good}&nbsp;&nbsp;&nbsp;&nbsp;
					<div align="center">
						<form action="/recipe/good" action="post">
							<input type="hidden" name="num" value="${article.num}">
							<input type="submit" value="좋아요">
						</form>
					</div>
				</td>

			</tr>

			</tr>
			<tr height="30">
				<td align="center" width="125" bgcolor="${value_c}">재료</td>
				<td align="center" width="375" align="center" colspan="3">${article.ingredient_meat} ${article.ingredient_vegetable} ${article.ingredient_fish} ${article.ingredient_egg} ${article.ingredient_instant} ${article.ingredient_grain} ${article.ingredient_fruit} ${article.ingredient_nut}</td>
			</tr>
			<tr height="30">
				<td align="center" width="125" bgcolor="${value_c}">기타재료</td>
				<td align="left" width="375" colspan="3">${article.ingredient}</td>
			</tr>
			<tr>
				<td align="center" width="125" bgcolor="${value_c}">설명</td>
				<td align="left" width="375" colspan="3">${article.explain}</td>
			</tr>

			<tr>
				<td align="center" width="125" bgcolor="${value_c}">요리 사진</td>
				<td align="left" width="375" colspan="3"><img src="/resources/img/${article.image}" width="100" height="100" /></td>
			</tr>

			<tr>
				<td align="center" width="125" bgcolor="${value_c}">요리 영상</td>
				<td align="left" width="375" colspan="3"><c:set var="step" value="${article.video}" /> <c:set var="linked" value="${fn:substring(step, 17, 100)}" /> <c:if test="${linked ne null}">
						<iframe width="560" height="315" src="https://www.youtube.com/embed/${linked}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></td>
				</c:if>
				<c:if test="${linked eq null}">
					<th colspan="4">저장된 글이 없습니다.</th>
				</c:if>
			</tr>

			<tr>
				<td align="center" width="125" bgcolor="${value_c}">난이도</td>
				<td align="left" width="375" colspan="3">${article.level_code}</td>
			</tr>

			<tr>
				<td align="center" width="125" bgcolor="${value_c}">조리시간</td>
				<td align="left" width="375" colspan="3">${article.time_code}</td>
			</tr>

			<tr>
				<td align="center" width="125" bgcolor="${value_c}">국가코드</td>
				<td align="left" width="375" colspan="3">${article.nation_code}</td>
			</tr>

			<tr>
				<td align="center" width="125" bgcolor="${value_c}">재료코드</td>
				<td align="left" width="375" colspan="3">${article.igrdnt_code}</td>
			</tr>

			<tr>
				<td align="center" width="125" bgcolor="${value_c}">태그</td>
				<td align="left" width="375" colspan="3"><a href="/recipe/list?num=${article.num}&pageNum=${pageNum}&tag=${article.tag}">
						<pre>${article.tag}</pre></td>
			</tr>

			<tr height="30">
				<td colspan="4" bgcolor="${value_c}" align="right"><input type="button" value="글수정" onclick="document.location.href='/recipe/update?num=${article.num}&pageNum=${pageNum}'"> &nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="글삭제" onclick="document.location.href='/recipe/delete?num=${article.num}&pageNum=${pageNum}'"> &nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="글목록" onclick="document.location.href='/recipe/list'"></td>
				<td colspan="4" bgcolor="${value_c}" align="left">
					<!-- 좋아요 기능 추가하기. -->
				</td>
			</tr>
		</table>

		<table width="500" border="1" cellspacing="0" cellpadding="0" bgcolor="${bodyback_c}" align="center">
			<form action="/recipe/comment" method="post">
				<input type="text" name="comment">
				<input type="submit" value="댓글 등록">
			</form>
		</table>
</body>
</html>
