import os
import psycopg2
from dotenv import load_dotenv

load_dotenv()

DATABASE_URL = os.getenv("DATABASE_URL")

def get_connection():
    try:
        conn = psycopg2.connect(DATABASE_URL)
        print("Database connected successfully!")
        return conn
    except Exception as e:
        print("Database connection failed:")
        print(e)
        return None