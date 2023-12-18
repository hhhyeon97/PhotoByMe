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


<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- Bootstrap JS and Popper.js -->
   <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>



<!-- 팝업 창 띄우기  -->
<script>
function handlePageLoad() {
    if (document.cookie.indexOf('popupShown=1') === -1 || !isPopupClosed()) {
        openPopup();
    }
}

window.onload = handlePageLoad;


function openPopup() {
	
	 var popupW = 600;
	  var popupH = 500;
	  var left = Math.ceil((window.screen.width - popupW)/2);
	  var top = Math.ceil((window.screen.height - popupH)/2);
	
    var popupFeatures = 'width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes';
    var popupWindow = window.open('', '_blank', popupFeatures);
    var imageUrl = '<%=request.getContextPath()%>/images/popup.png';
    var text = '안녕하세요 ⋰˚★<br>여기는 <span style="color: #72b1f7; font-size: 16px;">Photo By Me</span> 입니다<br>마음에 드는 사진을 보관해보세요 !';
    //popupWindow.document.write('<img src="' + imageUrl + '" alt="popup img">');
    
      // 팝업 창에 이미지와 텍스트를 동적으로 추가
    popupWindow.document.write('<html><head><div style="position: relative; text-align: center;">');
    
    // 체크박스 위치 변경  
    popupWindow.document.write('<input type="checkbox" id="hidePopupCheckbox">');
    popupWindow.document.write('<label for="hidePopupCheckbox">하루 동안 보지 않기</label>');

    
      popupWindow.document.write('<img src="' + imageUrl + '" alt="popup img" style="width: 100%; height: auto; opacity: 0.7;">');
    popupWindow.document.write('<p style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -10%);  font-size: 18px; font-weight: bold; color: black; ">' + text + '</p>');
    popupWindow.document.write('</div></body></html>');
    
    popupWindow.document.title = 'Photo by Me';

    
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
	color: gray; /* 아이콘의 기본 색상 설정 */
    transition: color 0.3s; /* 색상 전환 애니메이션 추가 - > 부드럽게 색상 표시됨 !! */
}

/* 아이콘을 호버했을 때의 스타일 */
#mycon:hover {
    color: skyblue; /* 호버 시 적용할 색상 설정 */
}

#jaebal{
margin-bottom: 20px;
}

.col-md-3{
	margin-top: 25px;
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
  /*display: block;*/
  width: auto;
 height: auto;
 max-height: 420px;
 object-fit:cover;
 object-position: 50% 30%; /* 이미지 배치 조절 */
}

#product {
	margin-top:25px;
}

.image-description {
    display: none;
    position: absolute;
    background-color: rgba(255, 255, 255, 0.7);
    padding: 10px;
    border: 1px solid #ddd;
    z-index: 1;
    bottom: 0; /* 이미지 아래에 배치 */
    width: 100%; /* 이미지 카드의 너비와 동일하게 설정 */
    box-sizing: border-box; /* 패딩과 테두리를 포함한 전체 너비를 설정 */
}
.card {
    position: relative; /* 자식 요소인 .image-description를 상대적으로 배치 */
}

.card:hover .image-description {
    display: block;
}

#dubogi{
	margin-top:40px;
}

.col-md-3{
	margin-bottom : 20px;
}

.custom-img {
    width: 100%; /* 이미지를 부모 요소의 100% 크기로 설정 */
    height: 100%; /* 이미지를 부모 요소의 100% 높이로 설정 */
    object-fit: cover; /* 가로 세로 비율을 유지하면서 부모 요소에 꽉 차게 설정 */
}

</style>

<!-- <script>
    // Wait for the DOM to be ready
    document.addEventListener("DOMContentLoaded", function() {
      // Initialize the Carousel
      var myCarousel = new bootstrap.Carousel(document.getElementById('carouselExample'), {
        interval: 3000, // Set the interval (in milliseconds) for the automatic sliding
        pause: 'hover', // Pause on mouse hover
        wrap: true // Allow wrapping of the slides
      });
    });
  </script> -->
  
  
</head>
<body>

<!-- 슬라이드 시작 -->
<!-- 
<div id="carouselExample" class="carousel slide">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="images/photo07.jpg" class="d-block w-100" alt="...">
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
</div> -->
<!-- 슬라이드 끝  -->


<!-- 슬라이드 버전 02  -->

<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="images/photo07.jpg"  class="d-block w-100 img-fluid" alt="...">
    </div>
    <div class="carousel-item">
      <img src="images/sli222.jpg" style="object-position: 50% 80%;" class="d-block w-100 img-fluid" alt="...">
    </div>
    <div class="carousel-item">
      <img src="images/s01.jpg" class="d-block w-100 img-fluid" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
<!-- 슬라이드 끝  -->

<!-- 제품(이미지)부분 시작 -->
<div id="product"  class="container">
	<div class="row">
    <div class="col-md-3">
        <div class="card mb-4" style="width: 12rem; height: 14rem;">
            <img src="images/photo01.jpg" class="card-img-top custom-img" alt="...">
            <h5 class="card-title">햇살 하늘<a href="/cart"><i id="mycon" class='bx bx-cart'></i></a></h5>
         <div class="image-description">
         <p class="description-text">햇살처럼 따듯한 하루 되세요!</p> <!-- 11/21 사진 간단 설명글 추가 -->
        </div>
    </div>
