<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main</title>
    <!--    <script src="https://balkangraph.com/js/latest/OrgChart.js"></script>-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="style.css">
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

<!--16px default browser font size = 1 em-->
<svg width="86vw" height="80vh" viewbox="0 0 1500 700"
     style="margin: .4in auto; border:1vw black solid; display:block;">
    <defs>   <!-- This means to hide the code inside it until the code inside is called with <use> -->
        <g id="tree">
            <g id="node">
                <rect x="152" y="320" width="328" height="80" fill="#111111" rx="16" ry="16"></rect>
                <text x="232" y="344" fill="#aaaaaa">Technology Name</text>
                <rect x="232" y="352" width="248" height="48" fill="#333333" rx="16" ry="16"></rect>
                <circle r="29" cx="192" cy="360" fill="#558473"></circle>    <!-- Tech img -->
                <circle r="21" cx="259" cy="376" fill="#558473"></circle> <!-- mini circles/tasks img -->
                <circle r="21" cx="307" cy="376" fill="#558473"></circle>
                <circle r="21" cx="355" cy="376" fill="#558473"></circle>
                <circle r="21" cx="403" cy="376" fill="#558473"></circle>
                <circle r="21" cx="451" cy="376" fill="#558473"></circle>
            </g>
            <path></path>
            <use href="#node" x="416" y="144"></use>
            <use href="#node" x="416" y="-144"></use>
        </g>
    </defs>
    <use href="#tree" id="mySvg" x="-100" y="0"></use>  <!--This tag controls entire tree. Javascript is used on this.-->
</svg>

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
    <br>
    <p>I completed this task</p>
    <button id="completed">checkmark emoji</button>
    <br>
    <p>How many hours did it take you?</p>
    <input type="number" id="timeToComplete">
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
    $result = $mysqli->query('CALL getTasks(0, 100)') or die(mysql_error);
    if ($result->num_rows > 0):
    ?>
    <?php while ($row = $result->fetch_assoc()): ?>
        <tr>
            <td><?php echo $row['id'] ?></td>
            <td><?php echo $row['title'] ?></td>
            <td><?php echo $row['tech'] ?></td>
            <td><?php echo $row['order'] ?></td>
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

    $(document).ready(function () {
        $("#profile").click(function (event) {
            $(window).attr('location', '/profile.php');
        });
    });

    $(document).ready(function () {
        $("#logout").click(function (event) {
            $(window).attr('location', '/index.php');
            //TODO: Add code here to remove cookies for user.
        });
    });


</script>
<script>
    //FIXME: bug with drag not stopping when mouseup.
    let svg = document.getElementById('mySvg');
    let svgX = svg.getAttributeNS(null, 'x');
    let svgY = svg.getAttributeNS(null, 'y');
    let startX = 0, startY = 0, newX = 0, newY = 0, x = 0, y = 0;
    function getPos(e) {
        e.preventDefault();
        svgX = svg.getAttributeNS(null, 'x');
        svgY = svg.getAttributeNS(null, 'y');
        startX = e.clientX;
        startY = e.clientY;
        document.addEventListener('mouseup', stopDrag);
        document.addEventListener('mousemove', moveMouse);
    }

    function moveMouse(e) {
        e.preventDefault();
        newX = e.clientX;
        newY = e.clientY;
        x = svgX - (startX - newX);
        y = svgY - (startY - newY);
        svg.setAttributeNS(null, 'x', x + "");
        svg.setAttributeNS(null, 'y', y + "");
    }

    //Stop dragging element after mouseup event.
    function stopDrag() {
        document.removeEventListener('mousemove', moveMouse);
    }

    document.addEventListener('mousedown', getPos);

</script>
</body>
</html>