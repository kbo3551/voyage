<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛소금</title>
</head>
<body>
	<form name="MsgUrl" method="post" action="${pageContext.request.contextPath}/alert">
		<input type="hidden" name="url" value="${url}">
		<input type="hidden" id="msg" value="${msg}">
	</form>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		let msg = $("#msg").val();
		alert(msg);
		MsgUrl.submit();
	</script>
</body>
</html>