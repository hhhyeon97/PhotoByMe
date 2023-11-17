<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Photo By Me</title>
<link rel="shortcut icon" href="/images/favicon.ico"/>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="css/style.css">
<jsp:include page="header.jsp" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">


<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
   rel="stylesheet">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>


<!-- 팝업 창 띄우기  -->
<script>
function handlePageLoad() {
    if (document.cookie.indexOf('popupShown=1') === -1 || !isPopupClosed()) {
        openPopup();
    }
}

window.onload = handlePageLoad;

function openPopup() {
    var popupFeatures = 'width=auto,height=auto,scrollbars=yes';
    var popupWindow = window.open('', '_blank', popupFeatures);
    var imageUrl = '<%=request.getContextPath()%>/images/popup.png';
    var text = '안녕하세요 ⋰˚★<br>여기는 <span style="color: #72b1f7; font-size: 26px;">Photo By Me</span> 입니다<br>마음에 드는 사진을 보관해보세요 !';
    
    //popupWindow.document.write('<img src="' + imageUrl + '" alt="popup img">');
    
      // 팝업 창에 이미지와 텍스트를 동적으로 추가
    popupWindow.document.write('<html><head><div style="position: relative; text-align: center;">');
    popupWindow.document.write('<img src="' + imageUrl + '" alt="popup img" style="width: 100%; height: auto; opacity: 0.7;">');
    popupWindow.document.write('<p style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -10%);  font-size: 18px; font-weight: bold; color: black; ">' + text + '</p>');
    popupWindow.document.write('</div></body></html>');
    
    popupWindow.document.title = 'Photo by Me';

    popupWindow.document.write('<input type="checkbox" id="hidePopupCheckbox">');
    popupWindow.document.write('<label for="hidePopupCheckbox">하루 동안 보지 않기</label>');

    var hidePopupCheckbox = popupWindow.document.getElementById('hidePopupCheckbox');

 // 팝업이 닫힐 때 체크 여부에 따라 쿠키 저장
    popupWindow.onbeforeunload = function () {
        var hidePopupCheckbox = popupWindow.document.getElementById('hidePopupCheckbox');
        if (hidePopupCheckbox.checked) {
            var expiryDate = new Date();
            expiryDate.setDate(expiryDate.getDate() + 1);
            document.cookie = 'popupShown=1; expires=' + expiryDate.toUTCString() + '; path=/';
        }
    }; 
}

function isPopupClosed() {
    return document.cookie.indexOf('popupShown=1') !== -1;
}
</script>


<style>
/* 스크롤바의 너비와 스타일을 변경 */
::-webkit-scrollbar {
  width: 10px; /* 스크롤바의 너비를 조절 */
}

/* 스크롤바의 왼쪽 여백을 숨기는 스타일 (크롬 및 사파리에서 동작) */
::-webkit-scrollbar-track {
  display: none; /* 왼쪽 여백을 숨김 */
}

/* 스크롤바의 스타일을 변경 (크롬 및 사파리에서 동작) */
::-webkit-scrollbar-thumb {
  background-color: #a5abb5; /* 스크롤바 색상 변경 */
  border-radius: 10px; /* 스크롤바의 모서리를 둥글게 만듦 */
}

/* 스크롤바의 왼쪽 여백을 숨기는 스타일 (파이어폭스에서 동작) */
.scrollbar {
  scrollbar-width: thin;
  scrollbar-color: transparent transparent; /* 왼쪽 여백을 투명하게 설정 */
}

/* 스크롤바의 스타일을 변경 (파이어폭스에서 동작) */
.scrollbar {
  scrollbar-width: thin;
  scrollbar-color: #555 transparent;
}

#mycon{
	position:relative;
	top:2px;
	float:right;
	width :3ex;
}


#jaebal{
margin-bottom: 20px;
}

.col-md-3{
	margin-top: 15px;
}

a{
	text-decoration: none;
	color:inherit;
}


