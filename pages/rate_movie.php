<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "cinema";

// Создание соединения
$conn = new mysqli($servername, $username, $password, $dbname);

// Проверка соединения
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$input = json_decode(file_get_contents('php://input'), true);
$movieId = $input['movieId'];
$rating = $input['rating'];
$userId = $_SESSION['userId']; // Пример использования идентификатора пользователя из сессии

// Запрос на добавление оценки
$sql = "INSERT INTO movie_ratings (movieID, userID, rating) VALUES (?, ?, ?)";

$stmt = $conn->prepare($sql);
$stmt->bind_param("iii", $movieId, $userId, $rating);
$stmt->execute();

if ($stmt->error) {
    echo "Error: " . $stmt->error;
} else {
    echo "Rating added successfully";
}

$stmt->close();
$conn->close();
?>