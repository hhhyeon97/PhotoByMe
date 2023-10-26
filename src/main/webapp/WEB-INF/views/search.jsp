<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>//수정 필요 !! 서치페이지 x 아작스활용해서다시구성하기!!</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<style>
@font-face {
font-family: 'UhBeeSe_hyun';
src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_five@.2.0/UhBeeSe_hyun.woff') format('woff');
font-weight: normal;
font-style: normal;
}

  /* 모달 스타일 */
        .modal {
            /*display: none;*/ /*초기에는 숨겨져 있음*/
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
        h3{
        	font-family:'UhBeeSe_hyun';
        	text-align:center;
        	color: #8693a3;
        }
        #sear{
        	text-align:center;
        }
        input {
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
       input::placeholder{
       	font-family:'UhBeeSe_hyun';
       }
</style>
<jsp:include page="header.jsp" />
</head>
<body>
    <!-- 검색 모달 -->
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
</body>
</html>