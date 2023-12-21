<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<title></title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap');

header {
	position: fixed;
	background-color: 98b5d4;
	top: 0px;
	left: 0px;
	width: 100%;
	height: 70px;
	line-height: 70px;
	text-align: center;
}

nav {
	position: fixed;
	background-color: gray;
	color: white;
	top: 70px;
	left: 0px;
	width: 100%;
	height: 50px;
	line-height: 50px;
	text-align: center;
	display: flex;
    justify-content: space-between;
    align-items: center; /* 추가 */
}
form {
    display: flex; /* 추가 */
    align-items: left; /* 추가 */
}

#outbtn{
	position:relative;
	right: 20px;
}
a {
	margin-left: 30px;
	color: inherit;
	padding : 10px 20px;
	text-decoration: none;
}

a:hover{
	text-decoration: underline;
	text-underline-offset:10px;
}

footer {
	position: fixed;
	background-color: 98b5d4;
	bottom: 0px;
	left: 0px;
	width: 100%;
	height: 50px;
	line-height: 50px;
	text-align: center;
	font-weight: bold;
}

section {
	position: fixed;
	background-color: #fff;
	top: 120px;
	left: 0px;
	width: 100%;
	height: 100%;
 	display: flex;
    justify-content: center; /* 수평 가운데 정렬 */
    align-items: center; /* 수직 가운데 정렬 */
}

hr{
	margin:0px;
	padding:0px;
	background: rgba(211, 211, 211, 0.5);
    height:1px;
    border:0;
}
#tt {
	font-family: 'Black Han Sans', sans-serif;
	font-size: 35px;
}
img {
	border-radius: 50%;
	margin-bottom: 150px;
}

</style>
</head>
<body>
<header>
<span id="tt">Photo&nbsp; By&nbsp; Me</span>
</header>
<nav>
<a href="/notice_list">공지 관리</a>&nbsp;&nbsp; 
<a href="#">QnA 관리</a>&nbsp;&nbsp; 
<a href="/member_list">회원 관리</a>&nbsp;&nbsp;
<a href="admin_index">HOME</a>&nbsp;&nbsp;
<span><strong>${aname}</strong>님으로 접속중</span>
        <form method="post" action="admin_logout">
            <input type="submit" id="outbtn" class="btn btn-dark" value="로그아웃" />
        </form>
</nav>
<section>
<img src="images/gifimg01.gif" width="300px" height="300px">
</section>
<footer>
<hr>
This is Photo By Me’s administrator page
</footer>
</body>
</html>