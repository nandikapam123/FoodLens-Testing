from database import get_connection


conn = get_connection()

cursor = conn.cursor()

cursor.execute(
    "SELECT * FROM recipes;"
)

recipes = cursor.fetchall()

print(recipes)

cursor.close()
conn.close()