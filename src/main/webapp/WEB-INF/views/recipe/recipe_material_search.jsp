<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>유캔쿡</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

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
                  href="/recipe/main">메인</a></li>       
               <li class="nav-item"><a class="nav-link"
                  href="/notice/notice_list">공지사항</a></li>
               <li class="nav-item"><a class="nav-link"
                  href="/recipe/search">검색 게시판</a></li>                    
               <li class="nav-item"><a class="nav-link" href="/recipe/list">요리게시판</a></li>
               <li class="nav-item"><a class="nav-link"
                  href="/recipe/bestList">베스트 요리게시판</a></li>
               <li class="nav-item"><a class="nav-link" href="/cs/list">고객센터</a></li>
               
               <c:if test="${sessionScope.userName==null}">
               <li class="nav-item"><a class="nav-link" href="/member/login">로그인</a></li>
               </c:if>
                <c:if test="${sessionScope.userName!=null && sessionScope.userName=='admin'}">
 				<li class="nav-item"><a class="nav-link" href="/admin/main">관리자 게시판</a></li>
				</c:if>
               <c:if test="${sessionScope.userName!=null}">
               <li class="nav-item"><a class="nav-link" href="/member/logout">로그아웃</a></li>
               </c:if>
               
            </ul>
         </div>
      </div>
   </nav>
<br /><br /><br /><br /><br /><br />   
<title>재료로 검색하기</title>

    <td align="left" bgcolor="${value_c}">
       <a href="/recipe/write">[레시피 등록]</a>
    </td>



<h1 align="center"><a href="/recipe/main">유캔쿡</a></h1>

</head>
<body>


<form action="searchList" method="get" >
<div class="container" >
	<div align="left">
	<div>
	<input type="text" name="searchRecipe" placeholder="요리명으로 검색해보세요." >
	<input type="submit" value="검색" />
</form>
	</div>
<br /><br />

<table width="700">
<a href="/recipe/recipeList?ingredient_meat=%EC%86%8C%EA%B3%A0%EA%B8%B0">
<div1 id="18" class="col-md-1" style="float: left">
	<img src ="https://d1hk7gw6lgygff.cloudfront.net/assets/_img/ico/3-e16c5bf26b89bed785267c7a82cd9e710825beb6204dfcc206e095b6572de236.png">
	<div class="ingredient_name">소고기</div>
</div1>
</a>

<a href="/recipe/recipeList?ingredient_meat=%EB%8F%BC%EC%A7%80%EA%B3%A0%EA%B8%B0">
<div1 id="19" class="col-md-1" style="float: left">
<img src ="https://d1hk7gw6lgygff.cloudfront.net/assets/_img/
ico/3-e16c5bf26b89bed785267c7a82cd9e710825beb6204dfcc206e095b6572de236.png">
	<div class="ingredient_name">돼지고기</div>

</div1>
</a>

<a href="/recipe/recipeList?ingredient_meat=%EB%8B%AD%EA%B3%A0%EA%B8%B0">
<div1 id="20" class="col-md-1" style="float: left">
<img src="https://d1hk7gw6lgygff.cloudfront.net/assets/_img/
ico/10-c096360425a3b2d8944ee3130fe11e565a3c35a64e879e19e3609a2531afac14.png">
	<div class="ingredient_name">닭고기</div>
</div1>
</a>

<a href="/recipe/recipeList?ingredient_meat=%EA%B8%B0%ED%83%80%EC%9C%A1%EB%A5%98">
<div1 id="21" class="col-md-1" style="float: left">
<img src = "https://d1hk7gw6lgygff.cloudfront.net/assets/_img/
ico/3-e16c5bf26b89bed785267c7a82cd9e710825beb6204dfcc206e095b6572de236.png"> 
	<div class="ingredient_name">기타육류</div>
</div1>
</a>

<a href="/recipe/recipeList?ingredient_vegetable=">
<div1 id="22" class="col-md-1" style="float: left">
<img src="https://d1hk7gw6lgygff.cloudfront.net/assets/_img/
ico/1-54b289fb9bb114fc9e9b9e4e82aedb8902947d86f487997ae47062caf013fde8.png">
	<div class="ingredient_name">채소류</div>
</div1>
</a>

