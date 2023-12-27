<?php
session_start();

include '../additional/header.php';

checkLogin();

if (isset($_POST['isnew']) && $_POST['isnew'] == 1) {
  $saveCustomer = savePost($connection);
  header("Location: index.php");
}
?>

<section class="hero is-fullheight" style="background-color: #fff;">
  <div class="hero-body">
    <div class="container">
      <div class="columns is-centered">
        <div class="column booking-col">
          <p class="title">
            Создать новость
          </p>
          <a class="darklink" href="../pages/index.php">Вернуться</a>
          <br><br>
          <form action="post-new.php" method="post">
            <input type="hidden" name="isnew" id="isnew" value="1">
            <div class="field">
              <label class="label">Краткое название:</label>
              <div class="control has-icons-left">
                <input class="input is-medium" type="text" name="postTitle"
                  placeholder="Введите краткое название новости">
                <span class=" icon is-small is-left">
                  <i class="fas fa-pen"></i>
                </span>
              </div>
            </div>
            <label class="label">Текст:</label>
            <textarea class="textarea" rows="12" name="postComment" placeholder="Текст новости"></textarea></p>
            <p><input style="margin-top: 20px;" class="button is-medium" type="submit" value="Сохранить">
          </form>
        </div>
      </div>
    </div>
  </div>
</section>

<?php include '../additional/footer.php' ?>