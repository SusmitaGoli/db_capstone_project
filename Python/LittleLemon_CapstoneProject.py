### importing packages ##

import mysql.connector as connector
from mysql.connector import Error

### establishing the mysql connection ###
try:
    connection =  connector.connect(user='little_lemon',password='little_lemon',port='3306',
                                    host='127.0.0.1',auth_plugin='mysql_native_password',database = 'littlelemon_db')
    
except connector.Error as er:
    print(er)

cursor = connection.cursor()

## Using the database ##
cursor.execute('Use littlelemon_db;')
print("\nThe database little_lemon is set for use.\n")

### Printing the tables in database ###
cursor.execute('Show tables;')
tables = cursor.fetchall()
print('Tables in little lemon database \n')
print(tables)


## Customers details whose bill is > 60 ###

query = """SELECT 
    c.CustomerName AS CustomerName,
    c.ContactNumber AS ContactNumber,
    c.Email AS Email
FROM
    Customers AS c
        INNER JOIN
    Orders AS o ON c.CustomerID = o.CustomerID
WHERE
    o.BillAmount > 60;"""

cursor.execute(query)
customers = cursor.fetchall()
print("\nCustomer details whose order >60$ \n")

for row in customers:
    print(row)
