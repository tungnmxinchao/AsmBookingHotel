<%-- 
    Document   : manageBooking
    Created on : Jun 22, 2024, 4:42:15 PM
    Author     : TNO
--%>

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
                                        <a href=""></a>
                                    </li>
                                </ul>
                            </div>
                            <div class="page-category">
                            </div>
                        </div>
                    </div>

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
