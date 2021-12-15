<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="assets/js/wow.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/hashtag.css">
</head>
<body>
   <div id="hashtag_search">
      <div class="center_wrap">
         <div class="hero__caption">
              <h1>더 다양한 해시태그가 궁금하다면?</h1>
              <span class="scroll">scroll !</span>
         </div>
      </div>
   </div>
   <div class="center_wrap" style="padding-top: 100px;">
      <c:forEach items="${hashtagList }" var="hashtag" varStatus="status">
         <a href="/hashtag?hashtag=${hashtag.hashtag }">
            <button type="submit" class="btn wow pulse fadeInDown animated" data-wow-delay="0.${status.count }s"
                  style="visibility: visible; animation-delay: 0.${status.count}s; animation-name: fadeInDown;"
                  id="hashtag${status.count}" >
               		#${hashtag.hashtag }
            </button>
         </a>
      </c:forEach>
   </div>
   
   <script src="${pageContext.request.contextPath}/assets/js/hashtag.js"></script>   
</body>
</html>