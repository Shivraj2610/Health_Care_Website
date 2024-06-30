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
	<c:if test="${empty adminObj}">
        <p class="error">${adminObj}</p>
        <c:redirect url="../admin_login.jsp"></c:redirect>
    </c:if>
        	
        	
        	
    <header class="header">
        <img src="../images/logo.png" id="logo" alt="">

        <nav class="navbar">
            <a href="#">Home</a>
            <a href="doctor.jsp">Doctor</a>
            <a href="patient.jsp">Patient</a>
        </nav>

        <div class="icons">
            <a href="../adminLogout">logout</a>
        </div>
    </header>
    
    <c:if test="${not empty succMsg}">
        		<p class="succMsg">${succMsg}</p>
        		<c:remove var="succMsg" scope="session"/>
        	</c:if>
        	
        	<c:if test="${not empty errorMsg}">
        		<p class="errorMsg">${errorMsg}</p>
        		<c:remove var="errorMsg" scope="session"/>
        	</c:if>
        	
        	<%
        		DoctorDao dao=new DoctorDao(DBconn.jdbcConn());
        		
        	%>

    <div class="container">
        <h1 style="text-align: center; margin: 30px; font-family: sans-serif; text-shadow: 1px 2px gray;">Admin Dashboard</h1>

        <div class="cards">
            <div class="part">
                <div class="card">
                    
                    <h3>Doctor</h3>
                    <h3 class="count"><%=dao.countDoctor() %></h3>
                </div>
    
                <div class="card">
                    
                    <h3>User</h3>
                    <h3 class="count"><%=dao.countUser() %></h3>
                </div>
            </div>

            <div class="part">
                <div class="card">
                   
                    <h3>Total Appointment</h3>
                    <h3 class="count"><%=dao.countAppointment() %></h3>
                </div>

                <div class="card" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    
                    <h3>Specialist</h3>
                    <h3 class="count"><%=dao.countSpecialist() %></h3>
                </div>
                
                <!-- Button trigger modal -->
		
		
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        <form action="../addSpecialist" method="post">
				        	<div class="form-group">
				        		<label>Enter Specialist Name</label>
				        		<input type="text" name="specName" class="form-control">
				        	</div>
				        	
				        	<div class="text-center mt-3">
				        		<button type="submit" class="btn btn-primary">Add</button>
				        	</div>
				        </form>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				        <button type="button" class="btn btn-primary">Save changes</button>
				      </div>
				    </div>
				  </div>
				</div>
                
            </div>
        </div>
    </div>
</body>
</html>