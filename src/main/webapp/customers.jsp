<%@ page import="java.util.List" %>
<%@ page import="com.bakery.model.Customer" %>
<html>
<head>
    <title>Customers</title>
</head>
<body>
<h1>Customer Management</h1>

<form method="post" action="${pageContext.request.contextPath}/customers">
    <label>Id: <input type="text" name="id" required/></label><br/>
    <label>Name: <input type="text" name="name" required/></label><br/>
    <label>Phone: <input type="text" name="phone" required/></label><br/>
    <label>Email: <input type="email" name="email" required/></label><br/>
    <button type="submit">Add Customer</button>
</form>

<h2>Customer List</h2>
<table border="1" cellpadding="6">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Phone</th>
        <th>Email</th>
    </tr>
    <%
        List<Customer> customers = (List<Customer>) request.getAttribute("customers");
        if (customers != null) {
            for (Customer c : customers) {
    %>
    <tr>
        <td><%= c.getId() %></td>
        <td><%= c.getName() %></td>
        <td><%= c.getPhone() %></td>
        <td><%= c.getEmail() %></td>
    </tr>
    <%
            }
        }
    %>
</table>
</body>
</html>
