<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Star rating</title>
  <link rel="stylesheet" href="css/star.css">
</head>
<body>
<div class="container">
  <div class="rating-wrap">
    <h2>Star Rating</h2>
    <div class="center">
      <form class="rating" method="post" action="#">
        <input type="radio" id="star5" name="rating" value="5"/><label for="star5" class="full"></label>
        <input type="radio" id="star4" name="rating" value="4"/><label for="star4" class="full"></label>
        <input type="radio" id="star3" name="rating" value="3"/><label for="star3" class="full"></label>
        <input type="radio" id="star2" name="rating" value="2"/><label for="star2" class="full"></label>
        <input type="radio" id="star1" name="rating" value="1"/><label for="star1" class="full"></label>
      </form>
    </div>
  </div>
</div>
</body>
</html>