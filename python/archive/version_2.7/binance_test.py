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

#print('account', bot.account(recvWindow=15000))
print(bot.exchangeInfo())

print('testOrder', bot.testOrder(
    symbol='ZECBTC',
    recvWindow=5000,
    side='BUY',
    type='MARKET',
    #timeInForce='GTC',
    quantity=0.53,
    #price=0.1
))
