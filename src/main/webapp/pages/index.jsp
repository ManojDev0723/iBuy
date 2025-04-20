<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBuy -Home</title>
<link rel="stylesheet" type="text/css" href="../CSS/styles.css" />
</head>
<body>
 
  <jsp:include page="/pages/header.jsp"/>

  <!-- Hero Section -->
  <section class="hero">
    <div class="hero-content">
      <h1>Welcome to AppleStore</h1>
      <p>Explore the latest Apple products with cutting-edge technology.</p>
      <a href="${pageContext.request.contextPath}/products.jsp" class="btn">Shop Now</a>
    </div>
  </section>

  <!-- Featured Products -->
  <section class="featured-products">
    <h2>Featured Apple Products</h2>
    <div class="product-grid">
      <div class="product-card">
        <img src="${pageContext.request.contextPath}/images/iphone15pro.jpg" alt="iPhone 15 Pro" />
        <div class="overlay">
          <h3>iPhone 15 Pro</h3>
          <p>$1199</p>
          <a href="${pageContext.request.contextPath}/products.jsp" class="btn">Shop Now</a>
        </div>
      </div>
      <div class="product-card">
        <img src="${pageContext.request.contextPath}/images/macbookpro.jpg" alt="MacBook Pro M3" />
        <div class="overlay">
          <h3>MacBook Pro M3</h3>
          <p>$1999</p>
          <a href="${pageContext.request.contextPath}/products.jsp" class="btn">Shop Now</a>
        </div>
      </div>
      <div class="product-card">
        <img src="${pageContext.request.contextPath}/images/airpodspro.jpg" alt="AirPods Pro 2" />
        <div class="overlay">
          <h3>AirPods Pro 2</h3>
          <p>$249</p>
          <a href="${pageContext.request.contextPath}/products.jsp" class="btn">Shop Now</a>
        </div>
      </div>
    </div>
  </section>

  <!-- New Arrivals -->
  <section class="new-arrivals">
    <h2>New Arrivals</h2>
    <div class="slideshow">
      <div class="slides fade">
        <img src="${pageContext.request.contextPath}/images/new-arrival1.jpg" alt="New Apple Product" />
      </div>
      <div class="slides fade">
        <img src="${pageContext.request.contextPath}/images/new-arrival2.jpg" alt="New Apple Product" />
      </div>
      <div class="slides fade">
        <img src="${pageContext.request.contextPath}/images/new-arrival3.jpg" alt="New Apple Product" />
      </div>
    </div>
    <div class="slideshow-buttons">
      <span class="prev" onclick="moveSlides(-1)">&#10094;</span>
      <span class="next" onclick="moveSlides(1)">&#10095;</span>
    </div>
  </section>

  <!-- Bestsellers -->
  <section class="bestsellers">
    <h2>Bestselling Apple Products</h2>
    <div class="product-grid">
      <div class="product-card">
        <img src="${pageContext.request.contextPath}/images/studiomonitor.jpg" alt="Studio Display" />
        <h3>Studio Display</h3>
        <p>$1599</p>
        <a href="${pageContext.request.contextPath}/products.jsp" class="btn">Shop Now</a>
      </div>
      <div class="product-card">
        <img src="${pageContext.request.contextPath}/images/appletv.jpg" alt="Apple TV 4K" />
        <h3>Apple TV 4K</h3>
        <p>$179</p>
        <a href="${pageContext.request.contextPath}/products.jsp" class="btn">Shop Now</a>
      </div>
    </div>
  </section>

 
  <jsp:include page="/pages/footer.jsp"/>

<%--   <script src="${pageContext.request.contextPath}/scripts.js"></script>
 --%>
</body>
</html>