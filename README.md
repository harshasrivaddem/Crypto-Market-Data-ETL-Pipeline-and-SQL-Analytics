# Crypto Market Data Pipeline & SQL Analysis (Python + MySQL)

## Overview
This project implements a **data engineering pipeline** that extracts cryptocurrency market data from the CoinGecko API, processes it using Python, and stores it in a MySQL database for SQL-based analysis.

The pipeline automates the process of collecting cryptocurrency market information such as price, market capitalization, and trading volume. Once the data is stored in the database, SQL queries are used to analyze market trends and generate insights.

---

## Technologies Used
- Python
- Pandas
- MySQL
- SQL
- CoinGecko API

---

## Project Architecture

```
CoinGecko API
      ↓
Python (Requests + Pandas)
      ↓
Data Transformation
      ↓
MySQL Database
      ↓
SQL Analysis
```

---

## Features
- Fetches cryptocurrency market data from the CoinGecko API
- Cleans and transforms raw JSON data using Pandas
- Stores processed data in a MySQL relational database
- Uses UPSERT logic with a primary key to prevent duplicate entries
- Performs SQL analysis to identify market trends

---

## Database Schema

Table: `crypto_prices`

| Column | Description |
|------|-------------|
| coin | Unique identifier for cryptocurrency |
| symbol | Trading symbol |
| price | Current market price |
| market_cap | Total market capitalization |
| volume | Trading volume |
| created_at | Timestamp when the record was inserted |

---

## Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/crypto-market-data-pipeline.git
cd crypto-market-data-pipeline
```

### 2. Install Dependencies
```bash
pip install -r requirements.txt
```

### 3. Create the Database
Run the following SQL commands in MySQL:

```sql
CREATE DATABASE crypto_db;

USE crypto_db;

CREATE TABLE crypto_prices (
coin VARCHAR(100),
symbol VARCHAR(10),
price FLOAT,
market_cap FLOAT,
volume FLOAT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (coin)
);
```

### 4. Configure Database Credentials
Create a `.env` file and add your database credentials:

```
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=yourpassword
DB_NAME=crypto_db
```

---

## Running the Pipeline

Run the Python script:

```bash
python3 crypto_pipeline.py
```

The script will:

1. Fetch cryptocurrency data from the CoinGecko API  
2. Transform and clean the dataset using Pandas  
3. Insert or update records in the MySQL database  

---

## Example Output

| coin | symbol | price | market_cap | volume |
|-----|------|------|------|------|
| bitcoin | btc | 73051 | 1.4T | 45B |
| ethereum | eth | 2146 | 500B | 20B |

---

## Future Improvements
- Schedule the pipeline to run automatically
- Add historical price tracking for time-series analysis
- Build dashboards for visualization using tools like Power BI

---

## Author
Harsha Sri Vaddem  
Data Science Graduate | Python | SQL | Data Engineering
