<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form</title>

   <%@include file="../component/allcss.jsp" %>
   
</head>
<body>
    
    <div class="bgImg">
        <div class="content">
            <header>User Login</header>
            <c:if test="${not empty error}">
        		<p class="error">${error}</p>
        		<c:remove var="error" scope="session"/>
        	</c:if>
        	<c:if test="${not empty logout}">
        		<p class="error">${logout}</p>
        		<c:remove var="logout" scope="session"/>
        	</c:if>
        	
            <form action="../userlogin" method="post">
                <div class="field">
                    <span class="fa fa-user"></span>
                    <input type="text" placeholder="Email" name="email" required>
                </div>
                <div class="field space">
                    <span class="fa fa-lock"></span>
                    <input type="password" class="password" placeholder="Password" name="password" required>
                    <span class="showpass">SHOW</span>
                </div>

                <div class="pass">
                    <a href="#">Forgot Password</a>
                </div>
                
                <div class="field">
                    <input type="submit" value="LOGIN">
                </div>

                <div class="login">Or login with</div>

                <div class="link">
                    <div class="facebook">
                        <i class="fab fa-facebook-f"><span>Facebook</span></i>
                    </div>

                    <div class="instagram">
                        <i class="fab fa-instagram"><span>Instagram</span></i>
                    </div>
                </div>

                <div class="signup">Don't have account?
                    <a href="../user_signup.jsp">Signup Now</a>
                </div>
            </form>
        </div>
    </div>


    <script src="index.js"></script>
    <!-- <script src="https://kit.fontawesome.com/a076d05399.js"></script> -->

</body>
</html>