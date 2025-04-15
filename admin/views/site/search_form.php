<?php
/**
 * Created by PhpStorm.
 * User: Vladimir
 * Date: 07.05.2018
 * Time: 12:18
 */
use yii\helpers\Html;
?>

<? Html::beginForm(['site/search_news'],'post','')?>
    <table>
        <tr>
            <td>От:
                <?= Html::input('text', 'date_for', $date_for, ['id'=>'datepicker_for','class' => '']) ?>
            </td>
            <td>До:
                <?= Html::input('text', 'date_to', $date_to, ['id'=>'datepicker_to','class' => '']) ?>
            </td>
            <td>
                <?= Html::submitButton('Показать', ['class' => '']) ?>
            </td>
        </tr>
</table>
<? Html::endForm()?>
