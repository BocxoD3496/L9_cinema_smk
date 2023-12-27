<?php
// В get_news.php

// Подключение к базе данных
$host = 'localhost';
$username = 'root';
$password = 'root';
$database = 'cinema';

$connection = new mysqli($host, $username, $password, $database);

if ($connection->connect_error) {
    die("Ошибка подключения: " . $connection->connect_error);
}

$query = isset($_GET['query']) ? $_GET['query'] : '';
$offset = isset($_GET['offset']) ? (int)$_GET['offset'] : 3;
$limit = isset($_GET['limit']) ? (int)$_GET['limit'] : 3; // Количество новостей, загружаемых за один раз


$sql = "SELECT posts.*, users.userName FROM posts
        LEFT JOIN users ON posts.userId = users.userid
        WHERE posts.postTitle LIKE '%$query%'
        ORDER BY posts.postDate DESC LIMIT $limit OFFSET $offset";

$result = $connection->query($sql);

if ($result === false) {
    die("Ошибка выполнения запроса: " . $connection->error);
}

while ($row = mysqli_fetch_array($result)) {


// Вывод новостей
echo "<div class='columns new-news'>";
echo "<div class='column all-news'>";
echo "<h2 class='title'><a href='post.php?id=" . $row['postID'] . "'>" . $row['postTitle'] . "</a></h2>";
echo "<i class='date'>" . ucfirst($row['userName']) . " | " . date('Y-m-d H:i', strtotime($row['postDate'])) . "</i><br>";
echo "<p class='post-comment'>" . $row['postComment'] . "</p><br>";
// Проверка на наличие прав для редактирования и удаления
if (isset($_SESSION['loggedin']) && $_SESSION['userGroup'] === 1) {
    echo "<a href='post-edit.php?editid=" . $row['postID'] . "' class='button button-edit' data-postid='" . $row['postID'] . "'>Изменить</a>";
    echo "<a href='post-delete.php?deleteid=" . $row['postID'] . "' class='button button-delete' data-postid='" . $row['postID'] . "'>Удалить</a><br><br>";
}
echo "</div>";
echo "</div>";
echo "<hr>";

    
}

$connection->close();
?>
