<html>
<head>
    <title>Bakery Item Management</title>
</head>
<body>

<h2>Bakery Item Management</h2>

<form action="item" method="post">
    <input type="text" name="itemId" placeholder="Item ID" required><br><br>
    <input type="text" name="name" placeholder="Item Name" required><br><br>

    <select name="category" required>
        <option value="Cake">Cake</option>
        <option value="Pastry">Pastry</option>
        <option value="Bread">Bread</option>
        <option value="Cookie">Cookie</option>
    </select><br><br>

    <input type="number" step="0.01" name="price" placeholder="Price" required><br><br>
    <input type="number" name="quantity" placeholder="Quantity" required><br><br>

    <button type="submit">Add Item</button>
</form>

<br>
<a href="index.jsp">Back to Home</a>

</body>
</html>
