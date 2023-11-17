<%-- <%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Ajax 검색 예제</title>
    <!-- jQuery 라이브러리를 포함합니다. -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <button id="searchButton">검색</button>
    <div id="searchBox" style="display: none;">
        <input type="text" id="searchInput" placeholder="검색어 입력">
        <button id="submitSearch">검색</button>
    </div>

    <div id="searchResults"></div>

    <script>
        // 검색 버튼을 클릭했을 때 검색 창을 나타내는 이벤트 핸들러를 등록합니다.
        $("#searchButton").click(function() {
            // 검색 창을 토글하여 표시/숨김 상태를 변경합니다.
            $("#searchBox").toggle();
        });

        // 검색 버튼을 클릭했을 때 검색 창을 나타내는 이벤트 핸들러를 등록합니다.
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
 
 --%>