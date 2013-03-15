<%@ include file="include.jsp"%>

<!DOCTYPE html>
<html xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="chrome=1" />

<title>Edit Run</title>

<script type="text/javascript" src="<spring:theme code="generalsource"/>"></script>
<script type="text/javascript" src="<spring:theme code="jquerysource"/>"></script>

<link href="<spring:theme code="globalstyles"/>" media="screen" rel="stylesheet"  type="text/css" />
<link href="<spring:theme code="stylesheet"/>" media="screen" rel="stylesheet"  type="text/css" />
<link href="<spring:theme code="teacherprojectstylesheet" />" media="screen" rel="stylesheet" type="text/css" />

<script type='text/javascript'>
	var runUpdated = false;
	
	function updateRunTitle(runId){
		$('#msgDiv').html('');
		var val = $('#editRunTitleInput').val();
		val = escape(val);

		/* validate user entered value */
		if(!val || val==''){
			writeMessage('您必須指定一個執行標題的值');
			return;
		}

		$.ajax({type:'POST', url:'updaterun.html', data:'command=updateTitle&runId=' + runId + '&title=' + val, error:updateFailure, success:updateTitleSuccess});
	}

	function updateRunPeriod(runId){
		$('#msgDiv').html('');
		var val=$('#editRunPeriodsInput').val();

		/* validate user entered value */
		if(!val || val==''){
			writeMessage('您必須指定一個班級的值');
			return;
		}

		$.ajax({type:'POST', url:'updaterun.html', data:'command=addPeriod&runId=' + runId + '&name=' + val, error:updateFailure, success:updatePeriodSuccess});
	}

	function writeMessage(msg){
		$('#msgDiv').html(msg);
		setTimeout(function(){$('#msgDiv').html('')}, 10000);
	}

	function updateSuccess(){
		writeMessage('成功更新執行設定！');
	}
	
	function updateTitleSuccess(){
		runUpdated = true;
		writeMessage('成功更新執行標題！');
	}

	function updateFailure(){
		writeMessage('更新執行資訊產生錯誤，請再試一次！');
	}

	function updatePeriodSuccess(){
		runUpdated = true;
		var val = $('#editRunPeriodsInput').val();

		$('#existingPeriodsList').append('<li>班級名稱: ' + val);
		writeMessage('成功新增執行的班級！');
	}

	$(document).ready(function() {		
		$(".runInfoOption").bind("click", function() {
			$('#msgDiv').html('');
			var runId = $("#runId").html();
			var infoOptionName = this.id;
			var isEnabled = this.checked;

			$.ajax({type:'POST', url:'updaterun.html', data:'command='+infoOptionName+'&runId=' + runId + '&isEnabled=' + isEnabled, error:updateFailure, success:updateSuccess});
		});
	});
</script>
</head>
<body style="background:#FFFFFF;">
<div class="dialogContent">
	<div id="runId" style="display:none;">${run.id}</div>
	<div id='msgDiv'></div>
	<div id="editRunTitleDiv" class="dialogSection">
		執行標題: <input id="editRunTitleInput" class="dialogTextInput" type="text" size="40" value="<c:out value='${run.name}' />"/><input type="button" value="更新標題" onclick="updateRunTitle('${run.id}')"/>
	</div>
	<div id='runInfo' class="dialogSection">
		<c:choose>
			<c:when test="${run.ideaManagerEnabled}">
				<input id='enableIdeaManager' class='runInfoOption' type="checkbox" checked="checked" ></input>想法管理<br/>
			</c:when>
			<c:otherwise>
				<input id='enableIdeaManager' class='runInfoOption' type="checkbox" ></input>想法管理<br/>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${run.studentAssetUploaderEnabled}">
				<input id='enableStudentAssetUploader' class='runInfoOption' type="checkbox" checked="checked"></input>學生檔案上傳
			</c:when>
			<c:otherwise>
				<input id='enableStudentAssetUploader' class='runInfoOption' type="checkbox"></input>學生檔案上傳
			</c:otherwise>
		</c:choose>
	</div>
	<div class="sectionHead">目前班級</div>
	<div id="editRunPeriodsDiv" class="dialogSection">
		<div id="editRunPeriodsExistingPeriodsDiv">
			<ul id="existingPeriodsList">
				<c:forEach var="period" items="${run.periods}">
					<li>班級名稱: ${period.name}</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="sectionHead">新增班級:</div>
	<div class="dialogSection">
		<div id="editRunPeriodsAddPeriodDiv">
			<div>輸入班級名稱 (e.g. 班級 4，只需輸入 4): <input id="editRunPeriodsInput" class="dialogTextInput" type="text" size="10"/><input type="button" value="新增班級" onclick="updateRunPeriod('${run.id}')"/></div>
		</div>
		<div class="buffer"></div>
	</div>
</div>
</body>
</html>