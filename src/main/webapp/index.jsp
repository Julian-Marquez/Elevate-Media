<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="media.*" %>
<!DOCTYPE html>
<html lang="en">

    <!-- Basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">   
   
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
 
     <!-- Site Metas -->
    <title>Elevate Media</title>  

    <!-- Site Icons -->
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

<style>
.navbar-toggler-icon {
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 30 30'%3E%3Cpath stroke='rgba(255,255,255,1)' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E");
}
</style>


</head>
<body id="page-top" class="politics_version">

    <!-- LOADER -->
    <div id="preloader">
		<div id="main-ld">
			<div class="loader">
				<span class="loader-inner">Elevate Media</span>
			</div>
		</div>
    </div><!-- end loader -->
    <!-- END LOADER -->
	

	
    <!-- Navigation -->
<nav style="background:black; height:100px;" class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
  <div class="container-fluid">
    <!-- Logo -->
    <a class="navbar-brand js-scroll-trigger" href="#page-top">
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
          <a class="nav-link js-scroll-trigger" href="#appdev">App Development</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="#pricing">Pricing</a>
        </li>
        <% 
        ServletContext context = request.getServletContext();
        User user = (User) context.getAttribute("loggedinUser");
        if(user != null){
        %>
        <li class="nav-item">
          <a class="nav-link" href="profile.jsp">Profile</a>
        </li>
        <% } else { %>
        <li class="nav-item">
          <a class="nav-link" href="login.jsp">Login</a>
        </li>
        <% } %>
      </ul>
    </div>
  </div>
</nav>

	
	<section id="home" class="main-banner parallaxie" style="background: url('uploads/elevate-bg.png')">
		<div class="heading">
			<h1>Lets Elevate Your Game</h1>
			<p>Elevate Your Story. Captivating Photography, Design, and Development to Propel Your Brand. <br>Explore our Photography, Web, Graphic Design, and Apparel Services</p>
			<h3 class="cd-headline clip is-full-width">
				<span>Choose From: </span>
				<span class="cd-words-wrapper">
					<b class="is-visible">Photography</b>
					<b>Web Design</b>
					<b>Graphical Design</b>
					<b>Elevating</b>
				</span>
			</h3>
		</div>
	</section>

<div id="about" class="section wb">
    <div class="container">
        <div class="row">
            <!-- Text Section -->
            <div class="col-md-6">
                <div class="message-box">                        
                    <h2>Josiah Escobedo</h2>
                    <p>Born and raised in Albuquerque, NM, Josiah Escobedo developed a passion for storytelling through the lens at an early age. What began as a curiosity for capturing everyday moments soon evolved into a full-fledged creative pursuit.</p>
                    <p>With a deep love for photography, Josiah founded <strong>Elevate Media</strong> to bring bold visuals, thoughtful design, and clean development to individuals and businesses alike. Whether it's through brand-focused photography, dynamic web experiences, or custom apparel design, Elevate Media helps clients turn ideas into impact.</p>
                    <p>Explore our full range of services — Photography, Web Design, Graphic Design, and Apparel — and see how we can help you elevate your story.</p>

                    <!-- Skill Bars -->
                        <h2>Photography Expertise</h2>

                        
                    
                    <!-- Call to Action -->
                    <a href="works.jsp" class="sim-btn btn-hover-new" data-text="My Works"><span>My Works</span></a>
                </div><!-- end messagebox -->
            </div><!-- end col -->

            <!-- Image Section -->
            <div class="col-md-6">
                <div class="right-box-pro wow fadeIn">
                    <img src="images/Josiah.jpg" alt="Josiah Escobedo" class="img-fluid img-rounded">
                </div><!-- end media -->
            </div><!-- end col -->
        </div><!-- end row -->
    </div><!-- end container -->
