<%-- 
    Document   : header.jsp
    Created on : Oct 22, 2017, 12:22:34 AM
    Author     : ducdat
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--header-->
<div class="header">
        <div class="top-header navbar navbar-default"><!--header-one-->
                <div class="container">
                        <div class="nav navbar-nav wow fadeInLeft animated" data-wow-delay=".5s">
                        <%if(session.getAttribute("MEM_FLG")== "1" || session.getAttribute("register")=="success")
                            {
                        %><p>Welcome to Zen's Coffee<a href="/QLCF/Auth/detail_user.jsp"><%=session.getAttribute("USERNAME")%></a> Bonus: <%=session.getAttribute("PLUS")%> Point: <%=session.getAttribute("POINT")%> , <a href="/QLCF/Auth/logout.jsp">Logout</a></p><%
                            }else
                            {
                        %><p>Welcome to Zen's Coffee <a href="/QLCF/Auth/register.jsp">Register </a> Or <a href="/QLCF/Auth/Login.jsp">Sign In </a></p><% }
                        %>
			</div>
                        <div class="nav navbar-nav navbar-right social-icons wow fadeInRight animated" data-wow-delay=".5s">
                                <ul>
                                        <li><a href="#"> </a></li>
                                        <li><a href="#" class="pin"> </a></li>
                                        <li><a href="#" class="in"> </a></li>
                                        <li><a href="#" class="be"> </a></li>
                                        <li><a href="#" class="you"> </a></li>
                                        <li><a href="#" class="vimeo"> </a></li>
                                </ul>
                        </div>
                        <div class="clearfix"> </div>
                </div>
        </div>
        <div class="header-two navbar navbar-default"><!--header-two-->
                <div class="container">
                        <div class="nav navbar-nav header-two-left">
                                <ul>
                                        <li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>+84167 711 6797</li>
                                        <li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="mailto:zencoffee@gmail.com">zencoffee@gmail.com</a></li>			
                                </ul>
                        </div>
                        <div class="nav navbar-nav logo wow zoomIn animated" data-wow-delay=".7s">
                                <h1><a href="/QLCF/index.jsp">Zen's <b>Coffee</b><span class="tag">Coffee for passion </span> </a></h1>
                        </div>
                        <div class="nav navbar-nav navbar-right header-two-right">
                                <div class="header-right my-account">
                                        <a href="/QLCF/Infor/contact.jsp"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> CONTACT US</a>						
                                </div>
                                <div class="header-right cart">
                                        <h4><a href="/QLCF/checkout/cart.jsp">
                                                <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
                                                <span class="Cart_total"> $0.00 </span> 
                                                (<span id="Cart_quantity" class="Cart_quantity">
                                                    <%if(session.getAttribute("sum_cart") != null){
                                                        out.println(session.getAttribute("sum_cart"));
                                                    }else{
                                                        out.println("0");
                                                    }
                                                    %>                    
                                                </span>) 
                                        </a></h4>
                                        <div class="cart-box">
                                                <a href="#" class="Cart_empty">Empty cart</a>
                                                <div class="clearfix"> </div>
                                        </div>
                                </div>
                                <div class="clearfix"> </div>
                        </div>
                        <div class="clearfix"> </div>
                </div>
        </div>
        <div class="top-nav navbar navbar-default"><!--header-three-->
                <div class="container">
                        <nav class="navbar" role="navigation">
                                <div class="navbar-header">
                                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                                <span class="sr-only">Toggle navigation</span>
                                                <span class="icon-bar"></span>
                                                <span class="icon-bar"></span>
                                                <span class="icon-bar"></span>
                                        </button>
                                </div>
                                <!--navbar-header-->
                                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                        <ul class="nav navbar-nav top-nav-info">
                                                <li><a href="/QLCF/index.jsp">Home</a></li>
                                                <li class="dropdown">
                                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Coffee <b class="caret"></b></a>
                                                        <ul class="dropdown-menu multi-column multi-column1">
                                                                <div class="row">
                                                                        <div class="col-sm-4 menu-grids menulist1">
                                                                                <h4>Hot drink</h4>
                                                                                <ul class="multi-column-dropdown ">
                                                                                        <li><a class="list" href="products.html">Diapering</a></li>
                                                                                        <li><a class="list" href="products.html">Baby Wipes</a></li>
                                                                                        <li><a class="list" href="products.html">Baby Soaps</a></li>
                                                                                        <li><a class="list" href="products.html">Lotions & Oils </a></li>
                                                                                        <li><a class="list" href="products.html">Powders</a></li>
                                                                                        <li><a class="list" href="products.html">Shampoos</a></li>
                                                                                </ul>
                                                                                <ul class="multi-column-dropdown">
                                                                                        <li><a class="list" href="products.html">Body Wash</a></li>
                                                                                        <li><a class="list" href="products.html">Cloth Diapers</a></li>
                                                                                        <li><a class="list" href="products.html">Baby Nappies</a></li>
                                                                                        <li><a class="list" href="products.html">Medical Care</a></li>
                                                                                        <li><a class="list" href="products.html">Grooming</a></li>
                                                                                        <li><h6><a class="list" href="products.html">Combo Packs</a></h6></li>
                                                                                </ul>
                                                                        </div>																		
                                                                        <div class="col-sm-2 menu-grids">
                                                                                <h4>Cold drink</h4>
                                                                                <ul class="multi-column-dropdown">
                                                                                        <li><a class="list" href="products.html">Onesies & Rompers</a></li>
                                                                                        <li><a class="list" href="products.html">Frocks</a></li>
                                                                                        <li><a class="list" href="products.html">Socks & Tights</a></li>
                                                                                        <li><a class="list" href="products.html">Sweaters & Caps</a></li>
                                                                                        <li><a class="list" href="products.html">Night Wear</a></li>
                                                                                        <li><a class="list" href="products.html">Quilts & Wraps</a></li>
                                                                                </ul>
                                                                        </div>
                                                                        <div class="col-sm-3 menu-grids">
                                                                                <ul class="multi-column-dropdown">
                                                                                        <li><a class="list" href="products.html">Blankets</a></li>
                                                                                        <li><a class="list" href="products.html">Gloves & Mittens</a></li>
                                                                                        <h4>Shop by Age</h4>
                                                                                        <li><a class="list" href="products.html">New Born (0 - 5 M)</a></li>
                                                                                        <li><a class="list" href="products.html">5 - 10 Months</a></li>
                                                                                        <li><a class="list" href="products.html">10 - 15 Months</a></li>
                                                                                        <li><a class="list" href="products.html">15 Months Above</a></li>
                                                                                </ul>
                                                                        </div>
                                                                        <div class="col-sm-3 menu-grids">
                                                                                <ul class="multi-column-dropdown">
                                                                                        <li><h6><a class="list" href="products.html">Feeding & Nursing</a></h6></li>
                                                                                        <h4>Baby Gear</h4>
                                                                                        <li><a class="list" href="products.html">Baby Walkers</a></li>
                                                                                        <li><a class="list" href="products.html">Strollers</a></li>
                                                                                        <li><a class="list" href="products.html">Prams & Toys</a></li>
                                                                                        <li><a class="list" href="products.html">Cribs & Cradles</a></li>
                                                                                        <li><a class="list" href="products.html">Booster Seats</a></li>
                                                                                </ul>
                                                                        </div>
                                                                        <div class="clearfix"> </div>
                                                                </div>
                                                        </ul>
                                                </li>
                                                <li class="dropdown grid">
                                                        <a href="#" class="dropdown-toggle list1" data-toggle="dropdown">Tea <b class="caret"></b></a>
                                                        <ul class="dropdown-menu multi-column multi-column2">
                                                                <div class="row">
                                                                        <div class="col-sm-3 menu-grids">
                                                                                <h4>Tea</h4>
                                                                                <ul class="multi-column-dropdown">
                                                                                        <li><a class="list" href="products.html">Topwear</a></li>
                                                                                        <li><a class="list" href="products.html">Bottomwear</a></li>
                                                                                        <li><a class="list" href="products.html">Innerwear</a></li>
                                                                                        <li><a class="list" href="products.html">Nightwear</a></li>
                                                                                        <li><a class="list" href="products.html">Swimwear</a></li>
                                                                                        <li><a class="list" href="products.html">Jumpers</a></li>
                                                                                </ul>
                                                                        </div>																		
                                                                        <div class="col-sm-3 menu-grids">
                                                                                <h4>Milk Tea</h4>
                                                                                <ul class="multi-column-dropdown">
                                                                                        <li><a class="list" href="products.html">Jeans</a></li>
                                                                                        <li><a class="list" href="products.html">Shirts</a></li>
                                                                                        <li><a class="list" href="products.html">T-shirts</a></li>
                                                                                        <li><a class="list" href="products.html">Dhoti Kurta Sets</a></li>
                                                                                        <li><a class="list" href="products.html">Winter wear</a></li>
                                                                                        <li><a class="list" href="products.html">Party Wear</a></li>
                                                                                </ul>
                                                                        </div>
                                                                        <div class="col-sm-3 menu-grids">
                                                                                <h4>Combo</h4>
                                                                                <ul class="multi-column-dropdown">
                                                                                        <li><a class="list" href="products.html">Tops</a></li>
                                                                                        <li><a class="list" href="products.html">Leggings</a></li>
                                                                                        <li><a class="list" href="products.html">Dresses </a></li>
                                                                                        <li><a class="list" href="products.html">Skirts</a></li>
                                                                                        <li><a class="list" href="products.html">Casual Dresses</a></li>
                                                                                        <li><a class="list" href="products.html">Capris & 3/4ths</a></li>
                                                                                </ul>
                                                                        </div>
                                                                        <div class="col-sm-3 menu-grids new-add2">
                                                                                <a href="products.html">
                                                                                        <h6>Kids Special</h6>
                                                                                        <img src="images/img1.jpg" alt="">
                                                                                </a>
                                                                        </div>
                                                                        <div class="clearfix"> </div>
                                                                </div>
                                                        </ul>
                                                </li>
                                                <li class="dropdown grid">
                                                        <a href="#" class="dropdown-toggle list1" data-toggle="dropdown">Cake&snacks<b class="caret"></b></a>
                                                        <ul class="dropdown-menu multi-column menu-two multi-column3">
                                                                <div class="row">
                                                                        <div class="col-sm-4 menu-grids">
                                                                                <ul class="multi-column-dropdown">
                                                                                        <li><a class="list" href="products.html">Jewellery</a></li>
                                                                                        <li><a class="list" href="products.html">Hair bands & Clips</a></li>
                                                                                        <li><a class="list" href="products.html">Bangles </a></li>
                                                                                        <li><a class="list" href="products.html">Caps & Belts</a></li>
                                                                                        <li><a class="list" href="products.html">Rain wear</a></li>
                                                                                        <li><a class="list" href="products.html">Bags</a></li>
                                                                                </ul>
                                                                        </div>
                                                                        <div class="col-sm-8 menu-grids">
                                                                                <a href="products.html">
                                                                                        <div class="new-add">
                                                                                                <h5>30% OFF <br> Today Only</h5>
                                                                                        </div>	
                                                                                </a>
                                                                        </div>	
                                                                        <div class="clearfix"> </div>
                                                                </div>	
                                                        </ul>
                                                </li>				
                                                <li class="dropdown grid">
                                                        <a href="/QLCF/Auth/buy_point.jsp">Buy point</a>
                                                </li>
                                                <li><a href="/QLCF/product/menu.jsp">All menu</a></li>
                                        </ul> 
                                        <div class="clearfix"> </div>
                                        <!--//navbar-collapse-->
                                        <header class="cd-main-header">
                                                <ul class="cd-header-buttons">
                                                        <li><a class="cd-search-trigger" href="#cd-search"> <span></span></a></li>
                                                </ul> <!-- cd-header-buttons -->
                                        </header>
                                </div>
                                <!--//navbar-header-->
                        </nav>
                        <div id="cd-search" class="cd-search">
                                <form>
                                        <input type="search" placeholder="Search...">
                                </form>
                        </div>
                </div>
        </div>
</div>
<!--//header-->
