<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">





<!-- 아이디 비밀번호 입력됬는지 확인 -->
<script>
	function checkValue(){
		var usv = document.getElementById("id").value;
		var pwv = document.getElementById("password").value;
		
		if(usv == ""){
			alert("아이디를 입력하세요.");
			return false;
		}
		if(pwv==""){
			alert("비밀번호를 입력하세요.");
			return false;
		}
	}
	
	
	function kakaoLogout() {
	    if (Kakao.Auth.getAccessToken()) {
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log(response)
	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    }
	  }  
	
	function secession( {
		Kakao.API.request({
			url:'/v1/user/unlink',
			success : function(responce){
				consol.log(responce);
				
				window.location.href='/"
				
			},
			fail: function(error){
				console.log('탈퇴미완료')
				console.log(error);
				
			},
		});
	});
</script>


<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>로그인</title>

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

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">로그인</h1>
                                    </div>
                                    <form class="user" action="/member/loginPro"  method="post">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                name="id" id="id" aria-describedby="emailHelp"
                                                placeholder="아이디를 입력하세요.">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user" id="password"
                                                name="password" placeholder="비밀번호를 입력하세요.">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">아이디 저장</label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                        	<input type="submit"  class="btn btn-primary btn-user btn-block" onclick="return checkValue();" value="로 그 인">

                                       	 		
                                       	 		<a href="https://kauth.kakao.com/oauth/authorize?client_id=9c8ff684c8cb53ebeabe98bab630956c&redirect_uri=http://localhost:8080/member/kakaologin&response_type=code"
                                       	 class="btn btn-facebook btn-user btn-block"  >
                                           카카오톡 계정으로 로그인
                                       	</a>
                                        	
                                        </div>
                                     <!--    <a href="/member/loginPro" class="btn btn-primary btn-user btn-block">
                                            로그인 -->
                                        </a>
                                        <hr>
                                        <a href="/member/input" class="btn btn-google btn-user btn-block">
                                           일반 회원가입
                                        </a>
                                       <!--  <input type="button" value="gg" onclick="secession()"/> -->
                                        
                             <%--            
						     <span th:if="${userId!==null}">                         
								<form name="logout" action="http://localhost:8080/logout">
									<input type="submit" value="로그아웃">
								</form>
							</span> --%>
                                       
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="/member/find_username">아이디 찾기</a>
                                    <div class="text-center">
                                        <a class="small" href="/member/find_userpw">비밀번호 찾기</a>
                                    </div>
                                    
                                </div>
                            </div>
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