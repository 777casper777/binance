from config import *
from binance_api import Binance
bot = Binance(
    API_KEY=api_key,
    API_SECRET=secret_key
)
#print('account', bot.account())
print(bot.ping())
