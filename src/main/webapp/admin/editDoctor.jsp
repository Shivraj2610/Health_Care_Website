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
        
       
    
      <h1 class="form-title">Edit Doctor Information</h1>
       <%
        	int id=Integer.parseInt(request.getParameter("id"));
        	DoctorDao dao=new DoctorDao(DBconn.jdbcConn());
        	Doctor d=dao.getDoctorById(id);
        %>
        
        
        
      <form action="../updateDoctor" method="post">
      <input type="hidden" name="id" value="<%=d.getId() %>">
        <div class="main-user-info">
          <div class="user-input-box">
            <label for="fullName">Full Name</label>
            <input
              type="text"
              id="fullName"
              name="fullName"
              placeholder="Enter Full Name"
              value="<%=d.getFullName() %>"
            />
          </div>
          <div class="user-input-box">
            <label for="Qualification">Qualification</label>
            <input
              type="text"
              id="Qualification"
              name="Qualification"
              placeholder="Enter Qualification"
              value="<%=d.getQualification() %>"
            />
          </div>
          <div class="user-input-box">
            <label for="email">Email</label>
            <input
              type="email"
              id="email"
              name="email"
              placeholder="Enter Email"
              value="<%=d.getEmail() %>"
            />
          </div>
          <div class="user-input-box">
            <label for="phoneNumber">Phone Number</label>
            <input
              type="text"
              id="phoneNumber"
              name="phoneNumber"
              placeholder="Enter Phone Number"
              value="<%=d.getMobNo() %>"
            />
          </div>
          <div class="user-input-box">
            <label for="password">Password</label>
            <input
              type="text"
              id="password"
              name="password"
              placeholder="Enter Password"
              value="<%=d.getPassword() %>"
            />
          </div>
          <div class="user-input-box">
           
            <label for="birthday">Birthday:</label>
            <input type="date" id="birthday" name="birthday" value="<%=d.getDob() %>"/>
            
          </div>
          <div class="user-input-box">
            <label for="specialization">Choose Your Specialization</label>
            <select name="specialization" id="specialization">
              <option value="Orthopedist"><%=d.getSpecialist() %></option>
              
              <%SpecialistDao dao1=new SpecialistDao(DBconn.jdbcConn());
            		
            		List<Specialist> list =dao1.getAllSpecialist();
            		
            		for(Specialist s:list){%>
            			<option><%=s.getSpecialistName()%></option>
            		<%}
            		%>
              
            </select>
          </div>
          
          
        </div>
        <div class="form-submit-btn">
          <input type="submit" value="Update" class="btn" style="color:white; background-color:#184399">
        </div>
      </form>
      
    </div>
    
    
  
  </body>
</html>
