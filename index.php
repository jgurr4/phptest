<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>login</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
    </style>
</head>
<body>
<div id="stage">
</div>
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
    <p id="getLogin" style="color:blue">Back to Login</p>
</form>

<form id="login">
    <input type="text" id="username" placeholder="username">
    <input type="text" id="passwordCheck" placeholder="password">
    <input type="button" id="loginDriver" value="login">
    <p id="getCreateAcct" style="color:blue; cursor:pointer">Create Account</p>
    <p id="getResetPass" style="color:blue; cursor:pointer">Forgot Password</p>
</form>

<form id="forgotPass" style="display:none">
    <input type="text" id="usernameCheck" placeholder="username">
    <input type="text" id="emailCheck" placeholder="email">
    <input type="button" id="passResetDriver" value="submit">
    <p id="getLogin" style="color:blue; cursor:pointer">Back to Login</p>
</form>

<script type="text/javascript" language="JavaScript">
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