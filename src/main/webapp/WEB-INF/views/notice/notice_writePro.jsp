<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result==1}">

<script>
	alert("글완료");
	window.location="/notice/notice_list";
	

</script>


<!-- <script>
//------ 글 내용 js 시작 ------
$(document).ready(function() {
	function sendFile(file){
		var data = new FormData();	
		data.append("file",file);
			$.ajax({
			  url: 본인 주소 적어주면 됨.
			  type: "POST",
			  enctype: 'multipart/form-data',
			  data: data,
			  cache: false,
			  contentType : false,
			  processData : false,
			  success: function(image){	
				$('#summernote').summernote('insertImage',image);
				},
				 error: function(e){console.log(e);}  
				});	
			}

				
                // summernote 
                $('#summernote').summernote({
                height :300,
                minHeight:null,
                maxHeight:null,
                focus:true,
                lang : "ko-KR",
                placeholder: '내용을 입력해주세요',
                callbacks: {
                onImageUpload : function(files){
                sendFile(files[0]);
                }
                }
                });



}); //ready


</script>
 -->


</c:if>