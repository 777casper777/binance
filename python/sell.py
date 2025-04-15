# -*- coding: utf-8 -*-
from core import *
import time
from binance_api import Binance
import random
import logging
import math


buy_id_list=[]
#----------------------------------------------------------------------------------------------------------
#выборка всех кандидатов на продажу
def get_for_sell():
    sql = "SELECT * FROM " + config['table_buy'] + " WHERE was_sell='0'"
    cur = sql_query(sql)
    if cur.rowcount < 1:
        return False
    else:
        return cur
#----------------------------------------------------------------------------------------------------------
#получение тек.курса валюты по отношению к btc
def get_current_btc(currency):
    bot = Binance(
        API_KEY=config['api_key'],
        API_SECRET=config['secret_key']
    )
    response=bot.tickerPrice(
        symbol=currency+'BTC'
    )
    return response
#----------------------------------------------------------------------------------------------------------
def get_max_id(table):
    sql="SELECT MAX(id) as max FROM "+table
    cur=sql_query(sql)
    if cur.rowcount<1:
        return False
    else:
        for row in cur:
            return row['max']
#----------------------------------------------------------------------------------------------------------
def sell_api(currency,quantity):
    bot = Binance(
        API_KEY=config['api_key'],
        API_SECRET=config['secret_key']
    )
    result = {}
    if config['test_script'] == '1':
        buy=bot.testOrder(
            symbol=currency + "BTC",  # пара
            recvWindow=config['recvWindow'],
            # кол-во миллисекунд, которое прибавляется к timestamp и формирует окно действия запроса (см. выше). По умолчанию 5000.
            side='SELL',  # тип ордера (BUY либо SELL)
            type='MARKET',
            # тип ордера (LIMIT, MARKET, STOP_LOSS, STOP_LOSS_LIMIT, TAKE_PROFIT, TAKE_PROFIT_LIMIT, LIMIT_MAKER)
            #timeInForce='GTC',
            # (GTC, IOC, FOK). По умолчанию GTC.
            # GTC (Good Till Cancelled) – ордер будет висеть до тех пор, пока его не отменят.
            # IOC (Immediate Or Cancel) – Будет куплено то количество, которое можно купить немедленно. Все, что не удалось купить, будет отменено.
            # FOK (Fill-Or-Kill) – Либо будет куплено все указанное количество немедленно, либо не будет куплено вообще ничего, ордер отменится.
            quantity=quantity,  # количество к покупке
            # price=0.1  # цена
        )
        #print("Test Order buy")
        #print(buy)
        # уже есть словарь
        if 'code' in buy:
            result['error'] = '1'
            result['code'] = buy['code']
            msg=buy['msg']
            result['msg'] = msg.replace("'","")
        else:
            result['error'] = '0'
            result['status'] = 'NEW'
            result['orderId'] = random.randint(0, 10000)

        return result
    #боевой режим
    else:
        buy = bot.createOrder(
            symbol=currency + "BTC",  # пара
            recvWindow=5000,
            # кол-во миллисекунд, которое прибавляется к timestamp и формирует окно действия запроса (см. выше). По умолчанию 5000.
            side='BUY',  # тип ордера (BUY либо SELL)
            type='MARKET',
            # тип ордера (LIMIT, MARKET, STOP_LOSS, STOP_LOSS_LIMIT, TAKE_PROFIT, TAKE_PROFIT_LIMIT, LIMIT_MAKER)
            #timeInForce='GTC',
            # (GTC, IOC, FOK). По умолчанию GTC.
            # GTC (Good Till Cancelled) – ордер будет висеть до тех пор, пока его не отменят.
            # IOC (Immediate Or Cancel) – Будет куплено то количество, которое можно купить немедленно. Все, что не удалось купить, будет отменено.
            # FOK (Fill-Or-Kill) – Либо будет куплено все указанное количество немедленно, либо не будет куплено вообще ничего, ордер отменится.
            quantity=quantity,  # количество к покупке
            # price=0.1  # цена
        )
        if 'code' in buy:
            result['error'] = '1'
            result['code'] = buy['code']
            msg=buy['msg']
            result['msg'] = msg.replace("'","")
        else:
            result['error'] = '0'
            result['status'] = buy['status']
            result['orderId'] = buy['orderId']

    return result
