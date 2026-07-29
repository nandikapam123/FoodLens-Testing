from fastapi import APIRouter
from database import get_connection


router = APIRouter()

@router.get("/recipes")
def get_recipes():
    conn = get_connection()

    cursor = conn.cursor()

    cursor.execute("""
        SELECT
            id,
            title,
            description,
            instructions,
            cook_time,
            difficulty,
            image_url
        FROM recipes;
    """)

    rows = cursor.fetchall()

    recipes = []

    for row in rows:
        recipes.append({
            "id": str(row[0]),
            "title": row[1],
            "description": row[2],
            "instructions": row[3],
            "cook_time": row[4],
            "difficulty": row[5],
            "image_url": row[6]
        })

    cursor.close()
    conn.close()

    return recipes

@router.get("/recipes/{recipe_id}")
def get_recipe(recipe_id: str):

    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute(
        """
        SELECT
            id,
            title,
            description,
            instructions,
            cook_time,
            difficulty,
            image_url
        FROM recipes
        WHERE id = %s;
        """,
        (recipe_id,)
    )

    row = cursor.fetchone()

    cursor.close()
    conn.close()

    if row is None:
        return {
            "error": "Recipe not found"
        }


    return {
        "id": str(row[0]),
        "title": row[1],
        "description": row[2],
        "instructions": row[3],
        "cook_time": row[4],
        "difficulty": row[5],
        "image_url": row[6]
    }