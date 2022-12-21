<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="stylesheet" href="css/admin.css" />
    <title>Admin Dashboard</title>
</head>

<body>
<div class="d-flex" id="wrapper">
    <!-- Sidebar -->
    <div class="bg-white" id="sidebar-wrapper">
        <div class="sidebar-heading text-center py-4 primary-text fs-4 fw-bold text-uppercase border-bottom"><i
                class="fa fa-book me-2"></i>Tuna Admin</div>
        <div class="list-group list-group-flush my-3 nav">
            <ul class="nav">
                <li class="nav-item">
                    <a href="#book" data-toggle="tab" class="nav-link active list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                            class="fas fa-gift me-2"></i>Sách</a>
                </li>
                <li class="nav-item">
                    <a href="#order" data-toggle="tab" class="nav-link list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                            class="fas fa-shopping-cart me-2"></i>Đơn hàng</a>
                </li>
            </ul>
            <a href="" class="list-group-item list-group-item-action bg-transparent text-danger fw-bold"><i
                    class="fas fa-power-off me-2"></i>Đăng xuất</a>
        </div>
    </div>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">
        <nav class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
            <div class="d-flex align-items-center">
                <i class="fas fa-align-left primary-text fs-4 me-3" id="menu-toggle"></i>
                <h2 class="fs-2 m-0">Dashboard</h2>
            </div>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle second-text fw-bold" href="#" id="navbarDropdown"
                           role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-user me-2"></i>admin
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#">Profile</a></li>
                            <li><a class="dropdown-item" href="#">Settings</a></li>
                            <li><a class="dropdown-item" href="#">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="container-fluid px-4">
            <div class="row g-3 my-2">
                <div class="col-md-3">
                    <div class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded">
                        <div>
                            <h3 class="fs-2">720</h3>
                            <p class="fs-5">Products</p>
                        </div>
                        <i class="fas fa-gift fs-1 primary-text border rounded-full secondary-bg p-3"></i>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded">
                        <div>
                            <h3 class="fs-2">4920</h3>
                            <p class="fs-5">Sales</p>
                        </div>
                        <i
                                class="fas fa-hand-holding-usd fs-1 primary-text border rounded-full secondary-bg p-3"></i>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded">
                        <div>
                            <h3 class="fs-2">3899</h3>
                            <p class="fs-5">Delivery</p>
                        </div>
                        <i class="fas fa-truck fs-1 primary-text border rounded-full secondary-bg p-3"></i>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded">
                        <div>
                            <h3 class="fs-2">25%</h3>
                            <p class="fs-5">Increase</p>
                        </div>
                        <i class="fas fa-chart-line fs-1 primary-text border rounded-full secondary-bg p-3"></i>
                    </div>
                </div>
            </div>

            <div class="row my-5">
                <div class="tab-content">
                    <div class="tab-pane fade" id="order">
                        <div class="col">
                            <h3 class="fs-4 mb-3">Đơn hàng</h3>
                            <table class="table bg-white rounded shadow-sm  table-hover">
                                <thead>
                                <tr>
                                    <th scope="col">STT</th>
                                    <th scope="col">Khách hàng</th>
                                    <th scope="col">Địa chỉ</th>
                                    <th scope="col">Số điện thoại</th>
                                    <th scope="col">Tổng tiền</th>
                                    <th scope="col">Hành động</th>

                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="order" items="${list_order}">
                                    <tr>
                                        <td>${order.id}</td>
                                        <td>${order.name}</td>
                                        <td>${order.address}</td>
                                        <td>${order.phonenumber}</td>
                                        <td>${order.total} VNĐ</td>
                                        <td>
                                            <input class="btn btn-warning" type="button" value="Chi tiết">
                                            <input class="btn btn-primary" type="button" value="Cập nhật">
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade show active" id="book">
                        <div class="col">
                            <h3 class="fs-4 mb-3">Danh sách sản phẩm</h3>
                            <button onclick="addBook()" type="submit" class="btn btn-success">Thêm sách</button>
                            <table class="center table bg-white rounded shadow-sm  table-hover table-bordered">
                                <thead class="table-success">
                                <tr>
                                    <th scope="col" width="50">STT</th>
                                    <th scope="col">Sách</th>
                                    <th scope="col">Tiêu đề</th>
                                    <th scope="col">Thể loại</th>
                                    <th scope="col">Tác giả</th>
                                    <th scope="col">Giá tiền</th>
                                    <th scope="col">Hành động</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="book" items="${list_book}">
                                        <tr>
                                            <th>${book.id}</th>
                                            <th><img style="width: 60px; height: 80px;" src="${book.img}" alt=""></th>
                                            <td>${book.name}</td>
                                            <td>${book.category}</td>
                                            <td>${book.author}</td>
                                            <td>${book.price} VNĐ</td>
                                            <td>
                                                <form id="myForm" action="" method="post">
                                                    <input onclick="delete_book(${book.id})" class="btn btn-danger" type="button" value="Xóa">
                                                    <input onclick="submitForm(${book.id})" class="btn btn-primary" type="button" value="Sửa">
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    let el = document.getElementById("wrapper");
    let toggleButton = document.getElementById("menu-toggle");

    toggleButton.onclick = function () {
        el.classList.toggle("toggled");
    };
</script>
<script>
    function delete_book(id){
        if (confirm("Bạn có chắc chắn muốn xóa không?") === true) {
            $('#myForm').attr('action', '/delete?id=' + id);
            document.getElementById("myForm").submit();
        }
    }
    function submitForm(id){
        window.location.href = "/save?id=" + id;
    }
    function addBook(){
        window.location.href = "/save?id=-1";
    }
</script>
</body>
</html>
<style>
    th{
        text-align: center;
        vertical-align: middle;
    }
    td {
        text-align: center;
        vertical-align: middle;
    }
</style>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>