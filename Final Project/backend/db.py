import pymysql
from pymysql.cursors import DictCursor 

# Database configuration
dbConfig = {
    "host": "localhost",
    "user": "root",
    "password": "sqldb1!",
    "database": "pokemonDB",
}

# Function to connect to the database
def getDBConnection():
    conn = pymysql.connect(**dbConfig, cursorclass=DictCursor)
    return conn
