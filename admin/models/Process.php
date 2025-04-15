<?php
/**
 * Created by PhpStorm.
 * User: Vladimir
 * Date: 21.05.2018
 * Time: 11:34
 */

namespace app\models;


use \Yii;

class Process{
    private $pid;
    private $command;
    public function __construct(){

    }
    public function runCom($command){
        $this->command=$command;
        exec($command ,$op);
        $this->pid = (int)$op[0];
    }

    public function getCommand(){
        return $this->command;
    }
    public function setPid($pid){
        $this->pid = $pid;
    }
    public function getPid(){
        return $this->pid;
    }

    public function status(){
        $command = 'ps -p '.$this->pid;
        exec($command,$op);
        if (!isset($op[1]))return false;
        else return true;
    }

    public function start(){
        if ($this->command != '')$this->runCom();
        else return true;
    }

    public function stop(){
        $command = 'kill '.$this->pid;
        exec($command);
        if ($this->status() == false)return true;
        else return false;
    }
    public function writeInfo($data){
        $json=json_encode($data);
        $file=Yii::getAlias('@runtime').'/files/process.json';
        $f=fopen($file,"w+");
        fwrite($f,$json);
        fclose($f);
    }
    public function getInfo(){
        $file=Yii::getAlias('@runtime').'/files/process.json';
        $f=fopen($file,"r");
        $json=fread($f,filesize($file));
        $data=json_decode($json,true);
        fclose($f);
        return $data;
    }
}



