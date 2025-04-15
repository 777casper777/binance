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
    <h1>История покупок</h1>
    <table width="100%" class="table table-striped">
        <thead>
        <tr>
            <th>Ид</th>
            <th>Ид. новости</th>
            <th>Валюта</th>
            <th>Процент</th>
            <th>Цена(к BTC)</th>
            <th>Купили(да/нет)</th>
            <th>Дата</th>
        </tr>
        </thead>

        <?
        foreach ($history_buy as $value) {
            ?>
            <tr>
                <td><?= $value->id?></td>
                <td><div class="id"> <?= Html::a($value->news_id, ['site/news', 'id' => $value->news_id]) ?></div></td>
                <td><?= $value->currency?></td>
                <td><?= $value->percent?></td>
                <td><?= $value->price?></td>
                <td><?= $value->history_buy?></td>
                <td><?= $value->date?></td>
            </tr>
            <?
        }
        ?>

    </table>

<?= LinkPager::widget(['pagination' => $pagination]) ?>