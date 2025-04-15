import time
import json
import urllib
import hmac, hashlib
import requests
#pip3 install requests
#from urllib.parse import urlparse, urlencode
from urlparse import urlparse
#from urllib.request import Request, urlopen
from urllib2 import urlopen
from core import *


class Binance():
    methods = {
        # public methods
        'ping': {'url': 'api/v1/ping', 'method': 'GET', 'private': False},
        'time': {'url': 'api/v1/time', 'method': 'GET', 'private': False},
        'exchangeInfo': {'url': 'api/v1/exchangeInfo', 'method': 'GET', 'private': False},
        'depth': {'url': 'api/v1/depth', 'method': 'GET', 'private': False},
        'trades': {'url': 'api/v1/trades', 'method': 'GET', 'private': False},
        'historicalTrades': {'url': 'api/v1/historicalTrades', 'method': 'GET', 'private': False},
        'aggTrades': {'url': 'api/v1/aggTrades', 'method': 'GET', 'private': False},
        'klines': {'url': 'api/v1/klines', 'method': 'GET', 'private': False},
        'ticker24hr': {'url': 'api/v1/ticker/24hr', 'method': 'GET', 'private': False},
        'tickerPrice': {'url': 'api/v3/ticker/price', 'method': 'GET', 'private': False},
        'tickerBookTicker': {'url': 'api/v3/ticker/bookTicker', 'method': 'GET', 'private': False},
        # private methods
        'createOrder': {'url': 'api/v3/order', 'method': 'POST', 'private': True},
        'testOrder': {'url': 'api/v3/order/test', 'method': 'POST', 'private': True},
        'orderInfo': {'url': 'api/v3/order', 'method': 'GET', 'private': True},
        'cancelOrder': {'url': 'api/v3/order', 'method': 'DELETE', 'private': True},
        'openOrders': {'url': 'api/v3/openOrders', 'method': 'GET', 'private': True},
        'allOrders': {'url': 'api/v3/allOrders', 'method': 'GET', 'private': True},
        'account': {'url': 'api/v3/account', 'method': 'GET', 'private': True},
        'myTrades': {'url': 'api/v3/myTrades', 'method': 'GET', 'private': True},
    }

    def __init__(self, API_KEY, API_SECRET):
        self.API_KEY = API_KEY
        self.API_SECRET = bytearray(API_SECRET, encoding='utf-8')

    def __getattr__(self, name):
        def wrapper(*args, **kwargs):
            kwargs.update(command=name)
            return self.call_api(**kwargs)

        return wrapper

    def call_api(self, **kwargs):


        command = kwargs.pop('command')
        api_url = 'https://api.binance.com/' + self.methods[command]['url']

        payload = kwargs
        headers = {}

        if self.methods[command]['private']:
            payload.update({'timestamp': int(time.time() * 1000)})

            sign = hmac.new(
                key=self.API_SECRET,
                #msg=urllib.parse.urlencode(payload).encode('utf-8'),
                #urllib.urlencode()
                msg=urllib.urlencode(payload),
                digestmod=hashlib.sha256
            ).hexdigest()

            payload.update({'signature': sign})
            headers = {"X-MBX-APIKEY": self.API_KEY}

        if self.methods[command]['method'] == 'GET':
            #api_url += '?' + urllib.parse.urlencode(payload) #Parse a URL into six components, returning a 6-tuple.
            api_url += '?'+urllib.urlencode(payload)


        '''''
        proxy_id = 0
        proxys = []
        proxys = get_proxy_file()
        response = False
        i = 0
        if i > len(proxys):
            print("All proxies is ended for parsing!")
            sys.exit(1)
        while i < len(proxys) and response == False:
                #print(proxys[proxy_id])
                #r = requests.get(url, proxies={"http": proxys[proxy_id]}, headers={"Referer": referer})
                try:
                  response = requests.request(method=self.methods[command]['method'], url=api_url,data="" if self.methods[command]['method'] == 'GET' else payload,proxies={"http": proxys[proxy_id]},headers=headers)
                  json=response.json()
                  if 'code' in json :
                     if json['code']==-1003:
                       print("Proxy: " + proxys[proxy_id] + " is baned")
                       logging.debug("Proxy: " + proxys[proxy_id] + " is baned")
                       proxy_id += 1
                       response = False
                     else:
                       return json
                except:
                    print("Proxy: " + proxys[proxy_id] + " is down")
                    logging.debug("Proxy: " + proxys[proxy_id] + " is down")
                    proxy_id += 1
                    response = False
                i += 1
        '''''
        #response = requests.request(method=self.methods[command]['method'], url=api_url,data="" if self.methods[command]['method'] == 'GET' else payload, headers=headers)
        #json=response.json()
        method = self.methods[command]['method']
        if method=="GET":
         responce = requests.get(api_url,headers=headers)
        else:
         responce = requests.post(api_url, data=payload,headers=headers)
        json = responce.json()
        return json