</div>

    <div class="col-md-3">
        <div class="card mb-4" style="width: 12rem; height: 14rem;">
            <img src="images/photo02.jpg" class="card-img-top custom-img" alt="...">
            <h5 class="card-title">나는 귤입니다<a href="/cart"><i id="mycon" class='bx bx-cart'></i></a></h5>
        <div class="image-description">
         <p class="description-text">귤 먹기 좋은 날 </p> 
        </div>
        </div>
    </div>
    
        <div class="col-md-3">
        <div class="card mb-4" style="width: 12rem; height: 14rem;">
            <img src="images/photo03.jpg" class="card-img-top custom-img" alt="...">
            <h5 class="card-title">눈웃음 냥이<a href="/cart"><i id="mycon" class='bx bx-cart'></i></a></h5>
                <div class="image-description">
         <p class="description-text">웃으면 복이 와요 </p>
        </div>
        </div>
    </div>
    
        <div class="col-md-3">
        <div class="card mb-4" style="width: 12rem; height: 14rem;">
            <img src="images/photo06.jpg" class="card-img-top custom-img" alt="...">
            <h5 class="card-title">총총총 무지개<a href="/cart"><i id="mycon" class='bx bx-cart'></i></a></h5>
        <div class="image-description">
         <p class="description-text">무지개를 건너</p> 
        </div>
        </div>
    </div>
    
        <div class="col-md-3">
        <div class="card mb-4" style="width: 12rem; height: 14rem;">
            <img src="images/photo06.jpg" class="card-img-top custom-img" alt="...">
            <h5 class="card-title">총총총 무지개<a href="/cart"><i id="mycon" class='bx bx-cart'></i></a></h5>
                <div class="image-description">
         <p class="description-text">무지개를 건너</p> 
        </div>
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

<!-- 제품(이미지) 부분 끝  -->


<!-- 더보기 기능  -->
<div id="dubogi">
	<button type="button" class="btn btn-secondary" onclick="location='/';">더보기</button>
</div>


<script>
document.getElementById("mycon").addEventListener("click", function (e) {
    e.preventDefault(); // 기본 동작 중지
    alert("My저장소에 추가되었습니다!");
/*     alert("⠀⠀⠀⠀ ⠀⠀⠀⣀⠤⠔⠒⠒⡄⢀⣠⠤⠤⠦⡄⠀
    		⠀⠀⠀⠀⠀⢀⡴⠋⠀⠀⠀⣀⠴⠊⣡⣴⣾⡿⣣⠃⠀⠀
    		⠀⠀⠀⠀⢰⠋⠀⠀⠀⡤⠊⠁⣠⣾⡿⠟⣉⠴⠁⠀⠀⠀
    		⠀⠀⠀⡠⠓⠀⠀⠀⠘⠁⢒⣿⠍⠓⠒⠉⠀⠀⠀⠀⠀⠀
    		⠀⢠⠞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⣄⠀⠀⠀⠀⠀⠀⠀⠀
    		⠀⡏⠀⠀⠀⠀⠴⠂⠀⠀⠀⠀⠀⠘⢦⠀⠀⠀⠀⠀⠀⠀
    		⢸⠘⠉⠀⠀⠀⣴⣶⢶⢀⠤⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀
    		⠀⢷⣿⣵⣴⡆⢙⠉⡘⠟⠉⠁⠀⢀⡼⠁⠀⠀⠀⠀⠀⠀
    		⢀⣾⡉⠣⠵⠶⠎⠉⠀⠀⠀⡠⠖⠛⠉⠉⠉⠙⢦⡀⠀⠀
    		⠀⠊⠑⠂⠀⠤⣄⠀⠀⠀⠀⠀⠀⢀⣠⠄⠒⠀⠘⠁⠀⠀
    		⣴⣒⠤⢤⡠⠔⡏⠀⠀⣀⠀⠀⠀⠀⠈⠙⠒⠢⢴⠑⢢⠀
    		⠷⡀⠁⠀⠀⠈⡏⠑⠊⠉⠀⠀⠀⠀⠀⠀⠀⠀⠈⡇⢠⠁
    		⠀⠈⠉⠉⠉⠉⠱⡀⠀⠀⠀⠀⠰⠀⠀⠀⠀⠀⠀⡏⠁⠀
    		⠀⠀⠀⠀⠀⠀⢸⠉⠒⠤⠤⢤⡇⠀⠀⠀⠀⢀⢼⣇⠀⠀
    		⠀⠀⠀⠀⠀⢠⠶⠿⠤⠤⠔⠛⡞⠦⣄⡠⡤⢊⣾⠟⠀⠀
    		⠀⠀⠀⠀⠀⢱⣤⣤⣤⠠⢶⡿⠀⠀⠀⠙⠶⠽⠟⠀⠀⠀
    		⠀⠀⠀⠀⠀⠀⠀⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"); */
    // 이후 링크로 이동하거나 다른 동작을 수행할 수 있습니다
    // 예를 들어, 페이지를 이동하려면 다음과 같이 사용할 수 있습니다.
     window.location.href = "/cart";
});
</script>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<jsp:include page="footer.jsp" />
</body>
</html>