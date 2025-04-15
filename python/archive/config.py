#-*- coding: utf-8 -*-
proxyUser = "UA_NA245374"
proxyPassword = "KghnRSb0je"
url_twitter = "https://twitter.com"
url_currency="https://coinzaa.com/tools/binex"
url_btc="https://coinmarketcap.com/currencies/bitcoin/"
test_script=False
# отношение BTC к USD
btc_usd=9247.20
# макс. время для мониторинга при поиске новости
max_seconds=180
# макс. время поиска для продажи
max_seconds_sell=900
#процент для покупки
percent_to_buy=1
# процент роста,спада при котром продаем
percent_to_sell=3
#лимит при покупке к BTC=quantity
buy_limit=0.001
# комиссия в %
commission=0.025
# кратность к quantity к LOT_SIZE
#stepSize=0.01000000
# округление для LOT_SIZE
lot_size_round=0
api_key="6gryfLNmtKgxTWe3gMT0yY9lNPGwwwkje6Gh3kQUWSIVvd5fheQAyp0wEUAvv9hg"
secret_key="jg5QzcIsSMz8L8GP0VuAL4CyUEegunleWrY5Ah7mRdICVaHNBN3HoB25HxuXHBWx"
# время ожидания API binance
recvWindow=5000
#----------------Tables----------------------------------------------------
table_prefix=''
table_news = "news"+table_prefix
table_buy="buy"+table_prefix
table_sells="sells"+table_prefix
table_history_buy="history_buy"+table_prefix
table_history_sells="history_sells"+table_prefix
#---------------------------------------------------------------------------
log_file='logs/log.log'
#-------------Data base access----------------------------------------------
# данные передавать в БД лучше в виде строк
host = "localhost"
#host = "5.101.116.95"
user = "twitter"
passwd = "7777777mv!"
db = "twitter"
#PID- 17541





