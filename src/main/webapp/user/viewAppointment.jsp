<%@ page import="com.dao.SpecialistDao, com.dao.AppointmentDao, com.db.DBconn, com.entity.Specialist,com.entity.User, com.entity.Appointment, java.util.List, com.dao.DoctorDao, com.entity.Doctor" %>
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

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
</head>
<body>
    <div class="col-md-12">
     	<div class="card point-card">
     		<div class="card-body">
     			<p class="fs-3 text-center">Appointment List</p>
     			
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
     						<th scope="col">Gender</th>
     						<th scope="col">Age</th>
     						<th scope="col">Appoint Date</th>
     						<th scope="col">Diseases</th>
     						<th scope="col">Doctor Name</th>
     						<th scope="col">Status</th>
     					</tr>
     				</thead>
     				<tbody>
     				
     					<%
     						User user= (User) session.getAttribute("userObj");
     						AppointmentDao dao=new AppointmentDao(DBconn.jdbcConn());
     						DoctorDao dao2=new DoctorDao(DBconn.jdbcConn());
     						List<Appointment> list=dao.getAllAppointmentByLoginUser(user.getId());
     						
     						for(Appointment ap:list){
     							Doctor d=dao2.getDoctorById(ap.getDocId());
     						%>
     							
     							<tr>
     								<td><%=ap.getFullName() %></td>
			                        <td><%=ap.getGender() %></td>
			                        <td><%=ap.getAge() %></td>
			                        <td><%=ap.getAppoinDate() %></td>
			                        <td><%=ap.getDiseases() %></td>		 
			                        <td><%=d.getFullName() %></td>
			                        <td><%
			                        	if("pending".equals(ap.getStatus())){%>
			                        		<a href="#" class="btn btn-sm btn-warning">Pending</a>
			                        	<%}else{%>
			                        		<%=ap.getStatus() %>
			                        	<%}
			                        %></td>		
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