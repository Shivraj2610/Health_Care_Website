<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@page isELIgnored="false" %>

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
        	<c:if test="${not empty suc}">
        		<p>${suc}</p>
        		<c:remove var="suc" scope="session"/>
        	</c:if>
        	<c:if test="${not empty fail}">
        		<p>${fail}</p>
        		<c:remove var="fail" scope="session"/>
        	</c:if>
        	
        
            <div class="leftBox">
                <h1 class="left">DocApp</h1>
                <h2 class="left">Registration Form</h2>
            </div>
        
            <form action="user_register" method="post">
                <div class="input">
                    <label class="label">Name</label><input type="text" placeholder="Enter name" name="name" required>
                </div>

                <div class="input">
                    <label class="label">email</label><input type="email" placeholder="Enter email" name="email" required>
                </div>

                <div class="input">
                    <label class="label">mobile</label><input type="text" placeholder="Enter mobile" name="mobile" required>
                </div>

                <div class="input">
                    <label class="label">password</label><input type="text" placeholder="Enter password" name="password" required>
                </div>
                
                <div class="input submit">
                	<button class="btn">Submit</button>
                </div>
               
            </form>
        </div>
    </div>
</body>
</html>