<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login - Bakery System</title>
    <meta charset="UTF-8">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body style="background-color:#fff8f0;">

<div class="container mt-5">
    <div class="row justify-content-center">

        <div class="col-md-4">
            <div class="card shadow">
                <div class="card-body p-4">

                    <h3 class="text-center mb-4">🧁 Admin Login</h3>

                    <% if (request.getParameter("error") != null) { %>
                        <div class="alert alert-danger">
                            Invalid username or password
                        </div>
                    <% } %>

                    <form action="login" method="post">
                        <input type="text" name="username" class="form-control mb-3" placeholder="Username" required>

                        <input type="password" name="password" class="form-control mb-3" placeholder="Password" required>

                        <button type="submit" class="btn btn-dark w-100">
                            Login
                        </button>
                    </form>

                    <p class="text-muted text-center mt-3">
                        Username: admin | Password: admin123
                    </p>

                </div>
            </div>
        </div>

    </div>
</div>

</body>
</html>
