<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="media.*" %>
<%@ page import="java.util.Base64" %>

<%
    ServletContext context = request.getServletContext();
    User user = (User) context.getAttribute("loggedinUser");
    String profilePicBase64 = (user.getProfilePic() != null && user.getProfilePic().length > 0) ? Base64.getEncoder().encodeToString(user.getProfilePic()) : "";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Profile | Elevate Media</title>

    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
    <link rel="stylesheet" href="style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">
	<script src="js/modernizr.js"></script> <!-- Modernizr -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Only ONE Bootstrap Bundle JS for Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<%

boolean Show = false;

try{
	
Show = (boolean) context.getAttribute("updateMessage");

}catch(NullPointerException e){
	Show = false;
}

if(Show){ %>

<script >

alert("We recomend you update your pasword with the edit Profile button");

</script>
<%
context.removeAttribute("updateMessage");
} %>
    <style>
        body {
            background: url('uploads/elevate-bg2.png') no-repeat center center fixed;
            background-size: cover;
            color: #333; /* Darker text for better readability */
        }
        .profile-container {
            margin-top: 80px; /* Adjust margin for better spacing below the nav */
            padding: 30px 0; /* Add some vertical padding */
        }
        .profile-card {
            background: rgba(255, 255, 255, 0.9); /* Slightly less opaque */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Softer shadow */
            padding: 30px;
        }
        .profile-header {
            text-align: center;
            margin-bottom: 25px;
        }
        .profile-pic-wrapper {
            width: 100px; /* Adjusted size */
            height: 100px; /* Adjusted size */
            border-radius: 50%;
            overflow: hidden; /* Ensures the image stays within the circle */
            margin: 0 auto 15px; /* Center the image */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Subtle shadow on the pic */
            border: 3px solid #eee; /* Optional: light border */
        }
        .profile-pic {
            width: 100%;
            height: 100%;
            object-fit: cover; /* Ensures the image covers the area without distortion */
        }
        .profile-title {
            font-size: 1.5em;
            font-weight: bold;
            color: #db5c87;
            margin-bottom: 5px;
        }
        .profile-info {
            margin-top: 20px;
        }
        .profile-info p {
            margin-bottom: 10px;
        }
        .profile-info strong {
            font-weight: bold;
            color: #555;
            margin-right: 5px;
        }
        .profile-actions {
            margin-top: 30px;
            text-align: center;
        }
        .btn-primary {
            background-color: #db5c87;
            border: none;
        }
        .btn-primary:hover {
            background-color: #c94a75;
        }
        .btn-danger {
            background-color: #dc3545;
            border: none;
        }
        .btn-danger:hover {
            background-color: #c82333;
        }
        .nav-link {
            color: white !important; /* Ensure nav links are white */
        }
        .nav-link:hover {
            color: #f0f0f0 !important;
        }
        .navbar-brand img {
            max-height: 40px; /* Adjust logo size if needed */
        }
   
.navbar-toggler-icon {
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 30 30'%3E%3Cpath stroke='rgba(255,255,255,1)' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E");
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
        <% 
        if(user != null){
        %>
        <li class="nav-item">
          <a class="nav-link" href="profile.jsp">Profile</a>
        </li>
        <% } %>
      </ul>
    </div>
  </div>
</nav>


<div class="container profile-container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="profile-card">
                <div class="profile-header">
                    <% if (!profilePicBase64.isEmpty()) { %>
                        <div class="profile-pic-wrapper">
                            <img src="data:image/jpeg;base64,<%= profilePicBase64 %>" alt="Profile Picture" class="profile-pic">
                        </div>
                    <% } else { %>
                        <div class="profile-pic-wrapper">
                            <img src="images/default-profile.png" alt="Default Profile Picture" class="profile-pic">
                        </div>
                    <% } %>
                    <h3 class="profile-title"><%= user.getFirstName() %> <%= user.getLastName() %></h3>
                </div>
                <div class="profile-info">
                    <p><strong>Email:</strong> <%= user.getEmail() %></p>
                    <% if (user.getPhoneNumber() != null && !user.getPhoneNumber().isEmpty()) { %>
                        <p><strong>Phone Number:</strong> <%= user.getPhoneNumber() %></p>
                    <% } %>
                    </div>
                <div class="profile-actions">
                    <a href="editProfile.jsp" class="sim-btn btn-hover-new"><span>Edit Profile</span></a>
                    <div class="row">
                    <form action="handleAccount" method="get" class="d-inline">
                        <button type="submit" name="action" value="logout" style="background-color: #FFA500;"  class="sim-btn btn-hover-new"><span>Logout</span></button>
                        <button type="submit" name="action" value="delete" style="background-color: #800000;" class="sim-btn btn-hover-new"><span>Delete Account</span></button>
                    </form>
                    </div>
                </div>
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