# CS50sql_project

This project includes almost all the problem sets for the course offered at EDX.ORG except those that need written answers based on individual readings.

## Course Information

- **Course Name**: HarvardX: CS50's Introduction to Databases with SQL
- **Link to the Course**: [CS50's Introduction to Databases with SQL](https://www.edx.org/learn/sql/harvard-university-cs50-s-introduction-to-databases-with-sql?index=product&queryID=7592f67e20ff1bd6a01a8bd9f992112c&position=1&results_level=first-level-results&term=cs50+sql&objectID=course-3e45c431-10df-423e-9f03-fb98b713cd4a&campaign=CS50%27s+Introduction+to+Databases+with+SQL&source=edX&product_category=course&placement_url=https%3A%2F%2Fwww.edx.org%2Fsearch)
- **Instructor**: Carter Zenke

## Warnings

This project was completed based on my own understanding from reading and watching the lectures taught by Carter Zenke. It is intended to help guide you if you are stuck on a problem set. Please note that the final project included here is my own work and should be used as an example for learning purposes only.

## Project Overview

This repository contains my solutions to the problem sets from the CS50 SQL course on edX. It demonstrates various SQL concepts and techniques taught throughout the course, such as creating databases, querying data, and using SQL functions.

## Prerequisites

- SQL database management system (e.g., SQLite) 
- Basic understanding of SQL offered at lectures

## Installation

To set up the project locally, follow these steps:

1. **Clone the repository**:
    ```bash
    git clone [https://github.com/NHTA24/CS50sql_project.git]
    ```
2. **Navigate to the project directory**:
    ```bash
    cd CS50sql_project
    ```
3. **Set up the database**:
    - Use the provided `schema.sql` to create the database schema.
    - Load the sample data into your database.

## Usage

To run the SQL scripts, you can use your preferred SQL client or the command line:

```bash
sqlite3 atl.db < schema.sql
