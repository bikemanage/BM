<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="../../../Public/bootstrap/css/bootstrap.min.css" />
		<script type="text/javascript" src="../../../Public/bootstrap/js/bootstrap.min.js" ></script>
		<script type="text/javascript" src="../../../Public/bootstrap/js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("button").mouseover(function(){
					$("button").css("background-color","gainsboro");
					$("button").css("border-radius","10px");
				})
				$("button").mouseleave(function(){
					$("button").css("background-color","black");
					$("button").css("border-radius","0px");
				})
			})
		</script>
		<style type="text/css">
			body{
				background: url(img/dancheBG3.jpg) no-repeat 0px 0px;
				background-size:cover;
				-webkit-background-size:cover;
				-moz-background-size:cover;
				-o-background-size:cover;	
			}
		</style>
	</head>
	<body>
		<form action="" method="post" onsubmit="" style="width: 50%; height: 70%;position:absolute;top:50%;height:240px;margin-top:-160px; margin-left: 25%">
			<div class="form-group">
				<h2 style="color:black;">欢迎来到BM</h2>
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">用户名</label>
				<input type="email" class="form-control" id="exampleInputEmail1" placeholder="请输入用户名">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">请输入密码</label>
				<input type="password" class="form-control" id="exampleInputPassword1" placeholder="密码">
			</div>
			<div class="form-group">
			 	<button type="submit" class="btn" style="width: 70%;background-color: black; color: grey;margin-left:15%">登录</button>
			</div>		  
		</form>
	</body>

</html>