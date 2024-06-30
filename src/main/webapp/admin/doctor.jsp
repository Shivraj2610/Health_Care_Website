<%@ page import="com.dao.SpecialistDao, com.db.DBconn, com.entity.Specialist, java.util.List, com.dao.DoctorDao, com.entity.Doctor" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>Doctor</title>
    <meta
      name="viewport"
      content="width=device-width,
      initial-scale=1.0"
    />
    <link rel="stylesheet" href="style2.css" />
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
  </head>
  <body>
    <div class="container">
    
    	<c:if test="${not empty succMsg}">
        	<p class="error">${succMsg}</p>
        	<c:remove var="succMsg" scope="session"/>
        </c:if>
        
        <c:if test="${not empty errorMsg}">
        	<p class="error">${errorMsg}</p>
        	<c:remove var="errorMsg" scope="session"/>
        </c:if>
        
        <c:if test="${not empty success}">
        	<p class="error">${success}</p>
        	<c:remove var="success" scope="session"/>
        </c:if>
        
        <c:if test="${not empty error}">
        	<p class="error">${error}</p>
        	<c:remove var="error" scope="session"/>
        </c:if>
    
      <h1 class="form-title">Add Doctor Info.</h1>
      <form action="../addDoctor" method="post">
        <div class="main-user-info">
          <div class="user-input-box">
            <label for="fullName">Full Name</label>
            <input
              type="text"
              id="fullName"
              name="fullName"
              placeholder="Enter Full Name"
            />
          </div>
          <div class="user-input-box">
            <label for="Qualification">Qualification</label>
            <input
              type="text"
              id="Qualification"
              name="Qualification"
              placeholder="Enter Qualification"
            />
          </div>
          <div class="user-input-box">
            <label for="email">Email</label>
            <input
              type="email"
              id="email"
              name="email"
              placeholder="Enter Email"
            />
          </div>
          <div class="user-input-box">
            <label for="phoneNumber">Phone Number</label>
            <input
              type="text"
              id="phoneNumber"
              name="phoneNumber"
              placeholder="Enter Phone Number"
            />
          </div>
          <div class="user-input-box">
            <label for="password">Password</label>
            <input
              type="password"
              id="password"
              name="password"
              placeholder="Enter Password"
            />
          </div>
          <div class="user-input-box">
           
            <label for="birthday">Birthday:</label>
            <input type="date" id="birthday" name="birthday" />
            
          </div>
          <div class="user-input-box">
            <label for="specialization">Choose Your Specialization</label>
            <select name="specialization" id="specialization">
              <option value="Orthopedist">--select--</option>
              
              <%SpecialistDao dao=new SpecialistDao(DBconn.jdbcConn());
            		
            		List<Specialist> list =dao.getAllSpecialist();
            		
            		for(Specialist s:list){%>
            			<option><%=s.getSpecialistName()%></option>
            		<%}
            		%>
              
            </select>
          </div>
        </div>
        
          <input type="submit" value="submit" class="btn" style="color:white; background-color:blue">
        
      </form>
      
    </div>
    
     <div class="col-md-8">
     	<div class="card point-card">
     		<div class="card-body">
     			<p class="fs-3 text-center">Doctor Details</p>
     			
     			<c:if test="${not empty succ}">
        			<p class="error">${succ}</p>
        			<c:remove var="succ" scope="session"/>
        		</c:if>
        
		        <c:if test="${not empty err}">
		        	<p class="error">${err}</p>
		        	<c:remove var="err" scope="session"/>
		        </c:if>
     			
     			<table class="table">
     				<thead>
     					<tr>
     						<th scope="col">Full Name</th>
     						<th scope="col">DoB</th>
     						<th scope="col">Qualification</th>
     						<th scope="col">Specialist</th>
     						<th scope="col">Email</th>
     						<th scope="col">Mobile No</th>
     						<th scope="col">Action</th>
     					</tr>
     				</thead>
     				<tbody>
     				
     					<% DoctorDao dao2=new DoctorDao(DBconn.jdbcConn());
     						List<Doctor> list1=dao2.getAllDoct();
     						
     						for(Doctor d:list1){%>
     							<tr>
     								<td><%= d.getFullName() %></td>
     								<td><%= d.getDob() %></td>
     								<td><%= d.getQualification() %></td>
     								<td><%= d.getSpecialist() %></td>
     								<td><%= d.getEmail() %></td>
     								<td><%= d.getMobNo() %></td>
     								<td>
     									<a href="editDoctor.jsp?id=<%=d.getId() %>" class="btn btn-sm btn-primary">Edit</a>
     									<a href="../deleteDoctor?id=<%=d.getId() %>" class="btn btn-sm btn-danger">Delete</a>
     								</td>
     							</tr>
     						<%}
     					%>
     				
     				</tbody>
     			</table>
     		</div>
     	</div>
      		
      </div>
  </body>
</html>
