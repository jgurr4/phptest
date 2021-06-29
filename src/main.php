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
<svg id="fullSvg" width="86vw" height="80vh" viewbox="0 0 1500 700"
     style="margin: .4in auto; border:1vw black solid; display:block;">
    <defs>
        <pattern id="techImage" x="0%" y="0%" height="100%" width="100%"
                 viewBox="0 0 512 512">
            <image x="0%" y="0%" width="512" height="512" href="/images/campfire.png"></image>
        </pattern>
        <pattern id="taskImage" x="0%" y="0%" height="100%" width="100%"
                 viewBox="0 0 200 200">
            <image x="0%" y="0%" width="200" height="200" href="/images/foraging.png"></image>
        </pattern>
    </defs>
    <defs>   <!-- <defs> will hide the code inside it until the code inside is called with <use> -->
        <g id="tree">
            <g id="node">
                <rect x="152" y="320" width="328" height="80" fill="#111111" rx="16" ry="16"></rect>
                <text x="232" y="344" fill="#aaaaaa">Technology Name</text>
                <rect x="232" y="352" width="248" height="48" fill="#333333" rx="16" ry="16"></rect>
                <circle r="29" cx="192" cy="360" fill="url(#techImage)" stroke="gold" stroke-width="0.2%"></circle>    <!-- Tech img -->
                <circle r="21" cx="259" cy="376" fill="url(#taskImage)"></circle> <!-- mini circles/tasks img -->
                <circle r="21" cx="307" cy="376" fill="url(#taskImage)"></circle>
                <circle r="21" cx="355" cy="376" fill="url(#taskImage)"></circle>
                <circle r="21" cx="403" cy="376" fill="url(#taskImage)"></circle>
                <circle r="21" cx="451" cy="376" fill="url(#taskImage)"></circle>
            </g>
            <path></path>
            <use href="#node" x="416" y="144"></use>
            <use href="#node" x="416" y="-144"></use>
        </g>
    </defs>
    <use id="mySvg" href="#tree" x="-100" y="0"></use>  <!--This tag controls entire tree. Javascript is used on this.-->
</svg>

<div id="nextTask">
    <h3>Next Task for you to complete:</h3>
    <?php $user = $_COOKIE['username'];  // Retrieves username of user that just logged in and use that to pull up the user next task.
    $taskRes = $mysqli->query('CALL getNextTask("' . $user . '")');
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
            <td><?php echo $row['tOrder'] ?></td>
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

        $("#city").click(function (event) {
            //put code in here to change all the page info to the city type.
        })

        $("#homestead").click(function (event) {
            //put code in here to change all the page info to the homestead type.
        })

        $("#profile").click(function (event) {
            $(window).attr('location', '/profile.php');
        });

        // logout function destroys all existing cookies.
        $("#logout").click(function (event) {
            document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
            $(window).attr('location', '/index.php');
        });
    });


</script>
<script>
    //svg dragging function:
    const svg = document.getElementById('mySvg');
    const fullSvg = document.getElementById('fullSvg');
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

    fullSvg.onmousedown = getPos;

    // Zoom svg functions:
    //FIXME: Make it possible to affect scrollbar with mousewheel when mouse is not hovering over svg element.
    // Change browser default behavior of scrollbar with mousewheel event.
    window.addEventListener("wheel", e => e.preventDefault(), { passive:false })
    function zoom(e) {
        e.preventDefault();
        scale += e.deltaY * -0.001;
        //Change to -0.0009 or -0.002 to increase/decrease zoom increments per scroll.

        scale = Math.min(Math.max(.35, scale), 2);
        //Change .35 to .2 or .125 etc.. to make it possible to zoom out more. Or .4 > to make it zoom out less.
        //Change 2 to 3 or 4 etc... to make it possible to zoom in more. Or 1 to make it zoom in less.

        svg.style.transform = `scale(${scale})`;
    }

    let scale = 1;
    fullSvg.onwheel = zoom;


</script>
</body>
</html>