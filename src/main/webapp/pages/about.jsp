<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../CSS/styles.css" />
<title>About Us</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section class="about-us">
    <h2>About AppleStore</h2>
    <p>
      We are a premier online destination for all things Apple. From the latest iPhone to the newest MacBooks, 
      AppleStore offers a variety of products to suit your needs. Explore our products and experience premium 
      Apple quality at your fingertips.
    </p>
    <div class="team">
      <div class="team-member">
        <img src="images/team1.jpg" alt="Team Member" />
        <h3>John Doe</h3>
        <p>Founder & CEO</p>
      </div>
      <div class="team-member">
        <img src="images/team2.jpg" alt="Team Member" />
        <h3>Jane Smith</h3>
        <p>Head of Marketing</p>
      </div>
    </div>
  </section>
  <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>