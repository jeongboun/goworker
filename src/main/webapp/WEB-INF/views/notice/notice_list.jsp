<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>공지 사항</title>
    					
    					
    <!-- Custom fonts for this template -->
    <link href="../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">


    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../resources/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="../resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">유캔쿡</h1>
                    <p class="mb-4">공지사항 게시판 입니다. 1:1문의사항은 <a target="_blank"
                            href="/notice/service_list">고객센터로 문의 바랍니다</a>.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
								
								  <c:if test="${sessionScope.id!=admin}">
										 <div style="float: right;">
										 <tr>
										    <td align="right" bgcolor="${value_c}">
										       <a href="/notice/notice_write">글쓰기</a>
										    </td>
										  </tr>
										  </div>
								  </c:if>
								  
								
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>날짜</th>
                                            <th>조회수</th>
                                        </tr>
                                    </thead>
                                   
                                    <tbody>
                                    	<c:forEach var="notice" items="${articleList}">
                                    			<tr>
	                                    			<td>${notice.num}</td>
	                                    			<td>
	                                    				<a href="/notice/notice_content?num=${notice.num}&pageNum=${currentPage}">
	                                    				${notice.nsubject}</a>
	                                    			</td>
			                                    		<c:if test="${notice.nreadcount >= 20}"> </c:if>
																 											
	                                    			<td>${notice.ndate}</td>
	                                    			<td>${notice.nreadcount}</td>
                                        		</tr>
                                       
                                    	</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>


    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>


    <!-- Bootstrap core JavaScript-->
    <script src="../resources/vendor/jquery/jquery.min.js"></script>
    <script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="../resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="../resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  
	<div align="center">
		<c:if test="${count > 0}">
		   <c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}"/>
		   <c:set var="pageBlock" value="${10}"/>
		   <fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
		   <c:set var="startPage" value="${result * 10 + 1}" />
		   <c:set var="endPage" value="${startPage + pageBlock-1}"/>
		   <c:if test="${endPage > pageCount}">
		        <c:set var="endPage" value="${pageCount}"/>
		   </c:if> 
		          
		   <c:if test="${startPage > 10}">
		        <a href="/notice/notice_list?pageNum=${startPage - 10 }">[이전]</a>
		   </c:if>
		
		   <c:forEach var="i" begin="${startPage}" end="${endPage}">
		       <a href="/notice/notice_list?pageNum=${i}">[${i}]</a>
		   </c:forEach>
		
		   <c:if test="${endPage < pageCount}">
		        <a href="/notice/notice_list?pageNum=${startPage + 10}">[다음]</a>
		   </c:if>
		</c:if>
	</div>
</body>

</html>