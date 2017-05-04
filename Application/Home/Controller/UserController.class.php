<?php
namespace Home\Controller;

use Think\Controller;
class UserController extends Controller{
    private $UserModel;
    
    public function __construct() {
        parent::__construct();//子类继承父类
        $this->UserModel= M("");
    }
}

?>