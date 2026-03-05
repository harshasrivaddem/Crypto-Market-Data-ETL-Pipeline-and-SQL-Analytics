CREATE DATABASE crypto_db;

USE crypto_db;

CREATE TABLE crypto_prices (
coin VARCHAR(50),
symbol VARCHAR(10),
price FLOAT,
market_cap FLOAT,
volume FLOAT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (coin)
);
ALTER TABLE crypto_prices
MODIFY coin VARCHAR(100);

select * from crypto_prices;

# Top 10 Cryptocurrencies by Price
select coin,symbol,price
from crypto_prices
order by price DESC
limit 10;

# Top 10 by Market Cap
select coin,symbol,price
from crypto_prices
order by market_cap DESC
limit 10;

# Highest Trading volume
select coin,symbol,price
from crypto_prices
order by volume DESC
limit 10;

# Average Crypto Price
select avg(price) as average_price
from crypto_prices;

# Coins With Price Greater Than 1000
select coin,symbol,price
from crypto_prices
where price>1000
order by price DESC;

# Coins With Low Trading Volume
select coin,volume
from crypto_prices
where volume<10000000
order by volume ASC;

# Market Cap Categories
select 
coin,market_cap,
CASE
WHEN market_cap > 10000000000 THEN 'Large Cap'
WHEN market_cap > 1000000000 THEN 'Mid Cap'
ELSE 'Small Cap'
end as market_category
from crypto_prices;

# Price Ranking
select 
coin,price,
rank() over (order by price DESC) as price_rank
from crypto_prices;

# Coins With Above Average Price
select coin,price
from crypto_prices
where price>(
select avg(price) from crypto_prices);

# Percentage of Market Cap
select coin,market_cap,
ROUND((market_cap/(select sum(market_cap) from crypto_prices))*100,2)
as market_share_percentage
from crypto_prices
order by market_share_percentage DESC;

# Top 5 Coins by Volume and Price
select coin,price,volume
from crypto_prices
order by volume DESC, price DESC
limit 5;

# Total Market Capitalization
select sum(market_cap) as total_market_cap
from crypto_prices;