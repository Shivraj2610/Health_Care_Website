<%@ page import="java.sql.Connection"%>
<%@ page import="com.db.DBconn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
   <%@include file="component/allcss.jsp" %>
</head>
<body>
    
 <%@include file="component/header.jsp" %>

   <% Connection conn=DBconn.jdbcConn(); %>

    <div class="background-image">
        <div class="background-content">
            <h1>provide an exceptional <br> patient experience</h1>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Necessit<br>atibus reiciendis eos saepe vitae quibusdam corrupti ip<br> ipsa asperiores reprehenderit </p>
            <a href="#">Read more</a>
        </div>
    </div>

    <div class="about" id="aboutUs">
        <div class="main-about">
            <div class="inner-about">
                <div class="about-content">
                    <h1>about us</h1>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quas, consequuntur harum beatae inventore voluptatem numquam voluptatibus fuga, cupiditate cumque porro perferendis tempora, adipisci culpa odio molestias dolorem blanditiis quos ad!</p>
                <a href="#">Read more</a>
                </div>
                
            </div>
            <div class="inner-about">
                <div class="inner-about-image">
                    <img src="images/chiness.jpg" alt="">
                </div>
            </div>
        </div>
    </div>

    <div class="our-services" id="ourServices">
        <div class="service-content">
            <div class="left-service-content">
                <h1>Our special services</h1>
                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Veritatis animi similique perspiciatis, impedit blanditiis itaque consequuntur laboriosam ipsa asperiores?</p>
            </div>

            <div class="right-service-content">
                <div class="right-btn">
                    <a href="#">See all services</a>
                </div>
            </div>
        </div>

        <div class="main-services">
            <div class="inner-services-content">
                <div class="service-icon">
                    <i class="fas fa-notes-medical"></i>
                </div>
                <h2>health care</h2>
                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Cum corporis impedit nam quaerat vitae incidunt aspernatur, conseq</p>

            </div>

            <div class="inner-services-content">
                <div class="service-icon">
                    <i class="fas fa-hospital-user"></i>
                </div>
                <h2>health care</h2>
                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Cum corporis impedit nam quaerat vitae incidunt aspernatur, conseq</p>
                
            </div>

            <div class="inner-services-content">
                <div class="service-icon">
                    <i class="fas fa-user-md"></i>
                </div>
                <h2>health care</h2>
                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Cum corporis impedit nam quaerat vitae incidunt aspernatur, conseq</p>
                
            </div>
        </div>
    </div>


    <div class="gallery">
        <h1>Gallery</h1>
        <div class="main-gallery">
            <div class="inner-gallery">
                <img src="images/gal1.jpg" alt="">
            </div>

            <div class="inner-gallery">
                <img src="images/gal2.jpg" alt="">
            </div>

            <div class="inner-gallery">
                <img src="images/gal3.jpg" alt="">
            </div>

            <div class="inner-gallery">
                <img src="images/gal4.jpg" alt="">
            </div>

            <div class="inner-gallery">
                <img src="images/gal5.jpg" alt="">
            </div>

            <div class="inner-gallery">
                <img src="images/gal6.jpg" alt="">
            </div>
        </div>
    </div>
    

    <div class="why-choseus">
    <div class="main-chose">
        <div class="inner-chose">
            <img src="images/cute.jpg" alt="">
        </div>

        <div class="inner-chose">
            <h1>why chose us </h1>

            <div class="inner-chose-content">
                <div class="main-inner-chose">
                    <div class="chose-icon">
                        <i class="fas fa-notes-medical"></i>
                    </div>
                    <div class="icon-content">
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae error explicabo possimus fugit fuga inventore tenetur natus, </p>
                    </div>
                </div>

                <div class="main-inner-chose">
                    <div class="chose-icon">
                        <i class="fas fa-hospital-user"></i>
                        
                    </div>
                    <div class="icon-content">
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae error explicabo possimus fugit fuga inventore tenetur natus, </p>
                    </div>
                </div>

                <div class="main-inner-chose">
                    <div class="chose-icon">
                        <i class="fas fa-user-md"></i>
                    </div>
                    <div class="icon-content">
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae error explicabo possimus fugit fuga inventore tenetur natus, </p>
                    </div>
                </div>
            </div>
            

        </div>
    </div>
</div>



<div class="our-doctors">
    <h1>Our special doctors</h1>

    <div class="main-doctor">
        <div class="inner-doctor">
            <img src="images/gal3.jpg" alt="">
            <div class="doc-icons">
                <div class="fab fa-facebook"></div>
                <div class="fab fa-twitter"></div>
                <div class="fab fa-instagram"></div>
                <div class="fab fa-linkedin"></div>
            </div>
        </div>

        <div class="inner-doctor">
            <img src="images/gal2.jpg" alt="">
            <div class="doc-icons">
                <div class="fab fa-facebook"></div>
                <div class="fab fa-twitter"></div>
                <div class="fab fa-instagram"></div>
                <div class="fab fa-linkedin"></div>
            </div>
        </div>

        <div class="inner-doctor">
            <img src="images/gal5.jpg" alt="">
            <div class="doc-icons">
                <div class="fab fa-facebook"></div>
                <div class="fab fa-twitter"></div>
                <div class="fab fa-instagram"></div>
                <div class="fab fa-linkedin"></div>
            </div>
        </div>

        
    </div>
</div>



</body>
</html>





<!-- provide an exceptional patient experience
<i class="fas fa-notes-medical"></i>
<i class="fas fa-hospital-user"></i>
<i class="fas fa-user-md"></i>
-->