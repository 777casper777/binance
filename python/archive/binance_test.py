from config import *
import sys
from binance_api import Binance
bot = Binance(
    API_KEY=api_key,
    API_SECRET=secret_key
)
#print('account', bot.account())
#print(bot.ping())
#print(bot.time())
#print(bot.exchangeInfo())
# Тест покупки
# Протестировать отложенный ордер на покупку 0.1 LTC за BTC
# По курсу 0.1

#print('account', bot.account(recvWindow=15000))
'''''
print(bot.exchangeInfo())

print('testOrder', bot.testOrder(
    symbol='ZECBTC',
    recvWindow=5000,
    side='BUY',
    type='MARKET',
    #timeInForce='GTC',
    quantity=22.371,
    #price=0.1
))
'''''
print('createOrder', bot.createOrder(
    symbol='ICXBTC',#пара
    recvWindow=5000,#кол-во миллисекунд, которое прибавляется к timestamp и формирует окно действия запроса (см. выше). По умолчанию 5000.
    side='SELL',#тип ордера (BUY либо SELL)
    type='MARKET',#тип ордера (LIMIT, MARKET, STOP_LOSS, STOP_LOSS_LIMIT, TAKE_PROFIT, TAKE_PROFIT_LIMIT, LIMIT_MAKER)
    #timeInForce='GTC',
     #(GTC, IOC, FOK). По умолчанию GTC.
     #GTC (Good Till Cancelled) – ордер будет висеть до тех пор, пока его не отменят.
     #IOC (Immediate Or Cancel) – Будет куплено то количество, которое можно купить немедленно. Все, что не удалось купить, будет отменено.
     #FOK (Fill-Or-Kill) – Либо будет куплено все указанное количество немедленно, либо не будет куплено вообще ничего, ордер отменится.
    quantity=0.1,# количество к покупке
    #price=0.1#цена
))

