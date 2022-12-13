<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Tuna Book Shop</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Font Awesome 5 CSS -->
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.2/css/all.css'>
    <!-- Products List CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Demo CSS (No need to include it into your project) -->

</head>
<body>
<header class="intro">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a href="${pageContext.request.contextPath}/home" class="navbar-brand" style="font-weight: bold;font-family: 'Dancing Script', cursive;"><i class="fa fa-book"></i> Tuna Book Shop</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="cart.jsp">Giỏ hàng</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="test.jsp">Ưa thích</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Lịch sử mua hàng</a>
                    </li>
                    <c:if test="${sessionScope.user == null}">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/login">Đăng nhập</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/register">Đăng ký</a>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.user != null}">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
                        </li>
                    </c:if>
                </ul>
                <form class="d-flex">
                    <input name="keyword" class="form-control me-2" type="search" placeholder="Tìm kiếm sách..." aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>

</header>

<main>
    <!-- DEMO HTML -->
    <div class="container bg-white">
        <div class="row">
            <c:forEach var="book" items="${list_book}">
                <div class="col-lg-3 col-sm-6 d-flex flex-column align-items-center justify-content-center product-item my-3">
                    <div class="product"> <img src="${book.img}" alt="">
                        <ul class="d-flex align-items-center justify-content-center list-unstyled icons">
                            <li class="icon"><span onclick="window.location.href='/detail?id=${book.id}';" class="fas fa-expand-arrows-alt"></span></li>
                            <li class="icon mx-3"><span class="far fa-heart"></span></li>
                            <li class="icon"><span class="fas fa-shopping-bag"></span></li>
                        </ul>
                    </div>
                    <div class="tag bg-red">${book.category}</div>
                    <div class="title pt-4 pb-1">${book.name}</div>
                    <div class="d-flex align-content-center justify-content-center"> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> </div>
                    <div class="price">${book.price} VNĐ</div>
                </div>
            </c:forEach>
        </div>
    </div>
    <!-- EMD DEMO HTML -->
</main>

<footer class="credit">Author: Sanja - Distributed By: <a title="Awesome web design code & scripts" href="https://www.codehim.com?source=demo-page" target="_blank">CodeHim</a></footer>
<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>