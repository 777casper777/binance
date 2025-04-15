# -*- coding: utf-8 -*-
#from core import *
from sell import *
import time
import threading
from binance_api import Binance
import random
import logging

url=[
   ['https://twitter.com/ethereum', 'ETH'],
   ['https://twitter.com/Ripple', 'XRP'],
   ['https://twitter.com/LitecoinProject','LTC'],
   ['https://twitter.com/EOS_io','EOS'],
   ['https://twitter.com/CardanoStiftung', 'ADA'],
   ['https://twitter.com/StellarOrg','XLM'],
   ['https://twitter.com/NEO_Blockchain','NEO'],
   ['https://twitter.com/Tronfoundation','TRX'],
   ['https://twitter.com/iotatoken','IOTA'],
   ['https://twitter.com/monerocurrency','XMR'],
   ['https://twitter.com/Dashpay','DASH'],
   ['https://twitter.com/NEMofficial','XEM'],
   ['https://twitter.com/eth_classic','ETC'],
   ['https://twitter.com/vechainofficial','VEN'],
   ['https://twitter.com/QtumOfficial','QTUM'],
   ['https://twitter.com/omise_go','OMG'],
   ['https://twitter.com/LiskHQ','LSK'],
   ['https://twitter.com/helloiconworld','ICX'],
   ['https://twitter.com/vergecurrency','XVG'],
   ['https://twitter.com/bitcoingold','BTG'],
   ['https://twitter.com/nanocurrency','NANO'],
   ['https://twitter.com/zcashco','ZEC'],
   ['https://twitter.com/OntologyNetwork','ONT'],
   ['https://twitter.com/steemit','STEEM'],
   ['https://twitter.com/BitPopulous','PPT'],
   ['https://twitter.com/DigixGlobal','DGD'],
   ['https://twitter.com/bitshares','BTS'],
   ['https://twitter.com/stratisplatform','STRAT'],
   ['https://twitter.com/aeternity','AE'],
   ['https://twitter.com/0xProject','ZRX'],
   ['https://twitter.com/wanchain_org','WAN']
   ]
def if_exist_news(url,theme):
      sql="SELECT id FROM " + config['table_news'] + " WHERE url='" + url + "' AND " + "theme='"+theme+"'"
      cur=sql_query(sql)
      if cur.rowcount < 1:
          return False
      else:
          for row in cur:
              return row['id']
#------------------------------------------------------------------------------------------------------------
# поиск валюты с процентом >1 для новости
def if_exist_currency(news_id,currency,percent,date):
      sql="SELECT id FROM " + config['table_buy'] + " WHERE news_id='" + news_id + "' AND " + "currency='"+currency+"'"+ " AND " + "percent='"+percent+"'"+ " AND " + "date='"+date+"'"
      cur=sql_query(sql)
      if cur.rowcount < 1:
          return False
      else:
          for row in cur:
              return row['id']
