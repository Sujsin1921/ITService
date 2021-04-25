<%-- 
    Document   : index
    Created on : 13 Dec, 2020, 1:20:48 PM
    Author     : sujsi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="CSS.css" type="text/css">
        <script src="https://kit.fontawesome.com/yourcode.js"></script>

        <title>IT Services</title>
    </head>

    <body>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
                integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
                integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>

        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03"
                        aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand" href="#">IT Services</a>
                <%
                    if (session.getAttribute("client") == null) {
                        response.sendRedirect("index.jsp");
                    }
                %>
                <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                        <li class="nav-item active">
                            <a class="nav-item nav-link active" href="#">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-item nav-link" href="#services">Services</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-item nav-link " href="#">Buy</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-item nav-link" href="#Contact">Contact</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-item nav-link " href="#Status">Check Status</a>
                        </li>

                    </ul>
                    <!-- right button-->
                    <a href="clientlogout" class="nav-link nav-item text-dark navbar-nav mt-2 mt-lg-0 ">logout</a>
                </div>
            </nav>

            <div class="header-section">
                <div class="writearea">
                    <h2>Welcome to IT service</h2>
                    <p>For Any Type of Computer services just Click the below button and register for it OR
                        call OR Mail</p>
                    <button type="button " class="btn button " data-toggle="modal"
                            data-target="#exampleModal">Book your Service</button>
                </div>
            </div>
        </header>

        <!-- modal-->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Appointment For Repairing</h5>
                        <button type="button closebutton" class="close" data-dismiss="modal" aria-label="Close">
                            <p class="closebutton">+</p>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="order">
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Device</label>
                                <select class="form-control" name="Device">

                                    <option>Desktop</option>
                                    <option>Laptop</option>
                                    <option>Mac</option>
                                </select>
                                <!--<input type="text" class="form-control" id="recipient-name" name="Device">-->
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Brand</label>
                                <select class="form-control" name="brand">
                                    <option>Dell</option>
                                    <option>HP</option>
                                    <option>Lenovo</option>
                                    <option>Apple</option>
                                    <option>Asus</option>
                                    <option>Assembled</option>
                                    <option>Other</option>
                                </select>
                                <!--<textarea class="form-control" id="message-text" name="brand"></textarea>-->
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Problem</label>
                                <select class="form-control" name="Problem">
                                    <option>PC/Laptop service</option>
                                    <option>Data Recovery</option>
                                    <option>Network issue</option>
                                    <option>Windows + basic s/f installation</option>
                                    <option>Accessory and anti-virus</option>
                                    <option>Other</option>
                                </select>                               
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Description</label>
                                <textarea class="form-control" id="message-text" name="Description"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Name</label>
                                <input type="text" class="form-control" id="recipient-name" name="name">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Address</label>
                                <textarea class="form-control" id="message-text" name="Address"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Contact No.</label>
                                <input type="text" class="form-control" id="recipient-name" name="Contact">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Email ID</label>
                                <input type="text" class="form-control" id="recipient-name" name="email">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Time of Consultation</label>
                                <select class="form-control" name="timetocontact">
                                    <option>Today</option>
                                    <option>Tomorrow</option>
                                    <option>week Ends</option>                                    
                                    <option>Any Time</option>
                                </select>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary float-right" data-dismiss="modal">Close</button>
                                <input type="submit" class="btn btn-primary float-right" name="submit" value="Submit">
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>

        <!-- About US
        <a href="#" name="About"></a>
        <div class="container ">
            <div class="section-header">
             <h2 class="section-title">
                 About US
             </h2><span>About</span>
             <p class="section-subtitle">
                 Check Status of your Appointment request here
             </p>
         </div>
            <div class="aboutus">
                <div class="persolnal">
                    <h2>Welcome to IT service</h2>
                    <p class="centertext">For Any Type of Computer services just Click the below button and register for it
                        OR call OR Mail</p>
                    <button type="button " class="btn bg-info centeritem" data-toggle="modal"
                        data-target="#exampleModal">Service</button>
                    <div class="writearea">
                        <p>Mobile No: <b>8850168041</b> (whatsapp no.)<br>&emsp;&emsp;&emsp;&emsp;&emsp;9987903361</p>
                        <p>Email ID: <b>sujsin1922@gmail.com</b></p>
                    </div>
                </div>
            </div>
        </div>-->
        <!--Our Services -->
        <a href="#" name="services"></a>
        <div class="section">
            <div class="container">
                <div class="section-header">
                    <h2 class="section-title">
                        Our Services
                    </h2><span>Services</span>
                    <p class="section-subtitle">
                        All type of Laptop/Desktop/Mac services are Provided
                    </p>
                </div>

                <div class="pad-head">
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-xs-12">
                        <div class="item-boxes services-item wow fadeInDown animated border " data-wow-delay="0.2s"
                             style="visibility: visible;-webkit-animation-delay: 0.2s; -moz-animation-delay: 0.2s; animation-delay: 0.2s;">
                            <div class="icon color-1">
                                <img src="res/laptop.png" alt="not loaded" class="im">
                            </div>
                            <h4>Any Brand Laptop Repair including Apple</h4>
                            <p>
                                <span>Click below button for service</span>
                            </p>
                            <button type="button" class="btn bg-info" data-toggle="modal"
                                    data-target="#exampleModal">Book your Service</button>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-xs-12">
                        <div class="item-boxes services-item wow fadeInDown animated" data-wow-delay="0.2s"
                             style="visibility: visible;-webkit-animation-delay: 0.2s; -moz-animation-delay: 0.2s; animation-delay: 0.2s;">
                            <div class="icon color-1">
                                <img src="res/desktop.jpg" alt="not loaded" class="im">
                            </div>
                            <h4>Laptop/Desktop software Issue</h4>
                            <p>
                                <span>Click below button for service</span>
                            </p>
                            <button type="button" class="btn bg-info" data-toggle="modal"
                                    data-target="#exampleModal">Book your Service</button>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-xs-12">
                        <div class="item-boxes services-item wow fadeInDown animated" data-wow-delay="0.2s"
                             style="visibility: visible;-webkit-animation-delay: 0.2s; -moz-animation-delay: 0.2s; animation-delay: 0.2s;">
                            <div class="icon color-1">
                                <img src="res/software.jpg" alt="not loaded" class="im">
                            </div>
                            <h4>All Basic Software plus Driver & Windows Installation</h4>
                            <p>
                                <span>Click below button for service</span>
                            </p>
                            <button type="button" class="btn bg-info" data-toggle="modal"
                                    data-target="#exampleModal">Book your Service</button>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-xs-12">
                        <div class="item-boxes services-item wow fadeInDown animated" data-wow-delay="0.2s"
                             style="visibility: visible;-webkit-animation-delay: 0.2s; -moz-animation-delay: 0.2s; animation-delay: 0.2s;">
                            <div class="icon color-1">
                                <img src="res/network.png" alt="not loaded" class="im">
                            </div>
                            <h4>Network solution</h4>
                            <p>
                                <span>Click below button for service</span>
                            </p>
                            <button type="button" class="btn bg-info" data-toggle="modal"
                                    data-target="#exampleModal">Book your Service</button>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-xs-12">
                        <div class="item-boxes services-item wow fadeInDown animated" data-wow-delay="0.2s"
                             style="visibility: visible;-webkit-animation-delay: 0.2s; -moz-animation-delay: 0.2s; animation-delay: 0.2s;">
                            <div class="icon color-1">
                                <img src="res/Asse-1.png" alt="not loaded" class="im">
                            </div>
                            <h4>Accessores And Anti-Virus</h4>
                            <p>
                                <span>Click below button for service</span>
                            </p>
                            <button type="button" class="btn bg-info" data-toggle="modal"
                                    data-target="#exampleModal">Book your Service</button>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-xs-12">
                        <div class="item-boxes services-item wow fadeInDown animated" data-wow-delay="0.2s"
                             style="visibility: visible;-webkit-animation-delay: 0.2s; -moz-animation-delay: 0.2s; animation-delay: 0.2s;">
                            <div class="icon color-1">
                                <img src="res/remote.png" alt="not loaded" class="im">
                            </div>
                            <h4>Remotely PC Solution </h4>
                            <p>
                                <span>Click below button for service</span>
                            </p>
                            <button type="button" class="btn bg-info" data-toggle="modal"
                                    data-target="#exampleModal">Book your Service</button>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-xs-12">
                        <div class="item-boxes services-item wow fadeInDown animated" data-wow-delay="0.2s"
                             style="visibility: visible;-webkit-animation-delay: 0.2s; -moz-animation-delay: 0.2s; animation-delay: 0.2s;">
                            <div class="icon color-1">
                                <img src="res/Assembling.png" alt="not loaded" class="im">
                            </div>
                            <h4>PC Assembling </h4>
                            <p>
                                <span>Click below button for service</span>
                            </p>
                            <button type="button" class="btn bg-info" data-toggle="modal"
                                    data-target="#exampleModal">Book your Service</button>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-xs-12">
                        <div class="item-boxes services-item wow fadeInDown animated" data-wow-delay="0.2s"
                             style="visibility: visible;-webkit-animation-delay: 0.2s; -moz-animation-delay: 0.2s; animation-delay: 0.2s;">
                            <div class="icon color-1">
                                <img src="res/recovery.png" alt="not loaded" class="im">
                            </div>
                            <h4>Data Recovery </h4>
                            <p>
                                <span>Click below button for service</span>
                            </p>
                            <button type="button" class="btn bg-info" data-toggle="modal"
                                    data-target="#exampleModal">Book your Service</button>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-xs-12">
                        <div class="item-boxes services-item wow fadeInDown animated" data-wow-delay="0.2s"
                             style="visibility: visible;-webkit-animation-delay: 0.2s; -moz-animation-delay: 0.2s; animation-delay: 0.2s;">
                            <div class="icon color-1">
                                <img src="res/pc.jpg" alt="not loaded" class="im">
                            </div>
                            <h4>Any Other Issue </h4>
                            <p>
                                <span>Click below button for service</span>
                            </p>
                            <button type="button" class="btn bg-info" data-toggle="modal"
                                    data-target="#exampleModal">Book your Service</button>
                        </div>
                    </div>




                </div>
            </div>
        </div>


        <!--Contact section  -->
        <a href="#" name="Contact"></a>
        <div id="subscribe" class="section">
            <div class=".container-fluid">
                <div class="section-header">
                    <h2 class="section-title">
                        Get In Touch
                    </h2><span>Contact</span>
                    <p class="section-subtitle">
                        For any Quaries please Contact us.
                    </p>
                </div>
                <div class="back">
                    <div class="row justify-content-between " style="background: url('bg.jpg') no-repeat; padding: 30px;">
                        <div class="col-lg-5 col-md-12 col-xs-12" style="margin: 0 auto;">
                            <div class="subscribe-form contact-form-width">

                                <div class="form-wrapper">
                                    <div class="sub-title text-center">
                                        <h3>Contact Us</h3>
                                        <p>Write the details below and we will be back within 2 hours</p>
                                    </div>
                                    <form>
                                        <div class="row">
                                            <div class="col-12 form-line">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" name="email" placeholder="Name">
                                                </div>
                                            </div>
                                            <div class="col-md-12 form-line">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" name="phone"
                                                           placeholder="Phone">
                                                </div>
                                            </div>
                                            <div class="col-12 form-line">
                                                <div class="form-group">
                                                    <input type="email" class="form-control" name="email"
                                                           placeholder="Email">
                                                </div>
                                            </div>
                                            <div class="col-12 form-line">
                                                <div class="form-group">
                                                    <textarea class="form-control" name="comment"
                                                              placeholder="Comment"></textarea>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-submit">
                                                    <button type="button"
                                                            class="btn btn-outline-danger btn-block btns">Send</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Check Status-->

        <a href="#" name="Status"></a>
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">
                    Check Status
                </h2><span>Status</span>
                <p class="section-subtitle">
                    Check Status of your Appointment request here
                </p>
            </div>
            <form method="post" action="Status">
                <div class="form-group">
                    <label for="recipient-name" class="col-form-label"> Enter your Application ID number</label>
                    <input type="text" class="form-control" id="recipient-name" name="applicationid">
                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-primary" value="submit">
                </div>
            </form>
        </div>



        <!-- admin login box-->


        <div class="modal fade" id="loginmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Admin Login</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="admincontrol" method="post">
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">User ID:</label>
                                <input type="text" class="form-control" id="recipient-name" name="userid">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Password</label>
                                <input type="Password" class="form-control" name="password">

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <input type="submit" class="btn btn-primary" value="submit">
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>

        <!-- Agent Login-->
        <div class="modal fade" id="loginmodal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Buddy Login</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="agentControl" method="post">
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">User ID:</label>
                                <input type="text" class="form-control" id="recipient-name" name="userid">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Password</label>
                                <input type="Password" class="form-control" name="password">

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <input type="submit" class="btn btn-primary" value="submit">
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>

        <!-- footer area-->
        <footer class="footer mt-auto py-3 bg-light">
            <div class="container foot">
                <div class="foot-card">
                    <h3>Reach Out To US</h3>
                    <p><strong>Address: </strong> Aadhishakti Nagar, Ghansoli, Navi Mumbain-400701</p>
                    <p><strong>Mobile No:</strong> 8850168041/9987295644</p>
                    <p><strong>Email ID:</strong> sujsin1921@gmail.com</p>
                </div>
                <div class="foot-card">
                    <h3>Catch On</h3>
                    <p> Follow us on below Social Networking sites</p>
                    <a class="insta" target="_blank" href="https://www.instagram.com/invites/contact/?i=13zhm8ofz26te&utm_content=1w33s1j"><i class="fab fa-instagram"></i> Instagram</a>
                    <a class="facebook" target="_blank" href="https://www.facebook.com/people/Sujeet-Singh/100008964828775"><i class="fab fa-facebook-f"></i> facebook</a>

                </div>
                <div class="foot-card">
                    <h3>Sign in </h3>
                    <p>
                        <a href="#" class=" nav-link nav-item text-dark navbar-nav mt-2 mt-lg-0" data-toggle="modal"
                           data-target="#loginmodal">AdminLogin</a>
                        <a href="#" class=" nav-link nav-item text-dark navbar-nav mt-2 mt-lg-0" data-toggle="modal"
                           data-target="#loginmodal2">BuddyLogin</a>
                    </p>


                </div>
                <!--old version
                <span class="text-muted">&copy;copyright </span>
                <a href="#" class="float-right nav-link nav-item text-dark navbar-nav mt-2 mt-lg-0" data-toggle="modal"
                    data-target="#loginmodal">AdminLogin</a>
                <a href="#" class="float-right nav-link nav-item text-dark navbar-nav mt-2 mt-lg-0" data-toggle="modal"
                    data-target="#loginmodal2">AgentLogin</a>-->
            </div>
        </footer>
         <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
                integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
                integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
        <script>
            <%
                String varify = request.getParameter("a");
            %>
            var a =<%= varify%>;

            if (a == false) {
                alert("Please check userID and Password");
            }
        </script>
    </body>

</html>