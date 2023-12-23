<?php
require("../includes/config.php");
require("../includes/functions.php");
?>

<!DOCTYPE html>
<html lang="sv" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>Cinema</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.4/css/bulma.min.css">
  <script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
  <link rel="stylesheet" href="./styles.css">
</head>

<body>
  <nav class="navbar wrap-menu" role="navigation">
    <div class="navbar-brand">
      <a class="navbar-item" href="../pages/index.php">
        <img style="width: 100%; height: 100%" src="../img/logo.png">
      </a>
      <div class="navbar-burger burger menu-mob">
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
      </div>
    </div>
    <div class="navbar-menu">
      <div class="navbar-start">
        <a href="../pages/index.php" class="navbar-item">
          Главная
        </a>
        <?php if (!isset($_SESSION['loggedin'])) { ?>
          <a href="../pages/login.php" class="navbar-item ">
            Логин
          </a>
        <?php } else { ?>
          <a href="../pages/tickets.php" class="navbar-item">
            Билеты
          </a>
        <?php } ?>
        <a href="../pages/movies.php" class="navbar-item">
          Фильмы
        </a>
        <?php if (isset($_SESSION['loggedin'])) { ?>
          <a href="../pages/profile.php" class="navbar-item">
            Профиль
          </a>
        <?php } ?>
      </div>
      <div class="navbar-end">
        <?php if (!isset($_SESSION['loggedin'])) { ?>
          <a href="../pages/register.php" class="navbar-item">
            Регистрация <i class="fas fa-user-plus log-icon"></i>
          </a>
          <a href="../pages/login.php" class="navbar-item">
            Логин <i class="fas fa-user log-icon"></i>
          </a>
        <?php } else { ?>
          <a href="../pages/logout.php" class="navbar-item">
            Выход <i class="fas fa-sign-out-alt log-icon"></i>
          </a>
        <?php } ?>
      </div>
    </div>
  </nav>