# -*- coding: utf-8 -*-
from core import *
from bs4 import BeautifulSoup
import time
import threading
reload(sys)
sys.setdefaultencoding('utf-8')

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
   ['https://twitter.com/stratisplatform','STRAT']
]
#------------------------------------------------------------------------------------------------------------
def if_exist_news(cur,url,theme):
      sql="SELECT id FROM " + table_twitter + " WHERE url='" + url + "' AND " + "theme='"+theme+"'"
      sql_query(cur,sql)
      if cur.fetchone() == None:
        return False
      else:
        for row in cur:
          return row[0]
#------------------------------------------------------------------------------------------------------------
def if_exist_currency(cur,twitter_id,currency,percent,date):
      sql="SELECT id FROM " + table_currency + " WHERE twitter_id='" + twitter_id + "' AND " + "currency='"+currency+"'"+ "' AND " + "percent='"+percent+"'"+ "' AND " + "date='"+date+"'"
      sql_query(cur,sql)
      if cur.fetchone() == None:
        return False
      else:
        for row in cur:
          return row[0]
#------------------------------------------------------------------------------------------------------------
def pay_currency(currency,percent):
    print "Pay currency "+ currency+" for  percent"+percent
#------------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------------
def get_twitter_id(cur,url,date):
    sql = "SELECT id FROM " + table_twitter + " WHERE url='" + url + "'" +" AND date='"+date+"'"
    sql_query(cur, sql)
    if cur.fetchone() == None:
        return False
    else:
        for row in cur:
            return row[0]
#------------------------------------------------------------------------------------------------------------
def parce_currency(currency_thread_name,url,theme,date_add):
    #установим отсчет времени
    #определим разницу во времени
    #print "Work "+thread_name +" find currency"
    start_time = time.clock()
    delta_time = time.clock() - start_time
    k=0
    while delta_time<max_seconds:
        dates = get_currency_percent()
        #print dates[currency]
        print "Work " + currency_thread_name + " monitoring currency " + str(delta_time)+";"+str(dates[currency])+"%"
        if dates[currency] > max_percent:
            pay_currency(currency, dates[currency])
            cur=connect_db()
            twitter_id = get_twitter_id(cur, url, date_add)
            added_time = time.strftime('%Y-%m-%d %H:%M:%S')
            data_currency = [
                ['twitter_id', str(twitter_id)],
                ['currency', currency],
                ['percent', str(dates[currency])],
                ['date', date_add],
            ]
            if if_exist_currency(cur, twitter_id, currency, dates[currency], added_time):
                res_currency = insert_db(cur, table_currency, data_currency)
                print " Add currency with twitter_id = " + str(twitter_id)
            else:
                print "Currency with twitter_id = " + str(twitter_id) + " exist"
            cur.close()
        #print delta_time
        delta_time = time.clock() - start_time
        #k+=1

    #------------------------------------------------------------------------------------------------------------
#@return Array
def get_currency_percent():
   html=get_html(url_currency,'')
   try:
    html = html.encode('utf-8')
   except:
       html=html
   currency_dictionary={}
   soup = BeautifulSoup(html)
   rows=soup.find("tbody",{"id":"czRadarTableBody"}).findAll("tr")
   for element in rows:
       td=element.findAll('td')
       step=0
       for item in td :
         if step==0:
          currency=item['data-order']
         if step==1:
          percent=item['data-order']
          break
         step+=1
       currency_dictionary[currency]=float(percent)
   return currency_dictionary
#------------------------------------------------------------------------------------------------------------
def parse_chanel(thread_name,url,currency):
    while True:
      html=get_html(url,'')
      html = html.encode('utf-8')
      html = html.replace("\r\n", "").replace("\r", "").replace("\n", "").replace("  ", " ").replace("  ", " ").replace("  ", " ").replace("  ", " ").replace("'", "")
      soup = BeautifulSoup(html)
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
      cur = connect_db()
      exist_news = if_exist_news(cur, url, theme)
      date_add=time.strftime('%Y-%m-%d %H:%M:%S')
      data = [
         ['url', url],
         ['theme', theme],
         ['url_news', url_news],
         ['date', date_add]
       ]
      print "Work:" + thread_name + " url=" + url
      if flag == True:
        if exist_news==False:
          print "Find news '"+theme+"'"
          res_twitter = insert_db(cur, table_twitter, data)
          currency_thread_name=thread_name+"_"+currency
          currency_thread = threading.Thread(target=parce_currency, name=currency_thread_name, args=(currency_thread_name,url,theme,date_add))
          currency_thread.start()
        else:
            print "News exist '"+theme+"'"

      cur.close()
#------------------------------------------------------------------------------------------------------------
#test parse_currency
i=1
for element in url:
    thread_name="Thread_"+str(i)
    url=element[0]
    currency=element[1]
    #print url+":"+currency
    t = threading.Thread(target=parse_chanel,name=thread_name,args=(thread_name,url,currency))
    t.start()
    i+=1