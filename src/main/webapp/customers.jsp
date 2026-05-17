<%@ page import="com.bakery.service.CustomerService" %>
<%@ page import="com.bakery.model.Customer" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Customer Management</title>
</head>
<body>

<h2>Customer Management</h2>

<%
    CustomerService service = new CustomerService();
    String editId = request.getParameter("editId");
    Customer editCustomer = null;

    if (editId != null) {
        editCustomer = service.getCustomerById(editId);
    }
%>

<form action="customer" method="post">
    <input type="hidden" name="action" value="<%= editCustomer != null ? "update" : "add" %>">

    <input type="text" name="id" placeholder="Customer ID"
           value="<%= editCustomer != null ? editCustomer.getId() : "" %>"
           <%= editCustomer != null ? "readonly" : "" %> required><br><br>

    <input type="text" name="name" placeholder="Customer Name"
           value="<%= editCustomer != null ? editCustomer.getName() : "" %>" required><br><br>

    <input type="email" name="email" placeholder="Email"
           value="<%= editCustomer != null ? editCustomer.getEmail() : "" %>" required><br><br>

    <input type="text" name="phone" placeholder="Phone Number"
           value="<%= editCustomer != null ? editCustomer.getPhone() : "" %>" required><br><br>

    <button type="submit">
        <%= editCustomer != null ? "Update Customer" : "Add Customer" %>
    </button>
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
        List<Customer> customers = service.getAllCustomers();

        for (Customer c : customers) {
    %>

    <tr>
        <td><%= c.getId() %></td>
        <td><%= c.getName() %></td>
        <td><%= c.getEmail() %></td>
        <td><%= c.getPhone() %></td>
        <td>
            <form action="customers.jsp" method="get" style="display:inline;">
                <input type="hidden" name="editId" value="<%= c.getId() %>">
                <button type="submit">Edit</button>
            </form>

            <form action="customer" method="post" style="display:inline;">
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
