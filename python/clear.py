from core import *
set_config()
sql_query("TRUNCATE TABLE "+config['table_news'])
sql_query("TRUNCATE TABLE "+config['table_buy'])
sql_query("TRUNCATE TABLE "+config['table_sells'])
sql_query("TRUNCATE TABLE "+config['table_history_buy'])
sql_query("TRUNCATE TABLE "+config['table_history_sells'])
print('Clear tables')
