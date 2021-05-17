<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Main</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="/orgchart.js"></script>
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
<button id="city">City</button>
<button id="homestead">Homestead</button>
<button id="survival">Survival</button>

<div style="width:900px; height:900px; margin: 40px auto;border:3px black solid;" id="orgchart"></div>
<script>
    let chart = new OrgChart(document.getElementById("orgchart"), {
/*
        nodeMenu: {
            png : { text: "Export PNG"}
        },
*/
        nodeBinding: {
            field_0: "tech",
            img_0: "img"
        },
        nodes: [
            {id: 1, tech: "Stone Axehead", img: "/images/stoneAxehead.png"},
            {id: 2, pid: 1, tech: "Plant Cordage", img: "/images/plantCordage.png"},
            {id: 3, pid: 1, tech: "Stone Axe", img: "/images/stoneAxe.png"}
        ]
    });
</script>

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
<script>
    $(document).ready(function () {
        $("#city").click(function (event) {
            //put code in here to change all the page info to the city type.
        })
    })

    $(document).ready(function () {
        $("#homestead").click(function (event) {
            //put code in here to change all the page info to the homestead type.
        })
    })

    $(document).ready(function () {
        $("#survival").click(function (event) {
            //put code in here to change all the page info to the survival type.
        })
    })
</script>

</body>
</html>