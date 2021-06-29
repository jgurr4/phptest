<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>login</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div id="stage">
</div>
<div id="login">
    <input type="text" id="username" placeholder="username">
    <input type="password" id="passwordCheck" placeholder="password">
    <input type="button" id="loginDriver" value="login">
    <p id="getCreateAcct" class="link">Create Account</p>
    <p id="getResetPass" class="link">Forgot Password</p>
</div>

<div id="createAccount" style="display:none">
<input type="text" id="name" class="input" placeholder="name">
<br>
<input type="text" id="uid" class="input" placeholder="Username">
<br>
<input type="password" id="password" class="input" placeholder="password">
<br>
<input type="text" id="email" class="input" placeholder="E-mail">
<br>
<input type="text" id="phone" class="input" placeholder="phone number(optional)">
<br>
<input type="button" id="newAcctDriver" value="signup">
    <p id="getLogin" class="link">Back to Login</p>
</div>

<div id="forgotPass" style="display:none">
    <input type="text" id="usernameCheck" placeholder="username">
    <input type="text" id="emailCheck" placeholder="email">
    <input type="button" id="passResetDriver" value="submit">
    <p id="passGetLogin" class="link">Back to Login</p>
</div>

<script type="text/javascript" language="JavaScript">
    // This checks for cookies. If a user has logged in before, then a cookie should exist and this will redirect them.
    $(document).ready(function () {
        let decodedCookie = decodeURIComponent(document.cookie);
        if (decodedCookie.search("username") > -1) {
            $(window).attr('location', '/main.php');
        }

    // This function checks to see if user exists in table, then if successful will take user to the main page.
        $("#loginDriver").click(function (event) {
            let uname = $("#username").val();
            let pass = $("#passwordCheck").val();
            $("#stage").load('/mysqlLogin.php', {
                "uname": uname,
                "pass": pass,
            }, function () {  // Complete function runs as soon as .load completes. It checks if login successful and if so, redirects user.
                if ($("#loginResult").html() === 'success') {
                    let curDate = new Date();
                    curDate.setDate(curDate.getDate() + 1);
                    let date = curDate.toUTCString();
                    document.cookie = "username=" + uname + "; expires=" + date + "; path=/";
                    $(window).attr('location','/main.php');
                } else {
                    $(".input").val(''); // clears the text inside each input text box.
                }
            });
        });

    // This function creates a new user in table after user hits the submit button on the createAccount form.
        $("#newAcctDriver").click(function (event) {
            let name = $("#name").val();
            let uid = $("#uid").val();
            let password = $("#password").val();
            let email = $("#email").val();
            let phone = $("#phone").val();
            $("#stage").load('/mysqliInsertUser.php', {
                "name": name,
                "uid": uid,
                "password": password,
                "email": email,
                "phone": phone
            });
            $(".input").val(''); // clears the text inside each input text box.
        });

    // This function checks to see if email/password combo exists in table, then if successful will allow user to reset their password.
        $("#passResetDriver").click(function (event) {
            let uname = $("#usernameCheck").val();
            let email = $("#emailCheck").val();
            $("#stage").load('/mysqlResetPass.php', {
                "uname": uname,
                "email": email,
            });
            $(".input").val(''); // clears the text inside each input text box.
        });

    // This function closes login form and opens the createAccount form.
        $("#getCreateAcct").click(function(){
            $("#login").toggle();
            $("#createAccount").toggle();
        });

    // This function closes the createAccount form and opens the login form.
        $("#getLogin").click(function(){
            $("#login").toggle();
            $("#createAccount").toggle();
        });

    // This function closes the login form and opens the forgot password form.
        $("#getResetPass").click(function(){
            $("#login").toggle();
            $("#forgotPass").toggle();
        });

    // This function closes the forgotPassword form and opens the login form.
        $("#passGetLogin").click(function(){
            $("#login").toggle();
            $("#forgotPass").toggle();
        });
    });

</script>

</body>
</html>