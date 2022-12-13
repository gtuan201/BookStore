<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.2/css/all.css'>
    <link rel="stylesheet" href="css/cart.css">
    <title>Document</title>
</head>
<body>
<main>
    <div class="card">
        <div class="row">
            <div class="col-md-8 cart">
                <div class="title">
                    <div class="row">
                        <div class="col"><h4><b>Giỏ Hàng</b></h4></div>
                    </div>
                </div>
                <c:forEach var="book" items="${book_in_cart}">
                    <div class="row border-top border-bottom">
                        <div class="row main align-items-center">
                            <div class="col"><img class="img-fluid border border-dark" style="width: 120px; height: 180px;" src="${book.book.img}"></div>
                            <div class="col">
                                <div class="row">${book.book.name}</div>
                                <div class="row text-muted">Giá : ${book.book.price} VNĐ</div>
                            </div>
                            <div class="col">
                                Số lượng : ${book.quantity}
                            </div>
                            <div class="col-2"> ${book.quantity * book.book.price} VNĐ <span class="close">&#10005;</span></div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="col-md-4 summary">
                <div><h5><b>Thanh toán</b></h5></div>
                <hr>
                <div class="row">
                    <div class="col" style="padding-left:0;">Sản phẩm : ${cart_quantity}</div>
                </div>
                <form action="" method="post">
                    <label>Họ tên người nhận hàng</label>
                    <input name="name" type="text" placeholder="Nhập họ tên người nhận hàng...">
                    <label>Địa chỉ</label>
                    <input name="address" type="text" placeholder="Nhập địa chỉ chi tiết giao hàng...">
                    <label>Số điện thoại</label>
                    <input name="phonenumber" type="number" placeholder="Số điện thoại nhận hàng...">
                    <label>Phí giao hàng</label>
                    <select><option class="text-muted">Vận chuyển nhanh- 21.200 VNĐ</option></select>
                </form>
                <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                    <div class="col">TỔNG TIỀN : ${total} VNĐ</div>
                </div>
                <button class="btn rounded">Đặt hàng</button>
                <div style="margin-top: 10px;"><a href="/home">Quay lại trang chủ</a></div>
            </div>
        </div>
    </div>
</main>
</body>
</html>
