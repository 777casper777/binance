# -*- coding: utf-8 -*-
import MySQLdb
import os
import sys
import math
import time
import random
from config import *
import re
import logging
import urllib2
import requests
#Create a cursor on which queries may be performed
proxy_id=0
#------------------------------------------------------------------------------------------------------------
def connect_db():
    cur = False
    db=get_db_settings()
    try:
        con = MySQLdb.connect(db['host'], db['user'], db['passwd'],db['db'],charset="utf8",connect_timeout=1000) #server
        cur = con.cursor()
        cur.execute('SET NAMES utf8;')
        cur.execute('SET CHARACTER SET utf8;')
        cur.execute('SET character_set_connection=utf8;')
        return cur
    except MySQLdb.Error:
        print(MySQLdb.Error.message)
        logging.error(MySQLdb.Error.message)
        return False
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
def sql_query(cur,sql):
    #print sql
    sql=sql.replace("\xF0\x9F\x93\x8C","").replace("F09F93","")
    MySQLdb.escape_string(sql)
    if connect_db() == False:
        connect_db()
        print "DB error connection in: "
        result = False
    else:
        try:
            result = cur.execute(sql)
            return result
        except MySQLdb.Error:
            print(MySQLdb.Error)
            print "sql error in: " + sql
            logging.error("sql error in: " + sql)
            return False
#------------------------------------------------------------------------------------------------------------
def get_next_id(cur,table_name):
    try:
     result=sql_query(cur,"SELECT MAX(id) FROM "+table_name)
     next_id = cur.fetchone()[0]
     next_id += 1
     #print next_id
     return str(next_id)
    except:
        return "0"

#------------------------------------------------------------------------------------------------------------
def get_id_by_url(cur,table_name,download):
    try:
     result=sql_query(cur,"SELECT id FROM "+table_name+" WHERE download='"+download+"'")
     id = cur.fetchone()[0]
     return str(id)
    except:
        return "0"

#------------------------------------------------------------------------------------------------------------
def get_next_id(cur,table_name):
    try:
     result=sql_query(cur,"SELECT MAX(id) FROM "+table_name)
     next_id = cur.fetchone()[0]
     next_id += 1
     #print next_id
     return str(next_id)
    except:
        return "0"

#------------------------------------------------------------------------------------------------------------
def if_exist_row(cur,download,table_name):

    try:
     result=sql_query(cur,"SELECT id FROM "+table_name+" WHERE download='"+download+"'")
     if cur.rowcount > 0:
        #print cur.fetchone()[0]
        return cur.fetchone()[0]
     else:
        return False
    except:
       return False

#------------------------------------------------------------------------------------------------------------
def get_thumb_name(cur,download,table_name):
    try:
     result=sql_query(cur,"SELECT thumb FROM "+table_name+" WHERE download='"+download+"'")
     if cur.rowcount > 0:
        return cur.fetchone()[0]
     else:
        return False
    except:
       return False
#------------------------------------------------------------------------------------------------------------
def get_torrent_name(cur,download,table_name):
    try:
     result=sql_query(cur,"SELECT id FROM "+table_name+" WHERE download='"+download+"'")
     if cur.rowcount > 0:
        return str(cur.fetchone()[0])
     else:
        return False
    except:
       return False
#------------------------------------------------------------------------------------------------------------

def insert_db(cur,table_name,arr) :
        result = True
        sql = ''
        if cur == False :
            print "Can't do connection with DB"
            logging.error("Can't do connection with DB")
            result = False
            sys.exit(1)
        else:
            str_1 = u"INSERT INTO "+ "`"+ table_name+ "` ("
            str_2 = u""
            str_3 = u"("
            len_arr = len(arr)
            i = 0
            for key, value in arr :
                value=delete_simbol(value)
                key=delete_simbol(key)
                if len_arr - 1 > i:
                    str_2 = str_2 + u"`" + key + u"`" + u','
                    str_3 = str_3 + u"'" + value + u"'" + u","
                else:
                    str_2 = str_2 + u"`" +key + u"`)"
                    str_3 = str_3 + u"'" + value + u"')"

                i+=1

            sql = str_1 + str_2 + u" VALUES " + str_3
            #print sql
            res=sql_query(cur, sql)
            return res
