<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	function fileUpload() {
		$("#image").click();
	};
	function setThumbnail() {
		preview = new FileReader();
		preview.onload = function(e) {
			document.getElementById('image_preview').src = e.target.result;
		};
		preview.readAsDataURL(document.getElementById("image").files[0]);
	};
</script>

<head>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>유캔쿡</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
   crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
   rel="stylesheet" type="text/css" />
<link
   href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
   rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/bootstrap/css/styles.css" rel="stylesheet" />
</head>
<body id="page-top">
   <!-- Navigation-->
   <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
      <div class="container">
         <h3>
            <a href="/recipe/main">유캔쿡</a>
         </h3>
         <button class="navbar-toggler" type="button"
            data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
            aria-controls="navbarResponsive" aria-expanded="false"
            aria-label="Toggle navigation">
            Menu <i class="fas fa-bars ms-1"></i>
         </button>
         <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
               <li class="nav-item"><a class="nav-link"
                  href="/notice/notice_list">공지사항</a></li>
               <li class="nav-item"><a class="nav-link" href="/recipe/list">요리게시판</a></li>
               <li class="nav-item"><a class="nav-link"
                  href="/recipe/bestList">베스트 요리게시판</a></li>
               <li class="nav-item"><a class="nav-link" href="/cs/list">고객센터</a></li>
               
               <c:if test="${sessionScope.userName==null}">
               <li class="nav-item"><a class="nav-link" href="/member/login">로그인</a></li>
               </c:if>
               <c:if test="${sessionScope.userName!=null}">
               <li class="nav-item"><a class="nav-link" href="/member/logout">로그아웃</a></li>
               </c:if>
            </ul>
         </div>
      </div>
   </nav>
</br></br></br></br></br></br>
<div class="row">
	<div class="col-md-12"></div>
	<h1 align="center">광고 넣기</h1>
</div>
<body>
	<div class="container" align="center">
		<form action="/ads/ads_insertPro" method="post">
			<table>
				<div class="row">
					<div class="col-md-8">
						광고주 <input type="text" name="ads_costomer" placeholder="광고주">
					</div>
					<div class="col-md-4" style="float: center;">
						<label class="">요리 대표 사진을 등록해 주세요.</label></br> <img
							src="/resources/img/ads" id="image_preview"
							onclick="fileUpload()" style="cursor: pointer;" width="250"
							height="250" /> <input type="file" name="save" id="image"
							accept="image/*" onchange="setThumbnail();"
							style="display: none;" />
					</div></br>
					
					<div class="col-md-8">

						광고료 <input type="text" name="ads_fee" placeholder="'원'제외">

					</div>
					<div class="col-md-8">

						광고 내용 <input type="text" name="ads_contents" placeholder="광고내용">

					</div>
					<div class="col-md-8">

						광고 url <input type="text" name="ads_url"
							placeholder="www.xxxxx.xxx">

					</div>
					<div class="col-md-8">

						광고 거래 은행 <select name="advs_bank">
							<option value="신한">신한은행</option>
							<option value="우리">우리은행</option>
							<option value="국민">국민은행</option>
							<option value="하나">하나은행</option>
							<option value="기업">기업은행</option>
						</select>

					</div>
					<div class="col-md-8">

						광거 거래 계좌(광고주) <input type="text" name="advs_bank_account"
							placeholder="'-'제외하고 입력">

					</div>

					<div class="col-md-8">

						광고 시작일 <input type="date" name="ads_start" value="2022-01-01"
							min="2022-01-01">

					</div>
					<div class="col-md-8">

						광고 종료일 <input type="date" name="ads_end" value="2022-01-01"
							min="2022-01-01">

					</div>
					<div class="col-md-8">

						광고료 입금일 <input type="date" name="depo_date" value="2022-01-01"
							min="2022-01-01">
					</div>
				</div>
			</table>
			<input type="submit" value="등록">
		</form>
	</div>
</body>

<%@ include file = "/WEB-INF/views/include/footer.jsp" %>