#------------------------------------------------------------------------------------------------------------
def buy_api(currency,quantity):
    global config
    bot = Binance(
        API_KEY=config['api_key'],
        API_SECRET=config['secret_key']
    )
    result = {}
    if config['test_script']=="1":

        buy=bot.testOrder(
            symbol=currency + "BTC",  # пара
            recvWindow=config['recvWindow'],
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
        # уже есть словарь
        if 'code' in buy:
            result['error'] = '1'
            result['code'] = buy['code']
            result['order_id'] = -1
            msg = buy['msg']
            result['msg'] = msg.replace("'", "")
        else:
            result['error'] = '0'
            result['status'] = 'NEW'
            result['orderId'] = random.randint(0, 10000)
    #боевой режим
    else:
        buy = bot.createOrder(
            symbol=currency + "BTC",  # пара
            recvWindow=config['recvWindow'],
            # кол-во миллисекунд, которое прибавляется к timestamp и формирует окно действия запроса (см. выше). По умолчанию 5000.
            side='BUY',  # тип ордера (BUY либо SELL)
            type='MARKET',
            # тип ордера (LIMIT, MARKET, STOP_LOSS, STOP_LOSS_LIMIT, TAKE_PROFIT, TAKE_PROFIT_LIMIT, LIMIT_MAKER)
            # timeInForce='GTC',
            # (GTC, IOC, FOK). По умолчанию GTC.
            # GTC (Good Till Cancelled) – ордер будет висеть до тех пор, пока его не отменят.
            # IOC (Immediate Or Cancel) – Будет куплено то количество, которое можно купить немедленно. Все, что не удалось купить, будет отменено.
            # FOK (Fill-Or-Kill) – Либо будет куплено все указанное количество немедленно, либо не будет куплено вообще ничего, ордер отменится.
            quantity=quantity
            # price=0.1  # цена
        )
        #buy=buy.replace("createOrder ","")
        #parsed_string = json.loads(buy)
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

#------------------------------------------------------------------------------------------------------------
def get_news_id(url,date):
    sql = "SELECT id FROM " + config['table_news'] + " WHERE url='" + url + "'" +" AND date='"+date+"'"
    cur=sql_query(sql)
    if cur.rowcount < 1:
        return False
    else:
      for row in cur:
         return row['id']
#------------------------------------------------------------------------------------------------------------
def if_exist_history_buy(news_id,percent,history_buy,date):
    sql = "SELECT id FROM " + config['table_history_buy'] + " WHERE news_id='" + str(news_id) + "' AND percent='" + str(percent) + "' AND date='" + str(date) + "'"+ " AND history_buy='" + str(history_buy) + "'"
    cur = sql_query(sql)
    if cur.rowcount < 1:
        return False
    else:
        for row in cur:
            return row['id']
#------------------------------------------------------------------------------------------------------------
def do_history_buy(news_id,currency,price,percent,history_buy, date):
   if if_exist_history_buy(news_id,percent,history_buy,date) == False:
    data_history = [
        ['news_id', str(news_id)],
        ['currency', currency],
        ['price', price],
        ['percent', percent],
        ['history_buy', history_buy],
        ['date', date],
    ]
    cur = insert_db(config['table_history_buy'], data_history)
    logging.debug("history_buy:" + time.strftime('%Y-%m-%d %H:%M:%S'))
#------------------------------------------------------------------------------------------------------------
# мониторинг сайта валют до определенного времени
def parce_currency(currency_thread_name,url,currency,date_add_news):
    #установим отсчет времени
    start_time = time.clock()
    #определим разницу во времени
    delta_time = time.clock() - start_time
    while delta_time<int(config['max_seconds']):
        dates = get_currency_percent()
        quantity=round(float(config['buy_limit']) / float(dates[currency]['btc']),3)
        quantity_binance = math.ceil(quantity)
        percent=float(dates[currency]['percent'])
        btc = float(dates[currency]['btc'])
        amount=btc*quantity
        amount_binance=btc*quantity_binance
        amount_dollar_binance=get_btc()*amount_binance
        date_add_buy_currency = time.strftime('%Y-%m-%d %H:%M:%S')
        print ("Work " + currency_thread_name + " monitoring currency " + str(delta_time)+";"+str(dates[currency])+"%")
        news_id = get_news_id(url, date_add_news)
        history_buy = 0
        do_history_buy(news_id, currency, btc,percent, history_buy, date_add_buy_currency)
        if percent > float(config['percent_to_buy']):
            if if_exist_currency(str(news_id), str(currency), str(percent), str(date_add_buy_currency))==False:
                history_buy = 1
                do_history_buy(news_id, currency, btc, percent, history_buy, date_add_buy_currency)
                buy=buy_api(currency,quantity_binance)
                if buy['error'] =='0':
                    status=buy['status']
                    code = ''
                    msg=''
                    order_id = buy['orderId']
                else:
                    status = 'error'
                    code = buy['code']
                    msg = buy['msg']
                    order_id = 0
                data_buy = [
                    ['news_id', str(news_id)],
                    ['currency', currency],
                    ['percent', percent],
                    ['btc', btc],
                    ['quantity', quantity],
                    ['quantity_binance', quantity_binance],
                    ['amount', amount],
                    ['amount_binance', amount_binance],
                    ['amount_dollar_binance', amount_dollar_binance],
                    ['date', date_add_buy_currency],
                    ['status', status],
                    ['code', code],
                    ['msg', msg],
                    ['order_id', order_id],
                    ['was_sell', 0],
                ]
                buy_currency = insert_db(config['table_buy'], data_buy)
                buy_id = buy_currency.lastrowid
                if status=='error':
                   return True
                else:
                   print (" Add currency with news_id = " + str(news_id))
                   logging.debug(" Add currency with news_id = " + str(news_id)+":"+date_add_buy_currency)
                   thread_name = "Thread_sell_" + currency
                   t_sell = threading.Thread(target=find_for_sell, name=thread_name,args=(thread_name,news_id, buy_id, currency, btc,amount_binance,amount_dollar_binance))
                   t_sell.start()
                   return True
            else:
                print ("Exist Currency with news_id = " + str(news_id) )
                return False
        #print delta_time
        delta_time = time.clock() - start_time
#------------------------------------------------------------------------------------------------------------

# получение валют и процентов с сайта валют
#@return Array
def get_currency_percent():
   currency_dictionary = {}
   #html=get_html(url_currency)
   html=get_html_by_proxy(config['url_currency'])
   #if html==False:
   #    print("Error in get html to "+url_currency)
   #    return False
   soup = BeautifulSoup(html, "html.parser")
   rows = soup.findAll('tr')
   for element in rows:
       td=element.findAll('td')
       step=0
       flag=True
       for item in td :
         if flag==True:
          if step==0:
            currency=item['data-order']
          if step==1:
            percent=item['data-order']
          if step==4:
              btc=item['data-order']
              btc=btc.replace("setmyprice('ADA', '', '","").replace("')","")
              currency_dictionary[currency] = {'percent': percent, 'btc': btc}
              flag=False
          step+=1
   return currency_dictionary
#------------------------------------------------------------------------------------------------------------
def parse_chanel(thread_name,url,currency):
    while True:
      #html=get_html(url)
      html=get_html_by_proxy(url)
      if html == False:
          print("Error in get html to " + url)
          continue
          #return False
      #print (html)
      #html = codecs.encode(html,'utf-8')
      #sys.exit(1)
      html = html.replace("\r\n", "").replace("\r", "").replace("\n", "").replace("  ", " ").replace("  ", " ").replace("  ", " ").replace("  ", " ").replace("'", "")
      soup = BeautifulSoup(html,"html.parser")
      try:
        theme = soup.find('div', {'class': "content"}).find('div', {'class': "js-tweet-text-container"}).find('p').text
      except:
        theme = ''
      theme=theme.replace("'", "")
      try:
        url_news =soup.find('div', {'class': "content"}).find('div', {'class': "js-tweet-text-container"}).find('p').find('a')['data-expanded-url']
      except:
        url_news = ''
      if theme == '':
         flag = False
      else:
        flag = True
      exist_news = if_exist_news(url, theme)
      #date_add=datetime.utcnow().strftime('%Y-%m-%d %H:%M:%S.%f')
      date_add = time.strftime('%Y-%m-%d %H:%M:%S')
      #print(date_add)
      data = [
         ['url', url],
         ['theme', theme],
         ['url_news', url_news],
         ['date', date_add]
       ]
      print ("Work:" + thread_name)
      if flag == True:
        if exist_news==False:
          print ("Find news")
          logging.debug("Find news:"+date_add)
          res_twitter = insert_db(config['table_news'], data)
          currency_thread_name=thread_name+"_"+currency
          try:
           currency_thread = threading.Thread(target=parce_currency, name=currency_thread_name, args=(currency_thread_name,url,currency,date_add))
           currency_thread.start()
          except:
              #print("Some error in Thread:"+currency_thread_name)
              logging.error("Some error in Thread:"+currency_thread_name)
        #else:
        #    print ("News exist '"+theme+"'")
#------------------------------------------------------------------------------------------------------------
set_config()
#print(config)
#sys.exit(1)
f = open(config['log_file'], 'w')
f.close()
logging.basicConfig(filename=config['log_file'],level=logging.DEBUG)
logging.getLogger("urllib3").setLevel(logging.WARNING)
logging.debug("Start parser:" + time.strftime('%Y-%m-%d %H:%M:%S'))
i=1
for element in url:
    thread_name="Thread_"+str(i)
    url=element[0]
    currency=element[1]
    try:
     t = threading.Thread(target=parse_chanel,name=thread_name,args=(thread_name,url,currency))
     t.start()
    except:
        print("Some error in Thread:"+thread_name)
        logging.error("Some error in Thread:"+thread_name)
    i+=1