<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <link rel="stylesheet" href="signup.css">
</head>
<body>
    <div class="bgimg">
        <div class="container">
            <div class="leftBox">
                <h1 class="left">DocApp</h1>
                <h2 class="left">Registration Form</h2>
            </div>
        
            <form action="SignupServlet" method="post">
                <div class="input">
                    <label class="label">Name</label><input type="text" placeholder="Enter name">
                </div>

                <div class="input">
                    <label class="label">email</label><input type="email" placeholder="Enter email">
                </div>

                <div class="input">
                    <label class="label">mobile</label><input type="text" placeholder="Enter mobile">
                </div>

                <div class="input">
                    <label class="label">password</label><input type="text" placeholder="Enter password">
                </div>
                
                <div class="input submit">
                	<button class="btn">Submit</button>
                </div>
               
            </form>
        </div>
    </div>
</body>
</html>