/* .carousel-inner img {
    width: 100%; /* Make sure the image fills the width of the container 
    max-height: 300px; /* Set the maximum height as per your requirement 
    margin: auto; /* Center the image horizontally 
} */

 /*        .carousel-inner img {
            width: 100%;
            height: auto;
            max-height: 400px;
            margin: auto;
            object-fit:cover;
        } */
        
        .carousel-inner img {
  display: block;
  width: auto;
 height: auto;
 max-height: 320px;
 object-fit:cover;
}
</style>
</head>
<body>

<!-- 슬라이드 시작 -->

<div id="carouselExample" class="carousel slide">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="images/sli03.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="images/sli06.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="images/sli08.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
<!-- 슬라이드 끝  -->


<div id="product"  class="container">
	<div class="row">
    <div id="jaebal" class="col-md-3">
        <div class="card mb-4" style="width: 12rem; height: 14rem;">
            <img src="images/photo01.jpg" class="card-img-top custom-img" alt="...">
            <h5 class="card-title">햇살 하늘<a href="/cart"><i id="mycon" class='bx bx-cart'></i></a></h5>
        </div>
    </div>


    <div class="col-md-3">
        <div class="card mb-4" style="width: 12rem; height: 14rem;">
            <img src="images/photo02.jpg" class="card-img-top custom-img" alt="...">
            <h5 class="card-title">나는 귤입니다<a href="/cart"><i id="mycon" class='bx bx-cart'></i></a></h5>
        </div>
    </div>
    
        <div class="col-md-3">
        <div class="card mb-4" style="width: 12rem; height: 14rem;">
            <img src="images/photo03.jpg" class="card-img-top custom-img" alt="...">
            <h5 class="card-title">눈웃음 냥이<a href="/cart"><i id="mycon" class='bx bx-cart'></i></a></h5>
        </div>
    </div>
    
        <div class="col-md-3">
        <div class="card mb-4" style="width: 12rem; height: 14rem;">
            <img src="images/photo06.jpg" class="card-img-top custom-img" alt="...">
            <h5 class="card-title">총총총 무지개<a href="/cart"><i id="mycon" class='bx bx-cart'></i></a></h5>
        </div>
    </div>
    
        <div class="col-md-3">
        <div class="card mb-4" style="width: 12rem; height: 14rem;">
            <img src="images/photo07.jpg" class="card-img-top custom-img" alt="...">
            <h5 class="card-title">수리중<a href="/cart"><i id="mycon" class='bx bx-cart'></i></a></h5>
        </div>
    </div>    
    
         <div class="col-md-3">
        <div class="card mb-4" style="width: 12rem; height: 14rem;">
            <img src="images/photo06.jpg" class="card-img-top custom-img" alt="...">
            <h5 class="card-title">총총총 무지개<a href="/cart"><i id="mycon" class='bx bx-cart'></i></a></h5>
        </div>
    </div>
    
    
            <div class="col-md-3">
        <div class="card mb-4" style="width: 12rem; height: 14rem;">
            <img src="images/photo06.jpg" class="card-img-top custom-img" alt="...">
            <h5 class="card-title">총총총 무지개<a href="/cart"><i id="mycon" class='bx bx-cart'></i></a></h5>
        </div>
    </div>
    
            <div class="col-md-3">
        <div class="card mb-4" style="width: 12rem; height: 14rem;">
            <img src="images/photo06.jpg" class="card-img-top custom-img" alt="...">
            <h5 class="card-title">총총총 무지개<a href="/cart"><i id="mycon" class='bx bx-cart'></i></a></h5>
        </div>
    </div>
    
    
    
    </div>
</div>

<script>
document.getElementById("mycon").addEventListener("click", function (e) {
    e.preventDefault(); // 기본 동작 중지
    alert("My저장소에 추가되었습니다!");
    // 이후 링크로 이동하거나 다른 동작을 수행할 수 있습니다
    // 예를 들어, 페이지를 이동하려면 다음과 같이 사용할 수 있습니다.
     window.location.href = "/cart";
});
</script>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<jsp:include page="footer.jsp" />
</body>
</html>