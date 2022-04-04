<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


<!-- 
<script type="text/javascript">
  function loginWithKakao() {
    Kakao.Auth.authorize({
     /*  redirectUri: 'https://developers.kakao.com/tool/demo/oauth' */
      redirectUri: 'https://naver.com'
    })
  }
  // 아래는 데모를 위한 UI 코드입니다.
  displayToken()
  function displayToken() {
    const token = getCookie('authorize-access-token')
    if(token) {
      Kakao.Auth.setAccessToken(token)
      Kakao.Auth.getStatusInfo(({ status }) => {
        if(status === 'connected') {
          document.getElementById('token-result').innerText = 'login success. token: ' + Kakao.Auth.getAccessToken()
        } else {
          Kakao.Auth.setAccessToken(null)
        }
      })
    }
  }
  function getCookie(name) {
    const value = "; " + document.cookie;
    const parts = value.split("; " + name + "=");
    if (parts.length === 2) return parts.pop().split(";").shift();
  }
</script>
 -->
 
<script>
	function idCheck(){
		var idv=document.getElementById("id").value;
		
		if (idv==""){
			alert("공백");
			return false;
		}
		
		
		$(document).ready(function(){
			$.ajax({
				type:"post",
				url: "/member/idCheck",
				data:{id: idv },
				success:function(data){
					if(data==0){
						alert("사용 가능한 아이디 입니다.");
						document.getElementById("test").value="ok";
					}
					else if(data==1){
						alert("사용중인 아이디 입니다."); 
						document.getElementById("id").value="";
						document.getElementById("test").value="";
					}
				}
			});
		});
	}

	function inputCheck(){
		
		var idv=document.getElementById("id").value;
		var inputresult = document.getElementById("test").value;
		var inputemail = document.getElementById("email").value;
		var inputphone_number = document.getElementById("phone_number").value;
		var inputbirthday = document.getElementById("birthday").value;
		var inputpassword = document.getElementById("password").value;
		
		
		if (inputresult == "" || inputemail==""||inputphone_number==""|| inputbirthday==""|| inputpassword==""||idv==""){
			alert("빈공란이 있습니다..");
			return false;
		}
	}
	
</script>






<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>회원가입</title>

    <!-- Custom fonts for this template-->
    <link href="../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">회원가입</h1>
                            </div>
                             <form class="user" action="/member/inputPro" method="post" onsubmit="return inputCheck();">
                            	<div class="row">
	                            	 <div class="col-md-6 mb-3">
	                            	 	<label for="id">아이디</label>
	                            	 		<input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력해주세요." value="" required>
	                            	 		<div class="invalid-feedback">
	                            	 		</div>
	                            	 </div>
	                            	 <div class="col-md-6 mb-3">
	                            	 	<label for="idCheck">. </label>
	                            	 	<div></div>
	                            	 		<input type="text" class="btn btn-primary" onclick="idCheck()" value="아이디 중복확인 클릭" >
	                            	 		<div class="invalid-feedback">
	                            	 		</div>
	                            	 </div>
	                            	 
                            	</div>
                            	<div class="mb-3">
                            		<label for="password">비밀번호<span class="text-muted"></span></label>
                            		<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력해주세요.">
                            	</div>
                            	
                            	<div class="mb-3">
                            		<label for="email">이메일</label>
                            			<input type="email" class="form-control" id="email" placeholder="abcd1234@gmail.com" name="email" required>                            			<div class="invalid-feedback">
                            			</div>
                            	</div>
                            	<div class="mb-3">
                            		<label for="phone_number">핸드폰 번호</label>
                            			<input type="text" class="form-control" id="phone_number" name="phone_number" placeholder="핸드폰 번호 입력해주세요. (ex.010-1234-5678)" required>
                            			<div class="invalid-feedback">
                            			</div>
                            	</div>
                            	
                            	<div class="row">
                            		<div class="col-md-8 mb-3">
                            			<label for="gender">성별</label>
                            			<select class="custom-select d-black w-100" id="gender" name="gender">
                            				<option value=""></option>
                            				<option value="male">남자</option>
                            				<option value="female">여자</option>
                            			</select>
                            			<div class="invalid-feedback">
                            			</div>
                            		</div>
                            	<div class="col-md-4 mb-3">
                            	 	<label for="birthday">생년월일</label>
	                            	 	<input type="date" class="form-control" id="birthday" name="birthday" required>
	                            	 	<div class="invalid-feedback">
                            	 	</div>
                            	</div>
                        	</div>
                        
                        <hr class="mb-4">
                        <div class="custom-control custom-checkbox">
                        	<input type="checkbox" class="custom-control-input" id="aggrement" required>
                        	<label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
                        </div>
					<div class="mb-4"></div>
						<a class="btn btn-primary btn-lg btn-black" type="submit" href="/member/login">취소</a>
						<div style="float: right;">
						<button class="btn btn-primary btn-lg btn-black" type="submit">가입완료</button>
						</div>
                                   
	                   </form>
                   </div>
                 </div>
             </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="../resources/vendor/jquery/jquery.min.js"></script>
    <script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../resources/js/sb-admin-2.min.js"></script>

</body>

</html>