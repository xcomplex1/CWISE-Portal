﻿<%@ include file="../include.jsp"%>

<!DOCTYPE html>
<html xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="chrome=1" />

<link href="<spring:theme code="globalstyles"/>" media="screen" rel="stylesheet"  type="text/css" />
<link href="<spring:theme code="stylesheet"/>" media="screen" rel="stylesheet"  type="text/css" />
<link href="<spring:theme code="teacherprojectstylesheet" />" media="screen" rel="stylesheet" type="text/css" />

<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title>Edit Announcement</title>

<script type="text/javascript" src="<spring:theme code="generalsource"/>"></script>
</head>

<body style="background:#FFFFFF;">
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<div class="dialogContent">
		<div class="sectionHead">公告時間: <fmt:formatDate value="${announcement.timestamp}" type="both" timeStyle="short" dateStyle="medium" /></div>
		<div class="dialogSection">標題: ${announcement.title}</div>
		<div class="dialogSection">
			內容: ${announcement.announcement}
		</div>
		<div class="dialogSection"><a href="manageannouncement.html?runId=<c:out value='${param.runId}' />">回前頁</a></div>
	</div>
</body>
</html>