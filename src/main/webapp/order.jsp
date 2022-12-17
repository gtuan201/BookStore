<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.2/css/all.css'>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/order.css">
  <title>Document</title>
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
            <a class="nav-link active" onclick="cart_link()" id="cart_link" href="#" aria-current="page">Giỏ hàng <span class='badge badge-warning' id='lblCartCount'> ${quantity_item} </span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="test.jsp">Ưa thích</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">Lịch sử mua hàng</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/login">Đăng nhập</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/register">Đăng ký</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

</header>
<div class="m-4">
  <ul class="nav nav-pills" id="myTab">
    <li class="nav-item">
      <a href="#home" data-toggle="tab" class="nav-link active">Đơn hàng đang giao</a>
    </li>
    <li class="nav-item">
      <a href="#profile"  data-toggle="tab" class="nav-link">Đơn hàng đã mua</a>
    </li>
  </ul>
  <div class="tab-content">
    <div class="tab-pane fade show active" id="home">
      <c:forEach var="order" items="${order_list}">
        <div class="container">
          <div class="table">
            <div class="alert alert-primary" role="alert">
              Họ tên khách hàng : ${order.name}<br>
              Địa chỉ giao hàng : ${order.address}<br>
              Số điện thoại nhận hàng: ${order.phonenumber}<br>
              Trạng thái :
              <c:if test="${order.status == 1}">Đang chuẩn bị đơn hàng</c:if>
              <c:if test="${order.status == 2}">Đang giao hàng</c:if>
              <br>
            </div>
            <table class="table table-bordered" style="width: 100%">
              <thead>
              <th></th>
              <th>Product</th>
              <th>Price</th>
              <th>Quantity</th>
              <th>total</th>
              </thead>
              <tbody>
              <c:forEach var="item" items="${order.list}">
                <tr class="align-middle alert border-bottom" role="alert">
                  <td class="text-center">
                    <img class="pic border border-dark"
                         src="${item.book.img}"
                         alt="">
                  </td>
                  <td>
                    <div>
                      <p class="m-0 fw-bold">${item.book.name}</p>
                      <p class="m-0 text-muted">${item.book.author}</p>
                    </div>
                  </td>
                  <td>
                    <div class="">${item.book.price}</div>
                  </td>
                  <td class="d-">
                      ${item.quantity}
                  </td>
                  <td>
                      ${item.book.price * item.quantity}
                  </td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </c:forEach>
    </div>
    <div class="tab-pane fade" id="profile">
      <div class="container">
        <div class="table">
          <div class="alert alert-primary" role="alert">
            Họ tên: Tuấn<br>
            Địa chỉ giao hàng<br>
            Số điện thoại nhận hàng<br>
            Trạng thái<br>
          </div>
          <table class="table table-bordered" style="width: 100%">
            <thead>
            <th></th>
            <th>Product</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>total</th>
            </thead>
            <tbody>
            <tr class="align-middle alert border-bottom" role="alert">
              <td class="text-center">
                <img class="pic border border-dark"
                     src="assest/bookcover3.jpg"
                     alt="">
              </td>
              <td>
                <div>
                  <p class="m-0 fw-bold">Sneakers Shoes 2020 For Men</p>
                  <p class="m-0 text-muted">Fugiat Voluptates quasi nemo,ipsa perferencis</p>
                </div>
              </td>
              <td>
                <div class="">$44.99</div>
              </td>
              <td class="d-">
                2
              </td>
              <td>
                $89.98
              </td>
            </tr>
            </tbody>
          </table>
        </div>
      </div>

    </div>
  </div>
</div>
</body>
</html>
<script type="text/javascript">
  function cart_link(){
    let cart_link = document.getElementById("cart_link");
    <c:if test="${sessionScope.user != null}">
    cart_link.setAttribute("href","/cart");
    </c:if>
    <c:if test="${sessionScope.user == null}">
    alert('Vui lòng đăng nhập')
    cart_link.setAttribute("href","/login");
    </c:if>
    return false;
  }
</script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<style>
  .badge {
    padding-left: 9px;
    padding-right: 9px;
    -webkit-border-radius: 9px;
    -moz-border-radius: 9px;
    border-radius: 9px;
  }

  .label-warning[href],
  .badge-warning[href] {
    background-color: #c67605;
  }
  #lblCartCount {
    font-size: 13px;
    background: #ff0000;
    color: #fff;
    padding: 0 5px;
    vertical-align: top;
    margin-left: -7px;
  }
</style>
