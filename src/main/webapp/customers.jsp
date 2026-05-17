<%@ page import="com.bakery.service.CustomerService" %>
<%@ page import="com.bakery.model.Customer" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Customer Management</title>
</head>
<body>

<h2>Customer Management</h2>

<form action="customer" method="post">
    <input type="hidden" name="action" value="add">

    <input type="text" name="id" placeholder="Customer ID" required><br><br>
    <input type="text" name="name" placeholder="Customer Name" required><br><br>
    <input type="email" name="email" placeholder="Email" required><br><br>
    <input type="text" name="phone" placeholder="Phone Number" required><br><br>

    <button type="submit">Add Customer</button>
</form>

<hr>

<h3>Customer List</h3>

<table border="1" cellpadding="10">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Action</th>
    </tr>

    <%
        CustomerService service = new CustomerService();
        List<Customer> customers = service.getAllCustomers();

        for (Customer c : customers) {
    %>

    <tr>
        <td><%= c.getId() %></td>
        <td><%= c.getName() %></td>
        <td><%= c.getEmail() %></td>
        <td><%= c.getPhone() %></td>
        <td>
            <form action="customer" method="post">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="<%= c.getId() %>">
                <button type="submit">Delete</button>
            </form>
        </td>
    </tr>

    <%
        }
    %>
</table>

<br>
<a href="index.jsp">Back to Home</a>

</body>
</html>
