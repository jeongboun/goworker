<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>






<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>공지사항 작성</title>

    <!-- Custom fonts for this template-->
    <link href="../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../resources/css/sb-admin-2.min.css" rel="stylesheet">
</head>


<body>

      <div class="col-lg-7">
          <div class="p-5">
             <div class="text-center">
                 <h1 class="h4 text-gray-900 mb-4">공지사항 수정</h1>
             </div>
				<div class="container">
					<form action="/notice/notice_writePro" method="POST">
					
						<div class="form-group">
							<label for="nsubject">제목:</label>
							<input type="text" class="form-control" placeholder="제목" id="nsubject" name="nsubject" value="${content.nsubject}">
						</div>
					
						<div class="form-group">
							<label for="ncontent">내용:</label>
							<textarea id="summernote" class="form-control" rows="5" id="ncontent" name="ncontent" value="${content.ncontent}"></textarea>
							
							<!-- id="summernote" -->
						</div>
					
						<button type="submit" class="btn btn-primary">글쓰기 수정</button>
						<button type="button" onclick="history.go(-1)" class="btn btn-primary">취소</button>
					</form>
					
				</div>
			</div>
	
	
</div>

		<script>
	      $('#summernote').summernote({
	        placeholder:'${content.ncontent}',
	        tabsize: 2,
	        height: 400
	      });
 	   </script>
 	   
 <script>
 function sendFile(file,editor,welEditable) {
	    data = new FormData();
	    data.append("file", file);
	    $.ajax({
	        data: data,
	        type: "POST",
	        url: "/write/imageUpload",
	        enctype: 'multipart/form-data',
	        cache: false,
	        contentType: false,
	        processData: false,
	        success: function(response) {
	            if (response.error){
	                alert('에러가 발생했습니다. ' + response.error);
	            } else {
	                $('#summernote').summernote('insertImage', response.url);
	            }
	        }
	    });
	}
 
 </script>
 <script>
 
	 router.post('/imageUpload',multipartMiddleware,function(req,res){
		    f = fs.readFileSync(req.files.file.path);
		    base64 = Buffer.from(f).toString('base64');
		    
		    var imgbbAPI = require('../imgbbAPIkey.json'); // API KEY
		    const options = {
		        uri:'https://api.imgbb.com/1/upload?expiration=600&key='+imgbbAPI.key, 
		        method: 'POST',
		        form: {
		          image:base64, // 이미지 첨부
		        },
		        json: true // json 형식으로 응답
		    }
		    request.post(options, function(error,httpResponse,body){
		        if(error){
		            res.send({error: error});
		        } else{
		            res.send({url: body.data.display_url});
		        }
		    });
		});
 
 
 </script>
 
 
 	   
	


</body>
</html>

