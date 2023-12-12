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
</style>

<!-- 11/21 검색 모달 헤더로 이동  -->
<style>
@font-face {
font-family: 'UhBeeSe_hyun';
src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_five@.2.0/UhBeeSe_hyun.woff') format('woff');
font-weight: normal;
font-style: normal;
}

  /* 모달 스타일 */
        .modal {
            display: none; /*초기에는 숨겨져 있음*/
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.3); /* 배경 어둡게 */
        }
        .modal-content {
            background-color: #fff;
            margin: 20% auto; /* 화면 중앙에 위치 */
            padding: 20px;
            width: 50%;
            height:18%;
            box-sizing: border-box;
    		border: 2px solid rgba(255,255,255, .2);
    		backdrop-filter : blur(20px);
			box-shadow:0 0 10px rgba(0, 0, 0, .2);
			border-radius: 10px;
        }
        /* 모달 닫기 버튼 스타일 */
        .close {
            float: right;
            cursor: pointer;
        }
        .modal h3{
        	font-family:'UhBeeSe_hyun';
        	text-align:center;
        	color: #8693a3;
        }
        #sear{
        	text-align:center;
        }
        .modal input {
        	width:30%;
        	margin-top:5px;
        	padding:10px;
			border:2px solid gray;
			border-radius: 6px;        	
        }
       .bx-x {
            font-size: 20px; /* 크기를 원하는 값으로 조절하세요. */
        }
       .bx-search{
       		font-size: 25px;
       }
       .modal input::placeholder{
       	font-family:'UhBeeSe_hyun';
       }
</style>
</head>
<body>

<header>


<!--
<audio id="music" controls>
  <source src="/audio/Oneul - Summer Vacation.mp3" type="audio/mpeg">
</audio>
-->

<!--<audio controls src="/audio/Oneul - Summer Vacation.mp3"></audio>-->
        <nav>
<!--         	   <div class="left-nav">
            <ul class="nav-links">
                <li><a href="/">ALL</a></li>
                <li><a href="#">SIGHT</a></li>
                <li><a href="#">OBJECT</a></li>
            </ul>
        </div> -->
        
            <div class="logo">
                <a href="/"> <!-- 컨트롤러에서 정의한 URL로 링크 설정 -->
                <h2>Photo By Me</h2>
                <!--<img src="/images/logo.jpg" width="450px" height="180px">-->
                <!--<img src="images/logo2.png" width="250px" height="120px">-->
                </a>
            </div>
             <div class="right-nav">
            <ul class="nav-links">
    		<li><a href="#" id="openModal">SEARCH</a></li>
    		<li><a href="/user_notice_list">NOTICE</a></li>
    		<li><a href="/board_list">Q&A</a></li>
    		<li><a href="/login">LOGIN</a></li>
   			 <!-- 이 부분에 대해 JavaScript로 동적으로 로그인 상태에 따라 변경 -->
    				
    <!-- <li id="userProfileLink"><a href="/member/userProfile">마이페이지</a></li> -->
    				
    				<li><a href="/cart">My저장</a></li>
			</ul>
            </div>
        </nav>
    </header>


  <!-- 검색 모달 시작 -->
    <div id="searchModal" class="modal">
        <div class="modal-content">
            <span class="close" id="closeModal"><i class='bx bx-x'></i></span> <!-- 모달 닫기 버튼 -->
 			<h3>Search !</h3>
            <!-- 검색 양식 -->
            <form id="sear">
                <input type="text" id="searchInput" placeholder="검색어 입력">
                <label class="searchbtn" for="submitSearch"></label>
                <button type="button" id="submitSearch" style="display: none;">검색</button>
            </form>
            <!-- 검색 결과를 표시할 곳 -->
            <div id="searchResults"></div>
        </div>
    </div>

    <script>
        // 검색 모달 열기
        $("#openModal").click(function() {
            $("#searchModal").css("display", "block");
        });

        // 검색 모달 닫기
        $("#closeModal, .modal").click(function(event) {
            if (event.target === document.getElementById('searchModal') || event.target === document.getElementById('closeModal')) {
                $("#searchModal").css("display", "none");
            }
        });
        
        
        // 검색 버튼 클릭 이벤트 처리
        $("#submitSearch").click(function() {
            // 검색어를 가져오고 검색 결과를 표시합니다.
            var searchTerm = $("#searchInput").val();
            $.ajax({
                url: "검색_처리_스크립트.php", // 검색을 처리하는 서버 스크립트의 경로를 지정합니다.
                method: "GET", // 또는 "POST"에 따라 HTTP 메소드를 선택합니다.
                data: { query: searchTerm },
                success: function(response) {
                    // 검색 결과를 표시합니다.
                    $("#searchResults").html(response);
                },
                error: function() {
                    alert("검색 요청을 처리하는 동안 오류가 발생했습니다.");
                }
            });
        });
    </script>
<!-- 검색 모달 관련 끝  -->

<!-- <script>
//HTML 오디오 요소 가져오기
const audioElement = document.getElementById("music");

// 페이지가 로드될 때 음악을 자동 재생하도록 설정
audioElement.autoplay = false;

// 페이지 간 전환 시 음악이 계속 재생되도록 설정
window.addEventListener("beforeunload", () => {
  audioElement.pause();
});

// 페이지가 다시 로드될 때 음악을 다시 재생하도록 설정
/* window.addEventListener("load", () => {
  audioElement.play();
}); */
</script> -->
<!-- 
<script>
//새로운 페이지 로드 함수
function loadNewPage(url) {
  // 페이지 컨텐츠 부분만 업데이트
  fetch(url)
    .then((response) => response.text())
    .then((newPageHTML) => {
      const mainContent = document.querySelector("index");
      mainContent.innerHTML = newPageHTML;

      // 페이지 로드 후 음악 재생
      audioElement.play();
    });
}

document.addEventListener("click", (event) => {
	  const target = event.target;
	  if (target.tagName === "A" && target.getAttribute("href")) {
	    // event.preventDefault(); // 주석 처리
	    const newPageUrl = target.getAttribute("href");
	    loadNewPage(newPageUrl);
	  }
	});
</script> -->


</body>
</html>