<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>{$title|default:"Sell-IT"}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/png" href="{$BASE_URL}resources/logo/favicon.png"/>
    <!-- Bootstrap/Jquery CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
    <!-- Bootstrap/Jquery JS -->
    <script src="https://npmcdn.com/tether@1.2.4/dist/js/tether.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
    <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="{$BASE_URL}css/header.css">
    <link rel="stylesheet" type="text/css" href="{$BASE_URL}css/footer.css">
    <link rel="stylesheet" type="text/css" href="{$BASE_URL}css/notFound.css">
    <link rel="stylesheet" type="text/css" href="{$BASE_URL}css/login_reg.css">
    <!-- Custom JS -->
    <script> BASE_URL = "{$BASE_URL}" </script>
    <script> PRIMAVERA_IP = "{$PRIMAVERA_IP}" </script>
    <script src="{$BASE_URL}javascript/main.js"></script>
    <script src="{$BASE_URL}javascript/header.js"></script>
    <script src="{$BASE_URL}javascript/login_reg.js"></script>
</head>
<body>
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark" id="header_navbar">
    <div class="container">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main_navbar"
                aria-controls="main_navbar" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="logo navbar-brand" href="{$BASE_URL}"><img src="{$BASE_URL}resources/logo/logo.png"></a>
        <div class="collapse navbar-collapse" id="main_navbar">

            <form class="form-inline my-2 my-lg-1" action="{$BASE_URL}pages/products/search_results.php" method="get">
                <div class="input-group">
                    <input name="query" type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                        <button class="btn btn-secondary" type="submit" id="search_button">
                            <i class="fa fa-search" aria-hidden="true"></i>
                        </button>
                    </span>
                </div>
            </form>

            <div class="header_btn_group">
                {if $USERNAME}
                    {include file='common/menu_logged_in.tpl'}
                {else}
                    {include file='common/menu_logged_out.tpl'}
                {/if}
                <button type="button" class="btn dropdown-toggle" id="my_cart_button">
                    <i class="fa fa-shopping-cart" aria-hidden="true"> </i> My Cart - <span class="my_cart_total">0.00</span>€
                </button>
            </div>

        </div>
    </div>
</nav>
<div class="container" style="height: 90%">
    <div class="container" id="shopping_cart_dropdown">
        <div class="shopping-cart" id="shop_cart">
            <div class="shopping-cart-header">
                <div class="shopping-cart-total">
                    <span class="lighter-text"></span>
                    <span class="main-color-text"></span>
                </div>
            </div>
            <div class="no_products_container">
                <span class="no_products_message">Your cart is empty.</span>
            </div>

            <a class="checkout_btn btn btn-success btn-block" href="{$BASE_URL}pages/users/shoppingCart.php" role="button">
                <i class="fa fa-unlock-alt" aria-hidden="true"></i> Proceed to checkout
            </a>
        </div>
    </div> <!--end shopping-cart -->
</div> <!--end container -->

<div class="modal" id="login-modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" id="login_header">
                <img src="{$BASE_URL}resources/logo/logo.png">
            </div>
            <div class="modal-body" id="login_body">
                <div class="alert alert-danger" role="alert" id="login_error_alert">
                </div>
                <div class="nb-login">
                    <form class="modal_form" id="login_modal_form">
                        <div class="form-group">
                            <input type="text" id="login_username" class="form-control" placeholder="Username/Email" required>
                        </div>
                        <div class="form-group">
                            <input type="password" id="login_password" class="form-control" placeholder="Password" required>
                        </div>
                        <button type="submit" class="btn btn-block">Sign In</button>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <span>Dont have an account?</span>
                <a href="" data-toggle="modal" data-target="#register-modal" data-dismiss="modal"> Register here</a>
            </div>
        </div>
    </div>
