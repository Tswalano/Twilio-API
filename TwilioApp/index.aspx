<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="TwilioApp.index" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Twilio App</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <%--    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">--%>
</head>
<body>
    <!-- A grey horizontal navbar that becomes vertical on small screens -->
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="/">Twilio API</a>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#">Link 1</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link 2</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link 3</a>
                </li>
            </ul>
        </div>
    </nav>


    <div class="container">
        <div class="row">
            <div class="align-self-center">
                <div class="py-5 text-center">
                    <img class="d-block mx-auto" src="https://panoply.io/images/integration-logos/twilio.svg" alt="" width="72" height="72">
                    <h2>Twillo API</h2>
                    <p class="lead">Simple Appliaction preview of how you can expand your business by allowing users to order products online and recive the order via WhatsApp Acount</p>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="list"></div>

                <h4 class="d-flex justify-content-between align-items-center mb-3">
                    <span class="text-muted">List Of Ingridients</span>
                </h4>

                <ul class="list-group mb-3" id="orderList" runat="server">
                </ul>

            </div>

            <div class="col-md-6">
                <div class="divs">
                    <div class="mb-2 cls1 active">
                        <h4 class="text-center text-capitalize" id="0">Menu 1</h4>
                        <img src="https://fakeimg.pl/782x300/?text=Image" class="img-fluid" alt="Responsive image">
                    </div>
                    <div class="mb-2 cls1 active">
                        <h4 class="text-center text-capitalize" id="1">Menu 2</h4>
                        <img src="https://fakeimg.pl/782x300/?text=Image" class="img-fluid" alt="Responsive image">
                    </div>
                    <div class="mb-2 cls1 active">
                        <h4 class="text-center text-capitalize" id="2">Menu 3</h4>
                        <img src="https://fakeimg.pl/782x300/?text=Image" class="img-fluid" alt="Responsive image">
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <button type="button" class="btn btn-success float-left" id="next"><i class="fa fa-chevron-left" aria-hidden="true"></i></button>
                    </div>
                    <div class="col-md-4">
                        <div class="row">
                            <div class="col-sm-12 text-center">
                                <button type="button" class="btn btn-success center-block" id="btnOrder"><i class="fa fa-shopping-cart" aria-hidden="true"></i>Order</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <button type="button" class="btn btn-success float-right" id="prev"><i class="fa fa-chevron-right" aria-hidden="true"></i></button>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <script>
        $(document).ready(function () {

            var userOrder = [];

            var message = '- NEW ORDER RECIEVED -' +
                            'Oredr Name: Oreder Name ' +
                            '-- INGRIDIENTS --' +
                            ' LIST THEM HERE';

            var selected, x;
            var myObj = {
                "shop_name": "John's Shop",
                "menu": [
                    {
                        "image": "",
                        "name": "Bunny Chow",
                        "ingredients": ["Achar", "Chips", "Cheese", "Polony"]
                    },
                    {
                        "image": "",
                        "name": "Fish & Chips",
                        "ingredients": ["Bread", "Chips", "Cheese", "Polony"]
                    },
                    {
                        "image": "",
                        "name": "Pap & Salad",
                        "ingredients": ["Pap", "Chips", "Tomato Salad", "Quater Chicken"]
                    }
                ]
            };

            function showMenu() {
                $(".list-group").empty();
                selected = $(".active > h4").attr("id");
                var idx = parseInt(selected);
                x = myObj.menu[idx].name;
                //$("#txtNumber").val(x); //Set Input values
                $(".active > h4").text(x);

                //Loop through the ingrediebnts 
                for (j in myObj.menu[idx].ingredients) {
                    x = myObj.menu[idx].ingredients[j];

                    $("")

                    var item = '<li class="list-group-item d-flex justify-content-between lh-condensed">' +
                        '<div><h6 class="my-0">' + x + '</h6></div>' +
                        '<span class="text-muted"><i class="fa fa-trash" aria-hidden="true"></i></span></li>'

                    $(".list-group").append(item);
                }
            }

            showMenu();

            $(".divs div").each(function (e) {
                if (e != 0) {
                    $(this).hide();
                    $(this).removeClass('active');
                }

            });

            $("#next").click(function () {
                if ($(".divs div:visible").next().length != 0) {
                    $(".divs div:visible").next().show().addClass('active').prev().hide().removeClass('active');
                } else {
                    $(".divs div:visible").hide();
                    $(".divs div:first").show()
                }
                showMenu();
                return false;

            });

            $("#prev").click(function () {
                if ($(".divs div:visible").prev().length != 0) {
                    $(".divs div:visible").prev().show().addClass('active').next().hide().removeClass('active');
                } else {
                    $(".divs div:visible").hide();
                    $(".divs div:last").show();
                }
                showMenu();
                return false;
            });

            

            //SEND AN ORDER TO TWILIO
            $("#btnOrder").click(function () {
                var indx = 0;

                $("ul.list-group > li").each(function (index) {
                    indx = index + 1;
                    userOrder.push($(this).text());
                    console.log(userOrder);
                });

                $.ajax({
                    type: 'POST',
                    url: 'index.aspx/GetUserOrder',
                    data: "{'menu':'" + userOrder + "', 'orderName':'" + $('.active h4').text() + "'}",
                    //data: "json=" + JSON.stringify(data),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'JSON',

                    success: function (data) {
                        alert("Thank You! Your order was recieved");
                    }
                });

            });

        });
    </script>

</body>
</html>
