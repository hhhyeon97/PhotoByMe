<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<h1>Image Upload Form</h1>

    <form method="post" action="/upload" enctype="multipart/form-data">
        <label for="file">Choose file:</label>
        <input type="file" name="file" id="file" required>
        <br>
        <label for="title">Image Title:</label>
        <input type="text" name="title" id="title" required>
        <br>
        <input type="submit" value="Upload">
    </form>

    <p>${message}</p>

    <hr>

    <!-- 이미지 목록 표시 -->
    <h2>Image List</h2>
    <c:forEach var="photo" items="${photoList}">
        <div class="card">
            <img src="${photo.purl}" alt="${photo.ptitle}" width="100">
            <div class="card-body">
                <h5 class="card-title">${photo.ptitle}</h5>
                <p class="card-text">Uploaded on: ${photo.pdate}</p>
            </div>
        </div>
    </c:forEach>
</body>
</html>