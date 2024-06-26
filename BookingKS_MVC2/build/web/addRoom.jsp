<%-- 
    Document   : addRoom
    Created on : Jun 23, 2024, 12:39:05 AM
    Author     : TNO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Add Room - Kaiadmin</title>
        <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport" />
        <link rel="icon" href="assets/img/kaiadmin/favicon.ico" type="image/x-icon" />

        <!-- Fonts and icons -->
        <script src="assets/js/plugin/webfont/webfont.min.js"></script>
        <script>
            WebFont.load({
                google: {families: ["Public Sans:300,400,500,600,700"]},
                custom: {
                    families: [
                        "Font Awesome 5 Solid",
                        "Font Awesome 5 Regular",
                        "Font Awesome 5 Brands",
                        "simple-line-icons",
                    ],
                    urls: ["assets/css/fonts.min.css"],
                },
                active: function () {
                    sessionStorage.fonts = true;
                },
            });
        </script>

        <!-- CSS Files -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/css/plugins.min.css" />
        <link rel="stylesheet" href="assets/css/kaiadmin.min.css" />
        <link rel="stylesheet" href="assets/css/demo.css" />

        <style>
            .form-group {
                margin-bottom: 15px;
            }

            .form-control {
                width: 100%;
            }

            .btn-increment, .btn-decrement {
                display: inline-block;
                width: 30px;
                height: 30px;
                text-align: center;
                line-height: 30px;
                background-color: #ddd;
                border: 1px solid #ccc;
                cursor: pointer;
            }

            .input-group {
                display: flex;
                align-items: center;
            }

            .input-group input {
                text-align: center;
            }

            .form-header {
                margin-bottom: 20px;
                color: #009879;
            }

            .submit-btn {
                background-color: #28a745;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                text-decoration: none;
            }

            .submit-btn:hover {
                background-color: #218838;
                color: white;
            }
        </style>
    </head>
    <body>

        <!-- Sidebar -->
        <div class="sidebar" data-background-color="dark">
            <div class="sidebar-logo">
                <!-- Logo Header -->
                <div class="logo-header" data-background-color="dark">
                    <a href="index.html" class="logo">
                        <img src="assets/img/kaiadmin/logo_light.svg" alt="navbar brand" class="navbar-brand" height="20" />
                    </a>
                    <div class="nav-toggle">
                        <button class="btn btn-toggle toggle-sidebar">
                            <i class="gg-menu-right"></i>
                        </button>
                        <button class="btn btn-toggle sidenav-toggler">
                            <i class="gg-menu-left"></i>
                        </button>
                    </div>
                    <button class="topbar-toggler more">
                        <i class="gg-more-vertical-alt"></i>
                    </button>
                </div>
                <!-- End Logo Header -->
            </div>
            <%@include file="componentPublic/sideBar.jsp" %>
        </div>

        <div class="main-panel">
            <div class="main-header">
                <div class="main-header-logo">
                    <!-- Logo Header -->
                    <div class="logo-header" data-background-color="dark">
                        <a href="index.html" class="logo">
                            <img src="assets/img/kaiadmin/logo_light.svg" alt="navbar brand" class="navbar-brand" height="20" />
                        </a>
                        <div class="nav-toggle">
                            <button class="btn btn-toggle toggle-sidebar">
                                <i class="gg-menu-right"></i>
                            </button>
                            <button class="btn btn-toggle sidenav-toggler">
                                <i class="gg-menu-left"></i>
                            </button>
                        </div>
                        <button class="topbar-toggler more">
                            <i class="gg-more-vertical-alt"></i>
                        </button>
                    </div>
                    <!-- End Logo Header -->
                </div>
                <!-- Navbar Header -->
                <%@include file="componentPublic/navBarDashboard.jsp" %>
                <!-- End Navbar -->
            </div>

            <div class="container">
                <div class="page-inner">
                    <h4 style="color: red">${msg}</h4>
                    <div class="page-header">
                        <h4 class="page-title">Add Room</h4>
                    </div>
                    <div class="page-category">
                        <form action="addRooms" method="POST" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="hotel">Hotel</label>
                                <select class="form-control" id="hotel" name="hotel">
                                    <c:forEach items="${listHotel}" var="listHotel">
                                        <option value="${listHotel.id}">${listHotel.name}</option>
                                    </c:forEach>
                                    <!-- Add more hotels as needed -->
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="name">Room Name</label>
                                <input type="text" class="form-control" id="name" name="name" required>
                            </div>

                            <div class="form-group">
                                <label for="description">Room Description</label>
                                <textarea class="form-control" id="description" name="description" rows="4" required></textarea>
                            </div>

                            <div class="form-group">
                                <label for="price">Price</label>
                                <input type="number" class="form-control" id="price" name="price" required>
                            </div>

                            <div class="form-group">
                                <label for="status">Status</label>
                                <select class="form-control" id="status" name="status">
                                    <option value="1">Active</option>
                                    <option value="0">Blocked</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>Adult Amount</label>
                                <div class="input-group">
                                    <div class="btn-decrement">-</div>
                                    <input type="number" class="form-control" name="adultAmount" value="1" min="1" required>
                                    <div class="btn-increment">+</div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Child Amount</label>
                                <div class="input-group">
                                    <div class="btn-decrement">-</div>
                                    <input type="number" class="form-control" name="childAmount" value="0" min="0" required>
                                    <div class="btn-increment">+</div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="thumbnail">Thumbnail</label>
                                <input type="file" class="form-control" id="thumbnail" name="thumbnail" required>
                            </div>

                            <div class="form-group">
                                <label for="amountRoom">Amount of Rooms</label>
                                <input type="number" class="form-control" id="amountRoom" name="amountRoom" min="1" required>
                            </div>

                            <div class="form-group">
                                <label for="roomImages">Room Images</label>
                                <input type="file" class="form-control" id="roomImages" name="roomImages" multiple>
                            </div>

                            <button type="submit" class="submit-btn">Add Room</button>
                        </form>
                    </div>
                </div>
            </div>
            <%@include file="componentPublic/footerDashboard.jsp" %>
        </div>


        <!-- Core JS Files -->
        <script src="assets/js/core/jquery-3.7.1.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>

        <script>
            document.querySelectorAll('.btn-increment').forEach(button => {
                button.addEventListener('click', function () {
                    const input = this.previousElementSibling;
                    input.value = parseInt(input.value) + 1;
                });
            });

            document.querySelectorAll('.btn-decrement').forEach(button => {
                button.addEventListener('click', function () {
                    const input = this.nextElementSibling;
                    if (input.value > 0) {
                        input.value = parseInt(input.value) - 1;
                    }
                });
            });
        </script>
    </body>
</html>