#------------------------------------------------------------------------------------------
def do_history_sells(buy_id, currency, price, history_sells, date_sell_currency):
     if if_exist_history_sells(buy_id,price,history_sells,date_sell_currency)==False:
        data_history = [
         ['buy_id', str(buy_id)],
         ['currency', currency],
         ['price', price],
         ['history_sells', history_sells],
         ['date', date_sell_currency],
        ]
        cur=insert_db(config['table_history_sells'], data_history)
#------------------------------------------------------------------------------------------
def do_sell(news_id,buy_id,cause,currency,btc,price,quantity_btc,quantity_price,quantity_price_commission,amount_binance_buy,amount_dollar_binance_buy,date):
    # btc- цена валюты при покупке
    quantity_binance=math.ceil(quantity_price_commission)
    amount = btc * quantity_price_commission
    amount_binance = btc * quantity_binance
    amount_dollar_binance = get_btc() * amount_binance
    #profit= btc_usd*(amount_binance-amount_binance_buy)
    #profit_commision = btc_usd * (amount_dollar_binance-amount_dollar_binance_buy)
    profit= float(config['btc_usd'])*(price*quantity_price-btc*quantity_btc)
    profit_commision = float(config['btc_usd'])*(price*quantity_price_commission-btc*quantity_btc)

    sell = sell_api(currency, quantity_binance)
    time.sleep(2)
    if sell['error'] == '0':
        status = sell['status']
        code = ''
        msg = ''
        order_id = sell['orderId']
    else:
        status = 'error'
        code = sell['code']
        msg = sell['msg']
        order_id = 0
    data_sell = [
        ['news_id', str(news_id)],
        ['buy_id', str(buy_id)],
        ['currency', currency],
        ['btc', btc],
        ['price', price],
        ['quantity_btc', quantity_btc],
        ['quantity_price', quantity_price],
        ['quantity_price_commission', quantity_price_commission],
        ['quantity_binance', quantity_binance],
        ['amount', amount],
        ['amount_binance', amount_binance],
        ['amount_dollar_binance', amount_dollar_binance],
        ['profit', profit],
        ['profit_commission', profit_commision],
        ['cause', cause],
        ['date', date],
        ['status', status],
        ['code', code],
        ['msg', msg],
        ['order_id', order_id],
    ]
    insert_db(config['table_sells'], data_sell)
    if config['test_script']==True:
     data_update=[
        ['was_sell',1]
      ]
    else:
        data_update = [
            ['was_sell', 1]
        ]
    update_db(config['table_buy'],data_update,buy_id)
    print(" Add sell with buy_id = " + str(buy_id))
    logging.debug(" Add sell with buy_id = " + str(buy_id))

#------------------------------------------------------------------------------------------
def if_exist_currency_sell(buy_id,currency):
      sql = "SELECT id FROM " + config['table_sells'] + " WHERE buy_id='" + str(buy_id) + "'"
      cur = sql_query(sql)
      if cur.rowcount < 1:
        return False
      else:
        for row in cur:
            return row['id']
#------------------------------------------------------------------------------------------
def if_exist_history_sells(buy_id,price,history_sells,date):
      sql = "SELECT id FROM " + config['table_history_sells'] + " WHERE buy_id='" + str(buy_id) + "' AND price='" + str(price)+ "' AND date='" + str(date)+"' AND history_sells='" + str(history_sells)+"'"
      cur = sql_query(sql)
      if cur.rowcount < 1:
        return False
      else:
        for row in cur:
            return row['id']
