<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    // Check if the user is logged in and has admin role
    com.iBuy.model.User user = (com.iBuy.model.User) session.getAttribute("userWithSession");
    if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/dashboard.css" />
<title>Admin</title>
</head>
<body>
	<nav class="sidebar">
    <h2>iBuy Admin</h2>
    <a href="<%=request.getContextPath()%>/pages/dashboard.jsp" class="active" data-icon="🏠"><span>Dashboard</span></a>
    <a href="#" data-icon="👥"><span>Users</span></a>
    <a href="#" data-icon="📦"><span>Orders</span></a>
    <a href="#" data-icon="⚙️"><span>Settings</span></a>
    <a href="<%=request.getContextPath()%>/LogOutController" data-icon="🔓"><span>Logout</span></a>
  </nav>

  <div class="main-content">
    <header class="header">
      <h1>Dashboard</h1>
      <div class="user-info">Logged in as: <strong><%= user.getName() %></strong></div>
    </header>

    <section class="dashboard-widgets">
      <div class="widget">
        <h2>Total Users</h2>
        <div class="value">125</div>
      </div>

      <div class="widget">
        <h2>Orders Today</h2>
        <div class="value">35</div>
      </div>

      <div class="widget">
        <h2>Revenue</h2>
        <div class="value">$8,430</div>
      </div>

      <div class="widget">
        <h2>Pending Tickets</h2>
        <div class="value">7</div>
      </div>
    </section>
  </div>
</body>
</html>