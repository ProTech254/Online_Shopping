
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title> Clothes 4 Men Stores </title>
        <link rel="shortcut icon" href="images/logo/ico.ico"/>

        <link rel="stylesheet" type="text/css" href="css/reset.css"/>
        <link rel="stylesheet" type="text/css" href="css/text.css"/>
        <link rel="stylesheet" type="text/css" href="css/960_16.css"/>
        <link rel="stylesheet" type="text/css" href="css/styles.css"/>
        <link rel="stylesheet" type="text/css" href="css/product.css"  />

        <link rel="stylesheet" type="text/css" href="css/lightbox.css"  />

        <script src="js/jquery-1.7.2.min.js"></script>
        <script src="js/lightbox.js"></script>

    </head>
    <body>

         


        <div class="container_16">
            <div id="whiteBox" class="grid_16">

                <div style="padding: 10px;" class="grid_7 push_5 BigRed" >
                    <h1>
                        <% out.print(request.getAttribute("message"));%>
                    </h1>

                        <%  if(request.getAttribute("message1")!=null) { %>
                        
                        <% out.print(request.getAttribute("message1"));%>
                        
                        <% } %>
                            
                    
                    
                </div>
            </div>
        </div>

        
        <jsp:include page="index.jsp"></jsp:include>
    </body>
</html>
