<?php
session_start();
require '../includes/config.php';
require '../includes/functions.php';

$username = $password = "";
$username_err = $password_err = "";

if (isset($_POST['isuser']) && $_POST['isuser'] == 1) {
  $username_err = login($connection);
}
?>

<!DOCTYPE html>
<html lang="sv" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>Вход | Cinema</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.4/css/bulma.min.css">
  <script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
  <link rel="stylesheet" href="styles.css">
</head>

<body>
  <section class="hero curtain is-fullheight">
    <div class="hero-body">
      <div class="container has-text-centered">
        <div class="column is-4 is-offset-4" style="margin-left:0px;">
          <div class="box">
            <h3 class="title">Вход в аккаунт</h3>
            <p class="subtitle">Пожалуйста, войдите чтобы продолжить.</p>
            <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
              <input type="hidden" name="isuser" id="isuser" value="1">
              <div class="field <?php echo (!empty($username_err)) ? 'has-error' : ''; ?>">
                <label class="label">Логин</label>
                <div class="control has-icons-left">
                  <input class="input is-large" type="username" name="username" placeholder="Логин"
                    value="<?php echo $username; ?>" required>
                  <span class="icon is-small is-left">
                    <i class="fas fa-user"></i>
                  </span>
                  <span class="help is-danger">
                    <?php echo $username_err; ?>
                  </span>
                </div>
              </div>
              <div class="field <?php echo (!empty($password_err)) ? 'has-error' : ''; ?>">
                <label class="label">Пароль</label>
                <div class="control has-icons-left">
                  <input class="input is-large" type="password" name="password" placeholder="Пароль" required>
                  <span class="icon is-small is-left">
                    <i class="fas fa-lock"></i>
                  </span>
                  <span class="help is-danger">
                    <?php echo $password_err; ?>
                  </span>
                </div>
              </div>
              <input class="button is-fullwidth is-medium" type="submit" name="submit" value="Войти">
              <br>
              <p>Вы хотите создать аккаунт? <a class="darklink" href="../pages/register.php">Зарегистрироваться</a>.</p>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>
</body>

</html>
<?php
dbDisconnect($connection);
?>