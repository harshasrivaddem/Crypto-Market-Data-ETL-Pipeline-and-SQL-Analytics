import pandas as pd
import requests
import mysql.connector
from dotenv import load_dotenv
import os

# extract data from API
url="https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd"
response=requests.get(url)
data=response.json()

print("Data fetched Suceesfully!")

# transform data
df=pd.DataFrame(data)

df=df[['id','symbol','current_price','market_cap','total_volume']]
df=df.rename(columns={
    'id':'coin',
    'current_price':'price',
    'total_volume':'volume'
})
print("Data Transformed!")

# connect to MySql
load_dotenv()
conn = mysql.connector.connect(
    host=os.getenv("DB_HOST"),
    user=os.getenv("DB_USER"),
    password=os.getenv("DB_PASSWORD"),
    database=os.getenv("DB_NAME")
)

cursor=conn.cursor()
print("Connected to MySql!")

# insert and update data
query="""
    INSERT INTO crypto_prices
    (coin, symbol, price, market_cap, volume)
    VALUES(%s,%s,%s,%s,%s)
    ON DUPLICATE KEY UPDATE 
    price=VALUES(price),
    market_cap=VALUES(market_cap),
    volume=VALUES(volume)
"""

values=df.values.tolist()
cursor.executemany(query,values)
conn.commit()

print("Data inserted into database!")

cursor.close()
conn.close()
