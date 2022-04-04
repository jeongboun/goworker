<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<title>recipe write.jsp!</title>

<c:if test="${sessionScope.id==null}">
	<script>
		alert("로그인하세요");
		window.location = "/member/login";
	</script>
</c:if>
<c:if test="${sessionScope.id!=null}">
	<body>
		<form action="/recipe/writePro" method="post" enctype="multipart/form-data">
			<input type="hidden" name="writer" value="${userName}" />
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h3>레시피 등록</h3>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4" style="float: right">
						<label class="">요리 대표 사진을 등록해 주세요.</label></br> <img 
						src="/resources/img/represent.png" 
						id="image_preview" onclick="fileUpload()" 
						style="cursor: pointer;" width="250" height="250" />
						<input type="file" name="save" id="image" 
						accept="image/*" onchange="setThumbnail();" 
						style="display: none;" />
						
					</div>
					<div class="col-md-8">
						<label class="">레시피 제목</label> </br>
						<input type="text" name="title" placeholder="예) 소고기 미역국 꿇이기" />
					</div>
					<div class="col-md-8">
						<label class="">요리 소개 </label>
						<textarea class="form-control" name="brief" rows="3" placeholder="이 레시피의 탄생배경을 적어주세요. 예) 남편의 생일을 맞아 소고기 미역국을 끓여봤어요. 어머니로부터 배운 미역국 레시피를 남편의 입맛에 맞게 고안했습니다."></textarea>
					</div>
					<div class="col-md-4" style="float: left;">
						<label class="">동영상</label>
						<textarea class="form-control" name="video" id="video" rows="3" placeholder="동영상이 있으면 주소를 입력하세요.(Youtube,네이버tvcast,다음tvpot 만 가능) 예)http://youtu.be/lA0Bxo3IZmM" cols="10"></textarea>
					</div>
					<!-- <div class="col-md-4" style="float:right;">
					<img src="/resources/img/thumbnail.png" id="video_preview" width="150" height="150"/>
				</div> -->

					<div class="col-md-8">
						<label class="">카테고리</label>
						<select name="nation_code" text="나라별" class="input-sm">
							<option value="">나라</option>
							<option value="한국">한국</option>
							<option value="미국">미국</option>
							<option value="일본">일본</option>
							<option value="중국">중국</option>
							<option value="멕시코">멕시코</option>
							<option value="이탈리아">이탈리아</option>
							<option value="베트남">베트남</option>
							<option value="기타">기타</option>
						</select>
						<select name="level_code" text="난이도" class="input-sm">
							<option value="">난이도</option>
							<option value="누구나">누구나</option>
							<option value="하급">하급</option>
							<option value="중급">중급</option>
							<option value="상급">상급</option>
							<option value="최상급">최상급</option>
						</select>
						<select name="time_code" text="시간별" class="input-sm">
							<option value="">시간</option>
							<option value="10분이내">10분이내</option>
							<option value="30분이내">30분이내</option>
							<option value="1시간이내">1시간이내</option>
							<option value="1시간이상">1시간이상</option>
						</select>
					</div>
						
						<div class="col-md-8">
						<label class="">메인 재료 등록</label>
						</div>
						<div class="col-md-8">
						<label class="">육류</label>
						<select name="ingredient_meat" text="육류" class="input-sm">
							<option value="">육류</option>
							<option value="소고기">소고기</option>
							<option value="돼지고기">돼지고기</option>
							<option value="닭고기">닭고기</option>
							<option value="기타 육류">기타육류</option>
						</select>

						<label class="">채소류</label>
						<select name="ingredient_vegetable" text="채소류" class="input-sm">
							<option value="">채소류</option>
							<option value="가지">가지</option>
							<option value="감자">감자</option>
							<option value="고구마">고구마</option>
							<option value="당근">당근</option>
							<option value="대파">대파</option>
							<option value="미나리">미나리</option>
							<option value="버섯">버섯</option>
							<option value="배추">배추</option>
							<option value="양파">양파</option>
							<option value="콩나물">콩나물</option>
							<option value="기타">기타</option>
						</select>

						<label class="">해물/해조류</label>
						<select name="ingredient_fish" text="해물/해조류" class="input-sm">
							<option value="">해물/해조류</option>
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

						<label class="">달걀/유제품</label>
						<select name="ingredient_egg" text="달걀/유제품" class="input-sm">
							<option value="">달걀/유제품</option>
							<option value="계란">계란</option>
							<option value="메추리알">메추리알</option>
							<option value="생크림">생크림</option>
							<option value="연유">연유</option>
							<option value="우유">우유</option>
							<option value="치즈">치즈</option>
							<option value="기타 유제품">기타 유제품</option>
						</select>
						</br> 
						<label class="">가공식품류</label>
						<select name="ingredient_instant" text="가공식품류" class="input-sm">
							<option value="">가공식품류</option>
							<option value="베이컨">베이컨</option>
							<option value="순대">순대</option>
							<option value="햄">햄</option>
							<option value="기타">기타</option>
						</select>

						<label class="">곡류</label>
						<select name="ingredient_grain" text="곡류" class="input-sm">
							<option value="">곡류</option>
							<option value="밀가루">밀가루</option>
							<option value="보리">보리</option>
							<option value="쌀">쌀</option>
							<option value="찹쌀">찹쌀</option>
							<option value="현미">현미</option>
							<option value="기타곡류">기타곡류</option>
						</select>

						<label class="">과일류</label>
						<select name="ingredient_fruit" text="과일류" class="input-sm">
							<option value="">과일류</option>
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

						<label class="">콩/견과류</label>
						<select name="ingredient_nut" text="콩/견과류" class="input-sm">
							<option value="">콩/견과류</option>
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
				<div class="row">
					<span style="font-size: 14px; display: inline-block; inline-height: 1.8; margin-top: 6px; color: #999; padding: 0 0 0 20px; verical-align: top;"> 재료가 남거나 부족하지 않도록 정확한 계량정보를 적어주세요.</span>
				</div>
				<div class="row">
					<ul class="" id="" style="list-style: none; padding-left: 15px;">
						<li>
							<!-- <span class="recipeErrorMessage" id="recipeIngredients" style="display: none;">재료를 적어주세요</span> --> <label for="Ingredients">기타 재료들</label></br> <textarea class="form-control" cols="20" id="Ingredients" name="ingredient" placeholder="기타 필요한 재료를 등록해주세요." rows="5" style="width: 600px;"></textarea>
						</li>
						<li>
							<!-- <span class="recipeErrorMessage" id="recipeDirections" style="display: none;">요리법을 적어주세요</span> --> <label for="Directions">요리법</label></br> <textarea class="form-control" cols="20" id="Directions" name="explain" placeholder="한 줄당 각 스탭을 적어주세요. " rows="5" style="width: 600px;"></textarea>
						</li>
					</ul>
				</div>
				<div class="row">
					<ul class="" id="" style="list-style: none; padding-left: 15px;">
						<li><label for="tags">태그</label></br> <input type="text" size="40" maxlength="30" name="tag" value="#"></li>
					</ul>
				</div>
				<div class="row" style="text-align: center;">
					<input type="submit" value="등록" />
				</div>
			</div>
		</form>
	</body>
</c:if>