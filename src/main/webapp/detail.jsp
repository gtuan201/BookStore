<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/detail.css">
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
            <a class="nav-link active" aria-current="page" href="#">Giỏ hàng<span class='badge badge-warning' id='lblCartCount'> ${quantity_item} </span></a>
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
      </div>
    </div>
  </nav>

</header>
<div class="container">
  <div class="card">
    <div class="card-body">
      <h3 class="card-title"><c:out value="${book.name}"/></h3>
      <h6 class="card-subtitle"><c:out value="${book.author}"/></h6>
      <div class="row">
        <div class="col-lg-5 col-md-5 col-sm-6">
          <div class="white-box text-center"><img src="<c:out value="${book.img}"/>" style="width: 420px; height: 600px;" class="img-responsive"></div>
        </div>
        <div class="col-lg-7 col-md-7 col-sm-6">
          <h4 class="box-title mt-5">Giới thiệu sách</h4>
          <p>${book.description}</p>
          <h4 class="mt-5 text-danger">
            Giá: ${book.price} VNĐ
          </h4>
          <div>
            <form id="form_cart" style="display: flex" action="${pageContext.request.contextPath}/add_cart?id=${book.id}" method="post">
              <p>Số lượng : </p>
              <input id="quantity_input" name="quantity" style="width: 70px; height: 30px; margin-left: 5px" class="form-control" type="number" value="1">
            </form>
          </div>
            <div class="alert alert-danger" role="alert" style="display: none">
              Số lượng không hợp lệ ! Vui lòng nhập số lượng lớn hơn hoặc bằng 1
            </div>
          <button onclick="add()" class="btn btn-dark btn-rounded mr-1" data-toggle="tooltip" title="" data-original-title="Add to cart">
            <i class="fa fa-shopping-cart"></i>
          </button>
          <button class="btn btn-primary btn-rounded">Mua ngay</button>
          <button onclick="show()" class="btn btn-danger btn-rounded" data-toggle="modal"><i class="fa fa-star"></i> Đánh giá</button>
          <h3 class="box-title mt-5">Key Highlights</h3>
          <ul class="list-unstyled">
            <li><i class="fa fa-check text-success"></i>Sturdy structure</li>
            <li><i class="fa fa-check text-success"></i>Designed to foster easy portability</li>
            <li><i class="fa fa-check text-success"></i>Perfect furniture to flaunt your wonderful collectibles</li>
          </ul>
        </div>
      </div>
      <div class="col-lg-12 col-md-12 col-sm-12">
        <h3 class="box-title mt-5">Thông tin cơ bản</h3>
        <div class="table-responsive">
          <table class="table table-striped table-product">
            <tbody>
            <tr>
              <td width="390">Thể loại</td>
              <td><c:out value="${book.category}"/></td>
            </tr>
            <tr>
              <td>Ngày phát hàng</td>
              <td><c:out value="${book.date}"/></td>
            </tr>
            <tr>
              <td>Số trang</td>
              <td><c:out value="${book.page}"/></td>
            </tr>
            </tbody>
          </table>
        </div>
        <h3 class="box-title">Đánh giá</h3>
          <ul class="list-group list-group-flush">
            <c:forEach var="item" items="${list_review}">
              <li class="list-group-item">
                <p style="font-weight: bold; font-family: 'Arial Black','Arial Black'">${item.email_user}</p>
                <div>
                  ${item.review}
                </div>
              </li>
            </c:forEach>
          </ul>
      </div>
    </div>
  </div>
  <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <form action="${pageContext.request.contextPath}/detail" method="post">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">Đánh giá sản phẩm</h5>
          </div>
          <div class="modal-body">
            <div class="rating">
              <input type="radio" id="star5" name="rating" value="5"/><label for="star5" class="full"></label>
              <input type="radio" id="star4" name="rating" value="4"/><label for="star4" class="full"></label>
              <input type="radio" id="star3" name="rating" value="3"/><label for="star3" class="full"></label>
              <input type="radio" id="star2" name="rating" value="2"/><label for="star2" class="full"></label>
              <input type="radio" id="star1" name="rating" value="1"/><label for="star1" class="full"></label>
            </div>
            <input name="review" class="form-control" type="text" placeholder="Review...." required>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
            <button type="submit" class="btn btn-primary">Gửi đánh giá</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>
<script>
  function show(){
    <c:if test="${sessionScope.user != null}">
      $('#exampleModalCenter').modal('show');
    </c:if>
    <c:if test="${sessionScope.user == null}">
      alert('Vui lòng đăng nhập để đánh giá !')
    </c:if>
  }
  function add(){
    <c:if test="${sessionScope.user != null}">
    let quantity = document.getElementById("quantity_input").value;
    if (quantity <= 0){
      $('.alert').show()
    }
    else  document.getElementById("form_cart").submit();
    </c:if>
    <c:if test="${sessionScope.user == null}">
      alert('Vui lòng đăng nhập !')
      window.location.href = "/login"
    </c:if>
  }
</script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>