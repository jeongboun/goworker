<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<title>recipe update.jsp!</title>
</head>
<script>
	function fileUpload(){
				
	}
</script>
<body>
	<form action="updatePro" method="post">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h3>레시피 등록</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4" style="float: right">
					<label class="">요리 대표 사진을 등록해 주세요.</label> </br> <img src="/resources/img/represent.png" onclick="fileUpload()" />
					<input type="file" name="image" id="food" value="${article.image}" accept="jpeg,png,gif" />
				</div>
				<div class="col-md-8">
					<label class="">레시피 제목</label> </br>
					<input type="text" name="title" value="${article.title}" placeholder="예) 소고기 미역국 꿇이기" />
				</div>
				<div class="col-md-8">
					<label class="">요리 소개 </label>
					<textarea class="form-control" name="brief" rows="3" placeholder="이 레시피의 탄생배경을 적어주세요. 예) 남편의 생일을 맞아 소고기 미역국을 끓여봤어요. 어머니로부터 배운 미역국 레시피를 남편의 입맛에 맞게 고안했습니다.">${article.brief}</textarea>
				</div>
				<div class="col-md-8">
					<label class="">동영상</label>
					<textarea class="form-control" name="video" rows="3" placeholder="동영상이 있으면 주소를 입력하세요.(Youtube,네이버tvcast,다음tvpot 만 가능) 예)http://youtu.be/lA0Bxo3IZmM"></textarea>
					<input type="file" name="video" id="video" accept="avi,mp4,wmv,mkv">
				</div>

				<div class="col-md-8">
					<label class="">카테고리</label>
					<select name="nation_code"value="${article.nation_code}" text="나라별" class="input-sm">
						<option selected disabled>나라</option>
						<option value="1">한국</option>
						<option value="2">미국</option>
						<option value="3">일본</option>
						<option value="4">중국</option>
						<option value="5">멕시코</option>
						<option value="6">이탈리아</option>
						<option value="7">베트남</option>
						<option value="8">기타</option>
					</select>
					<select name="level_code" value="${article.level_code}" text="난이도" class="input-sm">
						<option selected disabled>난이도</option>
						<option value="9">누구나</option>
						<option value="10">하급</option>
						<option value="11">중급</option>
						<option value="12">상급</option>
						<option value="13">최상급</option>
					</select>
					<select name="time_code" value="${article.time_code}" text="시간별" class="input-sm">
						<option selected disabled>시간</option>
						<option value="14">10분이내</option>
						<option value="15">30분이내</option>
						<option value="16">1시간이내</option>
						<option value="17">1시간이상</option>
					</select>
					<select name="igrdnt_code" value="${article.igrdnt_code}" text="재료별"  class="input-sm">
						<option selected disabled>재료별</option>
						<option value="18">소고기</option>
						<option value="19">돼지고기</option>
						<option value="20">닭고기</option>
						<option value="21">육류</option>
						<option value="22">채소류</option>
						<option value="23">해물류</option>
						<option value="24">달걀/유제품</option>
						<option value="25">가공식품류</option>
						<option value="26">쌀</option>
						<option value="27">밀가루</option>
						<option value="28">건어물류</option>
						<option value="29">버섯류</option>
						<option value="30">과일류</option>
						<option value="31">콩/견과류</option>
						<option value="32">곡류</option>
						<option value="33">기타</option>
					</select>
				</div>
			</div>
			<div class="row">
				<span style="font-size: 14px; display: inline-block; inline-height: 1.8; margin-top: 6px; color: #999; padding: 0 0 0 20px; verical-align: top;"> 재료가 남거나 부족하지 않도록 정확한 계량정보를 적어주세요.</span>
			</div>
			<div class="row">
				<ul class="" id="" style="list-style: none; padding-left: 15px;">
					<li>
                    <!-- <span class="recipeErrorMessage" id="recipeIngredients" style="display: none;">재료를 적어주세요</span> -->
                    <label for="Ingredients">재료들</label></br>
                    <textarea class="form-control" cols="20" id="Ingredients" name="ingredient" placeholder="각 재료당 한 줄씩 적어주세요." rows="5" style="width: 600px;">${article.ingredient}</textarea>
               		</li>
               		<li>
                    <!-- <span class="recipeErrorMessage" id="recipeDirections" style="display: none;">요리법을 적어주세요</span> -->
                    <label for="Directions">요리법</label></br>
                    <textarea class="form-control" cols="20" id="Directions" name="explain" placeholder="한 줄당 각 스탭을 적어주세요. " rows="5" style="width: 600px;">${article.explain} </textarea>
                	</li>
				</ul>
			</div>
			<div class="row">
				<ul class="" id="" style="list-style: none; padding-left: 15px;">
					<li>
                    <label for="tags">태그</label></br>
                    <input type="text" size="40" maxlength="30" name="tag" value="${article.tag}"> 
                	</li>
				</ul>
			</div>
			<div class="row"style="text-align:center;">
				<input type="submit" value="등록" />
			</div>
		</div>
	</form>
</body>
</html>