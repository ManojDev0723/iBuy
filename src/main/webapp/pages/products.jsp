<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBuy-Product</title>
</head>
<body>
<jsp:include page="/pages/header.jsp"/>
<!-- Filters Section -->
  <section class="filters">
    <select id="priceFilter">
      <option value="">Price</option>
      <option value="low">Low to High</option>
      <option value="high">High to Low</option>
    </select>
    <select id="categoryFilter">
      <option value="">Category</option>
      <option value="iphone">iPhone</option>
      <option value="mac">Mac</option>
      <option value="airpods">AirPods</option>
      <option value="tv">TV</option>
      <option value="monitor">Monitors</option>
    </select>
    <input type="text" id="searchInput" placeholder="Search Products" oninput="searchProducts()" />
  </section>

  <!-- Product Grid -->
  <section class="product-grid" id="productList">
    <!-- You can populate this dynamically using JSP scriptlets or JSTL from a backend list -->
    <%-- Example static product (optional to remove if dynamically loaded via JS) --
    <div class="product-card">
      <img src="${pageContext.request.contextPath}/images/iphone15pro.jpg" alt="iPhone 15 Pro" />
      <h3>iPhone 15 Pro</h3>
      <p>$1199</p>
      <a href="${pageContext.request.contextPath}/cart.jsp" class="btn">Add to Cart</a>
    </div>
    --%>
  </section>

  
<jsp:include page="/pages/footer.jsp"/>
</body>
</html>