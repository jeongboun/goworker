<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



    
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



   <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">${session.username}님의 작성한 글 목록 입니다. 
                            (
                  		      <c:set var="startDay" value="<%=new java.util.Date()%>" />
                     
                            <fmt:formatDate value="${startDay}" pattern="yyyy-MM-dd" />
							~
                          <c:set var="endDay" value="<%=new java.util.Date()%>" />
                            <fmt:formatDate value="${endDay}" pattern="yyyy-MM-dd" /> )
                            </h6>
				
				<%-- 
					<jsp:useBean id="now" class="java.util.Date" />
					<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="today" />
					오늘 날짜 : <c:out value="${today}"/>
					 --%>
						<c:if test="${count == 0 }">
							<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						      <tr>
						      	<td aling="center">
						      	 작성된 게시글이 없습니다.
						      	 </td>
						      	</tr>                 			
						</table>
						</c:if>

                        </div>
                        <c:if test="${count > 0 }"></c:if>
                        
            
                        
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">

                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>조회수</th>
                                        </tr>
                                    </thead>
                                    <c:forEach var="article" items="${articleList}">
                                   
                                    	<tbody>
                                       	 <tr>
                                            <td>${number}</td>
                                            <c:set var="number" value="${number - 1 }"/>
                                            <td>${article.subject}</td>
                                            <td>${article.writer}</td>
                                            <td>${article.reg_date}</td>
                                            <td>${article.readcount}</td>
                                       	 </tr>
                                    	</tbody>
                                  	</c:forEach>
                                </table>
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

    <!-- Page level plugins -->
    <script src="../resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="../resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="../resources/js/demo/datatables-demo.js"></script>

</body>
</html>