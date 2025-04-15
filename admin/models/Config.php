<?php
/**
 * Created by PhpStorm.
 * User: Vladimir
 * Date: 14.05.2018
 * Time: 11:15
 */

namespace app\models;


use yii\base\Model;

class Config extends Model
{
    public $proxyUser;
    public $proxyPassword;
    public $url_twitter;
    public $url_currency;
    public $url_btc;
    public $test_script;
    # отношение BTC к USD
    public $btc_usd;
    # макс. время для мониторинга при поиске новости
    public $max_seconds;
    # макс. время поиска для продажи
    public $max_seconds_sell;
    #процент для покупки
    public $percent_to_buy;
    # процент роста,спада при котром продаем
    public $percent_to_sell;
    #лимит при покупке к BTC=quantity
    public $buy_limit;
    # комиссия в %
    public $commission;
    # кратность к quantity к LOT_SIZE
    #stepSize=0.01000000
    # округление для LOT_SIZE
    public $lot_size_round;
    public $api_key;
    public $secret_key;
    # время ожидания API binance
    public $recvWindow;
    public $table_prefix;
    public $table_news;
    public $table_buy;
    public $table_sells;
    public $table_history_buy;
    public $table_history_sells;
    #---------------------------------------------------------------------------
    public $log_file;
    public $config_file;
    public $proxy_file;
    #-------------Data base access----------------------------------------------
    # данные передавать в БД лучше в виде строк
    public $host;
    #host = "91.217.85.18"
    #Proxy = "91.217.85.20"
    public $user;
    public $passwd;
    public $db;

    public function rules()
    {
        return [
            [['url_twitter','url_currency','url_btc','test_script','api_key','secret_key','recvWindow'],'required'],
            [['table_news','table_buy','table_sells','table_history_buy','table_history_sells','log_file','config_file','proxy_file'],'required'],
            [['host','user','passwd','db'],'required'],
            ['test_script','boolean'],
            [['btc_usd','percent_to_buy','percent_to_sell','buy_limit','commission'],'double'],
            [['max_seconds','max_seconds_sell','recvWindow'],'integer'],
        ];
    }

}