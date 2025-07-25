<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import='media.*' %>

<%

ServletContext context = request.getServletContext();

User user = (User) context.getAttribute("loggedinUser");



%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">   
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Register | Elevate Media</title>
    
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">
	<script src="js/modernizr.js"></script> <!-- Modernizr -->

    <style>
        body {
            background: url('uploads/elevate-bg2.png') no-repeat center center fixed;
            background-size: cover;
        }
        .login-container {
            margin-top: 100px;
        }
        .login-box {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0px 0px 20px rgba(0,0,0,0.2);
        }
        .login-title {
            font-weight: bold;
            margin-bottom: 25px;
        }
        .form-control:focus {
            box-shadow: none;
            border-color: #db5c87;
        }
        .btn-login {
            background-color: #db5c87;
            border: none;
        }
        .btn-login:hover {
            background-color: #c94a75;
        }
    </style>

</head>
<body>
<nav style="background:black; height:100px;" class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
  <div class="container-fluid">
    <!-- Logo -->
    <a class="navbar-brand js-scroll-trigger" href="index.jsp">
      <img class="img-fluid" src="images/logo.png" alt="" style="height: 60px;" />
    </a>

    <!-- Hamburger Button -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
      aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Collapsible Nav Links -->
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="#gallery">Gallery</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="#services">Services</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="https://dealership.fly.dev/Dealership/needWebsite.jsp">App Development</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="#pricing">Pricing</a>
        </li>
   
        <li class="nav-item">
          <a class="nav-link" href="profile.jsp">Profile</a>
        </li>
    
      </ul>
    </div>
  </div>
</nav>
    <!-- Login Section -->
    <div class="container login-container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="login-box text-center">
                    <h3 class="login-title">Editing <%= user.getFirstName() %> <%= user.getLastName() %></h3>
                  <form action="handleAccount" method="post" enctype="multipart/form-data">
                        <div class="form-group text-left">
                            <label>Username</label>
                            <input type="text" class="form-control" name="username"  placeholder="<%= user.getUsername() %>">
                        </div>
                        <div class="form-group text-left">
                            <label>First Name</label>
                            <input type="text" class="form-control" name="firstName"  placeholder="<%= user.getFirstName() %>">
                        </div>
                        <div class="form-group text-left">
                            <label>Last Name</label>
                            <input type="text" class="form-control" name="lastName" placeholder="<%= user.getLastName() %>">
                        </div>
                        <div class="form-group text-left">
                            <label>Email address</label>
                            <input type="email" class="form-control" name="email" placeholder="<%= user.getEmail() %>">
                        </div>
                        <div class="form-group text-left">
                            <label>Password</label>
                            <input type="password" class="form-control" name="password"  >
                        </div>
                        <div class="form-group text-left">
                            <label>Confirm Password</label>
                            <input type="password" class="form-control" name="comnfirmPassword" >
                        </div>
	                     <div class="form-group text-left">
						    <label>Change Phone Number</label>
						    <%
						        String phoneNumber = null;
						        try {
						            phoneNumber = user.getPhoneNumber();
						        } catch (NullPointerException e) {
						            // phoneNumber remains null
						        }
						        if (phoneNumber != null && !phoneNumber.isEmpty()) {
						    %>
						        <input type="text" class="form-control" name="phone" placeholder="<%= phoneNumber %>">
						    <%
						        } else {
						    %>
						        <input type="text" class="form-control" name="phone" placeholder="Phone Number">
						    <%
						        }
						    %>
						</div>

                        <div class="form-group text-left">
                            <label>Change Profile Picture</label>
                            <input type="file" class="form-control" name="file" >
                        </div>
                        <button type="submit" class="btn btn-login btn-block mt-4">Confirm</button>
                    </form>
                </div>
                </div>
            </div>
        </div>

    <script src="js/all.js"></script>
	<!-- Camera Slider -->
	<script src="js/jquery.mobile.customized.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script> 
	<script src="js/parallaxie.js"></script>
	<script src="js/headline.js"></script>
	<script src="js/jquery.appear.min.js"></script>
	<script src="js/skill.bars.jquery.js"></script>
	<script src="js/responsiveslides.min.js"></script>
	<!-- Contact form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>
    <!-- ALL PLUGINS -->
	<!-- Bootstrap 5 Bundle (with Popper) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/main.js"></script>
    <script src="js/custom.js"></script>

</body>
</html>
