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
                <c:if test="${sessionScope.cart_empty == true}">
                    <div class="alert alert-info" role="alert">
                        Không có sản phẩm nào trong giỏ hàng !
                    </div>
                </c:if>
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
                            <div class="col-2"> ${book.quantity * book.book.price} VNĐ</div>
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
                <form id="form_order" action="${pageContext.request.contextPath}/cart?total=${total}" method="post">
                    <label>Họ tên người nhận hàng</label>
                    <input id="checkname" name="name" type="text" placeholder="Nhập họ tên người nhận hàng..." required>
                    <label>Địa chỉ</label>
                    <input id="checkaddress" name="address" type="text" placeholder="Nhập địa chỉ chi tiết giao hàng..." required>
                    <label>Số điện thoại</label>
                    <input id="checkphone" name="phonenumber" type="number" placeholder="Số điện thoại nhận hàng..." required>
                    <label>Phí giao hàng</label>
                    <select><option class="text-muted">Vận chuyển nhanh- 21.200 VNĐ</option></select>
                </form>
                <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                    <div class="col">TỔNG TIỀN : ${total} VNĐ</div>
                </div>
                <button onclick="order()" class="btn rounded">Đặt hàng</button>
                <div style="margin-top: 10px;"><a href="/home">Quay lại trang chủ</a></div>
            </div>
        </div>
    </div>
</main>
</body>
</html>
<script>
    function order(){
        <c:if test="${sessionScope.cart_empty == null}">
            let phone = document.getElementById("checkphone").value;
            let name = document.getElementById("checkname").value;
            let address = document.getElementById("checkaddress").value;
            if (name.length === 0){
                alert('Không được để trống họ tên người nhận hàng!')
            }
            else if (address.length === 0){
                alert('Không được để trống địa chỉ nhận hàng')
            }
            else if (phone.length < 10 || phone.length > 11){
                alert('Số điện thoại không hợp lệ')
            }
            else document.getElementById("form_order").submit()
        </c:if>
        <c:if test="${sessionScope.cart_empty == true}">
            alert('Hãy thêm sản phẩm vào giỏ hàng trước khi thanh toán')
            window.location.href = "/home";
        </c:if>

    }
</script>
