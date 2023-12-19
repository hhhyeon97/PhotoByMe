<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<title>마이페이지</title>
<style>
body{
	text-align: center;
}
#usericon{
	position:relative;
	top: -2px;
	width: 30px;
}
section{
	margin-top: 50px;
}
</style>
</head>
<body>
<jsp:include page="../header.jsp" />
<h2>My Page <img id="usericon" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAARxJREFUSEvVlNENwjAMRN1NYBOYBJgEmAQ2oZvAJtAnxVIanFxU1A8i5aOJes++2B5s5TWsrG+9gI2Z3cxsZ2avtK/T96gC7AEck3ipBehuZoCqSwGI+JH+viQxsjlMZ3wDObUyUQBsIQMXzyP1zLBpX0tBAZ6TDUS8TdHmOpxzTxbch+sXAILvpFrVUQD85x0ii87pnIfmHRZlkNvgFZM/MqL4Xy1XlQECHmkUIZEDXlym/uOqjaaatXmvLMIeHpldLh8Z+F/t5hoAQZoMa3pWtaMjQD4eWqMAONuzDCsqAnj3Nus7S6ucTbOuLgFd8yXwLK+yWVOWAB9usr4DiFs7G34loDXc1GOHw68EyOElKF//qz5QUcv7/wd8AKJNRBl0Vm5MAAAAAElFTkSuQmCC"/></h2>
<section>
<input type="button" class="btn btn-dark" value="회원 정보 수정" onclick="location='user_edit';">
<input type="button" class="btn btn-dark" value="비밀번호 변경" onclick="location='#';">
<input type="button" class="btn btn-dark" value="회원 탈퇴" onclick="location='user_del';">
</section>
<jsp:include page="../subfooter.jsp" />
</body>
</html>