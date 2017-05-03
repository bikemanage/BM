<?php 
session_start();
?>
<html>
	<head>
		<title></title>
		<link rel="stylesheet" href="Public/dist/css/bootstrap.min.css"/>
		<script type="text/javascript" src="Public/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="Public/dist/js/bootstrap.min.js"></script>
	</head>
	<body style="background-color:#CCCCCC;">
		<div class="col-md-3 col-md-offset-4" style="margin-top:20px;">
			<form action="index.php/Home/User/login" method="post">
        		<div class="panel panel-info">
        			<div class="panel-heading">
        				<div class="panel-title" style="text-align:center;">
        					<b style="font-size:20px;">登录</b>
        				</div>
        			</div>
        			<div class="panel-body">
        				<label for="userName">账号：</label>
        				<input type="text" name="userName" id="userName" style="width:80%; height:30px;" placeholder="请输入账号..."/>
        			</div>
        			<div class="panel-body">
        				<label for="userPass">密码：</label>
        				<input type="password" name="userPass" id="userPass" style="width:80%;height:30px;" placeholder="请输入密码..."/>
        			</div>
        			<div class="panel-body form-group form-inline">
        				<label for="vcode">验证码：</label>
        				<input type="text" class="form-control" name="vcode" id="vcode" style="width:47%;height:30px;"  placeholder="请输入验证码..."/>
        				<img src="http://localhost:8080/U32/part11/vcode.php" title="看不清？点击换一张" onclick="changeVcode(this);" style="width:80px;height:30px;cursor:pointer;">
        			</div>
        			<div style="color:red;text-align:center;">
    					<?php 
    					   if(isset($_SESSION["loginError"])){
    					       echo $_SESSION["loginError"];
    					       unset($_SESSION["loginError"]);
    					   }
    					?>
    				</div>
        			<div class="panel-body" style="text-align:center;">
        				<input type="submit" value="登录" class="btn btn-md btn-primary" style="width:60%;height:30px;font-size:16px;padding-top:4px;font-weight:bold;"/>
        				<div style="margin-top:5px;">
							<span>没有账号？<a href="Application/Home/View/zhuce.php"">立即注册</a></span>
						</div>
        			</div>
        		</div>
    		</form>
		</div>
		
	</body>
</html>





