</div><!-- end section -->

	
	<div id="gallery" class="section lb">
		<div class="container">
			<div class="section-title text-center">
				<h3>Gallery</h3>
				<p>Samples of What the Photography Aspect can do.</p>
			</div><!-- end title -->
		
			<div class="gallery-menu text-center row">
				<div class="col-md-12">
					<div class="button-group filter-button-group">
						<button class="active" data-filter="*">All</button>
						<button data-filter=".photo_a">Business </button>
						<button data-filter=".photo_b">Sports</button>
						<button data-filter=".photo_c">Vehicles</button>
					</div>
				</div>
			</div>
		
			<div class="gallery-list row">
				<div class="col-md-4 col-sm-6 gallery-grid photo_a">
					<div class="gallery-single fix">
						<img src="images/business.jpg" class="img-fluid" alt="Image">
						<div class="box-content">
							<div class="inner-content">
								<h3 class="title">Business</h3>
							</div>
							<ul class="icon">
								<li><a href="images/business.jpg" data-rel="prettyPhoto[gal]"><i class="fa fa-search"></i></a></li>
								<li><a href="https://www.instagram.com/p/DFOmOk0x2aJ/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA=="><i class="fa fa-link"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="col-md-4 col-sm-6 gallery-grid photo_b">
					<div class="gallery-single fix">
						<img src="images/sport.jpg" class="img-fluid" alt="Image">
						<div class="box-content">
							<div class="inner-content">
								<h3 class="title">Sports</h3>
							</div>
							<ul class="icon">
								<li><a href="images/sport.jpg" data-rel="prettyPhoto[gal]"><i class="fa fa-search"></i></a></li>
								<li><a href="https://www.instagram.com/p/DEjRrJsR2L2/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA=="><i class="fa fa-link"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="col-md-4 col-sm-6 gallery-grid photo_c">
					<div class="gallery-single fix">
						<img src="images/vehicles.jpg" class="img-fluid" alt="Image">
						<div class="box-content">
							<div class="inner-content">
								<h3 class="title">Vehicles</h3>
							</div>
							<ul class="icon">
								<li><a href="images/vehicles.jpg" data-rel="prettyPhoto[gal]"><i class="fa fa-search"></i></a></li>
								<li><a href="https://www.instagram.com/p/DDDHGV6RBFE/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA=="><i class="fa fa-link"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
    <div id="services" class="section lb">
        <div class="container">
            <div class="section-title text-center">
                <h3>Services</h3>
                <p>Choose from one our Services to get Started.</p>
            </div><!-- end title -->

            <div class="row">
			<div class="col-md-4">
			    <div class="services-inner-box text-center">
			        <div class="ser-icon">
			            <i style="background: url('images/videography.png') no-repeat center center; background-size: contain; display: block; width: 60px; height: 60px; margin: 0 auto;"></i>
			        </div>
						<h2>Videography</h2>
						<p>From promotional content to special events, our videography service captures your story with cinematic quality. Let us turn your moments into dynamic visual experiences that resonate and engage.</p>

					</div>
                </div><!-- end col -->
				<div class="col-md-4">
				    <div class="services-inner-box text-center">
				        <div class="ser-icon">
				            <i style="background: url('images/camera.png') no-repeat center center; background-size: contain; display: block; width: 60px; height: 60px; margin: 0 auto;"></i>
				        </div>
						<h2>Photography</h2>
						<p>Elevate your business with our photography service or just have a proffesional Photographer Capture stunning memeories </p>
					</div>
                </div><!-- end col -->
				<div class="col-md-4">
				    <div class="services-inner-box text-center">
				        <div class="ser-icon">
				            <i style="background: url('images/backend.png') no-repeat center center; background-size: contain; display: block; width: 60px; height: 60px; margin: 0 auto;"></i>
				        </div>
						<h2>Web Development</h2>
						<p>For any occasion, Elevate Media goes beyond simply taking pictures. We bring the energy and capture the excitement, delivering amazing images that amplify the buzz and make your event unforgettable.</p>
					</div>
                </div><!-- end col -->
            </div><!-- end row -->
        </div><!-- end container -->
    </div><!-- end section -->
	
	<div style="width:100%; background: url('images/logo-background.png') ;" id="appdev" class="section lb">
    <div  class="container">
        <div class="section-title text-center">
            <h3>App Development</h3>
            <p>Custom Web & Mobile Apps to Help You Stand Out</p>
        </div><!-- end title -->

        <div   class="row justify-content-center">
            <div class="col-md-6">
                <div  class="services-inner-box text-center">
                    <div class="ser-icon">
                        <i style="background: url('images/mobile-app.png') no-repeat center center; background-size: contain; display: block; width: 60px; height: 60px; margin: 0 auto;"></i>
                    </div>
                    <h2>Web & Mobile Apps</h2>
                    <p>Whether you're starting a new business or expanding your online presence, we craft fast, responsive, and secure web and mobile applications tailored to your goals. From sleek interfaces to powerful backend functionality, we’ll bring your digital product to life.</p>
                    <a href="https://dealership.fly.dev/Dealership/needWebsite.jsp" class="sim-btn btn-hover-new" data-text="Request Quote"><span>Learn More</span></a>
                </div>
            </div>
        </div>
    </div>
