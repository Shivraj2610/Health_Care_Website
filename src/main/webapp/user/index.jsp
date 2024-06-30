<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../admin/admin.css">

</head>
<body>
	
		<c:if test="${empty userObj}">
        		<p class="error">${userObj}</p>
        		<c:redirect url="../Login/user_login.jsp"></c:redirect>
        	</c:if>
        	
        
        <header class="header">
        <img src="../images/logo.png" id="logo" alt="">

        <nav class="navbar">
            <a href="#">Home</a>
            <a href="appoinment.jsp">Appointment</a>
            <a href="viewAppointment.jsp">View Appointment</a>
        </nav>

        <div class="icons">
            <a href="../userlogout">logout</a>
        </div>
    </header>
        
        	   	
        	
</body>
</html>