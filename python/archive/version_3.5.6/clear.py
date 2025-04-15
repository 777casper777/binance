from core import *
import math
sql_query("TRUNCATE TABLE "+table_news)
sql_query("TRUNCATE TABLE "+table_buy)
sql_query("TRUNCATE TABLE "+table_sells)
sql_query("TRUNCATE TABLE "+table_history_buy)
sql_query("TRUNCATE TABLE "+table_history_sells)
print('Clear tables')