#------------------------------------------------------------------------------------------------------
def update_db(cur,table_name, arr, id) :
        result = True
        sql = ''
        if cur == False:
            print "Can't do connection with DB"
            logging.error("Can't do connection with DB")
            result = False
            sys.exit(1)
        else:
            str_1 = u"UPDATE"+ u"`"+ table_name +u"`" + u" SET "
            str_2 = u""
            str_3 = u" WHERE `id`="
            len_arr = len(arr)
            i = 0
            for key, value in arr:
                value = delete_simbol(value)
                key = delete_simbol(key)
                if len_arr - 1 > i :
                    str_2 = str_2 + u"`" + key + u"`='" + value + u"',"
                else:
                    str_2 = str_2 + u"`" + key + u"`='" + value + u"'"

                i+=1
            sql = str_1 + str_2 + str_3 + str(id)
            res=sql_query(cur, sql)
        return res
#------------------------------------------------------------------------------------------------------
def convert_size(size_bytes):
   if size_bytes == 0:
       return "0B"
   size_name = ("B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB")
   i = int(math.floor(math.log(size_bytes, 1024)))
   p = math.pow(1024, i)
   s = round(size_bytes / p, 2)
   return "%s %s" % (s, size_name[i])
#------------------------------------------------------------------------------------------------------------
def delete_simbol(str):
    try:
     str=str.replace("'","")
     return str
    except:
     print "Some error in delete simbol '"
     logging.error("Some error in delete simbol '")
     return  ""
#------------------------------------------------------------------------------------------------------------
def get_proxy_file():
    proxys=[]
    for line in open("good.txt", "r").read().split("\n"):
        proxys.append(line)
    return proxys
#------------------------------------------------------------------------------------------------------------
def get_index_str(index):
    return str(index)
#------------------------------------------------------------------------------------------------------------
def get_category_str(category):
    return str(category)
#------------------------------------------------------------------------------------------------------------
def get_screens_to_string(screens):
   if screens== None:
       return ""
   else:
    return ''.join(unicode(item) for item in screens)
#------------------------------------------------------------------------------------------------------------
def get_cat_name_to_string(cat_name):
   if cat_name== None:
       return ""
   else:
    return ''.join(unicode(item) for item in cat_name)
#------------------------------------------------------------------------------------------------------------
def get_html(url,referer):
    html = ''
    try:
     req = urllib2.Request(url)
     req.add_header('Referer', referer)
     resp = urllib2.urlopen(req)
     content = resp.read()
     return content
    except:
        return  False
#------------------------------------------------------------------------------------------------------------
def get_html_by_proxy(url,referer):
    # пытаемся получить страницу html через прокси
    proxy_id=0
    proxys = []
    proxys = get_proxy_file()
    request = None
    i=0
    #print len(proxys)
    #if i > len(proxys):
    #    print "All proxies is ended for parsing!"
    #    sys.exit(1)
    #print url
    while i<len(proxys) and request == None :
        #print proxys[proxy_id]
        try:
            proxy_support = urllib2.ProxyHandler({"http": "http://"+proxys[proxy_id]})
            opener = urllib2.build_opener(proxy_support)
            opener.addheaders=[('Referer', referer)]
            urllib2.install_opener(opener)
            f = urllib2.urlopen(url,timeout=1)
            request=f.read()
        except:
            print "Proxy: " + proxys[proxy_id] + " is down"
            logging.debug("Proxy: " + proxys[proxy_id] + " is down")
            proxy_id += 1
            request = None
        i+=1
        #print i
    return request
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





