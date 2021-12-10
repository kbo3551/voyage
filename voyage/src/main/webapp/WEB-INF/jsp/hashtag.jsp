<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.btn {
  	margin: 5px;
  	padding: 25px;
}
</style>
</head>
<body>
	<c:forEach items="${hashtagList }" var="hashtag">
	
			<a href="#?hashtag=${hashtag.hashtag }">
				<button type="submit" class="btn" style="background: rgb(0,172,238); background: linear-gradient(0deg, rgba(0,172,238,1) 0%, rgba(2,126,251,1) 100%);">
					${hashtag.hashtag }
				</button>
			</a>
			
	</c:forEach>
</body>
</html>