<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../CSS/styles.css" />
<title>Register</title>
</head>
<body>

  <div class="auth-form">
    <h2>Register</h2>
    <form action="RegisterServlet" method="POST">
      <input type="text" name="name" placeholder="Name" required />
      <input type="email" name="email" placeholder="Email" required />
      <input type="tel" name="contact" placeholder="Contact" required />
      <input type="password" name="password" placeholder="Password" required />
      <input type="text" name="address" placeholder="Address" required />
      <button type="submit">Register</button>
      <p>Already have an account? <a href="login.jsp">Login here</a></p>
    </form>
  </div>

</body>
</html>