<%@ page import="java.util.List" %>
<%@ page import="com.iBuy.model.User" %>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    User adminUser = (User) session.getAttribute("userWithSession");
    if (adminUser == null || !"admin".equalsIgnoreCase(adminUser.getRole())) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        return;
    }
    List<User> users = (List<User>) request.getAttribute("userList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/user.css" />
<title>Admin Dashboard - User Management</title>

<script>
function openEditForm(id, name, email, role) {
    document.getElementById('editUserId').value = id;
    document.getElementById('editName').value = name;
    document.getElementById('editEmail').value = email;
    document.getElementById('editRole').value = role;`
    document.getElementById('editForm').style.display = 'block';
    window.scrollTo(0, document.body.scrollHeight);
}
function closeEditForm() {
    document.getElementById('editForm').style.display = 'none';
}
</script>
</head>
<body>
<div class="container">
<h1>Users Management</h1>

<c:if test="${not empty message}">
    <div id="messages">${message}</div>
</c:if>
<c:if test="${not empty error}">
    <div id="errors">${error}</div>
</c:if>

<table>
<thead>
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Role</th>
        <th>Created At</th>
        <th>Actions</th>
    </tr>
</thead>
<tbody>
    <% if(users != null && !users.isEmpty()) {
        for(User u : users) { %>
        <tr>
            <td><%= u.getName() %></td>
            <td><%= u.getEmail() %></td>
            <td><%= u.getRole() %></td>
            <td><%= u.getCreatedAt() %></td>
            <td class="actions">
                <button type="button" onclick="openEditForm('<%= u.getUserId() %>', '<%= u.getName().replace("'", "\\'") %>', '<%= u.getEmail() %>', '<%= u.getRole() %>')">Edit</button>
                <form action="<%=request.getContextPath()%>/UserManagementController" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this user?');">
                    <input type="hidden" name="userId" value="<%= u.getUserId() %>" />
                    <input type="hidden" name="action" value="delete" />
                    <button type="submit">Delete</button>
                </form>
            </td>
        </tr>
    <% }
    } else { %>
    <tr><td colspan="5" style="text-align:center;">No users found</td></tr>
    <% } %>
</tbody>
</table>

<div id="editForm">
    <h2>Edit User</h2>
    <form action="<%=request.getContextPath()%>/UserManagementController" method="post">
        <input type="hidden" id="editUserId" name="userId"/>
        <input type="hidden" name="action" value="update"/>
        <label for="editName">Name:</label><br/>
        <input type="text" id="editName" name="name" required/><br/>
        <label for="editEmail">Email:</label><br/>
        <input type="email" id="editEmail" name="email" required/><br/>
        <label for="editRole">Role:</label><br/>
        <select id="editRole" name="role" required>
            <option value="admin">Admin</option>
            <option value="customer">Customer</option>
            <!-- Add other roles as needed -->
        </select><br/>
        <button type="submit">Save</button>
        <button type="button" onclick="closeEditForm()">Cancel</button>
    </form>
</div>

</div>
</body>
</html>