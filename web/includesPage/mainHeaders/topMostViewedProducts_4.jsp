<%-- 
    Document   : topMostViewedProducts
    Created on : 10 Dec, 2021, 6:45:53 PM
    Author     : ProTech Corporation
--%>

<%@page import="database.*"%>
<%@page import="java.util.Locale.Category"%>
<%@page import="java.sql.*"%>
<style type="text/css">
    .prodGrid {
        margin: 10px;
        margin-right: -12px;
        margin-left: 36px;
    }
</style>


<div class="grid_13" id="productStrip"> 

    <div class="ProductHeading">
        <div class="grid_12">
            <h2 class="heading"><center>special offer today</center></h2>
        </div>
    </div>


    <div class="clear"></div>

    <%
        {
            
              Database_connection  obj_cnn = new Database_connection();
              Connection cnn = obj_cnn.cnn;
              Statement st1 = cnn.createStatement(); // Here One Changes Awailable please Check The Prodcut
            String query = "select * from tbl_product";
            ResultSet rs1 = st1.executeQuery(query);
            while (rs1.next()) 
        //    for(int i=0;i<4;i++)
            {

            int pid = rs1.getInt(1);
            String name = rs1.getString(3);
            String company = rs1.getString(10);
            String catagory = rs1.getString(7);
            String imagename = rs1.getString(9);
            String desc= rs1.getString(4);
            int price = rs1.getInt(5);
            int qty = rs1.getInt(7); 
            int old_price = rs1.getInt(6);
            
    %>


    <div id="productList" class="grid_3 prodGrid"> 
        <a target="_blank" href="product.jsp?id=<%= pid%>"><img src="<%= imagename%>" /></a>
        <p id="info">
            <span class="red"><%= name%></span><br/>
            <%= catagory%><br/>
            Available Quantity : <strong><span class="red"><%= qty %></span></strong> <br/> 
            <strong><font color="black" class="under_line"> Old $. <%= old_price %></font></strong><br>
            <strong><span class="red">Now $. <%= price%></span></strong>
        </p>
        <% if (qty > 0) {%>
        <a href="Add_to_cart.jsp?pid=<%= pid%>&qty=1"><ul id="greenBtn"  class ="Btn" style="padding:10px 35px"><strong>Add To Cart</strong></ul></a>
        <% } else {%>
        <a href="#"><ul id="greenBtn"  class ="Btn" style="padding:10px 30px"><strong><font color="#f90606">Out Of Stock</font></strong></ul></a>
                    <% }%>
    </div>

    <% }
        }%>

</div>