</div>
	
	 
	
	<div id="pricing" class="section lb">
		<div class="container">
			<div class="section-title text-center">
                <h3>Pricing</h3>
            </div><!-- end title -->
			
			<div class="row">
                <div class="col-md-4 col-sm-6">
                    <div class="pricingTable">
                        <div class="pricingTable-header">
                            <h3 class="title">Videography</h3>
                        </div>
                        <div class="pricing-content">
                            <div class="price-value">
                                <i class="fa fa-star"></i>
                                <span class="amount">$250</span>
                                <span class="month">project</span>
                            </div>
                            <ul>
                                <li>As low as $250 a project</li>
                                <li>Sky the limit</li>
                                <li>Negotiable pricing</li>
                            </ul>
                            <a href="#" class="pricingTable-signup">Details</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6">
                    <div class="pricingTable yellow">
                        <div class="pricingTable-header">
                            <h3 class="title">Photography</h3>
                        </div>
                        <div class="pricing-content">
                            <div class="price-value">
                                <i class="fa fa-star"></i><i class="fa fa-star"></i>
                                <span class="amount">$20</span>
                                <span class="month">project</span>
                            </div>
                            <ul>
                                <li>2-Location Shoot</li>
                                <li>$30 Print Credit</li>
                                <li>20 Digital Files</li>
                                <li>Print Release</li>
                            </ul>
                            <a href="#" class="pricingTable-signup">Order Now</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6">
                    <div class="pricingTable purple">
                        <div class="pricingTable-header">
                            <h3 class="title">Web design</h3>
                        </div>
                        <div class="pricing-content">
                            <div class="price-value">
                                <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                <span class="amount">$850</span>
                                <span class="month">A project</span>
                            </div>
                            <ul>
                                <li>Web design</li>
                                <li>Mobile App development</li>
                                <li>your design</li>
                            </ul>
                            <a href="https://dealership.fly.dev/Dealership/needWebsite.jsp" class="pricingTable-signup">View Details</a>
                        </div>
                    </div>
                </div>
            </div>
			
		</div>
	</div>

<style>
.socials {
  text-align: center;
  margin-top: 20px;
}

.socials h2 {
  color: red;
  font-size: 20px;
}

.socials .row {
  display: flex;
  justify-content: center;
  gap: 20px; /* adds spacing between icons */
  margin-top: 15px;
}

.socials img {
  width: 50px;
  height: auto;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.socials img:hover {
  transform: scale(1.1);
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}
</style>

<div id="contact" class="section db">
  <div class="container">
    <div class="section-title text-center">
      <h3><a href="login.jsp">Get Started</a></h3>
      <div class="socials">
        <h2>Our Socials</h2>
        <div class="row">
          <a href="https://www.instagram.com/elevate.media.nm">
            <img src="images/instagram-logo.png" alt="Instagram">
          </a>
          <a href="https://www.tiktok.com/@elevate.media.nm">
            <img src="images/tik-tok-icon.png" alt="TikTok">
          </a>
        </div>
      </div>
    </div>
  </div>
</div>


    <div class="copyrights">
        <div class="container">
            <div class="footer-distributed">
                <div class="footer-left">
                    <p class="footer-links">
                        <a href="#">Pricing</a>
                        <a href="#">About</a>
                    </p>
                   
                </div>
            </div>
        </div><!-- end container -->
    </div><!-- end copyrights -->

    <a href="#" id="scroll-to-top" class="dmtop global-radius"><i class="fa fa-camera" aria-hidden="true"></i></a>

    <!-- ALL JS FILES -->
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