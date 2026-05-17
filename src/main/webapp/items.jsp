<%@ page import="com.bakery.service.ItemService" %>
<%@ page import="com.bakery.model.BakeryItem" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Bakery Item Management</title>
</head>
<body>

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

    <button type="submit">
        <%= editItem != null ? "Update Item" : "Add Item" %>
    </button>

</form>

<hr>

<h3>Item List</h3>

<table border="1" cellpadding="10">

    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Category</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Action</th>
    </tr>

<%
    List<BakeryItem> items = service.getAllItems();

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

            <button type="submit">Edit</button>

        </form>

        <form action="item" method="post" style="display:inline;">

            <input type="hidden" name="action" value="delete">

            <input type="hidden"
                   name="itemId"
                   value="<%= item.getItemId() %>">

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