<a href="/recipe/recipeList?ingredient_fish=">
<div1 id="23" class="col-md-1" style="float: left">
<img src="https://d1hk7gw6lgygff.cloudfront.net/assets/_img/
ico/15-bfe5b1b763a7fe3cd441f655037b7c2d416130889bd2801b74c374e1df12459f.png">
	<div class="ingredient_name">해물류</div>
</div1>
</a>

<a href="/recipe/recipeList?ingredient_egg=">
<div1 id="24" class="col-md-1" style="float: left">
<img src="https://d1hk7gw6lgygff.cloudfront.net/assets/_img/
ico/11-4a0c7bfb482c9683f1a4834636920e76665b853fd5923d661366253e6d915bf3.png">
	<div class="ingredient_name">달걀/유제품</div>
</div1>
</a>
</div>
</table>

<a href="/recipe/recipeList?ingredient_instant=">
<div1 id="25" class="col-md-1" style="float: left">
<img src="https://d1hk7gw6lgygff.cloudfront.net/assets/_img/
ico/4-f38d8368162310e685e61ca678f99b4c40d272d96522f791743f7123205e9c9c.png">
	<div class="ingredient_name">가공식품류</div>
</div1>
</a>

<a href="/recipe/recipeList?ingredient_grain=%EC%8C%80">
<div1 id= "26" class="col-md-1" style="float: left">
<img src="https://d1hk7gw6lgygff.cloudfront.net/assets/_img/
ico/20-bce8efe1eb4b6342dc03fd92fba7fbc5e761d1e745aafd9cde6a9cc0e20969c3.png">
		<div class="ingredient_name">쌀</div>
</div1>
</a>

<a href="/recipe/recipeList?ingredient_grain=%EB%B0%80%EA%B0%80%EB%A3%A8">
<div1 id="27" class="col-md-1" style="float: left">
<img src="https://d1hk7gw6lgygff.cloudfront.net/assets/_img/
ico/20-bce8efe1eb4b6342dc03fd92fba7fbc5e761d1e745aafd9cde6a9cc0e20969c3.png">
	<div class="ingredient_name">밀가루</div>
	</div1>
</a>

<a href="/recipe/recipeList?ingredient_vegetable=%EB%B2%84%EC%84%AF">
<div1 id="29" class="col-md-1" style="float: left">
<img src="https://d1hk7gw6lgygff.cloudfront.net/assets/_img/
ico/2-1656ba45df867ed122259ba838849a3367ed2f73d6e2cdbfe850915b7ba50a51.png">
	<div class="ingredient_name">버섯류</div>
</div1>
</a>

<a href="/recipe/recipeList?ingredient_fruit=">
<div1 id="30" class="col-md-1" style="float: left">
<img src="https://d1hk7gw6lgygff.cloudfront.net/assets/_img/
ico/13-55045c540859f51b6d3bb83bb4ffd4918415d82f2182e66e7f5a6ebb1fe2f287.png">
	<div class="ingredient_name">과일류</div>
</div1>
</a>

<a href="/recipe/recipeList?ingredient_nut=">
<div1 id="31" class="col-md-1" style="float: left">
<img src="https://d1hk7gw6lgygff.cloudfront.net/assets/_img/
ico/12-28c8d8ba94eeb85a6847aa0aabb9317a69baa5c2f86b4ac2aef439950a19e0eb.png">
	<div class="ingredient_name">콩/견과류</div>
</div1>
</a>

<a href="/recipe/recipeList?ingredient_grain=%EA%B8%B0%ED%83%80%EA%B3%A1%EB%A5%98">
<div1 id="32" class="col-md-1" style="float: left">
<img src="https://d1hk7gw6lgygff.cloudfront.net/assets/_img/
ico/20-bce8efe1eb4b6342dc03fd92fba7fbc5e761d1e745aafd9cde6a9cc0e20969c3.png">
	<div class="ingredient_name">기타곡류</div>
	
