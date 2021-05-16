<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>login</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
        .link {
            color: blue;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div id="stage">
</div>
<form id="login">
    <input type="text" id="username" placeholder="username">
    <input type="text" id="passwordCheck" placeholder="password">
    <input type="button" id="loginDriver" value="login">
    <p id="getCreateAcct" class="link">Create Account</p>
    <p id="getResetPass" class="link">Forgot Password</p>
</form>

<form id="createAccount" style="display:none">
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
</form>

<form id="forgotPass" style="display:none">
    <input type="text" id="usernameCheck" placeholder="username">
    <input type="text" id="emailCheck" placeholder="email">
    <input type="button" id="passResetDriver" value="submit">
    <p id="passGetLogin" class="link">Back to Login</p>
</form>

<script type="text/javascript" language="JavaScript">
    // This function checks to see if user exists in table, then if successful will take user to the main page.

    // This function closes login form and opens the createAccount form.
    $(document).ready(function(){
        $("#getCreateAcct").click(function(){
            $("#login").toggle();
            $("#createAccount").toggle();
        });
    });

    // This function closes the createAccount form and opens the login form.
    $(document).ready(function(){
        $("#getLogin").click(function(){
            $("#login").toggle();
            $("#createAccount").toggle();
        });
    });

    // This function closes the login form and opens the forgot password form.
    $(document).ready(function(){
        $("#getResetPass").click(function(){
            $("#login").toggle();
            $("#forgotPass").toggle();
        });
    });

    // This function closes the forgotPassword form and opens the login form.
    $(document).ready(function(){
        $("#passGetLogin").click(function(){
            $("#login").toggle();
            $("#forgotPass").toggle();
        });
    });

    // This function creates a new user in table after user hits the submit button on the createAccount form.
    $(document).ready(function () {
        $("#driver").click(function (event) {
            let name = $("#name").val();
            let uid = $("#uid").val();
            let password = $("#password").val();
            let email = $("#email").val();
            let phone = $("#phone").val();
            $("#stage").load('/mysql.php', {
                "name": name,
                "uid": uid,
                "password": password,
                "email": email,
                "phone": phone
            });
            $(".input").val(''); // clears the text inside each input text box.
        });
    });
</script>

</body>
</html>