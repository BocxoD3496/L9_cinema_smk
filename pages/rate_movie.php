<?php
// Подключение к базе данных
$host = 'localhost'; // или ваш хост
$username = 'root'; // ваше имя пользователя базы данных
$password = 'root'; // ваш пароль к базе данных
$database = 'cinema'; // название вашей базы данных

//checklogin();

$connection = new mysqli($host, $username, $password, $database);
if ($connection->connect_error) {
    die("Ошибка подключения: " . $connection->connect_error);
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);
    $movieId = $data['movieId'];
    $rating = $data['rating'];

    $stmt = $connection->prepare("INSERT INTO movie_ratings (movieID, rating) VALUES (?, ?)");
    if ($stmt === false) {
        die("Ошибка подготовки запроса: " . htmlspecialchars($connection->error));
    }

    $stmt->bind_param("ii", $movieId, $rating);
    if (!$stmt->execute()) {
        die("Ошибка выполнения запроса: " . htmlspecialchars($stmt->error));
    }

    $averageStmt = $connection->prepare("SELECT AVG(rating) as averageRating FROM movie_ratings WHERE movieID = ?");
    $averageStmt->bind_param("i", $movieId);
    $averageStmt->execute();
    $result = $averageStmt->get_result();
    $row = $result->fetch_assoc();

    echo json_encode(['averageRating' => round($row['averageRating'], 1)]);
}

$connection->close();
?>