</div1>
<br /><br /><br /><br /><br /><br />
</a>
<br /><br /><br />
</div>
<br /><br /><br />
</div>
<br /><br /><br />
		<form action="/recipe/recipeList" method="get">
		<div style="position: absolute; left: 300px; top: 600px;">
			<label class="">육류</label>
			<select name="ingredient_meat" text="육류" class="input-sm">
				<option selected disabled>육류</option>
				<option value="소고기">소고기</option>
				<option value="돼지고기">돼지고기</option>
				<option value="닭고기">닭고기</option>
				<option value="기타 육류">기타육류</option>
			</select>
		</div>
		
		<div style="position: absolute; left: 450px; top: 600px;">
			<label class="">채소류</label>
			<select name="ingredient_vegetable" text="채소류" class="input-sm">
				<option selected disabled>채소류</option>
				<option value="가지">가지</option>
				<option value="감자">감자</option>
				<option value="고구마">고구마</option>
				<option value="당근">당근</option>
				<option value="대파">대파</option>
				<option value="미나리">미나리</option>
				<option value="배추">배추</option>
				<option value="양파">양파</option>
				<option value="콩나물">콩나물</option>
				<option value="기타">기타</option>
			</select>
		</div>	

		<div style="position: absolute; left: 600px; top: 600px;">
			<label class="">해물/해조류</label>
			<select name="ingredient_fish" text="해물/해조류" class="input-sm">
				<option selected disabled>해물/해조류</option>
				<option value="갈치">갈치</option>
				<option value="고등어">고등어</option>
				<option value="굴">굴</option>
				<option value="꼬막">꼬막</option>
				<option value="동태">동태</option>
				<option value="멸치">멸치</option>
				<option value="명란">명란</option>
				<option value="문어">문어</option>
				<option value="미역">미역</option>
				<option value="새우">새우</option>
				<option value="오징어">오징어</option>
				<option value="조개">조개</option>
				<option value="기타 해물류">기타 해물류</option>
			</select>
		</div>		

		<div style="position: absolute; left: 820px; top: 600px;">
			<label class="">달걀/유제품</label>
			<select name="ingredient_egg" text="달걀/유제품" class="input-sm">
				<option selected disabled>달걀/유제품</option>
				<option value="계란">계란</option>
				<option value="메추리알">메추리알</option>
				<option value="생크림">생크림</option>
				<option value="연유">연유</option>
				<option value="우유">우유</option>
				<option value="치즈">치즈</option>
				<option value="기타 유제품">기타 유제품</option>
			</select>
		</div>		
		
		<div style="position: absolute; left: 300px; top: 650px;">
			<label class="">가공식품류</label>
			<select name="ingredient_instant" text="가공식품류" class="input-sm">
				<option selected disabled>가공식품류</option>
				<option value="베이컨">베이컨</option>
				<option value="순대">순대</option>
				<option value="햄">햄</option>
				<option value="기타">기타</option>
			</select>
		</div>		

		<div style="position: absolute; left: 500px; top: 650px;">
			<label class="">곡류</label>
			<select name="ingredient_grain" text="곡류" class="input-sm">
				<option selected disabled>곡류</option>
				<option value="밀가루">밀가루</option>
				<option value="보리">보리</option>
				<option value="쌀">쌀</option>
				<option value="찹쌀">찹쌀</option>
				<option value="현미">현미</option>
				<option value="기타곡류">기타곡류</option>
			</select>
		</div>		

		<div style="position: absolute; left: 630px; top: 650px;">
			<label class="">과일류</label>
			<select name="ingredient_fruit" text="과일류" class="input-sm">
				<option selected disabled>과일류</option>
				<option value="귤">귤</option>
				<option value="단감">단감</option>
				<option value="딸기">딸기</option>
				<option value="레몬">레몬</option>
				<option value="매실">매실</option>
				<option value="바나나">바나나</option>
				<option value="배">배</option>
				<option value="복숭아">복숭아</option>
				<option value="사과">사과</option>
				<option value="기타과일류">기타과일류</option>
			</select>
		</div>		
		
		<div style="position: absolute; left: 800px; top: 650px;">
			<label class="">콩/견과류</label>
			<select name="ingredient_nut" text="콩/견과류" class="input-sm">
				<option selected disabled>콩/견과류</option>
				<option value="강낭콩">강낭콩</option>
				<option value="도토리">도토리</option>
				<option value="땅콩">땅콩</option>
				<option value="밤">밤</option>
				<option value="아몬드">아몬드</option>
				<option value="참깨">참깨</option>
				<option value="호두">호두</option>
				<option value="기타견과류">기타견과류</option>
			</select>
		</div>
		</div>
		<div style="position: absolute; left: 600px; top: 700px;">		
		<input type="submit" value="이 재료로 검색하기">
		
		</form>
	</div>
<%@ include file = "/WEB-INF/views/include/footer.jsp" %>
</body>
</html>