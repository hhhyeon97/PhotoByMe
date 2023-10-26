<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Photo_By_Me</title>
<link rel="stylesheet" href="css/style.css">
<jsp:include page="header.jsp" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>
<div id="product" class="row">
    <div class="col-md-3">
        <div class="card" style="width: 18rem;">
            <img src="images/photo01.jpg" class="card-img-top custom-img" alt="...">
            <div class="card-body">
                <a href="/product" class="btn btn-dark">click me!</a>
            </div>
            <h5 class="card-title">해헤헤 하늘</h5>
        </div>
    </div>

    <div class="col-md-3">
        <div class="card" style="width: 18rem;">
            <img src="images/photo02.jpg" class="card-img-top custom-img" alt="...">
            <div class="card-body">
                <a href="/product" class="btn btn-dark">click me!</a>
            </div>
            <h5 class="card-title">나는 귤입니다</h5>
        </div>
    </div>
    
        <div class="col-md-3">
        <div class="card" style="width: 18rem;">
            <img src="images/photo03.jpg" class="card-img-top custom-img" alt="...">
            <div class="card-body">
                <a href="/product" class="btn btn-dark">click me!</a>
            </div>
            <h5 class="card-title">눈웃음을 드려요</h5>
        </div>
    </div>
    
        <div class="col-md-3">
        <div class="card" style="width: 18rem;">
            <img src="images/photo06.jpg" class="card-img-top custom-img" alt="...">
            <div class="card-body">
                <a href="/product" class="btn btn-dark">click me!</a>
            </div>
            <h5 class="card-title">무지개를 따라서</h5>
        </div>
    </div>
    
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<jsp:include page="footer.jsp" />
</body>
</html>