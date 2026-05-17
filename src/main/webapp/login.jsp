<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login - Bakery System</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        body {
            min-height: 100vh;
            margin: 0;
            background:
                radial-gradient(circle at 12% 18%, #fff4ea 0%, #ffeede 38%, rgba(255, 238, 222, 0.2) 72%),
                linear-gradient(140deg, #fff8f0 0%, #ffe9d0 100%);
            overflow: hidden;
            position: relative;
            font-family: "Inter", "Segoe UI", Tahoma, sans-serif;
        }
        .floating-layer {
            position: absolute;
            inset: 0;
            pointer-events: none;
            overflow: hidden;
        }
        .float-icon {
            position: absolute;
            opacity: 0.16;
            font-size: 2rem;
            animation: drift 15s linear infinite;
            filter: saturate(1.2);
        }
        .i1 { left: 8%; top: 88%; animation-delay: 0s; }
        .i2 { left: 18%; top: 95%; animation-delay: 2s; }
        .i3 { left: 31%; top: 90%; animation-delay: 4s; }
        .i4 { left: 46%; top: 93%; animation-delay: 1s; }
        .i5 { left: 58%; top: 96%; animation-delay: 3s; }
        .i6 { left: 72%; top: 89%; animation-delay: 5s; }
        .i7 { left: 84%; top: 94%; animation-delay: 6s; }
        .i8 { left: 92%; top: 91%; animation-delay: 7s; }
        @keyframes drift {
            0% { transform: translateY(0) translateX(0) scale(1); opacity: 0; }
            10% { opacity: 0.13; }
            50% { transform: translateY(-45vh) translateX(14px) scale(1.06); opacity: 0.16; }
            100% { transform: translateY(-95vh) translateX(-12px) scale(0.95); opacity: 0; }
        }
        .login-wrap {
            position: relative;
            z-index: 2;
            min-height: 100vh;
        }
        .login-card {
            border: none;
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.94);
            box-shadow: 0 16px 34px rgba(121, 78, 54, 0.18);
            border: 1px solid rgba(225, 188, 157, 0.42);
        }
        .brand-title {
            color: #6f4e37;
            font-family: "Playfair Display", Georgia, serif;
            font-weight: 700;
            letter-spacing: 0;
        }
        .brand-sub {
            color: #9a6a4b;
            font-size: 0.9rem;
            text-align: center;
            margin-top: -8px;
            margin-bottom: 18px;
        }
        .form-control {
            border-radius: 10px;
            border-color: #e7cfba;
            padding: 0.68rem 0.8rem;
        }
        .form-control:focus {
            border-color: #c58f66;
            box-shadow: 0 0 0 0.2rem rgba(197, 143, 102, 0.2);
        }
        .btn-login {
            border: 0;
            border-radius: 10px;
            background: linear-gradient(90deg, #6f4e37, #8b5e3f);
            color: #fff;
            font-weight: 600;
            padding: 0.62rem 0.8rem;
        }
        .btn-login:hover {
            background: linear-gradient(90deg, #634531, #7e5539);
            color: #fff;
        }
        .quote-box {
            margin-top: 14px;
            padding: 12px;
            border-radius: 12px;
            background: #fff8f1;
            border: 1px solid #f4dcc5;
        }
        .quote-line {
            margin: 0 0 6px;
            color: #8a5b3f;
            font-size: 0.88rem;
        }
        .quote-line:last-child {
            margin-bottom: 0;
        }
    </style>
</head>

<body>
<div class="floating-layer">
    <span class="float-icon i1">🧁</span>
    <span class="float-icon i2">🍰</span>
    <span class="float-icon i3">🥐</span>
    <span class="float-icon i4">🍪</span>
    <span class="float-icon i5">🎂</span>
    <span class="float-icon i6">🥖</span>
    <span class="float-icon i7">🧁</span>
    <span class="float-icon i8">🍰</span>
</div>

<div class="container login-wrap d-flex align-items-center justify-content-center">
    <div class="row justify-content-center w-100">
        <div class="col-md-5 col-lg-4">
            <div class="card login-card">
                <div class="card-body p-4 p-md-5">
                    <h3 class="text-center mb-4 brand-title">🧁 Admin Login</h3>
                    <p class="brand-sub">Bakery Order Management Portal</p>

                    <% if (request.getParameter("error") != null) { %>
                        <div class="alert alert-danger">
                            Invalid username or password
                        </div>
                    <% } %>

                    <form action="login" method="post">
                        <input type="text" name="username" class="form-control mb-3" placeholder="Username" required>
                        <input type="password" name="password" class="form-control mb-3" placeholder="Password" required>
                        <button type="submit" class="btn btn-login w-100">Login</button>
                    </form>

                    <div class="quote-box">
                        <p class="quote-line">Freshly baked, freshly served.</p>
                        <p class="quote-line">Sweetness in every slice.</p>
                        <p class="quote-line">Bake with love.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
