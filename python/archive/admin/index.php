<?php
session_start();
if(!isset($_SESSION['authorized'])) {
    header('Location: login.php');
}

require_once('helper.php');
Class Logs extends Helper
{
    public $config_bd = array(
        'server' => 'localhost', //91.217.85.18
        'user_name' => 'twitter',
        'user_pass' => '7777777mv!',
        'bd_name' => 'twitter');
    public $table_name="twitter";

    public $dates_post=array(
        'day'=>'За день',
        'week'=>'За неделю',
        'month'=>'За месяц'
    );

    public function get_dates_by_date($date_for,$date_to,$site,$type)
    {
      $table=$this->table_name;
      if($site=="Все"){
        $sql="SELECT * FROM $table WHERE date >=' $date_for' AND date <=' $date_to' ORDER BY date DESC ";
      }
      if($type<>"all" ) {
          $fields="site,date,insert_torrents,".$type.",";
          $errors=$type."_errors";
          $all_fields=$fields.$errors;
          $site_search="http://".$site;
          $sql="SELECT $all_fields FROM $table WHERE date >=' $date_for' AND date <=' $date_to' AND site='$site_search' ORDER BY date DESC ";
      }else{
          $site_search="http://".$site;
          $sql="SELECT * FROM $table WHERE date >=' $date_for' AND date <=' $date_to' AND site='$site_search' ORDER BY date DESC ";
      }
      if($site=="Все" && $type=="all"){
          $sql="SELECT * FROM $table WHERE date >=' $date_for' AND date <=' $date_to'  ORDER BY date DESC ";
      }
      if($site=="Все" && $type<>"all"){
            $fields="site,date,insert_torrents,".$type.",";
            $errors=$type."_errors";
            $all_fields=$fields.$errors;
            $sql="SELECT $all_fields FROM $table WHERE date >=' $date_for' AND date <=' $date_to'  ORDER BY date DESC ";
        }
      $dates=$this->select_bd($sql);
      return $dates;

    }
    public function get_dates_by_period($period,$site,$type){
        $table=$this->table_name;
        $fields="*";
        $site="http://".$site;
        switch ($period){
            case 'day': $sql="SELECT $fields FROM $table WHERE date >= CURDATE() AND site='$site' ";break;
            case 'week':$sql="SELECT $fields FROM $table WHERE date >= DATE_SUB(CURRENT_DATE, INTERVAL 7 DAY) ";break;
            case 'month':$sql="SELECT $fields FROM $table WHERE date >= DATE_SUB(CURRENT_DATE, INTERVAL 1 MONTH) AND site='$site' ";break;
            default: $sql="SELECT $fields FROM $table WHERE date >= CURDATE() AND site='$site'";break;
        }

        $dates=$this->select_bd($sql);
        return $dates;
    }
    public function parse_dates($dates){

     foreach ($dates as $key=>$value){
          $errors=json_decode($value['errors_logs'],true);
          $value['errors_logs']= $errors;
          $success=json_decode($value['success_logs'],true);
          $value['success_logs']= $success;
      }
      return $dates;
    }

    public function get_sites(){
        $res=array();
        $table=$this->table_name;
        $dates=$this->select_bd("SELECT DISTINCT  url FROM $table ORDER BY url ASC ");
        $post=isset($_POST['site'])? $_POST['site']:'';
        if($post<>'') {
            $res[] = $post;
            if(!in_array('Все',$res)) $res[] = 'Все';
        } else{
         $res[] = 'Все';
        }
        foreach ($dates as $key=>$value){
            $site=str_replace("http://","",$value['site']);
            if($post<>$site){
                $res[]=$site;
            }
        }
        return $res;
    }
    public function get_week_dates(){
      $week_time=60*60*24*7;
      $date_to=time()+3600*24;
      $date_for=$date_to-$week_time;
      $res=array('date_for'=>date("d-m-Y",$date_for),"date_to"=>date("d-m-Y",$date_to));
      return $res;
    }
    public function get_types(){
        $dates=$this->types;
        $post=isset($_POST['type'])? $_POST['type']:'';
        if($post<>'') {
            $res[$_POST['type']] = $dates[$_POST['type']];
            if(!in_array('Все',$res)) $res['all'] = 'Все';
        } else{
            $res['all'] = 'Все';
        }
        foreach ($dates as $key=>$value){
            if($post<>$value){
                $res[$key]=$value;
            }
        }
        return $res;
    }

//----------------------------------------------------------------------------
}
$log=new Logs();
$log->conect_bd($log->config_bd);
ob_start();
if(isset($_POST['date_to'])& isset($_POST['date_for'])){
    $date_for_post=$_POST['date_for'];
    $date_to_post=$_POST['date_to'];
    $arr=explode('-',$date_for_post);
    $date_for=$arr[2]."-".$arr[1]."-".$arr[0];
    $arr=explode('-',$date_to_post);
    $date_to=$arr[2]."-".$arr[1]."-".$arr[0];
    $log=new Logs();
    $log->conect_bd($log->config_bd);
    $dates=$log->get_dates_by_date($date_for,$date_to,$site,$type);
    $dates_post=$log->dates_post;
    $sites=$log->get_sites();
    if($type=='all')include "logs.html";
     else
         include "logs_type.html";

}else{
    $sites=$log->get_sites();
    $dates=$log->get_dates_by_period("week","*","*");
    $default_date=$log->get_week_dates();
    $date_for_post=$default_date['date_for'];
    $date_to_post=$default_date['date_to'];
    include "logs.html";

}
$content=ob_get_contents();
ob_end_clean();
include "logs_form.html";
$log->close_bd();


