<%@ page import="com.dao.SpecialistDao, com.dao.AppointmentDao, com.db.DBconn, com.entity.Specialist,com.entity.Doctor, com.entity.Appointment, java.util.List, com.dao.DoctorDao, com.entity.Doctor" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comment</title>
    <link rel="stylesheet" href="comment.css">
</head>
<body>

    <form action="../updateStatus" method="post">
        <div class="outer">
        
        <%
        	int id=Integer.parseInt(request.getParameter("id"));
        	AppointmentDao dao=new AppointmentDao(DBconn.jdbcConn());
        	
        	Appointment ap=dao.getAppointmentById(id);
        %>

            <div class="inner">
                <h1>Patient Comment</h1>
    
            <div class="container">
                <div class="row">
                    <div class="field">
                        <label for="">Patient Name</label><br>
                        <input type="text" name="patientName" readonly value="<%=ap.getFullName() %>">
                    </div>
        
                    <div class="field">
                        <label for="">Age</label><br>
                        <input type="text" name="age" readonly value="<%=ap.getAge() %>">
                    </div>
                </div>
    
                <div class="row">
                    <div class="field">
                        <label for="">Mob No.</label><br>
                        <input type="text" name="mobno" readonly value="<%=ap.getPhNo()%>">
                    </div>
        
                    <div class="field">
                        <label for="">Diseases</label><br>
                        <input type="text" name="age" value="<%=ap.getDiseases() %>">
                    </div>
                </div>

            </div>

            <div class="row">
                <label for="comment">Comment</label><br>
                <textarea name="comment" rows="6" cols="80"></textarea>
            </div>
            
            <input type="hidden" name="id" value="<%=ap.getId() %>">
            <input type="hidden" name="doctId" value="<%=ap.getDocId() %>">
            
            <input type="submit" value="submit" class="submin">
            </div>
        </div>
    </form>
    
</body>
</html>