# -*- coding: utf-8 -*-
from core import *
from bs4 import BeautifulSoup
import re
import time
import datetime
reload(sys)
sys.setdefaultencoding('utf-8')
start_time = time.clock()
list=[

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
def step_3(currency,percent):
    print "Find percent "+ str(percent)+" for  "+currency
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
def get_twitter_id(cur,url,date):
    sql = "SELECT id FROM " + table_twitter + " WHERE url='" + url + "'" +" AND date='"+date+"'"
    sql_query(cur, sql)
    if cur.fetchone() == None:
        return False
    else:
        for row in cur:
            return row[0]
#------------------------------------------------------------------------------------------------------------
def get_theme(html):
    soup = BeautifulSoup(html)
    try:
        theme = soup.find('div', {'class': "content"}).find('div', {'class': "js-tweet-text-container"}).find('p').text
    except:
        theme = ''
    return theme.replace("'","")
#------------------------------------------------------------------------------------------------------------
def get_url_news(html):
    soup = BeautifulSoup(html)
    try:
        url_news = soup.find('div', {'class': "content"}).find('div', {'class': "js-tweet-text-container"}).find('p').find('a')['data-expanded-url']
    except:
        url_news=''
    return url_news
#------------------------------------------------------------------------------------------------------------
def main_parser(url,currency,html):
    cur = connect_db()
    global start_time
    global delta_time
    delta_time = time.clock() - start_time
    added_time = time.strftime('%Y-%m-%d %H:%M:%S')
    html = html.encode('utf-8')
    html=html.replace("\r\n","").replace("\r","").replace("\n","").replace("  "," ").replace("  "," ").replace("  "," ").replace("  "," ").replace("'","")
    theme=get_theme(html)
    url_news=get_url_news(html)
    exist_id = if_exist_news(cur, url, theme)
    if theme=='':
        flag=False
        return False
    else:
        flag=True
    data = [
        ['url', url],
        ['theme', theme],
        ['url_news', url_news],
        ['date', added_time],
    ]
    if flag==True:
      # если есть новая запись и не прошло 5 минут, то мониторим курс
      if exist_id==False and delta_time < max_seconds:
        print "no exist "+str(delta_time)
        res_twitter=insert_db(cur, table_twitter, data)
        print "Add news"
        twitter_id = get_twitter_id(cur, url, added_time)
        while delta_time < max_seconds:
           print delta_time
           dates=get_currency_percent()
           print dates[currency]
           if dates[currency] > max_percent:
             step_3(currency,dates[currency])
             data_currency = [
               ['twitter_id', str(twitter_id)],
               ['currency', currency],
               ['percent', str(dates[currency])],
               ['date', added_time],
             ]
             if if_exist_currency(cur,twitter_id,currency,dates[currency],added_time):
               res_currency=insert_db(cur, table_currency, data_currency)
               print " Add currency with twitter_id = " + str(twitter_id)
             else:
                 print "Currency with twitter_id = " + str(twitter_id)+" exist"
           delta_time = time.clock() - start_time
        start_time = time.clock()
      else:
        # если есть запись и не прошло 5 минут, то мониторим курс
        print "News '"+theme+"' already exist"
    cur.close()
#------------------------------------------------------------------------------------------------------------
#cur=connect_db()

logging.basicConfig(filename='logs/log.log',level=logging.DEBUG)
logging.debug("Start parser:" + time.strftime('%Y-%m-%d %H:%M:%S'))
k=0
while 1==1:
 for element in list:
     url = element[0]
     currency=element[1]
     print "------------------------------------------------------------------------------------------------------------"
     print url
     #html=get_html_by_proxy(url).read()
     html = get_html(url, '')
     data=main_parser(url,currency,html)
     k+=1
     print k
#------------------------------------------------------------------------------
#cur.close()





