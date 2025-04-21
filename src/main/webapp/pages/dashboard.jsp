<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../CSS/dashboardCSS.css" />
<title>Admin Dashboard</title>
</head>
<body>

<header>
    <nav>
        <div class="logo">AppleStore Admin</div>
        <ul>
    	<li><a href="${pageContext.request.contextPath}/pages/dashboard.jsp">Dashboard</a></li>
    	<li><a href="${pageContext.request.contextPath}/pages/products.jsp">Products</a></li>
    	<li><a href="${pageContext.request.contextPath}/pages/salesReport.jsp">Sales Report</a></li>
    	<li><a href="${pageContext.request.contextPath}/pages/addProduct.jsp">Add Product</a></li>
    	<li><a href="${pageContext.request.contextPath}/pages/index.html">Back to Site</a></li>
</ul>

        <div class="icons">
            <a href="logout.jsp">Logout</a>
        </div>
    </nav>
</header>

<section class="dashboard-container">
    <h2 class="dashboard-title">Admin Dashboard</h2>
    <div class="dashboard-grid">
        <div class="dashboard-card">
            <h3>Manage Products</h3>
            <p>View, update, or delete products listed in the store.</p>
            <a href="products.jsp">Go to Products</a>
        </div>
        <div class="dashboard-card">
            <h3>Add New Product</h3>
            <p>Add new Apple items to your store inventory.</p>
            <a href="addProduct.jsp">Add Product</a>
        </div>
        <div class="dashboard-card">
            <h3>Sales Reports</h3>
            <p>Check revenue and sales performance insights.</p>
            <a href="salesReport.jsp">View Reports</a>
        </div>
    </div>
</section>

<footer>
    <p>&copy; 2025 AppleStore Admin. All Rights Reserved.</p>
</footer>
</body>
</html>