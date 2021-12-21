<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
    	<h3>NAME : ${accomBuilding.accomBuildingName}</h3>
    	<h3>DESCRIPTION : ${accomBuilding.accomBuildingDescription}</h3>
    	<h3>PHONE : ${accomBuilding.accomBuildingPhone}</h3>
    	<h3>ADDRESS : ${accomBuilding.accomAddress.accomAddressPotalCode} | ${accomBuilding.accomAddress.accomAddressZip}, ${accomBuilding.accomAddress.accomAddressDetail}</h3>
    	<c:forEach items="${accomBuilding.accomBuildingImageList}" var="ai">
    		<div>
    			<img alt="${ai.accomBuildingImageName}.${accomBuildingImageExt}" src="${pageContext.request.contextPath}/image/accom_building/${ai.accomBuildingImageName}.${accomBuildingImageExt}">
    		</div>
    	</c:forEach>
    	<c:forEach items="${accomBuilding.accomBuildingFacilityList}" var="af">
    		<h3>FACILITY : ${af.accomBuildingFacilityName}</h3>
    	</c:forEach>
    	<c:forEach items="${accomBuilding.accomBuildingSpotList}" var="as">
    		<hr>
    		<h3>SPOT NAME : ${as.accomBuildingSpotName}</h3>
    		<h3>SPOT CATEGORY : ${as.accomBuildingSpotCategory}</h3>
    		<h3>SPOT DESCRIPTION : ${as.accomBuildingSpotDescription}</h3>
    		<hr>
    	</c:forEach>
    	<c:forEach items="${accomBuilding.hashtagList}" var="ah">
    		<h3>HASHTAG : ${ah.hashtag}</h3>
    	</c:forEach>
    </div>
</body>
</html>