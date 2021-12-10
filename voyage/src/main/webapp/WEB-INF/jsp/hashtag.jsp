<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${hashtagList }" var="hashtag">
		<button>${hashtag.hashtag }</button>
	</c:forEach>
	<h1>hasgtag1</h1>
	<h1>hasgtag2</h1>
	<h1>hasgtag3</h1>
	<h1>hasgtag4</h1>
	<h1>hasgtag5</h1>
</body>
</html>