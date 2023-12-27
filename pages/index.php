<?php
session_start();

include '../additional/header.php';

$postUser = getPostUser($connection);

if (isset($_GET['editid']) && $_GET['editid'] > 0) {
  $customerData = getPostInfo($connection, $_GET['editid']);
}

if (isset($_POST['updateid']) && $_POST['updateid'] > 0) {
  updatePost($connection);
  header("Location: index.php?editid=" . $_POST['updateid']);
}
?>

<section class="hero is-medium herobg">
    <div class="hero-body">
        <div class="content has-text-centered">
            <h1 class="index-title">Кинотеатр "Cinema"</h1>
            <h2 class="subtitle"><a href="../pages/tickets.php">Купить билет</a></h2>
        </div>
    </div>
</section>
<section class="hero is-medium">
    <div class="hero-body">
        <div class="container">
            <div class="content has-text-centered">
                <h1 class="title">Новости</h1>
                
                <?php if (isset($_SESSION['loggedin']) && $_SESSION['userGroup'] === 1) { ?>
                    <a href="post-new.php"><button class="button is-medium">Создайте новость сейчас</button></a>
                <?php } ?>
                <?php while ($row = mysqli_fetch_array($postUser)) { ?>
                    <div class="columns">
                        <div class="column all-news">
                            <h2 class="title">
                                <a href="post.php?id=<?php echo $row['postID']; ?>">
                                    <?php echo $row['postTitle']; ?>
                                </a>
                            </h2>
                            <i class="date">
                                <?php echo ucfirst($row['userName']); ?> |
                                <?php echo date('Y-m-d H:i', strtotime($row['postDate'])); ?>
                            </i><br>
                            <p class="post-comment">
                                <?php echo $row['postComment']; ?>
                            </p><br>

                            <?php if (isset($_SESSION['loggedin']) && ($_SESSION['userGroup'] === 1 || $_SESSION['userGroup'] === 1)) { ?>
                                <a href="post-edit.php?editid=<?php echo $row['postID']; ?>"><button class="button">Изменить</button></a>
                                <a href="post-delete.php?deleteid=<?php echo $row['postID']; ?>"><button class="button">Удалить</button></a><br><br>
                            <?php } ?>
                        </div>
                    </div>
                    <hr>
                <?php } ?>

                <hr>
                <form id="search-form">
                    <input type="text" id="search-query" placeholder="Поиск новостей...">
                    <button type="submit">Поиск</button>
                </form>
                <div id="news-container"></div>

            </div>
        </div>
    </div>
</section>

<script>
document.addEventListener('DOMContentLoaded', function () {
    const newsContainer = document.getElementById('news-container');
    const form = document.getElementById('search-form');
    let lastSearchQuery = '';
    let offset = 0; // Начальное смещение

    form.addEventListener('submit', function (e) {
        e.preventDefault();
        const query = document.getElementById('search-query').value;
        lastSearchQuery = query;
        offset = 0; // Сброс смещения при новом поиске
        fetchNews(query);
    });

    function fetchNews(query = '', newOffset = 0) {
        fetch(`get_news.php?query=${query}&offset=${newOffset}`)
            .then(response => response.text())
            .then(data => {
                if (newOffset === 0) newsContainer.innerHTML = data;
                else newsContainer.innerHTML += data;
                offset = newOffset + 3; // Увеличиваем смещение на количество загруженных элементов
            })
            .catch(error => console.error('Error:', error));
    }

    // Бесконечная прокрутка
    window.addEventListener('scroll', function () {
        if (window.innerHeight + window.scrollY >= document.body.offsetHeight - 100) {
            // Добавляем условие для предотвращения многократных запросов
            fetchNews(lastSearchQuery, offset);
        }
    });

    // Загрузка первоначальных новостей
    fetchNews();
});

</script>

<?php include '../additional/footer.php' ?>
