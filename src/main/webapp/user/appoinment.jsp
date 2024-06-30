<%@ page import="com.dao.SpecialistDao, com.db.DBconn, com.entity.Specialist, java.util.List, com.dao.DoctorDao, com.entity.Doctor" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>

	<c:if test="${empty userObj}">
        		<p class="error">${userObj}</p>
        		<c:redirect url="../Login/user_login.jsp"></c:redirect>
        	</c:if>
        	
	 <div class="container">
	 
	 	

        <div class="imgblock">
            <img src="doc.png" alt="doctor img">
        </div>

        <div class="formblock">
            <h1>User Appointment</h1>
            
            <c:if test="${not empty succMsg}">
        		<p class="error">${succMsg}</p>
        		<c:remove var="succMsg" scope="session"/>
        	</c:if>
        
	        <c:if test="${not empty errMsg}">
	        	<p class="error">${errMsg}</p>
	        	<c:remove var="errMsg" scope="session"/>
	        </c:if>
        
        <form action="../appointment" method="post">
        	<input type="hidden" name="userId" value="${userObj.id }" >
            <div class="line">
                <div class="done">
                    <label>Full Name</label></br>
                    <input type="text" name="fullName" class="input" required>
                </div>
                <div class="done">
                    <label for="gender">Gender</label></br>
                    <select name="gender" id="gender" class="input" required>
                        <option value="male">male</option>
                        <option value="female">female</option>
                        <option value="other">other</option>
                    </select>
                </div>
            </div>
    
            <div class="line">
                <div class="done">
                    <label for="age">Age</label></br>
                    <input type="text" name="age" class="input" required>
                </div>
                <div class="done">
                    <label for="appointmentDAte">Appointment date</label></br>
                    <input type="date" name="appoDate" class="input" required>
                </div>
            </div>
            <div class="line">
                <div class="done">
                    <label>Email</label></br>
                    <input type="email" name="email" class="input" required>
                </div>
                <div>
                    <label>Phone No.</label></br>
                    <input type="text" name="phNo" class="input" required>
                </div>
            </div>
            <div class="line">
                <div class="done">
                    <label>Diseases</label></br>
                    <input type="text" name="diseases" class="input" required>
                </div>
                <div>
                    <label>Doctor</label></br>
                    <select name="docId" id="doctor" class="input" required>
                        <option value="">--select--</option>
                        
                        <%DoctorDao dao=new DoctorDao(DBconn.jdbcConn());
                    		List<Doctor> list=dao.getAllDoct();
                    		
                    		for(Doctor d: list){%>
                    			<option value="<%=d.getId() %>"><%=d.getFullName()%>(<%=d.getSpecialist() %>)</option>
                    			
                    		<%}
                    		%>
                        
                                            </select>
                </div>
            </div>
            <input type="submit" value="Submit" class="submit">
        </form>
        </div>

    </div> 
</body>
</html>