<?php
/**
 * Created by PhpStorm.
 * User: Vladimir
 * Date: 11.05.2018
 * Time: 17:00
 */
use yii\helpers\Html;
use yii\widgets\ActiveForm;

?>
<div class="row">

<?
$form = ActiveForm::begin([
    //'id' => 'login-form',
    //'options' => ['class' => 'form-horizontal config_form'],
]);
?>

    <div class="checkbox_config">
        <?= Html::a($message,['site/config', 'type' => $status],['class'=>'btn btn-success','role'=>'button','style'=>'margin-bottom:10px;']) ?>
        <?= $form->field($model, 'test_script')->checkbox([ 'label'=>'Тестовый режим','checked ' => $config['test_script']  ]) ?>
    </div>
    <div class="col-xs-4">

        <?= $form->field($model, 'api_key')->label('API key Binance')->textInput(['value'=>$config['api_key']]) ?>
        <?= $form->field($model, 'secret_key')->label('API secret key Binance')->textInput(['value'=>$config['secret_key']]) ?>
        <?= $form->field($model, 'url_twitter')->label('URL twitter')->textInput(['value'=>$config['url_twitter']]) ?>
        <?= $form->field($model, 'url_currency')->label('URL мониторинга валюты')->textInput(['value'=>$config['url_currency']]) ?>
        <?= $form->field($model, 'btc_usd')->label('Отношение USD к BTC(если не сработает онлайн)')->textInput(['value'=>$config['btc_usd']]) ?>
        <?= $form->field($model, 'max_seconds')->label('Макс. время мониторинга валюты(сек.)')->textInput(['value'=>$config['max_seconds']]) ?>
        <?= $form->field($model, 'max_seconds_sell')->label('Макс. время поиска для продажи(сек.)')->textInput(['value'=>$config['max_seconds_sell']]) ?>
        <?= $form->field($model, 'percent_to_buy')->label('Процент покупки(%)')->textInput(['value'=>$config['percent_to_buy']]) ?>
        <?= $form->field($model, 'percent_to_sell')->label('Процент продажи(%)')->textInput(['value'=>$config['percent_to_sell']]) ?>
        <?= $form->field($model, 'buy_limit')->label('Лимит при покупке(quantity)')->textInput(['value'=>$config['buy_limit']]) ?>
        <?= $form->field($model, 'commission')->label('Процент комиссии(%)')->textInput(['value'=>$config['commission']]) ?>
        <?= $form->field($model, 'recvWindow')->label('Время ожидания API binance(сек.)')->textInput(['value'=>$config['recvWindow']]) ?>
    </div>
    <div class="col-xs-4">
        <?= $form->field($model, 'host')->label('Сервер Базы данных')->textInput(['value'=>$config['host']]) ?>
        <?= $form->field($model, 'db')->label('База данных') ->textInput(['value'=>$config['db']])?>
        <?= $form->field($model, 'user')->label('Логин пользователя')->textInput(['value'=>$config['user']]) ?>
        <?= $form->field($model, 'passwd')->label('Пароль пользователя')->textInput(['value'=>$config['passwd']]) ?>
        <?= $form->field($model, 'table_news')->label('Таблица новостей')->textInput(['value'=>$config['table_news']]) ?>
        <?= $form->field($model, 'table_buy')->label('Таблица покупок')->textInput(['value'=>$config['table_buy']]) ?>
        <?= $form->field($model, 'table_sells')->label('Таблица продаж')->textInput(['value'=>$config['table_sells']]) ?>
        <?= $form->field($model, 'table_history_buy')->label('Таблица истории покупок')->textInput(['value'=>$config['table_history_buy']]) ?>
        <?= $form->field($model, 'table_history_sells')->label('Таблица истории продаж')->textInput(['value'=>$config['table_history_sells']]) ?>
        <?= $form->field($model, 'config_file')->label('Путь к файлу настроек') ->textInput(['value'=>$config['config_file']])?>
        <?= $form->field($model, 'proxy_file')->label('Путь к файлу прокси') ->textInput(['value'=>$config['proxy_file']])?>
        <?= $form->field($model, 'log_file')->label('Путь к файлу логов') ->textInput(['value'=>$config['log_file']])?>


    </div>
</div>
<div class="form-group">
    <?= Html::submitButton('Сохранить', ['class' => 'btn btn-primary']) ?>
</div>


<? ActiveForm::end();
?>