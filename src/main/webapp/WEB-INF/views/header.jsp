<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script> <!-- jQuery 라이브러리 cdn 주소 -->
<title>Photo Project</title>
<link rel="stylesheet" href="/css/header.css">

<style>

p{
	font-size: 12px;
}
 audio {
 	position:relative;
 	left:30em;
    margin-right: 20px; /* 오디오 요소 오른쪽 여백 설정 */
        }  

@font-face {
font-family: 'UhBeeSe_hyun';
src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_five@.2.0/UhBeeSe_hyun.woff') format('woff');
font-weight: normal;
font-style: normal;
}

.logo h2{
	font-family: 'UhBeeSe_hyun';
	font-weight:bold;
	font-size: 50px;
}
.logo a{
	text-decoration: none;
	color:inherit;
}
</style>
</head>
<body>

<header>
<audio controls src="/audio/Oneul - Summer Vacation.mp3"></audio>
        <nav>
        	   <div class="left-nav">
            <ul class="nav-links">
                <li><a href="/">ALL</a></li>
                <li><a href="#">SIGHT</a></li>
                <li><a href="#">OBJECT</a></li>
            </ul>
        </div>
            <div class="logo">
                <a href="/"> <!-- 컨트롤러에서 정의한 URL로 링크 설정 -->
                <h2>Photo By Me</h2>
                <!--<img src="/images/logo.jpg" width="450px" height="180px">-->
                <!--<img src="images/logo2.png" width="250px" height="120px">-->
                </a>
            </div>
             <div class="right-nav">
            <ul class="nav-links">
                <li><a href="/search" id="openModal">SEARCH</a></li>
                <li><a href="/login">LOG IN</a></li>
                <li><a href="/cart">My저장</a></li>
            </ul>
            </div>
        </nav>
 
    </header>



 
    
</body>
</html>