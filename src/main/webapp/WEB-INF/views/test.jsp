<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
    <h1>Main Page</h1>
    <c:forEach var="photo" items="${photoList}">
        <div class="card">
            <img src="${photo.purl}" alt="Photo" width="100">
            <div class="card-body">
                <h5 class="card-title">${photo.ptitle}</h5>
                <p class="card-text">Uploaded on: ${photo.pdate}</p>
            </div>
        </div>
    </c:forEach>
</body>
</html>