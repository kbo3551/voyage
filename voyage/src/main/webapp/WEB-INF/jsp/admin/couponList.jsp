<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
<meta name="author" content="AdminKit">
<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="shortcut icon" href="img/icons/icon-48x48.png" />

<link rel="canonical" href="https://demo-basic.adminkit.io/" />

<title>쿠폰 리스트</title>

<link href="${pageContext.request.contextPath}/admin/css/app.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>
  <!-- 눈누 - 한산스네오 레귤러 폰트 -->
	<style type="text/css">
	
		@font-face {
		    font-family: 'SpoqaHanSansNeo-Regular';
		    	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SpoqaHanSansNeo-Regular.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		
		body {
			font-family: 'SpoqaHanSansNeo-Regular';
		}

	</style>
<body>
   <div class="wrapper">
      <!-- adminKit : 시작 -->
      <c:import url="partial\\adminKit.jsp" />
      <!-- adminKit : 끝 -->
      <div class="main">
         <!-- adminKit : 시작 -->
         <c:import url="partial\\\\adminBanner.jsp" />
         <!-- adminKit : 끝 -->
         <main class="content">
            <div class="container-fluid p-0">
               <h1 class="h3 mb-3">
                  <strong>쿠폰 관리</strong>
               </h1>
               <div class="row">
                  <div>
                     <div class="card flex-fill">
                        <div class="card-header">
                           <h5 class="card-title mb-0">쿠폰 발급 현황</h5>
                        </div>
                        <table class="table table-hover my-0">
                           <thead>
                              <tr>
                             	 <th>쿠폰 번호</th>
                                 <th>쿠폰 이름</th>
                                 <th>조건 금액</th>
                                 <th>할인 금액</th>
                                 <th>만료 일자</th>
                                 <th>쿠폰 상태</th>
                                 <th>쿠폰 생성일</th>
                                 <th></th>
                                 <th></th>
                              </tr>
                           </thead>
                           <tbody>
                              <c:forEach items="${couponList}" var="c">
						        <c:if test="${c.couponState != '삭제'}">
                                 <tr>
                                 	<td width="10%">${c.couponNo}</td>
                                    <td width="15%">${c.couponName}</td>
                                    <td >${c.couponTerms}</td>
                                    <td>${c.couponDiscount}</td>
                                    <td>${c.deadLine}</td>
                                    <td>${c.couponState}</td>
                                    <td>${c.createDate}</td>
                                    <td style="text-align:left;"><label></label>    
                                    <form class="form-contact contact_form mb-80" name="updateCoupon" id="updateCoupon" action="${pageContext.request.contextPath}/admin/updateCoupon?couponNo=${c.couponNo}" method="post">
                                  		<select style=" height: 30px; text-align:left;" name="couponState" id="couponState">
				                            <option value="활성화">활성화</option>
				                            <option value="비활성화">비활성화</option>
				                            <option value="삭제">삭제</option>
										</select>
										&emsp;
									<button class="btn btn-finish btn-primary" type="submit">수정</button>
										</form>
										</td>
                                	 </tr>
                                 </c:if>
                              </c:forEach>
                           </tbody>
                        </table>
                     </div>
                  </div>
               </div>
            </div>
            <div align="right" style="height: 100px;"><a class="btn btn-finish btn-primary" href="${pageContext.request.contextPath}/admin/addCoupon" class="btn">쿠폰 추가</a></div>
         </main>
           <!-- 페이징 -->
             <div class="container">
                <ul class="nav justify-content-center bg-light">
                   <c:if test="${beginRow > (ROW_PER_PAGE * 10)}">
                      <li><a href="${pageContext.request.contextPath}/admin/couponList?currentPage=${pageNo-1}">&lt;</a></li>
                   </c:if>
                   <c:set var="doneLoop" value="false"></c:set>
                   <c:forEach var="f" begin="${pageNo}" end="${pageNo + 9}">
                      <c:if test="${not doneLoop}">
                         <c:choose>
                            <c:when test="${currentPage == f}">
                               <li class="active"><span>${f}</span></li>
                            </c:when>
                            <c:otherwise>
                               <li><a class="nav-link active" href="${pageContext.request.contextPath}/admin/couponList?currentPage=${f}">${f}</a></li>
                            </c:otherwise>
                         </c:choose>
                         <c:if test="${f == lastPage}">
                            <c:set var="doneLoop" value="true"></c:set>
                         </c:if>
                      </c:if>
                   </c:forEach>
                   <c:if test="${currentPage + 10 <= lastPage}">
                      <li><a class="nav-link active" href="${pageContext.request.contextPath}/admin/couponList?currentPage=${pageNo+10}">&gt;</a></li>
                   </c:if>
                </ul>
          </div> 
         <!-- adminFooter : 시작 -->
         <c:import url="partial\\\\adminFooter.jsp" />
         <!-- adminFooter : 끝 -->
      </div>
   </div>
   <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
   <script src="${pageContext.request.contextPath}/admin/js/app.js"></script>
</body>

</html>
