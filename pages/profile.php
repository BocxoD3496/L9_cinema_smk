<?php
session_start();

include '../additional/header.php';

checkLogin();

$page = "profile";
?>

<section class="hero is-fullheight curtain">
  <div class="hero-body">
    <div class="container">
      <div class='columns'>
        <div class='container profile'>
          <div class='section profile-heading'>
            <div class='columns profile-info is-mobile is-multiline'>
              <div class='column is-2'>
                <figure class="image is-1by1">
                  <img alt='' src='<?php echo ($_SESSION["userImg"]); ?>'>
                </figure>
              </div>
              <div class='column is-4-tablet is-10-mobile name'>
                <ul>
                  <li>
                    <p>
                      <span class='title is-bold'>
                        <?php echo ucfirst($_SESSION["username"]); ?>
                      </span>
                    </p>
                  </li>
                  <li>
                    <p>
                      <strong>Зарегистрирован:</strong>
                      <?php echo htmlspecialchars($_SESSION["userCreated"]); ?>
                    </p>
                  </li>
                  <li>
                    <p>
                      <strong>О пользователе:</strong>
                      <?php echo htmlspecialchars($_SESSION["userDesc"]); ?>
                    </p>
                  </li>
                </ul>
              </div>
              <div class='column is-6-tablet is-4-mobile has-text-centered'>
                <?php checkUserGroup(); ?>
              </div>
            </div>
          </div>
          <div class='box' style='border-radius: 0px;'>
            <ul class="profile-menu">
              <li class="<?php echo ($page == "profile" ? "active" : "") ?>"><a href="profile.php">Профиль</a></li>
              <li class="<?php echo ($page == "settings" ? "active" : "") ?>"><a href="settings.php">Настройки</a></li>
            </ul><br>
            <h3 class="title">Профиль</h3>
            <p class="subtitle">Ваш профиль показывает информацию про ваш уровень аккаунта, очки пользователя
              купленные билеты, текущий код и ваши любимые фильмы. </p>
            <nav class="level">
              <div class="level-item has-text-centered">
                <div>
                  <p class="heading">Очки пользователя</p>
                  <p class="title">168</p>
                </div>
              </div>
              <div class="level-item has-text-centered">
                <div>
                  <p class="heading">Купленные билеты</p>
                  <p class="title">3</p>
                </div>
              </div>
              <div class="level-item has-text-centered">
                <div>
                  <p class="heading">Любимый фильм</p>
                  <p class="title">Oppenheimer</p>
                </div>
              </div>
            </nav>
            <h1 class="title" style="text-align: center">Уровень аккаунта: 2</h1>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<?php include '../additional/footer.php' ?>