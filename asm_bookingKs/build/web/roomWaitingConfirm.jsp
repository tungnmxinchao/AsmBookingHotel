

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

            .accept-link,
            .reject-link {
                display: inline-block;
                padding: 5px 10px;
                color: white;
                text-decoration: none;
                border-radius: 3px;
                margin-right: 5px;
            }

            .accept-link {
                background-color: green;
            }

            .reject-link {
                background-color: red;
            }

            .accept-link i,
            .reject-link i {
                margin-right: 5px;
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
                                    <table class="styled-table" border="1">
                                        <thead>
                                            <tr>
                                                <th>Booking ID</th>
                                                <th>Room Name</th>
                                                <th>Check In Date</th>
                                                <th>Check Out Date</th>
                                                <th>Booking Date</th>
                                                <th>Quantity</th>
                                                <th>Adult Amount</th>
                                                <th>Childent Amount</th>
                                                <th>Total Price</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${trackBooking}" var="trackBooking">
                                                <tr>
                                                    <td>${trackBooking.id}</td>
                                                    <td>${trackBooking.roomName}</td>
                                                    <td>${trackBooking.dateCheckIn}</td>
                                                    <td>${trackBooking.dateCheckOut}</td>
                                                    <td>${trackBooking.bookingDate}</td>
                                                    <td>${trackBooking.quantity}</td>
                                                    <td>${trackBooking.adultAmount}</td>
                                                    <td>${trackBooking.childAmount}</td>
                                                    <td>${trackBooking.totalPrice}</td>
                                                    <c:if test="${trackBooking.status == 1}">
                                                        <td>Awaiting approval</td>
                                                    </c:if>
                                                    <td>
                                                        <a href="accepBooking?id=${trackBooking.id}&roomID=${trackBooking.roomId}&quantityBooking=${trackBooking.quantity}" class="accept-link">
                                                            <i class="fas fa-check"></i> Accept
                                                        </a>
                                                        <a href="rejectBooking?id=${trackBooking.id}" class="reject-link">
                                                            <i class="fas fa-times"></i> Reject
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
