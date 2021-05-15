<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>login</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<?php

class Test
{
    const MYSQL_CONN_ERROR = "Unable to connect to database.";

    public function sendMysqli()
    {
        mysqli_report(MYSQLI_REPORT_STRICT | MYSQLI_REPORT_ERROR);
        $dbhost = 'p:192.168.1.53';
        $dbuser = 'root';
        $dbpass = 'super03';
        $dbdatabase = 'phptest';
        return new mysqli($dbhost, $dbuser, $dbpass, $dbdatabase, 3306);
    }
}

?>
<div id="stage">
</div>
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
<input type="button" id="driver" value="signup">

<table>
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Order #</th>
        <th>cityOrder</th>
        <th>Rank</th>
        <th>Author</th>
        <th>Purpose</th>
        <th>Instructions</th>
    </tr>
    <?php
    $getVar = new Test();
    $mysqli = $getVar->sendMysqli();
    $result = $mysqli->query('CALL getTasks(0, 10)') or die(mysql_error);
    if ($result->num_rows > 0):
    ?>
    <?php while ($row = $result->fetch_assoc()): ?>
        <tr>
            <td><?php echo $row['id'] ?></td>
            <td><?php echo $row['title'] ?></td>
            <td><?php echo $row['order'] ?></td>
            <td><?php echo $row['cityOrder'] ?></td>
            <td><?php echo $row['rank'] ?></td>
            <td><?php echo $row['user_author'] ?></td>
            <td><?php echo $row['purpose'] ?></td>
            <td><?php echo $row['instructions'] ?></td>
        </tr>
    <?php endwhile; ?>
</table>
<?php else: ?>
    <h3>Number of rows: <?php echo $result->num_rows; ?></h3>
<?php endif; ?>

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