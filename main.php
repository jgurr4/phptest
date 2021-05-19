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
?>

<div id="survivalOrgchart" style="width:900px; height:900px; margin: 40px auto;border:3px black solid;"></div>
<script>
    let chart = new OrgChart(document.getElementById("survivalOrgchart"), {
        nodeBinding: {
            field_0: "tech",
            img_0: "img"
        },
        nodes: [
            <?php
            $techResult = $mysqli->query('CALL getSurvivalTasks(0,100)') or die(mysql_error);
            if ($techResult->num_rows > 0) {
            $i = 0;
            $pid = -1;
            while ($row = $techResult->fetch_assoc()) {
                $lastTech = '';
                if ($row['tech'] != $lastTech) {
                    $pid++;
                }
                $lastTech = $row['tech'];
                if ($techResult->num_rows != $i + 1) {
                    echo "{id: " . $row['id'] . ", pid: " . $pid . ", tech: '" . $row['title'] . "', img: '/images/" . $row['image'] . "', instructions: '" . $row['instructions'] . "'},\n";
                    $i++;
                } else {
                    echo "{id: " . $row['id'] . ", pid: " . $pid . ", tech: '" . $row['title'] . "', img: '/images/" . $row['image'] . "', instructions: '" . $row['instructions'] . "'}\n";
                }
            }
        }
            $techResult->close();
            $mysqli->next_result();
            ?>
        ]
    });
</script>

<div id="nextTask">
    <h3>Next Task for you to complete:</h3>
<!--    FIXME: Somehow I need to get username from cookie to input for the stored procedure call here.-->
    <?php $taskRes = $mysqli->query('CALL getNextSurvivalTask("TheGuy")');
        $row = $taskRes->fetch_assoc(); ?>
    <p><?php echo $row['title']; ?></p>
    <img src="/images/<?php echo $row['image']; ?>" width="200px" height="200px">
    <?php
        $taskRes->close();
        $mysqli->next_result();
    ?>
</div>

<h3>Tasks for Survival Table</h3>
<table id="survivalTable">
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Tech</th>
        <th>Order #</th>
        <th>Author</th>
        <th>Purpose</th>
        <th>Instructions</th>
    </tr>
    <?php
    $result = $mysqli->query('CALL getSurvivalTasks(0, 100)') or die(mysql_error);
    if ($result->num_rows > 0):
    ?>
    <?php while ($row = $result->fetch_assoc()): ?>
        <tr>
            <td><?php echo $row['id'] ?></td>
            <td><?php echo $row['title'] ?></td>
            <td><?php echo $row['tech'] ?></td>
            <td><?php echo $row['survivalOrder'] ?></td>
            <td><?php echo $row['user_author'] ?></td>
            <td><?php echo $row['purpose'] ?></td>
            <td><?php echo $row['instructions'] ?></td>
        </tr>
    <?php endwhile; ?>
</table>
<?php else: ?>
    <h3>No Results Found.</h3>
<?php
endif;
    $result->close();
    $mysqli->next_result();
?>


<script>
    $(document).ready(function () {
        $("#survival").click(function (event) {
            $("#survivalOrgchart").toggle();
            $("#survivalTable").toggle();
            //put code in here to change all the page info to the survival type.
        })
    })

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