# 🎬 Movie Database System

## 📌 Overview
This project is a relational SQL database designed to manage movies, genres, reviews, and actors.

## 🧱 Database Structure
- Movies
- Genres
- Reviews
- Actors
- MovieActors (junction table)

## 🔗 Relationships
- Movies → linked to Genres
- Reviews → linked to Movies
- Movies ↔ Actors (many-to-many relationship)

## ⚙️ Features
- Primary Keys for unique records
- Foreign Keys to enforce relationships
- Many-to-many relationship using a junction table
- CRUD operations (Create, Read, Update, Delete)
- JOIN queries to combine data from multiple tables

## 💻 Example Query
```sql
SELECT Movies.MovieName, Actors.ActorName
FROM MovieActors
JOIN Movies ON MovieActors.MovieID = Movies.MovieID
JOIN Actors ON MovieActors.ActorID = Actors.ActorID
