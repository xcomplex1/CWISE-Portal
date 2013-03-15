<%@ include file="../include.jsp"%>

<!DOCTYPE html >
<html xml:lang="en" lang="en">
<head>

<link href="<spring:theme code="globalstyles"/>" media="screen" rel="stylesheet"  type="text/css" />
<link href="<spring:theme code="stylesheet"/>" media="screen" rel="stylesheet"  type="text/css" />
<link href="<spring:theme code="teacherprojectstylesheet" />" media="screen" rel="stylesheet" type="text/css" />

<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title>Manage Announcements</title>

</head>

<body style="background:#FFFFFF;">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="dialogContent">
	<div class="sectionHead">現有公告</div>
	<div id="existingAnnouncements" class="dialogSection">
		<c:choose>
			<c:when test="${fn:length(run.announcements) > 0}">
				<ul id="announcementList">
					<c:forEach var="announcement" items="${run.announcements}">
						<li>
							<span>
								<c:choose>
									<c:when test="${!empty announcement.title}">
										${announcement.title}
									</c:when>
									<c:otherwise>
										[No Title]
									</c:otherwise>
								</c:choose>
							</span> <span class="aDate">(<fmt:formatDate value="${announcement.timestamp}" type="both" timeStyle="short" dateStyle="medium" />)</span>
							<a href="viewannouncement.html?runId=${run.id}&announcementId=${announcement.id}">瀏覽</a>
							<a href="editannouncement.html?runId=${run.id}&announcementId=${announcement.id}">編輯</a>
							<a href="removeannouncement.html?runId=${run.id}&announcementId=${announcement.id}">刪除</a>
						</li>
					</c:forEach>
				</ul>
			</c:when>
			<c:otherwise>
				這個執行專題沒有公告
			</c:otherwise>
		</c:choose>
	</div>
	
	<div class="dialogSection">
		<input type="button" value="新增公告 +" onClick="window.location='createannouncement.html?runId=${run.id}'"/> 
	</div>
	<div class="dialogSection">
		<p class="info">新的公告將在下一次課堂執行時對所有登入的學生公布，學生只要點選學生主頁面的'瀏覽公告'按鈕即可瀏覽舊的專題公告。</p>
	</div>

</div>
</body>
</html>