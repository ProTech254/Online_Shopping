<!DOCTYPE HTML>
<%@page import="java.sql.*"%>
<%@page import="database.*"%>
<%@page import="java.util.*" %>
<%@page import="Add_To_Cart.*" %>
<%@page import="Admin.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Clothes 4 Men</title>
        
        <%@include file="includesPage/_stylesheets.jsp" %>

        <link rel="stylesheet" href="css/slider.css"  />

        <script type="text/javascript" src="js/jquery.js"></script>

        <script type="text/javascript" src="js/slider.js"></script>


        <script type="text/javascript" >

            // This is the script for the banner slider

            $(document).ready(function() {
                $('#slider').s3Slider({
                    timeOut: 6000
                });
            });
        </script>



        <script type="text/javascript" src="js/myScript.js"></script>

    </head>
    <body>

        <%

            if (session.getAttribute("user") == null) {
                Cookie[] ck = request.getCookies();
                if (ck != null) {

                    String lid = null;
                    String type = null;

                    for (Cookie c : ck) {
                        if (c.getName().equals("lid")) {
                            lid = String.valueOf(c.getValue());
                            //      out.println(lid);
                        }
                        if (c.getName().equals("type")) {
                            type = String.valueOf(c.getValue());
                            //        out.println(type);
                        }
                    }
                    if (lid != null) {
                        HashMap<Integer, Cart> hm = new HashMap<Integer, Cart>();
                        HttpSession usersession = request.getSession();

                        if (type.equals("private")) {

                            usersession.setAttribute("user", Integer.parseInt(lid));
                            usersession.setAttribute("admin", Integer.parseInt(lid));
                            usersession.setAttribute("Cart",(HashMap<Integer,Cart>)hm);
                            new top_10_thread(getServletContext()).start();
                            

                        } else if (type.equals("public")) {
                            usersession.setAttribute("user", Integer.parseInt(lid));
                            usersession.setAttribute("Cart",(HashMap<Integer,Cart>)hm);
                        } else {
                            usersession.setAttribute("user", Integer.parseInt(lid));
                            usersession.setAttribute("dealer", Integer.parseInt(lid));
                            usersession.setAttribute("Cart",(HashMap<Integer,Cart>)hm);
                        }
                        usersession.setAttribute("back_to_page",request.getContextPath()+"/index.jsp");
                       
                    }

                }
            }

            if (session.getAttribute("user") == null) {// THen new user, show join now
        %>
        <jsp:include page="includesPage/_joinNow.jsp"></jsp:include>
        <%        } else {
        %>
        <jsp:include page="includesPage/_logout.jsp"></jsp:include>
        <%            }
        %>


        <%@include file="includesPage/_search_navigationbar.jsp" %>

        <%@include file="includesPage/_facebookJoin.jsp" %>

        <div id = "banner">
            <div class="container_16">
                <div class="grid_16" style="padding-left: 20px; " id="slider">	
                    <ul id="sliderContent">		
                        <!-- Duplicate this code for each image -->				

                        <li class="sliderImage" style="display: none; ">

                            <img src="images/banner/1.jpg" width="900" height="300" /> 

                            <span class="top" style="display: none; ">

                                <strong>Black Men's Coats...</strong>	

                                <br>From the International and Indian markets, we have the variety of the High Class suits 

                               . Available now for you to get your hands on.

                            </span>

                        </li>  
                        <li class="sliderImage" style="display: none; ">

                            <img src="images/banner/b2.png" width="900" height="300" /> 

                            <span class="top" style="display: none; ">

                                <strong>Trousers, Shorts...</strong>				

                                <br>Fashion and style have been a major cultural preoccupation
                                since man first admired  himself in the skin of woolly mammoth whilst 
                                gazing at his reflection in the primordial swamp* 
                                
                            </span>

                        </li>  



                        <li class="sliderImage" style="display: none; ">

                            <img src="images/banner/b5.png" width="900" height="300" /> 

                            <span class="top" style="display: none; ">

                                <strong>Style and Individuality...</strong>				

                                <br>Clothes make man. Naked people have little or no influence on the society 

                            </span>

                        </li>  

                        <li class="sliderImage" style="display: none; ">

                            <img src="images/banner/b7.jpg" width="900" height="300" /> 

                            <span class="top" style="display: none; ">

                                <strong>Art of Dressing Well...</strong>				

                                <br>Mens's  Fashions all start as sports clothes and progress to 
                                the great occasions of state of state.             </span>

                        </li>   



                        <li class="sliderImage" style="display: none; ">

                            <img src="images/banner/b6.png" width="900" height="300" /> 

                            <span class="top" style="display: none; ">

                                <strong>Color World...</strong>				

                                <br>A vast variety of different sets of colors including trousers,

                                shirst, office shirt Colors, Acrylic Colors and many more...

                            </span>

                        </li>   




                        <li class="sliderImage" style="display: none; ">

                            <img src="images/banner/b3.PNG" width="900" height="300" /> 

                            <span class="top" style="display: none; ">

                                <strong>Dress Toolkit...</strong>				

                                <br>To achieve the nonchalance which is absolutely necessary
                                
                                for a man ,One article at least must not match...

                            </span>

                        </li>



                        <li class="sliderImage" style="display: none; ">

                            <img src="images/banner/b4.png" width="900" height="300" /> 

                            <span class="top" style="display: none; ">

                                <strong>Dress Toolkit...</strong>				

                                <br>To achieve the nonchalance which is absolutely necessary
                                
                                for a man ,One article at least must not match...

                            </span>

                        </li>








                        <div class="clear sliderImage"></div>  

                    </ul>
                </div>
            </div>
        </div>



        <div class="container_16">
            <div id = "contents">
                <!-- LeftSide -->


                <%
                    Database_connection obj_connection = new Database_connection();
                    Connection c = obj_connection.cnn;
                    Statement st = c.createStatement(); // some Changes Here
                    String getCategory = "select c_id,c_name from tbl_category where status = 'true'";

                    ResultSet rs = st.executeQuery(getCategory);

                %>
                <div id="leftside" class="grid_3">
                    <div>
                        <ul id="leftsideNav">
                            <li><a href="index.jsp"><strong>Home</strong></a></li>

                            <%
                                while (rs.next()) {
                                    int cid = rs.getInt(1);
                                    String category = rs.getString(2);
                                    if(category.equals("Special Offer")){ } else{

                            %>
                            <li><a href="viewProducts.jsp?id=<%= cid%>&c_name=<%= category%>"><strong><%= category%></strong></a></li>
                            <%
                                                          } }
                            %>

                        </ul>
                    </div>



                    <div class="adv">
                        <img src="images/banner/24-hours-website-design-delivery.png" width="150" height="150" />  
                    </div>
                </div>
            </div>

            <!-- Middle -->
            <div id="middle"class="grid_13">

                <%@include file="includesPage/mainHeaders/topMostViewedProducts_4.jsp" %>

            </div>
            <!--The Middle Content Div Closing -->
        </div>
        <!--The Center Content Div Closing -->

        <jsp:include page="includesPage/_footer.jsp"></jsp:include>

    </body>
</html>



