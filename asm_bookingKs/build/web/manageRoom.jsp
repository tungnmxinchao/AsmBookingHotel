
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Kaiadmin - Bootstrap 5 Admin Dashboard</title>
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

        <!-- CSS Just for demo purpose, don't include it in your project -->
        <link rel="stylesheet" href="assets/css/demo.css" />

        <style>
            /* Table Styles */
            .styled-table {
                width: 100%;
                border-collapse: collapse;
                margin: 25px 0;
                font-size: 0.9em;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                color: #333;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
            }

            .styled-table thead tr {
                background-color: #009879;
                color: #ffffff;
                text-align: left;
            }

            .styled-table th,
            .styled-table td {
                padding: 12px 15px;
            }

            .styled-table tbody tr {
                border-bottom: 1px solid #dddddd;
            }

            .styled-table tbody tr:nth-of-type(even) {
                background-color: #f3f3f3;
            }

            .styled-table tbody tr:last-of-type {
                border-bottom: 2px solid #009879;
            }

            .styled-table tbody tr.active-row {
                font-weight: bold;
                color: #009879;
            }

            /* Additional Styling for Better Layout */
            .page-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding-bottom: 20px;
            }

            .page-title {
                font-size: 24px;
                color: #333;
            }

            .breadcrumbs {
                display: flex;
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .breadcrumbs li {
                display: flex;
                align-items: center;
                color: #009879;
            }

            .breadcrumbs .separator {
                margin: 0 5px;
            }

            .nav-home i,
            .separator i,
            .nav-item a {
                color: #009879;
            }

            /* Table Container Styling */
            .table-container {
                padding: 20px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            }

            .page-category h4 {
                margin-bottom: 20px;
            }
            .btn-add-room {
                margin-bottom: 10px;
                background-color: #28a745;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
            }
            .btn-add-room i {
                margin-right: 5px;
            }
            .btn-add-room:hover {
                background-color: #218838;
                color: white;
            }
        </style>
    </head>

    <body>
        <div class="wrapper">
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
                            <div class="page-header">
                                <h4 class="page-title">Dashboard</h4>
                                <ul class="breadcrumbs">
                                    <li class="nav-home">
                                        <a href="#">
                                            <i class="icon-home"></i>
                                        </a>
                                    </li>
                                    <li class="separator">
                                        <i class="icon-arrow-right"></i>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#">Pages</a>
                                    </li>
                                    <li class="separator">
                                        <i class="icon-arrow-right"></i>
                                    </li>
                                    <li class="nav-item">
                                        <a href="roomWaitingConfirm">Waiting for confirmation</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="page-category">
                                <div class="row">
                                    <h4 style="color: red">${msg}</h4>
                                    <div>
                                        <a href="addRooms" class="btn btn-success" title="Add Room" style="margin-bottom: 10px;">
                                            <i class="fas fa-plus"></i> Add Room
                                        </a>
                                    </div>
                                    <table class="styled-table" border="1">
                                        <thead>
                                            <tr>
                                                <th>Thumbnail</th>
                                                <th>Room ID</th>
                                                <th>Room Name</th>
                                                <th>Price</th>
                                                <th>Adult Amount</th>
                                                <th>Childrent Amount</th>
                                                <th>Amount Room</th>
                                                <th>Hotel Name</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listRoom}" var="listRoom">
                                                <tr>
                                                    <td>
                                                        <img  height="80px" src="${listRoom.thumbnail}" class="responsive-img" alt="alt"/>

                                                    </td>
                                                    <td>${listRoom.rid}</td>
                                                    <td>${listRoom.name}</td>
                                                    <td>${listRoom.price}</td>
                                                    <td>${listRoom.adultAmount}</td>
                                                    <td>${listRoom.childAmount}</td>
                                                    <td>${listRoom.amountRoom}</td>
                                                    <td>${listRoom.hotelName}</td>
                                                    <td>${listRoom.status == true ? "Active" : "Blocked"}</td>
                                                    <td>
                                                        <a href="viewDetailsURL" class="btn btn-info" title="View Details">
                                                            <i class="fas fa-eye"></i> <!-- Icon for viewing details -->
                                                        </a>
                                                        <a href="deleteRoom?id=${listRoom.rid}" class="btn btn-danger" title="Delete">
                                                            <i class="fas fa-trash"></i> <!-- Icon for deleting -->
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%@include file="componentPublic/pagination.jsp" %>
                    <%@include file="componentPublic/footerDashboard.jsp" %>
                </div>
            </div>
            <!--   Core JS Files   -->
            <script src="assets/js/core/jquery-3.7.1.min.js"></script>
            <script src="assets/js/core/popper.min.js"></script>
            <script src="assets/js/core/bootstrap.min.js"></script>

            <!-- jQuery Scrollbar -->
            <script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

            <!-- Chart JS -->
            <script src="assets/js/plugin/chart.js/chart.min.js"></script>

            <!-- jQuery Sparkline -->
            <script src="assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

            <!-- Chart Circle -->
            <script src="assets/js/plugin/chart-circle/circles.min.js"></script>

            <!-- Datatables -->
            <script src="assets/js/plugin/datatables/datatables.min.js"></script>

            <!-- Bootstrap Notify -->
            <script src="assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

            <!-- jQuery Vector Maps -->
            <script src="assets/js/plugin/jsvectormap/jsvectormap.min.js"></script>
            <script src="assets/js/plugin/jsvectormap/world.js"></script>

            <!-- Google Maps Plugin -->
            <script src="assets/js/plugin/gmaps/gmaps.js"></script>

            <!-- Sweet Alert -->
            <script src="assets/js/plugin/sweetalert/sweetalert.min.js"></script>

            <!-- Kaiadmin JS -->
            <script src="assets/js/kaiadmin.min.js"></script>
    </body>

</html>
