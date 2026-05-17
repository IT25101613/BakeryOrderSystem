<%@ page import="com.bakery.service.ItemService" %>
<%@ page import="com.bakery.model.BakeryItem" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Bakery Item Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">

<h2>Bakery Item Management</h2>

<%
    ItemService service = new ItemService();

    String editId = request.getParameter("editId");

    BakeryItem editItem = null;

    if (editId != null) {
        editItem = service.getItemById(editId);
    }
%>

<form action="item" method="post">

    <input type="hidden"
           name="action"
           value="<%= editItem != null ? "update" : "add" %>">

    <input type="text"
           name="itemId"
           placeholder="Item ID"
           value="<%= editItem != null ? editItem.getItemId() : "" %>"
           <%= editItem != null ? "readonly" : "" %>
           required><br><br>

    <input type="text"
           name="name"
           placeholder="Item Name"
           value="<%= editItem != null ? editItem.getName() : "" %>"
           required><br><br>

    <select name="category" required>

        <option value="Cake">Cake</option>
        <option value="Pastry">Pastry</option>
        <option value="Bread">Bread</option>
        <option value="Cookie">Cookie</option>

    </select><br><br>

    <input type="number"
           step="0.01"
           name="price"
           placeholder="Price"
           value="<%= editItem != null ? editItem.getPrice() : "" %>"
           required><br><br>

    <input type="number"
           name="quantity"
           placeholder="Quantity"
           value="<%= editItem != null ? editItem.getQuantity() : "" %>"
           required><br><br>

    <button class="btn btn-primary" type="submit">
        <%= editItem != null ? "Update Item" : "Add Item" %>
    </button>

</form>

<hr>

<h3>Item List</h3>

<form method="get" action="items.jsp" class="mb-3">
    <input type="text" name="search" placeholder="Search item..." class="form-control"
           value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
    <br>
    <button type="submit" class="btn btn-primary">Search</button>
    <a href="items.jsp" class="btn btn-secondary">Clear</a>
</form>

<table class="table table-bordered table-striped">

    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Category</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Action</th>
    </tr>

<%
    String search = request.getParameter("search");

    List<BakeryItem> items;

    if (search != null && !search.trim().isEmpty()) {
        items = service.searchItems(search);
    } else {
        items = service.getAllItems();
    }

    for (BakeryItem item : items) {
%>

<tr>
    <td><%= item.getItemId() %></td>
    <td><%= item.getName() %></td>
    <td><%= item.getCategory() %></td>
    <td><%= item.getPrice() %></td>
    <td><%= item.getQuantity() %></td>

    <td>

        <form action="items.jsp" method="get" style="display:inline;">

            <input type="hidden"
                   name="editId"
                   value="<%= item.getItemId() %>">

            <button class="btn btn-warning btn-sm" type="submit">Edit</button>

        </form>

        <form action="item" method="post" style="display:inline;">

            <input type="hidden" name="action" value="delete">

            <input type="hidden"
                   name="itemId"
                   value="<%= item.getItemId() %>">

            <button class="btn btn-danger btn-sm" type="submit">Delete</button>

        </form>

    </td>

</tr>

<%
    }
%>

</table>

<br>

<a href="index.jsp">Back to Home</a>

</div>
</body>
</html>
