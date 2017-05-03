<?php
namespace Home\Controller\User;

use Think\Model;
use Think\Controller;
class UserController extends Controller{
    private $userModel;
    
    function __construct(){
        parent::__construct();
        $this->userModel = new Model("tb_user");
    }
    
    /**
     * 登录
     */
    function login(){
        $userName = $_POST["userName"];
        $userPass = $_POST["userPass"];
        //      查询数据
        $users = $this->userModel->where("userName='$userName'")->select();
        $host = $_SERVER["HTTP_HOST"];
        if(count($users) > 0){
            $u = $users[0];
            if($userPass == $u["userpass"]){    //密码正确 查询当前用户拥有的菜单
                $_SESSION["user"] = $u;
                $_SESSION["uid"] = $u["uid"];
                //查询菜单
                $menus = $this->userModel->table("menu m,userjob uj,menujob mj")
                ->field("m.*")
                ->where("uj.jid=mj.jid and mj.menuid=m.menuid and uj.uid=".$u["uid"])
                ->select();
                $_SESSION["menus"] = $menus;
                //                 header("location:http://".$host."/ThinkPHP/easyuiWelcome.php");
                $this->assign("BASEPATH",BASEPATH);
                $this->display("easyuiWelcome");
            }else{
                //密码错误
                $_SESSION["loginError"] = "密码错误";
                header("location:http://".$host."/BM/login.php");
            }
        }else{
            //账户不存在
            $_SESSION["loginError"] = "账户不存在";
            header("location:http://".$host."/BM/login.php");
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
