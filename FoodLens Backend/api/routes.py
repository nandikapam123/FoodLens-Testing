from fastapi import APIRouter, HTTPException
from database import get_connection

router = APIRouter()


def recipe_from_row(row, ingredients):
    return {
        "id": str(row[0]),
        "title": row[1],
        "description": row[2],
        "instructions": row[3],
        "cook_time": row[4],
        "difficulty": row[5],
        "image_url": row[6],
        "ingredients": ingredients
    }


def get_recipe_ingredients(cursor, recipe_id):
    cursor.execute(
        """
        SELECT
            i.name,
            ri.quantity
        FROM recipe_ingredients ri
        JOIN ingredients i
            ON ri.ingredient_id = i.id
        WHERE ri.recipe_id = %s
        ORDER BY i.name;
        """,
        (recipe_id,)
    )

    rows = cursor.fetchall()

    return [
        {
            "name": row[0],
            "quantity": row[1]
        }
        for row in rows
    ]


@router.get("/recipes")
def get_recipes():

    conn = get_connection()
    cursor = conn.cursor()

    try:
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
            ORDER BY created_at DESC;
            """
        )

        rows = cursor.fetchall()

        recipes = []

        for row in rows:
            ingredients = get_recipe_ingredients(
                cursor,
                row[0]
            )

            recipes.append(
                recipe_from_row(
                    row,
                    ingredients
                )
            )

        return recipes

    finally:
        cursor.close()
        conn.close()


@router.get("/recipes/{recipe_id}")
def get_recipe(recipe_id: str):

    conn = get_connection()
    cursor = conn.cursor()

    try:
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

        if row is None:
            raise HTTPException(
                status_code=404,
                detail="Recipe not found"
            )

        ingredients = get_recipe_ingredients(
            cursor,
            row[0]
        )

        return recipe_from_row(
            row,
            ingredients
        )

    finally:
        cursor.close()
        conn.close()