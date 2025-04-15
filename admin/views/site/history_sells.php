<?php
/**
 * Created by PhpStorm.
 * User: Vladimir
 * Date: 03.05.2018
 * Time: 18:35
 */
use yii\helpers\Html;
use yii\widgets\LinkPager;
?>
    <h1>История продаж</h1>
    <table width="100%" class="table table-striped">
        <thead>
        <tr>
            <th>Ид.</th>
            <th>Ид. покупки</th>
            <th>Валюта</th>
            <th>Цена(к BTC)</th>
            <th>Купили(да/нет)</th>
            <th>Дата</th>
        </tr>
        </thead>

        <?
        foreach ($history_sells as $value) {
            ?>
            <tr>
                <td><?= $value->id?></td>
                <td><div class="type"> <?= Html::a($value->buy_id, ['site/news', 'id' => $value->buy_id]) ?></div></td>
                <td><?= $value->currency?></td>
                <td><?= $value->price?></td>
                <td><?= $value->history_sells?></td>
                <td><?= $value->date?></td>
            </tr>
            <?
        }
        ?>

    </table>

<?= LinkPager::widget(['pagination' => $pagination]) ?>