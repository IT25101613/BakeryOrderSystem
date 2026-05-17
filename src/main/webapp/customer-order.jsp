<%@ page import="com.bakery.service.ItemService" %>
<%@ page import="com.bakery.model.BakeryItem" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Place Order</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Nunito:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: "Nunito", sans-serif;
            background:
                radial-gradient(circle at 13% 20%, rgba(255, 165, 92, 0.2), transparent 35%),
                radial-gradient(circle at 88% 12%, rgba(255, 94, 58, 0.17), transparent 33%),
                linear-gradient(180deg, #fff8f1 0%, #ffe7d6 100%);
            min-height: 100vh;
        }
        .brand-title { font-family: "Playfair Display", serif; }
        .pastry-nav { background: linear-gradient(90deg, #8d3e1f, #b5532b); }
        .card {
            border: 1px solid #f1cdb5;
            border-radius: 12px;
            box-shadow: 0 10px 24px rgba(141, 62, 31, 0.14);
        }
    </style>
</head>

<body>

<nav class="navbar navbar-dark pastry-nav">
    <div class="container">
        <span class="navbar-brand brand-title">Place Bakery Order</span>
        <a href="customer-home.jsp" class="btn btn-light btn-sm">Back</a>
    </div>
</nav>

<div class="container mt-4">
    <div id="numberWarning" class="alert alert-danger d-none" role="alert">
        Negative numbers are not allowed. Quantity must be at least 1.
    </div>

    <div class="card shadow">
        <div class="card-body">

            <h3 class="mb-4">Place Order</h3>

            <form action="order" method="post">
                <input type="hidden" name="action" value="add">

                <input type="text" name="orderId" class="form-control mb-3" placeholder="Order ID e.g. O009" required>

                <input type="text" name="customerId" class="form-control mb-3" placeholder="Customer ID e.g. C001" required>

                <select name="itemId" class="form-control mb-3" required>
                    <option value="">Select Item</option>

                    <%
                        ItemService itemService = new ItemService();
                        List<BakeryItem> items = itemService.getAllItems();

                        for (BakeryItem item : items) {
                    %>

                    <option value="<%= item.getItemId() %>">
                        <%= item.getItemId() %> - <%= item.getName() %> - Rs. <%= item.getPrice() %>
                    </option>

                    <%
                        }
                    %>
                </select>

                <input type="number" name="quantity" min="1" step="1" class="form-control mb-3 non-negative" placeholder="Quantity" required>

                <input type="hidden" name="status" value="Pending">

                <button type="submit" class="btn btn-warning w-100">Place Order</button>
            </form>

        </div>
    </div>

    <div class="card shadow mt-4">
        <div class="card-body">
            <h4 class="mb-3">Available Items</h4>
            <table class="table table-bordered table-striped mb-0">
                <tr>
                    <th>Item ID</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Available Qty</th>
                </tr>
                <%
                    for (BakeryItem item : items) {
                %>
                <tr>
                    <td><%= item.getItemId() %></td>
                    <td><%= item.getName() %></td>
                    <td><%= item.getCategory() %></td>
                    <td>Rs. <%= item.getPrice() %></td>
                    <td><%= item.getQuantity() %></td>
                </tr>
                <%
                    }
                    if (items.isEmpty()) {
                %>
                <tr>
                    <td colspan="5" class="text-center">No items available</td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
    </div>

</div>

<script>
    (function () {
        const warning = document.getElementById("numberWarning");
        const numericInputs = document.querySelectorAll("input[type='number']");

        function validateInput(input) {
            const value = input.value.trim();
            if (value === "") {
                input.setCustomValidity("");
                return false;
            }
            const number = Number(value);
            const invalid = Number.isNaN(number) || number < 0;
            const quantityInvalid = input.name === "quantity" && number < 1;
            if (invalid || quantityInvalid) {
                input.setCustomValidity(input.name === "quantity"
                    ? "Quantity must be 1 or more. Negative values are not allowed."
                    : "Negative values are not allowed.");
                return true;
            }
            input.setCustomValidity("");
            return false;
        }

        function refreshWarning() {
            let hasInvalid = false;
            numericInputs.forEach(function (input) {
                if (validateInput(input)) hasInvalid = true;
            });
            warning.classList.toggle("d-none", !hasInvalid);
        }

        numericInputs.forEach(function (input) {
            input.addEventListener("input", refreshWarning);
        });
    })();
</script>

</body>
</html>
