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
    <h1>Покупки</h1>
    <table width="100%" class="table table-striped">
        <thead>
        <tr>
            <th>Ид. новости</th>
            <th>Валюта</th>
            <th>Процент</th>
            <th>BTC</th>
            <th>Колл.</th>
            <th>Сумма(BTC)</th>
            <th>Сумма($)</th>
            <th>Дата</th>
            <th>Статус</th>
            <th>Код</th>
            <th>Сообщение ошибки</th>
            <th>Order_id</th>
        </tr>
        </thead>

        <?
        foreach ($buy as $value) {
            ?>
            <tr>
                <td><div class="type"> <?= Html::a($value->id, ['site/news', 'id' => $value->id]) ?></div></td>
                <td><?= $value->currency?></td>
                <td><?= $value->percent?></td>
                <td><?= $value->btc?></td>
                <td><?= $value->quantity_binance?></td>
                <td><?= $value->amount_binance?></td>
                <td><?= $value->amount_dollar_binance?></td>
                <td><?= $value->date?></td>
                <td><?= $value->status?></td>
                <td><?= $value->code?></td>
                <td><?= $value->msg?></td>
                <td><?= $value->order_id?></td>

            </tr>
            <?
        }
        ?>

    </table>

<?= LinkPager::widget(['pagination' => $pagination]) ?>