<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>
<title>ASC</title>
<meta charset="utf-8">

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css">

<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">

<!-- jQuery -->
<script src="/resources/js/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="/resources/js/bootstrap.min.js"></script>

<script type="text/javascript" src="/resources/js/TimeCircles.js"></script>
<script type="text/javascript" src="/resources/js/backstretch.js"></script>
<script type="text/javascript" src="/resources/js/ajaxchimp.js"></script>
<script type="text/javascript" src="/resources/js/main.js"></script>
<script type="text/javascript" src="/resources/js/index.js"></script>

</head>
<body>
  <div class="cont">
    <div class="demo">
      <div class="login">
        <div class="login__check">
          <img src="/resources/images/logo5.png">
        </div>
        <div class="login__form">
          <div class="login__row">
            <svg class="login__icon name svg-icon" viewBox="0 0 20 20">
            				<path d="M0,20 a10,8 0 0,1 20,0z M10,0 a4,4 0 0,1 0,8 a4,4 0 0,1 0,-8" />
          				</svg>
            <input type="text" class="login__input name" placeholder="Username" />
          </div>
          <div class="login__row">
            <svg class="login__icon pass svg-icon" viewBox="0 0 20 20">
			            	<path d="M0,20 20,20 20,8 0,8z M10,13 10,16z M4,8 a6,8 0 0,1 12,0" />
			          	</svg>
            <input type="password" class="login__input pass" placeholder="Password" />
          </div>

          <button type="button" class="login__submit">Sign in</button>

          <p class="login__signup">
            Don't have an account? &nbsp;<a data-toggle="modal" data-target="#registerModal">Sign up</a>
          </p>

        </div>
      </div>
    </div>
  </div>

  <!-- Modal -->
  <jsp:include page="user/include/registerModal.jsp" />

</body>
</html>
