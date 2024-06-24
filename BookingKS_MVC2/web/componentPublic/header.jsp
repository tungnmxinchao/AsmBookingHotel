<%-- 
    Document   : header
    Created on : Jun 12, 2024, 9:00:22 PM
    Author     : TNO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="header-section">
    <div class="top-nav">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <ul class="tn-left">
                        <li><i class="fa fa-phone"></i> (12) 345 67890</li>
                        <li><i class="fa fa-envelope"></i> info.colorlib@gmail.com</li>
                    </ul>
                </div>
                <div class="col-lg-6">
                    <div class="tn-right">
                        <div class="top-social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-tripadvisor"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                        </div>
                        <c:if test="${sessionScope.user == null}">
                            <a href="login" class="bk-btn">Login</a>
                        </c:if>
                        <c:if test="${sessionScope.user != null}">
                            <div class="language-option">
                                <img src="img/flag.jpg" alt="">
                                <span>${sessionScope.user.username} <i class="fa fa-angle-down"></i></span>
                                <div class="flag-dropdown">
                                    <c:if test="${sessionScope.user.role == 0}">
                                        <ul>
                                            <li><a href="trackingBooked">Tracking Room</a></li>
                                            <li><a href="home?action=logout">Logout</a></li>
                                        </ul>
                                    </c:if>
                                    <c:if test="${sessionScope.user.role == 1}">
                                        <ul>
                                            <li><a href="manageRoom">Manage Rooms</a></li>
                                            <li><a href="home?action=logout">Logout</a></li>
                                        </ul>
                                    </c:if>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="menu-item">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="logo">
                        <a href="./index.html">
                            <img src="img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-lg-10">
                    <div class="nav-menu">
                        <nav class="mainmenu">
                            <ul>
                                <li class="active"><a href="home">Home</a></li>
                                <li><a href="room">Rooms</a></li>
                                <li><a href="./about-us.html">About Us</a></li>
                                <li><a href="./pages.html">Pages</a>
                                    <ul class="dropdown">
                                        <li><a href="./room-details.html">Room Details</a></li>
                                        <li><a href="./blog-details.html">Blog Details</a></li>
                                        <li><a href="#">Family Room</a></li>
                                        <li><a href="#">Premium Room</a></li>
                                    </ul>
                                </li>
                                <li><a href="./blog.html">News</a></li>
                                <li><a href="./contact.html">Contact</a></li>
                            </ul>
                        </nav>
                        <div class="nav-right search-switch">
                            <i class="icon_search"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>