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
    <h1>Продажи</h1>
    <table width="100%" class="table table-striped">
        <thead>
        <tr>
            <th>Ид.</th>
            <th>Ид. покупки</th>
            <th>Валюта</th>
            <th>BTC</th>
            <th>Колл.</th>
            <th>Сумма(BTC)</th>
            <th>Сумма($)</th>
            <th>Дата</th>
            <th>Прибыль</th>
            <th>Причина</th>
            <th>Статус</th>
            <th>Код</th>
            <th>Сообщение</th>
            <th>Order_id</th>
            <th>Действие</th>
        </tr>
        </thead>

        <?
        foreach ($sells as $value) {
            ?>
            <tr>
                <td><div class="type"> <?= Html::a($value->id, ['site/sells', 'id' => $value->id]) ?></div></td>
                <td><div class="type"> <?= Html::a($value->buy_id, ['site/buy', 'id' => $value->buy_id]) ?></div></td>
                <td><?= $value->currency?></td>
                <td><?= $value->btc?></td>
                <td><?= $value->quantity_binance?></td>
                <td><?= $value->amount_binance?></td>
                <td><?= $value->amount_dollar_binance?></td>
                <td><?= $value->date?></td>
                <td><?= $value->profit_commission?></td>
                <td><?= $value->cause?></td>
                <td><?= $value->status?></td>
                <td><?= $value->code?></td>
                <td><?= $value->msg?></td>
                <td><?= $value->order_id?></td>
                <td><div class="type"> <?= Html::a('История', ['site/history_sells', 'id' => $value->buy_id]) ?></div></td>

            </tr>
            <?
        }
        ?>

    </table>

<?= LinkPager::widget(['pagination' => $pagination]) ?>