<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Main</title>
    <script src="/orgchart.js"></script>
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

        #menu {
            float: right;
        }
    </style>

</head>
<body>
<button id="city">City</button>
<button id="homestead">Homestead</button>
<button id="survival">Survival</button>
<div id="menu">
    <button id="logout">logout</button>
    <button id="profile">profile page</button>
</div>

<?php
include 'MysqlConnect.php';
$conn = new MysqlConnect();
$mysqli = $conn->sendMysqli();
$techResult = $mysqli->query('CALL getTasks(0,100)') or die(mysql_error);
?>

<div style="width:900px; height:900px; margin: 40px auto;border:3px black solid;" id="orgchart"></div>
<script>
    let chart = new OrgChart(document.getElementById("orgchart"), {
        nodeBinding: {
            field_0: "tech",
            img_0: "img"
        },
        nodes: [
            <?php if ($techResult->num_rows > 0) {
            $i = 0;
            while ($row = $techResult->fetch_assoc()) {
                if ($techResult->num_rows != $i + 1) {
                    echo "{id: " . $row['id'] . ", tech: '" . $row['title'] . "', img: '" . "/images/stoneAxehead.png" . "', instructions: '" . $row['instructions'] . "'},\n";
                    $i++;
                } else {
                    echo "{id: " . $row['id'] . ", tech: '" . $row['title'] . "', img: '" . "/images/stoneAxehead.png" . "', instructions: '" . $row['instructions'] . "'}\n";
                }
            }
        }
            $techResult->close();
            $mysqli->next_result();
            ?>
        ]
    });
    /*
            }
                {id: 1, tech: "Stone Axehead", img: "/images/stoneAxehead.png", instructions: "placeholder"},
                {id: 2, pid: 1, tech: "Plant Cordage", img: "/images/plantCordage.png", instructions: "placeholder"},
                {id: 3, pid: 1, tech: "Stone Axe", img: "/images/stoneAxe.png", instructions: "placeholder"}
    */
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

<!--
This is an option if I want to try using canvas instead later.
     //provides _.cloneDeep()
<script src="https://cdn.jsdelivr.net/npm/lodash@4.17.15/lodash.min.js"></script>

//This goes inside <style> tags:
        canvas {
            width:900px;
            height:900px;
            display: block;
            margin: 40px auto;
            border:3px black solid;
            background: #134;
        }
<canvas id="techTree" width="200" height="100" style="">
    Your browser does not support the HTML5 canvas tag.
</canvas>
<script>
    "use strict";
    let canvas = document.getElementById('techTree');
    let ctx = canvas.getContext('2d');

    class Controller {
        constructor() {
            this.buildTree();
        }

        buildTree() {

        }

    }
    const controller = new Controller();
</script>
-->