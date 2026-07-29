from fastapi import FastAPI
from routes import router


app = FastAPI(
    title="FoodLens API",
    description="Recipe recommendation backend",
    version="1.0"
)


app.include_router(router)


@app.get("/")
def home():
    return {
        "message": "FoodLens API is running!"
    }