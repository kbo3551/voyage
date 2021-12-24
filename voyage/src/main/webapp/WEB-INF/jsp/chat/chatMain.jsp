<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VOYAGE - CHAT</title>

<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/sockjs-client/sockjs.min.js"></script>
<script src="/webjars/stomp-websocket/stomp.min.js"></script>
<link rel="stylesheet" href="/webjars/bootstrap/5.1.3/css/bootstrap.min.css">

</head>
<body style="background-color:rgba(138,212,3,1);">
	<div style="width:450px; height:700px; margin:0px;">
		<h2 class="m-3">채팅</h2>
		<div class="m-3 p-3" style="background-color:white; border-radius:10px;">
			<table class="table table-hover">
				<c:forEach var="list" items="${chatList}">
					<tr>
						<td>${list.member.memberNickname} - ${list.member.memberLevel}</td>
						<td>${list.chatContent} - ${list.createDate}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>