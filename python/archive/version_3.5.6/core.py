# -*- coding: utf-8 -*-
from config import *
from bs4 import BeautifulSoup #pip3 install beautifulsoup4
import pymysql
import logging
import requests
import sys
import threading
import time
#------------------------------------------------------------------------------------------------------------
def connect_db():
    db=get_db_settings()
    pymysql.connect(db['host'], db['user'], db['passwd'], db['db'], charset="utf8")  # server
    connection = pymysql.connect(host=db['host'],
                                 user=db['user'],
                                 password=db['passwd'],
                                 db=db['db'],
                                 charset='utf8',
                                 cursorclass=pymysql.cursors.DictCursor)
    return connection
#------------------------------------------------------------------------------------------------------------
def get_db_settings():
    global host
    global user
    global passwd
    global db
    settings={'host':host,'user':user,'passwd':passwd,'db':db}
    return settings
#------------------------------------------------------------------------------------------------------------
def read_file(file_name):
    f=open(file_name,'r')
    file_content=f.read()
    return file_content
#------------------------------------------------------------------------------------------------------------
def sql_query(sql):
    #print (sql)
    #sql=sql.replace("\xF0\x9F\x93\x8C","").replace("F09F93","")
    #pymysql.escape_string(sql)
    lock_query = threading.Lock()
    lock_query.acquire()
    connection=connect_db()
    try:
        cursor = connection.cursor()
        cursor.execute(sql)
        return cursor
        print("cursor.description: ", cursor.description)
    except:
        print("sql error in: " + sql)
        logging.error("sql error in: " + sql)
        return False
    finally:
        # Закрыть соединение
        connection.close()
        lock_query.release()

  #------------------------------------------------------------------------------------------------------------
def get_next_id(table_name):
    try:
     cur=sql_query("SELECT MAX(id) FROM "+table_name)
     next_id = cur.fetchone()[0]
     next_id += 1
     #print next_id
     return str(next_id)
    except:
        return "0"

#------------------------------------------------------------------------------------------------------------
def get_next_id(table_name):
    try:
     cur=sql_query("SELECT MAX(id) FROM "+table_name)
     next_id = cur.fetchone()[0]
     next_id += 1
     #print next_id
     return str(next_id)
    except:
        return "0"

#------------------------------------------------------------------------------------------------------------
def if_exist_row(download,table_name):

    try:
     cur=sql_query("SELECT id FROM "+table_name+" WHERE download='"+download+"'")
     if cur.rowcount > 0:
        #print cur.fetchone()[0]
        return cur.fetchone()[0]
     else:
        return False
    except:
       return False

#------------------------------------------------------------------------------------------------------------
def insert_db(table_name,arr) :
        sql = ''
        str_1 = u"INSERT INTO "+ "`"+ table_name+ "` ("
        str_2 = u""
        str_3 = u"("
        len_arr = len(arr)
        i = 0
        for key, value in arr :
                #if type(value)=='string':
                #value=delete_simbol(value)
                #key=delete_simbol(key)
                if len_arr - 1 > i:
                    str_2 = str_2 + u"`" + key + u"`" + u','
                    str_3 = str_3 + u"'" + str(value) + u"'" + u","
                else:
                    str_2 = str_2 + u"`" +key + u"`)"
                    str_3 = str_3 + u"'" + str(value) + u"')"

                i+=1

        sql = str_1 + str_2 + u" VALUES " + str_3
        cur=sql_query(sql)
        return cur
#------------------------------------------------------------------------------------------------------
def update_db(table_name, arr, id) :
        sql = ''
        str_1 = u"UPDATE"+ u"`"+ table_name +u"`" + u" SET "
        str_2 = u""
        str_3 = u" WHERE `id`="
        len_arr = len(arr)
        i = 0
        for key, value in arr:
                #value = delete_simbol(value)
                #key = delete_simbol(key)
                if len_arr - 1 > i :
                    if type(value)!='boolean':
                     str_2 = str_2 + u"`" + key + u"`='" + str(value) + u"',"
                    else:
                        str_2 = str_2 + u"`" + key + u"`=" + str(value) + u","
                else:
                    if type(value) != 'boolean':
                     str_2 = str_2 + u"`" + key + u"`='" + str(value) + u"'"
                    else:
                        str_2 = str_2 + u"`" + key + u"`=" + str(value) + u""

                i+=1
        sql = str_1 + str_2 + str_3 + str(id)
        #print(sql)
        cur=sql_query(sql)
        return cur
#------------------------------------------------------------------------------------------------------
def delete_db(table,id):
    sql="DELETE FROM "+table+" WHERE id='"+id+"'"
    cur=sql_query(sql_query())
    return cur
#------------------------------------------------------------------------------------------------------
def delete_simbol(str):
    try:
     str=str.replace("'","")
     return str
    except:
     print ("Some error in delete simbol '")
     logging.error("Some error in delete simbol '")
     return  ""
#------------------------------------------------------------------------------------------------------------
def get_proxy_file():
    proxys=[]
    for line in open("good.txt", "r").read().split("\n"):
        proxys.append(line)
    return proxys

def get_html(url):
    try:
        response = requests.get(url).text
        return response
    except:
        return False
#------------------------------------------------------------------------------------------------------------
def get_btc():
    html = get_html_by_proxy(url_btc)
    btc=''
    html = html.replace("\r\n", "").replace("\r", "").replace("\n", "").replace("  ", " ").replace("  ", " ").replace("  ", " ").replace("  ", " ").replace("'", "")
    soup = BeautifulSoup(html, "html.parser")
    btc=soup.find('span', {'id': "quote_price"})['data-usd']
    print(btc)
    if btc==None:
        btc=btc_usd
    return float(btc)
#------------------------------------------------------------------------------------------------------------

def get_html_by_proxy(url):
    # пытаемся получить страницу html через прокси
    proxy_id=0
    proxys = []
    proxys = get_proxy_file()
    request = None
    i=0
    if i > len(proxys):
        print ("All proxies is ended for parsing!")
        sys.exit(1)
    while i<len(proxys) and request == None :
        #print(proxys[proxy_id])
        try:
            response = requests.get(url, proxies={"http": proxys[proxy_id]}).text
            return response
        except:
            print ("Proxy: " + proxys[proxy_id] + " is down")
            logging.debug("Proxy: " + proxys[proxy_id] + " is down")
            proxy_id += 1
            response = None
        i+=1

''''
def get_html_by_proxy(url,referer):
    # пытаемся получить страницу html через прокси
    global proxy_id
    proxys=get_proxy_file()
    request= None
    while request==None:
     try:
      r = requests.get(url, proxies={"http": proxys[proxy_id]},headers={"Referer":referer})
      request = r.content
     except:
         print "Proxy: " + proxys[proxy_id] + " is down"
         logging.debug("Proxy: " + proxys[proxy_id] + " is down")
         proxy_id+=1
         request= None
    return request
'''''





