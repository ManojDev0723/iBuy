<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../CSS/styles.css" />
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/pages/header.jsp"/>
<section class="login-section">
    <div class="login-box">
      <h2>Login to Your Account</h2>
      <form action="LoginServlet" method="POST"> <!-- Change to appropriate servlet or JSP handler -->
        <div class="form-group">
          <label for="email">Email Address</label>
          <input type="email" id="email" name="email" required placeholder="you@example.com" />
        </div>
        <div class="form-group">
          <label for="password">Password</label>
          <input type="password" id="password" name="password" required placeholder="••••••••" />
        </div>
        <button type="submit" class="btn full-btn">Login</button>
        <p class="register-link">Don't have an account? <a href="register.jsp">Register</a></p>
      </form>
    </div>
  </section>
  <jsp:include page="/pages/footer.jsp"/>
</body>
</html>