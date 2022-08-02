<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
     
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
  </head>
  <body>
  <!--   <img src="./img/1.jfif" style="width: 25%; min-width: 25%;" /> -->
  <nav class="navbar navbar-dark bg-dark fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"><p>홍과함께 쇼핑몰</p></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
      <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">ALL</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">
        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">로그인</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">BOARD</a>
          </li>
          
           <li class="nav-item">
            <a class="nav-link" href="#">주문내역</a>
          </li>
          
           <li class="nav-item">
            <a class="nav-link" href="#">장바구니</a>
          </li>
          
           <li class="nav-item">
            <a class="nav-link" href="#">찜목록</a>
          </li>
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              MEN
            </a>
            <ul class="dropdown-menu dropdown-menu-dark">
              <li><a class="dropdown-item" href="#">CROP SLIM</a></li>
              <li><a class="dropdown-item" href="#">CROP STARAIGHT</a></li>
              <li><a class="dropdown-item" href="#">REGULAR STRAIGHT</a></li>
              <li><a class="dropdown-item" href="#">BOOTS CUT</a></li>
              <li><a class="dropdown-item" href="#">LOOSE TAPERED</a></li>
              <li><a class="dropdown-item" href="#">WIDE STRAIGHT</a></li>
              <li><a class="dropdown-item" href="#">NEW STRAIGHT</a></li>
              <li><a class="dropdown-item" href="#">INTERNATIONAL DENIM</a></li>
                <li><a class="dropdown-item" href="#">OUTER/INNER</a></li>
              <li>
                <hr class="dropdown-divider">
              </li>
              <li><a class="dropdown-item" href="#">할인 상품</a></li>
            </ul>
          </li>
          
          <!--  -->
          
          
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              WOMEN
            </a>
            <ul class="dropdown-menu dropdown-menu-dark">
              <li><a class="dropdown-item" href="#">옷</a></li>
             <li><a class="dropdown-item" href="#">CROP SLIM</a></li>
              <li><a class="dropdown-item" href="#">CROP STARAIGHT</a></li>
              <li><a class="dropdown-item" href="#">REGULAR STRAIGHT</a></li>
              <li><a class="dropdown-item" href="#">BOOTS CUT</a></li>
              <li><a class="dropdown-item" href="#">LOOSE TAPERED</a></li>
              <li><a class="dropdown-item" href="#">WIDE STRAIGHT</a></li>
              <li><a class="dropdown-item" href="#">NEW STRAIGHT</a></li>
              <li><a class="dropdown-item" href="#">INTERNATIONAL DENIM</a></li>
                <li><a class="dropdown-item" href="#">OUTER/INNER</a></li>
              <li>
                <hr class="dropdown-divider">
              </li>
              <li><a class="dropdown-item" href="#">할인상품</a></li>
            </ul>
          </li>
        </ul>
        <form class="d-flex" role="search">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-success" type="submit">Search</button>
        </form>
      </div>
    </div>
  </div>
</nav>




    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html> 