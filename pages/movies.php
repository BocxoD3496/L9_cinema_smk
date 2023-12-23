<?php
session_start();

include '../additional/header.php';

$allMovies = getMovies($connection);
$recMovie = getRecMovie($connection, 3);

require '../includes/Customer.php';
require '../includes/Adult.php';
require '../includes/Child.php';

$adult = new Adult('18', '15', 'Gold');
$child = new Child('0 - 17', '8', $recMovie);

function getAverageRating($connection, $movieId)
{
  $sql = "SELECT AVG(rating) as averageRating FROM movie_ratings WHERE movieID = ?";
  $stmt = $connection->prepare($sql);
  $stmt->bind_param("i", $movieId);
  $stmt->execute();
  $result = $stmt->get_result();

  if ($row = $result->fetch_assoc()) {
    return round($row['averageRating'], 1);
  }

  return 0;
}
?>



<section class="hero is-fullheight curtain">
  <div class="hero-body">
    <div class="container">
      <div class='columns is-multiline is-centered'>
        <?php while ($row = mysqli_fetch_array($allMovies)) {
          // Получение средней оценки фильма
          $averageRating = getAverageRating($connection, $row['movieID']); // Функция getAverageRating должна быть определена
          ?>
          <div class='column is-3'>
            <div class='card movie-card'>
              <div class='card-image'>
                <figure class='image is-4by3'>
                  <img src='<?php echo $row['movieImg']; ?>'>
                </figure>
              </div>
              <div class='card-content'>
                <div class='content'>
                  <h2 class="movie-title">
                    <?php echo $row['movieTitle']; ?>
                  </h2>
                  <?php $getCategories = getCategories($connection, $row['movieID']) ?>
                  <?php while ($rowCat = mysqli_fetch_array($getCategories)) { ?>
                    <span class='tag subtitle'>
                      <?php echo $rowCat['catName']; ?>
                    </span>
                  <?php } ?>
                  <p>
                    <?php echo $row['movieInfo']; ?>
                  </p>
                  <!-- Отображение звездной оценки -->
                  <div class="star-rating">
                    <?php for ($i = 1; $i <= 5; $i++): ?>
                      <span class="star <?= ($i <= $averageRating) ? 'filled' : '' ?>">&#9733;</span>
                    <?php endfor; ?>
                  </div>
                </div>
              </div>
            </div>
          </div>
        <?php } ?>
      </div>
    </div>
  </div>
</section>

<?php include '../additional/footer.php' ?>


<script>
  document.querySelectorAll('.star').forEach(star => {
    star.addEventListener('click', function () {
      const rating = this.getAttribute('data-rating');
      const movieId = this.closest('.movie-card').getAttribute('data-movie-id');

      // Отправка данных на сервер
      fetch('rate_movie.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ movieId: movieId, rating: rating })
      })
        .then(response => response.json())
        .then(data => {
          console.log('Success:', data);
        })
        .catch((error) => {
          console.error('Error:', error);
        });
    });
  });
</script>

<style>
  .star-rating .star {
    color: gray;
    font-size: 20px;
    cursor: pointer;
  }

  .star-rating .star.filled {
    color: gold;
  }
</style>