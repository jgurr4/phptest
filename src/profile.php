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
<h3>Welcome to your profile page!</h3>
<p>Click <b id="backToMain" class="link">here</b> to be taken back to main page.</p>

<script>
    $(document).ready(function () {
        $("#backToMain").click(function (event) {
            $(window).attr('location', '/main.php')
        })
    })
</script>

</body>
</html>
