<?php
/**
 * Created by PhpStorm.
 * User: Vladimir
 * Date: 03.05.2018
 * Time: 16:03
 */
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\LinkPager;
?>

<h1>Новости</h1>
<?= Html::beginForm(['site/news'],'post',['class'=>'form-inline','style'=>'margin-bottom:30px;'])?>
    <div class="form-group">
        <?= Html::label('От', 'date_for', ['class' => '']) ?>
        <?= Html::input('text', 'date_for', $date_for, ['id'=>'datepicker_for','class' => 'form-control']) ?>
    </div>
    <div class="form-group">
        <?= Html::label('До', 'date_to', ['class' => '']) ?>
        <?= Html::input('text', 'date_to', $date_to, ['id'=>'datepicker_to','class' => 'form-control']) ?>
    </div>
    <?= Html::submitButton('Показать', ['class' => 'btn btn-default']) ?>
<?= Html::endForm()?>

<table width="100%" class="table table-striped">
 <thead>
   <tr>
     <th>id</th>
     <th>url</th>
     <th>url для новости</th>
     <th>Дата</th>
     <th>Тип</th>
     <th>Дейстивие</th>
   </tr>
 </thead>

<?
foreach ($news as $value) {
    ?>
    <tr>
        <td><div class="id"><?= $value->id?></div></td>
        <td><?= $value->url?></td>
        <td><?= $value->url_news?></td>
        <td><?= $value->date?></td>
        <td>
            <div class="type"> <?= Html::a('Покупка', ['site/buy', 'id' => $value->id]) ?></div>
            <div class="type"> <?= Html::a('Продажа', ['site/sells', 'id' => $value->id]) ?></div>
        </td>
        <td><div class="type"> <?= Html::a('История покупок', ['site/history_buy', 'id' => $value->id]) ?></div></td>
    </tr>
    <?
    }
?>

</table>

<?= LinkPager::widget(['pagination' => $pagination]) ?>