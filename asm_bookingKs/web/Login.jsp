<%-- 
    Document   : Login
    Created on : Jun 10, 2024, 8:42:47 PM
    Author     : TNO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: Arial, sans-serif;
            }

            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #f5f5f5;
            }

            .login-container {
                background-color: #ffffff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                width: 300px;
                text-align: center;
            }

            h2 {
                margin-bottom: 20px;
                color: #333333;
            }

            .input-group {
                margin-bottom: 15px;
                text-align: left;
            }

            label {
                display: block;
                margin-bottom: 5px;
                color: #555555;
            }

            input {
                width: 100%;
                padding: 10px;
                border: 1px solid #dddddd;
                border-radius: 4px;
            }

            button {
                width: 100%;
                padding: 10px;
                background-color: #007BFF;
                border: none;
                border-radius: 4px;
                color: #ffffff;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            button:hover {
                background-color: #0056b3;
            }
        </style>

    </head>
    <body>
        <div class="login-container">
            <h2>Login</h2>
            <div style="color: red">${msg}</div>
            <form action="login" method="post">
                <div class="input-group">
                    <label for="email">User name</label>
                    <input id="username" name="username" required>
                </div>
                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <button type="submit">Login</button>
            </form>
        </div>
    </body>
</html>
