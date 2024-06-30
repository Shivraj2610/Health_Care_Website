<%@ page import="com.dao.SpecialistDao, com.dao.AppointmentDao, com.db.DBconn, com.entity.Specialist,com.entity.Doctor, com.entity.Appointment, java.util.List, com.dao.DoctorDao, com.entity.Doctor" %>
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
    <link rel="stylesheet" href="admin2.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
    
</head>
<body>
	<c:if test="${empty doctorObj}">
        <p class="error">${doctorObj}</p>
        <c:redirect url="../Login/doct_login.jsp"></c:redirect>
    </c:if>
        	
        	
        	
    <header class="header">
        <img src="../images/logo.png" id="logo" alt="">

        <nav class="navbar">
            <a href="#">Home</a>
            <a href="paitent.jsp">Patient</a>
        </nav>

        <div class="icons">
            <a href="../doctorLogout">logout</a>
        </div>
    </header>
    
    
        	
        	<%
        		Doctor d=(Doctor)session.getAttribute("doctorObj");
        		DoctorDao dao=new DoctorDao(DBconn.jdbcConn());
        		
        	%>

    <div class="container">
        <h1 style="text-align: center; margin: 30px; font-family: sans-serif; text-shadow: 1px 2px gray;">Doctor Dashboard</h1>

        <div class="cards">
            <div class="part">
                <div class="card">
                    
                    <h3>Doctor</h3>
                    <h3 class="count"><%=dao.countDoctor() %></h3>
                </div>
    
                        </div>

            <div class="part">
                <div class="card">
                   
                    <h3>Total Appointment</h3>
                    <h3 class="count"><%=dao.countAppointmentByDoctorId(d.getId()) %></h3>
                </div>
  
            </div>
        </div>
    </div>
</body>
</html>