#------------------------------------------------------------------------------------------
# поиск продажи
def find_for_sell(sell_name,news_id,buy_id,currency,btc,amount_binance_buy,amount_dollar_binance_buy):
    #if buy_id in buy_id_list:
    #    print(" Sell with buy_id " + str(buy_id) + " exists ")
    #    print(buy_id_list)
    #    return True
    #buy_id_list.append(buy_id)
    if if_exist_currency_sell(buy_id, str(currency))!=False:
        return True
    start_time = time.clock()
    delta_time = time.clock() - start_time
    # начальное состояние валюты
    current_price=0
    #рост валюты
    currency_growth=False
    # если в течении времени не определились
    cause = 'Не определена'
    history_sells = 0
    quantity_btc = round(float(config['buy_limit']) / float(btc), 5)
    while delta_time < int(config['max_seconds_sell']):
        time.sleep(1)
        # если первый заход
        if current_price==0:
            current_price=btc
        response = get_current_btc(currency)
        try:
         #текущее состояние валюты
         price = float(response['price'])
        except:
            continue
        quantity_price =round(float(config['buy_limit']) / float(price),5)
        quantity_price_commission = round(float(config['buy_limit']) / float(price) - (float(config['commission']) * float(config['buy_limit']) / float(price) / 100), 5)
        print("Work " + sell_name+';'+ str(price)+';'+str(delta_time) )
        date_sell_currency = time.strftime('%Y-%m-%d %H:%M:%S')
        delta = float(config['percent_to_sell'])*btc / 100
        # если упало на 3%, то...
        if current_price-price > delta:
            #если до спада был рост, то продаем
          if currency_growth==True:
              cause = 'Валюта росла и упала на ' + config['percent_to_sell'] + " % "
          else:
           cause = 'Валюта упала на '+config['percent_to_sell']+" % "
          history_sells=1
          do_history_sells(buy_id, currency, price,history_sells, date_sell_currency)
          do_sell(news_id,buy_id,cause,currency,btc,price,quantity_btc,quantity_price,quantity_price_commission,amount_binance_buy,amount_dollar_binance_buy, date_sell_currency)
          return True
        else:
         # если есть рост, то ждем пика
         currency_growth=True
         print('Currency is growth!')
         do_history_sells(buy_id, currency, price, history_sells, date_sell_currency)
        delta_time = time.clock() - start_time
    cause = 'Валюта продана по истечению '+str(config['max_seconds_sell'])+' сек.'
    history_sells = 1
    do_history_sells(buy_id, currency, price, history_sells, date_sell_currency)
    do_sell(news_id, buy_id, cause, currency, btc, price, quantity_btc, quantity_price, quantity_price_commission,amount_binance_buy, amount_dollar_binance_buy, date_sell_currency)

#----------------------------------------------------------------------------------------------------------
'''''
def main_sell():
 for_sell=get_for_sell()
 if for_sell!=False:
  for element in for_sell:
     buy_id=element['id']
     currency=element['currency']
     btc = float(element['btc'])
     thread_name = "Thread_sell_" + currency
     try:
        t = threading.Thread(target=find_for_sell, name=thread_name, args=(thread_name,buy_id,currency,btc))
        t.start()
     except:
        print("Some error in Thread:" + thread_name)
        logging.error("Some error in Thread:" + thread_name)

 else:
      print("No dates to selling!")
'''''
'''''
def main_sell():
 for_sell=get_for_sell()
 if for_sell!=False:
   for element in for_sell:
      buy_id=element['id']
      currency=element['currency']
      btc = float(element['btc'])
      sell_name = "Sell_" + currency
      find_for_sell(sell_name,buy_id,currency,btc)
 else:
      print("No dates to selling!")
'''''
#----------------------------------------------------------------------------------------------------------

#sys.exit(1)
#sys.exit(1)
#print(buy_id_list)
#buy_id_list.clear()
#while True:
# time.sleep(1)
# main_sell()