</div>
<div class="modal" id="register-modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" id="reg_header">
                <img src="{$BASE_URL}resources/logo/logo.png">
            </div>
            <div class="modal-body" id="reg_body">
                <div class="alert alert-success" role="alert" id="reg_succ_alert">
                    <strong>Well done!</strong> You successfully registered in our website.
                </div>
                <div class="alert alert-danger" role="alert" id="reg_error_alert">
                </div>
                <div class="nb-login">
                    <form class="modal_form" id="reg_modal_form">
                        <div class="dividers">
                            <h6>Account Information</h6>
                        </div>
                        <div class="form-group" id="reg_username">
                            <a data-toggle="popover" data-trigger="hover" data-placement="left" data-content="Username must have only lower case letters or numbers.">
                                <i class="fa fa-exclamation-circle"  aria-hidden="true"></i>
                            </a>
                            <input type="text" class="form-control input_username" name="reg_username" placeholder="Username" required>
                        </div>
                        <div class="form-group" id="reg_password">
                            <a data-toggle="popover" data-trigger="hover" data-placement="left" data-content="Passwords dont match.">
                                <i class="fa fa-exclamation-circle"  aria-hidden="true"></i>
                            </a>
                            <input type="password" class="form-control input_password" name="reg_password" placeholder="Password" required>
                        </div>
                        <div class="form-group" id="reg_password2">
                            <a data-toggle="popover" data-trigger="hover" data-placement="left" data-content="Passwords dont match.">
                                <i class="fa fa-exclamation-circle"  aria-hidden="true"></i>
                            </a>
                            <input type="password" class="form-control input_conf_password" name="reg_password2"
                                   placeholder="Confirm Password" required>
                        </div>
                        <div class="form-group" id="reg_email">
                            <a data-toggle="popover" data-trigger="hover" data-placement="left" data-content="Invalid Email.">
                                <i class="fa fa-exclamation-circle"  aria-hidden="true"></i>
                            </a>
                            <input type="email" class="form-control input_email" name="reg_email" placeholder="Email" required>
                        </div>
                        <div class="dividers">
                            <h6>Personal Information</h6>
                        </div>
                        <div class="form-group" id="reg_name">
                            <a data-toggle="popover" data-trigger="hover" data-placement="left" data-content="Name must contain at least 3 letters.">
                                <i class="fa fa-exclamation-circle"  aria-hidden="true"></i>
                            </a>
                            <input type="text" class="form-control input_name" name="reg_name" placeholder="Name" required>
                        </div>
                        <div class="form-group" id="reg_nif">
                            <a data-toggle="popover" data-trigger="hover" data-placement="left" data-content="NIF must contain 9 digits.">
                                <i class="fa fa-exclamation-circle"  aria-hidden="true"></i>
                            </a>
                            <input type="number" class="form-control input_nif" name="reg_nif" placeholder="NIF" required>
                        </div>
                        <div class="form-group" id="reg_address">
                            <a data-toggle="popover" data-trigger="hover" data-placement="left" data-content="Address must contain at least 5 characters.">
                                <i class="fa fa-exclamation-circle"  aria-hidden="true"></i>
                            </a>
                            <input type="text" class="form-control input_address" name="reg_address" placeholder="Address" required>
                        </div>
                        <div class="form-group" id="reg_town">
                            <a data-toggle="popover" data-trigger="hover" data-placement="left" data-content="Town must contain at least 5 characters.">
                                <i class="fa fa-exclamation-circle"  aria-hidden="true"></i>
                            </a>
                            <input type="text" class="form-control input_town" name="reg_town" placeholder="Town" required>
                        </div>
                        <div class="form-group" id="reg_postal_code">
                            <a data-toggle="popover" data-trigger="hover" data-placement="left" data-content="Postal Code format: 4 digits - 3 digits.">
                                <i class="fa fa-exclamation-circle"  aria-hidden="true"></i>
                            </a>
                            <input class="input_postal_code1" type="number" name="reg_pcode1" placeholder="Postal Code" required> - <input
                                    class="input_postal_code2" type="number" name="reg_pcode2" placeholder="Postal Code" required>
                        </div>
                        <div class="form-group" id="reg_birthday">
                            <a data-toggle="popover" data-trigger="hover" data-placement="left" data-content="You must have at least 18 years.">
                                <i class="fa fa-exclamation-circle"  aria-hidden="true"></i>
                            </a>
                            <span>Birthday Date</span>
                            <input class="form-control input_birthday_date" type="date" name="reg_birthday" value="1999-08-19">
                        </div>

                        <button type="submit" class="btn btn-block">Register</button>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <span>Already have an account?</span>
                <a href="" data-toggle="modal" data-target="#login-modal" data-dismiss="modal"> Sign In </a>
            </div>
        </div>
    </div>
</div>

<div class="page_body">
    <div id="error_messages">
        {foreach $ERROR_MESSAGES as $error}
            <div class="error">{$error}
                <a class="closeError" href="#">X</a>
            </div>
        {/foreach}
    </div>
    <div id="success_messages">
        {foreach $SUCCESS_MESSAGES as $success}
            <div class="success">{$success}
                <a class="closeError" href="#">X</a>
            </div>
        {/foreach}
    </div>