<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	<title>AdminKit Demo - Bootstrap 5 Admin Templateee</title>

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
    	<c:import url="partial\\adminKit.jsp"/>
    <!-- adminKit : 끝 -->
	<div class="main">
    <!-- adminKit : 시작 -->
    	<c:import url="partial\\\\adminBanner.jsp"/>
    <!-- adminKit : 끝 -->
    	<main class="content">
			<div class="container-fluid p-0">
				<h1 class="h3 mb-3"><strong>문의글</strong>  상세보기</h1>
			</div>
			<div class="row">
				<div class="col-12 col-lg-8 col-xxl-9 d-flex">
					<div class="card flex-fill">
						<div class="card-header">
							<h3 class="h3 mb-3">${qna.memberNickname}님의 문의글</h3>
						</div>
						<div class="card">
							<div class="card-header">
								<div>No.${qna.qnaNo}</div>
								<div>
									<h5 class="card_title mb-0">Title : ${qna.qnaTitle}</h5>
								</div>
								<br>
								<div class="form-group">
                                  <label>카테고리</label>
                                  <input name="qnaCategory" id="qnaCategory" class="form-control" type="text" readonly="readonly" value="${qna.qnaCategory}" readonly="readonly">
                             	</div>
        	                    <div class="form-group">
                                  <label>비밀글 여부</label>
                                  <input name="qnaSecret" id="qnaSecret" class="form-control" type="text" readonly="readonly" value="${qna.qnaSecret}" readonly="readonly">
                             	</div>
                            	<div class="form-group">
                                  <label>작성일</label>
                                  <input name="createDate" id="createDate" class="form-control" type="text" readonly="readonly" value="${qna.createDate}" readonly="readonly">
                             	</div>
                            	<div class="form-group">
                                  <label>수정일</label>
                                  <input name="updateDate" id="updateDate" class="form-control" type="text" readonly="readonly" value="${qna.updateDate}" >
                             	</div>
							</div>
						</div>
						<div class="card_body">
							<div>
								<label>글내용</label>
								<textarea cols="80" readonly="readonly">${qna.qnaContent}</textarea>
							</div>
							<div>
								<label>첨부파일</label>
	                            <img width="400px" height="200px" src="${pageContext.request.contextPath}/resources/image/qna/${qna.qnaImg.qnaImgName}.${qna.qnaImg.qnaImgExt}">
							</div>
						</div>
						<div>
							<a href="${pageContext.request.contextPath}/admin/adminQnaList?pageNo=1" class="btn">Back</a>
							<a href="${pageContext.request.contextPath}/admin/addA?qnaNo=${qna.qnaNo}" class="btn btn-primary btn-lg">Write</a>
						</div>
                   	</div>
				</div>
			</div>
	</main>
      <!-- adminFooter : 시작 -->
    	<c:import url="partial\\\\adminFooter.jsp"/>
    <!-- adminFooter : 끝 -->
		</div>
	</div>  
		<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/admin/js/app.js"></script>
</body>
</html>