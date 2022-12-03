<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="./css/login.css">
  <title>Đăng nhập</title>
</head>
<body>
<div class="main">
  <form action="<%=request.getContextPath()%>/login" method="POST" class="form" id="form-2">
    <h3 class="heading">Đăng nhập</h3>
    <div class="spacer"></div>

    <c:if test="${sessionScope.login_false == false}">
      <div class="alert alert-danger" role="alert">Email hoặc mật khẩu không đúng !</div>
    </c:if>
    <div class="form-group">
      <label class="form-label">Email</label>
      <input type="email" name="email" class="form-control" placeholder="Nhập email của bạn..." required>
      <span class="form-message"></span>
    </div>

    <div class="form-group">
      <label class="form-label">Mật khẩu</label>
      <input type="password" name="password" class="form-control" placeholder="Nhập mật khẩu..." required>
      <span class="form-message"></span>
    </div>
    <button type="submit" class="form-submit">Đăng nhập</button>
    <div style="margin-top: 15px;font-size: 12px" class="sign-up">Chưa có tài khoản? <a href="${pageContext.request.contextPath}/register">Đăng ký ngay</a></div>
  </form>
</div>
</body>
</html>