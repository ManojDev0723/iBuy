<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../CSS/styles.css" />
</head>
<body>
 <!-- Header/Nav -->
  <header style="background-color: #fff; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05); position: sticky; top: 0; z-index: 1000;">
    <nav>
      <div class="logo">AppleStore</div>
      <ul>
        <li><a href="${pageContext.request.contextPath}/pages/index.jsp">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/pages/products.jsp">Products</a></li>
        <li><a href="${pageContext.request.contextPath}/pages/about.jsp">About Us</a></li>
        <li><a href="${pageContext.request.contextPath}/pages/cart.jsp">Cart</a></li>
      </ul>
      <div class="icons">
        <%
          String username = (String) session.getAttribute("username");
          if (username != null) {
        %>
          Welcome, <%= username %> | <a href="${pageContext.request.contextPath}/logout.jsp">Logout</a>
        <%
          } else {
        %>
          <a href="${pageContext.request.contextPath}/pages/login.jsp">Login</a> | 
          <a href="${pageContext.request.contextPath}/pages/register.jsp">Register</a>
        <%
          }
        %>
      </div>
    </nav>
  </header>

</body>
</html>