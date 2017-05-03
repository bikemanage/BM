<?php
session_start();
require_once '../../../../../autoload.php';
// if(!isset($_COOKIE["userName"]) || $_COOKIE["userName"] == ""){
//     header("location:http://localhost:8080/U32/part9/login/login.php?".http_build_query(array("loignERROR"=>"<b>请先登录！</b>")));
// }

?>
<html>
	<head>
		<title></title>
		<link rel="stylesheet" href="{$BASEPATH}Public/easyui/themes/default/easyui.css"/>
		<link rel="stylesheet" href="{$BASEPATH}Public/easyui/themes/default/icon.css"/>
		<script type="text/javascript" src="{$BASEPATH}Public/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="{$BASEPATH}Public/easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript">
		// 添加一个未选中状态的选项卡面板
    		function addTabs(title,url){
        		var b = $("#add").tabs("exists", title);
        		if(b){
        			$("#add").tabs("select", title);
        			$('#add').tabs('update', {
        				tab: $("#add").tabs("getTab", title),
        				options: {}
        			});
            	}else{
            		$('#add').tabs('add',{
            			title: title,
            			selected: true,
            			closable:true,
            			content:'<iframe width="100%" src="'+url+'" height="100%" frameborder="0" scroll></iframe>'
        			});
        		}
    		}
    		
		</script>
	</head>
	<body class="easyui-layout">   
        <div data-options="region:'north',split:false,collapsible:false" style="height:70px;color:#336666;font-size:18px;font-weight:bold;">
			<span style="position:relative;top:0;">欢迎你！===<?php echo $_SESSION["user"]["truename"];?></span>
			<a href="upLOadPictureForm.php" target="userInfo" style="position:relative;left:-176px;top:22px;font-size:16px;">上传头像</a>
			<a href="login.php" style="position:relative;left:-170px;top:22px;">退出登录</a>
        </div>   
        <div data-options="region:'west',title:'系统菜单',split:true" style="width:200px;">
        	<ul id="tt" class="easyui-tree">
        		<?php 
			     foreach($_SESSION["menus"] as $m){
			         if($m["level"] == 2){
			             echo "<li>";
			             echo "<span>{$m["menuname"]}</span>";
			             echo "<ul>";
			             foreach($_SESSION["menus"] as $m3){
			                 if($m3["level"] == 3 && $m["menuid"] == $m3["parentid"]){
			                     echo "<li><a href='javascript:addTabs(\"{$m3["menuname"]}\",\"{$m3["menuurl"]}\");'>{$m3["menuname"]}</a></li>";
			                 }
			             }
			             echo "</ul>";
			             echo "</li>";
			         }
			     }
        		?>
            </ul> 
        </div>   
        <div data-options="region:'center',title:'center title'" style="padding:5px;background:#eee;">
        	<div id="add" class="easyui-tabs" style="width:500px;height:100%;" data-options="fit:'true'">   
                <div title="Tab1" style="padding:20px;">   
                  	 <span> 欢迎你</span>   
                </div>
            </div> 
        </div>   
    </body> 
</html>



















