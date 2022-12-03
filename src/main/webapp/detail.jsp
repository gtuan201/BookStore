<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/detail.css">
</head>
<body>
<div class="container">
  <div class="card">
    <div class="card-body">
      <h3 class="card-title"><c:out value="${book.name}"/></h3>
      <h6 class="card-subtitle">Tác giả</h6>
      <div class="row">
        <div class="col-lg-5 col-md-5 col-sm-6">
          <div class="white-box text-center"><img src="assest/bookcover3.jpg" style="width: 420px; height: 600px;" class="img-responsive"></div>
        </div>
        <div class="col-lg-7 col-md-7 col-sm-6">
          <h4 class="box-title mt-5">Giới thiệu sách</h4>
          <p>Dragon Ball Super là loạt manga và anime truyền hình của Nhật Bản. Đây là phần tiếp theo của bộ truyện tranh Dragon Ball gốc và loạt phim hoạt hình Dragon Ball Z</p>
          <h4 class="mt-5 text-danger">
            Giá: 30.000 VNĐ
          </h4>
          <button class="btn btn-dark btn-rounded mr-1" data-toggle="tooltip" title="" data-original-title="Add to cart">
            <i class="fa fa-shopping-cart"></i>
          </button>
          <button class="btn btn-primary btn-rounded">Mua ngay</button>
          <h3 class="box-title mt-5">Key Highlights</h3>
          <ul class="list-unstyled">
            <li><i class="fa fa-check text-success"></i>Sturdy structure</li>
            <li><i class="fa fa-check text-success"></i>Designed to foster easy portability</li>
            <li><i class="fa fa-check text-success"></i>Perfect furniture to flaunt your wonderful collectibles</li>
          </ul>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12">
          <h3 class="box-title mt-5">Thông tin cơ bản</h3>
          <div class="table-responsive">
            <table class="table table-striped table-product">
              <tbody>
              <tr>
                <td width="390">Thể loại</td>
                <td>Truyện tranh</td>
              </tr>
              <tr>
                <td>Ngày phát hàng</td>
                <td>03/12/2022</td>
              </tr>
              <tr>
                <td>Số trang</td>
                <td>30</td>
              </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
