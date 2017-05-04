<?php
namespace Home\Controller;

use Think\Controller;
class Guzhang  extends Controller{
    private $UserModel;
    
    public function __construct() {
        parent::__construct();//子类继承父类
        $this->UserModel= M("tb_user");
    }
    
    /**
     * 加载故障表-------bootstrap同步
     */
    public  function  loadguzhangByPage($pageNo=1,$pageSize=10,$searchuid=null){
    
        $query = "1=1 ";
    
        if ($searchuid != null && $searchuid != ""){
            $query .= "and uid like '%$searchuid%'";
        }
    
        //总数量
        $total = $this->UserModel->count();
         
    
        //当前这一页数据
        $rows = $this->UserModel->table("tb_rechargerecord")->order("rid desc")->page($pageNo,$pageSize)->select();
        $page = array("pageNo"=>$pageNo,"pageSize"=>$pageSize,"total"=>$total,"rows"=>$rows);
        $this->assign("page",$page);
        $this->assign("BASEPATH",BASEPATH);
        $this->display("loadguzhangByPage");
         
    }
    
    /**
     * bootstrap同步添加、编辑
     */
    public function addORupdateguzhang(){
        $data = $this->UserModel->create();
        if ($data["rid"] < 0){
            //添加
            $this->UserModel->field("uid,money")->add();
    
        }else {
            //编辑、修改
            $this->UserModel->field("uid,money")->where("rid=%d",$data["rid"])->save();
             
        }
        $this->loadguzhangByPage();
    }
    /**
     * 按ID异步加载
     */
    public function loadguzhangById($rid){
        $guzhangs = $this->UserModel->find($rid);
        $this->ajaxReturn($guzhangs);
    }
    /**
     * 删除
     */
    public  function deleteguzhangs() {
        $rids=$_POST["rids"];
        for ($i=0;$i<count($rids);$i++){
            $this->UserModel->delete($rids[$i]);
        }
        $this->loadguzhangByPage();
    }
    
}

?>