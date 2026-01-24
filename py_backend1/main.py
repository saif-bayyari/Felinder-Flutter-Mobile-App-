# main.py
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from datetime import datetime
from typing import Optional
import uvicorn



app = FastAPI()

# This mirrors your Dart User model
class User(BaseModel):
    id: str
    email: Optional[str] = None
    phone_number: Optional[str] = None
    first_name: Optional[str] = None
    last_name: Optional[str] = None
    created_at: datetime
    last_login: Optional[datetime] = None
    email_verified_at: Optional[datetime] = None
    phone_verified_at: Optional[datetime] = None
    role: str = "user"
    profile_pictures: list[str] = []

# Fake database (just a dictionary for now)
users_db = {}

# Health check endpoint

#It's just a simple endpoint to 
# check if your server is alive.
@app.get("/health")
def health():
    return {"status": "ok"}
#just a standard thing we do in this API.

# Create a user
@app.post("/users")
def create_user(user: User):
    users_db[user.id] = user
    print(f"Created user: {user.first_name} {user.last_name}")
    return user

# Get a user
@app.get("/users/{user_id}")
def get_user(user_id: str):
    if user_id not in users_db:
        raise HTTPException(status_code=404, detail="User not found")
    return users_db[user_id]

# Get all users
@app.get("/users")
def get_all_users():
    return list(users_db.values())

# Delete a user
@app.delete("/users/{user_id}")
def delete_user(user_id: str):
    if user_id not in users_db:
        raise HTTPException(status_code=404, detail="User not found")
    del users_db[user_id]
    return {"message": "User deleted"}


if __name__ == "__main__":
    uvicorn.run("main:app", host="localhost", port=8000, reload=True)