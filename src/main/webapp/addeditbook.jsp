<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/19/2022
  Time: 6:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sách</title>
    <link href="https://fonts.googleapis.com/css?family=Quicksand&display=swap" rel="stylesheet">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <form id="myForm" action="${pageContext.request.contextPath}/save" method="post" enctype="multipart/form-data">
        <div class="contact-box">
            <div>
                <c:if test="${book == null}">
                    <img id="image" class="left" src="https://static.thenounproject.com/png/3322766-200.png" alt=""><br>
                </c:if>
                <c:if test="${book != null}">
                    <img id="image" class="left" src="${book.img}" alt=""><br>
                </c:if>
                <div style="width: 80%; margin-top: 43px" class="custom-file">
                    <input name="image" type="file" class="custom-file-input" id="customFile">
                    <label class="custom-file-label" for="customFile">Chọn bìa</label>
                </div>
            </div>
            <div class="right">
                <h2>Thêm sách</h2>
                <div style="display: flex;">
                    <div>
                        <label style="font-weight: bold">Tên sách</label>
                        <input id="title" name="title" style="margin-right: 5px;" type="text" class="field" placeholder="Tiêu đề" value="${book.name}" required>
                    </div>
                    <div>
                        <label style="font-weight: bold">Tác giả</label>
                        <input id="author" name="author" style="margin-left: 5px;" type="text" class="field" placeholder="Tác giả" value="${book.author}" required>
                    </div>
                </div>
                <label style="font-weight: bold">Mô tả</label>
                <input style="min-height: 150px;" id="description" name="description" placeholder="Mô tả" class="field" value="${book.description}" required>
                <div style="display: flex;">
                    <div>
                        <label style="font-weight: bold">Ngày phát hành</label>
                        <input id="date" name="date" style="margin-right: 5px;" type="text" class="field" placeholder="Ngày phát hàng" value="${book.date}" required>
                    </div>
                    <div>
                        <label style="font-weight: bold">Số trang</label>
                        <input id="page" name="page" style="margin-left: 5px;" type="number" class="field" placeholder="Số trang" value="${book.page}" required>
                    </div>
                </div>
                <div>
                    <label style="font-weight: bold">Thể loại</label>
                    <select name="category" id="category" class="field" aria-label="Default select example">
                        <c:forEach items="${categorys}" var="category">
                            <option value="${category.category}" ${category.category == book.category ? 'selected' : ''}>${category.category}</option>
                        </c:forEach>
                    </select>
                </div>
                <input onclick="edit()" id="bt" type="button" class="btn" value="${btn}">
            </div>
        </div>
    </form>
</div>
</body>
</html>
<script>
    const file = document.querySelector("#customFile")
    file.addEventListener("change", function() {
        const reader = new FileReader()
        reader.addEventListener("load", () => {
            document.querySelector("#image").src = reader.result
        })
        reader.readAsDataURL(this.files[0]);
    })
    //disable input
    let bt = document.getElementById("bt");
    if(bt.value === "Sửa") {
        document.getElementById("title").disabled = true;
        document.getElementById("author").disabled = true;
        document.getElementById("date").disabled = true;
        document.getElementById("page").disabled = true;
        document.getElementById("category").disabled = true;
        document.getElementById("description").disabled = true;
    }
    //
    function edit(){
        let bt = document.getElementById("bt");
        if(bt.value === "Sửa") {
            document.getElementById("title").disabled = false;
            document.getElementById("author").disabled = false;
            document.getElementById("date").disabled = false;
            document.getElementById("page").disabled = false;
            document.getElementById("category").disabled = false;
            document.getElementById("description").disabled = false;
            document.getElementById("bt").value = "Lưu";
        }
        else {
            document.getElementById("myForm").submit();
        }
    }
</script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<style>
    *{
        padding: 0;
        margin: 0;
        box-sizing: border-box;
        font-family: 'Quicksand', sans-serif;
    }

    body{
        height: 100vh;
        width: 100%;
    }

    .container{
        position: relative;
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px 100px;
    }

    .container:after{
        content: '';
        position: absolute;
        width: 100%;
        height: 100%;
        left: 0;
        top: 0;
        background: #6bf0a3;
        background-size: cover;
        filter: blur(70px);
        z-index: -1;
    }
    .contact-box{
        max-width: 850px;
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        justify-content: center;
        align-items: center;
        text-align: center;
        background-color: #fff;
        box-shadow: 0px 0px 19px 5px rgba(0,0,0,0.19);
    }

    .left{
        background-size: cover;
        height: 100%;
        width: 80%;
        border: 1px solid black;
    }

    .right{
        padding: 25px 20px;
    }

    h2{
        position: relative;
        padding: 0 0 10px;
        margin-bottom: 10px;
    }

    h2:after{
        content: '';
        position: absolute;
        left: 50%;
        bottom: 0;
        transform: translateX(-50%);
        height: 4px;
        width: 50px;
        border-radius: 2px;
        background-color: #2ecc71;
    }

    input:disabled{
        background-color: rgb(204, 203, 203);
    }

    .field{
        width: 100%;
        border: 2px solid rgba(0, 0, 0, 0);
        outline: none;
        background-color: rgba(230, 230, 230, 0.6);
        padding: 0.5rem 1rem;
        font-size: 1.1rem;
        margin-bottom: 22px;
        transition: .3s;
    }

    textarea{
        min-height: 150px;
    }

    .btn{
        width: 100%;
        padding: 0.5rem 1rem;
        background-color: #2ecc71;
        color: #fff;
        font-size: 1.1rem;
        border: none;
        outline: none;
        cursor: pointer;
        transition: .3s;
    }

    .btn:hover{
        background-color: #27ae60;
    }

    .field:focus{
        border: 2px solid rgba(30,85,250,0.47);
        background-color: #fff;
    }

    @media screen and (max-width: 880px){
        .contact-box{
            grid-template-columns: 1fr;
        }
        .left{
            height: 200px;
        }
    }
    textarea:disabled{
        background-color: rgb(204, 203, 203);
    }
    select:disabled{
        background-color: rgb(204, 203, 203);
    }
    input:disabled{
        background-color: rgb(204, 203, 203);
    }
</style>
