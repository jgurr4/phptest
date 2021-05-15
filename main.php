<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Main</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
        th {
            align: center;
            border: 3px black solid;
        }
        td {
            align: center;
            border: 1px black solid;
            margin: 0px;
        }
    </style>

</head>
<body>
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
    include 'MysqlConnect.php';
    $conn = new MysqlConnect();
    $mysqli = $conn->sendMysqli();
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
    <h3>No Results Found.</h3>
<?php endif; ?>

</body>
</html>