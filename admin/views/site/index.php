<?php

/* @var $this yii\web\View */

$this->title = 'My Yii Application';
?>
<div class="site-index">

    <div class="jumbotron">
        <?php
         if (Yii::$app->user->isGuest) {
             ?>
             <h1>Вход в Админ панель Binance!</h1>
             <?php
         }else{
             ?>
             <h1>Добро пожаловать в Binance!</h1>
         <?php
         }
          ?>

    </div>


</div>
