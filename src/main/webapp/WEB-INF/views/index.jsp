<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Photo_By_Me</title>
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
 max-height: 400px;
 object-fit:cover;
}
</style>
</head>
<body>


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